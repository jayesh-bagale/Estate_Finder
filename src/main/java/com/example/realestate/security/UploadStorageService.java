package com.example.realestate.security;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

@Service
public class UploadStorageService {

    private final Path uploadDirectory;
    private final String provider;
    private final SupabaseStorageClient supabaseStorageClient;

    @Autowired
    public UploadStorageService(
            @Value("${app.upload.dir:${user.home}/estatefinder-uploads}") String uploadDirectory,
            @Value("${app.upload.provider:local}") String provider,
            ObjectProvider<SupabaseStorageClient> supabaseStorageClientProvider) {
        this(uploadDirectory, provider, supabaseStorageClientProvider.getIfAvailable());
    }

    UploadStorageService(String uploadDirectory) {
        this(uploadDirectory, "local", (SupabaseStorageClient) null);
    }

    private UploadStorageService(String uploadDirectory, String provider, SupabaseStorageClient supabaseStorageClient) {
        this.uploadDirectory = Paths.get(uploadDirectory).toAbsolutePath().normalize();
        this.provider = provider;
        this.supabaseStorageClient = supabaseStorageClient;
        if (!"local".equals(provider) && !"supabase".equals(provider)) {
            throw new IllegalArgumentException("Unsupported app.upload.provider: " + provider);
        }
    }

    public Path getUploadDirectory() {
        return uploadDirectory;
    }

    public String getUploadResourceLocation() {
        String location = uploadDirectory.toUri().toString();
        return location.endsWith("/") ? location : location + "/";
    }

    public String storeImage(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Choose an image to upload.");
        }

        String extension = detectImageExtension(file);
        String filename = UUID.randomUUID().toString() + extension;
        if ("supabase".equals(provider)) {
            if (supabaseStorageClient == null) {
                throw new IllegalStateException("Supabase image storage is configured but unavailable.");
            }
            return supabaseStorageClient.storeImage(filename, contentTypeFor(extension), file.getBytes());
        }

        Files.createDirectories(uploadDirectory);
        Path destination = uploadDirectory.resolve(filename).normalize();
        if (!destination.startsWith(uploadDirectory)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid image filename.");
        }
        try (InputStream input = file.getInputStream()) {
            Files.copy(input, destination);
        }
        return "/uploads/" + filename;
    }

    private String contentTypeFor(String extension) {
        switch (extension) {
            case ".jpg":
                return "image/jpeg";
            case ".png":
                return "image/png";
            case ".gif":
                return "image/gif";
            case ".webp":
                return "image/webp";
            default:
                throw new IllegalArgumentException("Unsupported image extension: " + extension);
        }
    }

    private String detectImageExtension(MultipartFile file) throws IOException {
        byte[] header;
        try (InputStream input = file.getInputStream()) {
            header = input.readNBytes(12);
        }

        if (startsWith(header, 0xFF, 0xD8, 0xFF)) {
            return ".jpg";
        }
        if (startsWith(header, 0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A)) {
            return ".png";
        }
        if (startsWithAscii(header, "GIF87a") || startsWithAscii(header, "GIF89a")) {
            return ".gif";
        }
        if (startsWithAscii(header, "RIFF") && header.length >= 12
                && new String(header, 8, 4, java.nio.charset.StandardCharsets.US_ASCII).equals("WEBP")) {
            return ".webp";
        }
        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Upload a valid JPEG, PNG, GIF, or WebP image.");
    }

    private boolean startsWith(byte[] bytes, int... values) {
        if (bytes.length < values.length) {
            return false;
        }
        for (int index = 0; index < values.length; index++) {
            if ((bytes[index] & 0xFF) != values[index]) {
                return false;
            }
        }
        return true;
    }

    private boolean startsWithAscii(byte[] bytes, String value) {
        if (bytes.length < value.length()) {
            return false;
        }
        for (int index = 0; index < value.length(); index++) {
            if (bytes[index] != value.charAt(index)) {
                return false;
            }
        }
        return true;
    }
}
