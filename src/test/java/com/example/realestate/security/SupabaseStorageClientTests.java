package com.example.realestate.security;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.header;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.requestTo;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.test.web.client.MockRestServiceServer;
import org.springframework.web.client.RestTemplate;

class SupabaseStorageClientTests {

    @Test
    void uploadsImagesPrivatelyAndReturnsTheirPublicBucketUrl() {
        RestTemplate restTemplate = new RestTemplate();
        MockRestServiceServer server = MockRestServiceServer.bindTo(restTemplate).build();
        byte[] image = new byte[] { 1, 2, 3 };
        String uploadEndpoint = "https://project.supabase.co/storage/v1/object/property-images/image.png";

        server.expect(requestTo(uploadEndpoint))
                .andExpect(method(HttpMethod.POST))
                .andExpect(header("Authorization", "Bearer service-role-key"))
                .andExpect(header("apikey", "service-role-key"))
                .andExpect(content().contentType(MediaType.IMAGE_PNG))
                .andExpect(content().bytes(image))
                .andRespond(withSuccess("{}", MediaType.APPLICATION_JSON));

        SupabaseStorageClient storage = new SupabaseStorageClient(
                restTemplate,
                "https://project.supabase.co/",
                "service-role-key",
                "property-images");

        String url = storage.storeImage("image.png", "image/png", image);

        assertEquals(
                "https://project.supabase.co/storage/v1/object/public/property-images/image.png",
                url);
        server.verify();
    }
}
