package com.example.realestate.security;

import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriUtils;

@Service
@ConditionalOnProperty(name = "app.upload.provider", havingValue = "supabase")
public class SupabaseStorageClient {

    private final RestTemplate restTemplate;
    private final String projectUrl;
    private final String serviceRoleKey;
    private final String bucket;

    public SupabaseStorageClient(
            @Value("${app.upload.supabase.url}") String projectUrl,
            @Value("${app.upload.supabase.service-role-key}") String serviceRoleKey,
            @Value("${app.upload.supabase.bucket:property-images}") String bucket) {
        this(new RestTemplate(), projectUrl, serviceRoleKey, bucket);
    }

    SupabaseStorageClient(RestTemplate restTemplate, String projectUrl, String serviceRoleKey, String bucket) {
        this.restTemplate = restTemplate;
        this.projectUrl = trimTrailingSlash(projectUrl);
        this.serviceRoleKey = serviceRoleKey;
        this.bucket = bucket;
    }

    public String storeImage(String filename, String contentType, byte[] image) {
        String encodedFilename = UriUtils.encodePathSegment(filename, StandardCharsets.UTF_8);
        String encodedBucket = UriUtils.encodePathSegment(bucket, StandardCharsets.UTF_8);
        String objectUrl = projectUrl + "/storage/v1/object/" + encodedBucket + "/" + encodedFilename;

        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(serviceRoleKey);
        headers.set("apikey", serviceRoleKey);
        headers.setContentType(MediaType.parseMediaType(contentType));
        headers.set("x-upsert", "false");

        restTemplate.exchange(objectUrl, HttpMethod.POST, new HttpEntity<>(image, headers), String.class);
        return projectUrl + "/storage/v1/object/public/" + encodedBucket + "/" + encodedFilename;
    }

    private String trimTrailingSlash(String value) {
        return value.endsWith("/") ? value.substring(0, value.length() - 1) : value;
    }
}
