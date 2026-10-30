package com.example.realestate.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.lang.NonNull;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Objects;

@Configuration
public class WebSecurityConfiguration implements WebMvcConfigurer {

    private final AdminAuthenticationInterceptor adminAuthenticationInterceptor;
    private final UploadStorageService uploadStorageService;

    public WebSecurityConfiguration(AdminAuthenticationInterceptor adminAuthenticationInterceptor,
                                    UploadStorageService uploadStorageService) {
        this.adminAuthenticationInterceptor = adminAuthenticationInterceptor;
        this.uploadStorageService = uploadStorageService;
    }

    @Override
    public void addInterceptors(@NonNull InterceptorRegistry registry) {
        registry.addInterceptor(Objects.requireNonNull(adminAuthenticationInterceptor)).addPathPatterns("/**");
    }

    @Override
    public void addResourceHandlers(@NonNull ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations(
                        uploadStorageService.getUploadResourceLocation(),
                        "classpath:/static/uploads/");
    }
}
