package com.example.realestate.security;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Files;
import java.nio.file.Path;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.springframework.http.HttpStatus;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.server.ResponseStatusException;

class UploadStorageServiceTests {

    @TempDir
    Path uploadDirectory;

    @Test
    void storesAnImageUnderAnUnrelatedGeneratedName() throws Exception {
        byte[] pngHeader = new byte[] {
                (byte) 0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A
        };
        MockMultipartFile file = new MockMultipartFile(
                "image", "../../unsafe.png", "image/png", pngHeader);
        UploadStorageService storage = new UploadStorageService(uploadDirectory.toString());

        String url = storage.storeImage(file);
        Path storedFile = uploadDirectory.resolve(url.substring("/uploads/".length()));

        assertTrue(url.matches("/uploads/[0-9a-f-]{36}\\.png"));
        assertTrue(Files.exists(storedFile));
        assertFalse(url.contains("unsafe"));
    }

    @Test
    void rejectsNonImageContent() {
        MockMultipartFile file = new MockMultipartFile(
                "image", "image.png", "image/png", "not an image".getBytes(java.nio.charset.StandardCharsets.UTF_8));
        UploadStorageService storage = new UploadStorageService(uploadDirectory.toString());

        ResponseStatusException exception = assertThrows(
                ResponseStatusException.class, () -> storage.storeImage(file));

        assertEquals(HttpStatus.BAD_REQUEST, exception.getStatus());
    }

    @Test
    void rejectsMissingFiles() {
        MockMultipartFile file = new MockMultipartFile("image", "", "image/png", new byte[0]);
        UploadStorageService storage = new UploadStorageService(uploadDirectory.toString());

        ResponseStatusException exception = assertThrows(
                ResponseStatusException.class, () -> storage.storeImage(file));

        assertEquals(HttpStatus.BAD_REQUEST, exception.getStatus());
    }
}
