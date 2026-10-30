package com.example.realestate.security;

import com.example.realestate.model.aregister;
import com.example.realestate.repository.aregisterRepository;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class AdminAccountBootstrap implements ApplicationRunner {

    private final aregisterRepository adminRepository;
    private final PasswordService passwordService;
    private final String username;
    private final String email;
    private final String password;

    public AdminAccountBootstrap(
            aregisterRepository adminRepository,
            PasswordService passwordService,
            @Value("${app.admin.bootstrap.username:}") String username,
            @Value("${app.admin.bootstrap.email:}") String email,
            @Value("${app.admin.bootstrap.password:}") String password) {
        this.adminRepository = adminRepository;
        this.passwordService = passwordService;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    @Override
    public void run(ApplicationArguments args) {
        boolean anyBootstrapValue = StringUtils.hasText(username)
                || StringUtils.hasText(email)
                || StringUtils.hasText(password);
        if (!anyBootstrapValue) {
            return;
        }
        if (!StringUtils.hasText(username) || !StringUtils.hasText(email) || !StringUtils.hasText(password)) {
            throw new IllegalStateException(
                    "Set ADMIN_BOOTSTRAP_USERNAME, ADMIN_BOOTSTRAP_EMAIL, and ADMIN_BOOTSTRAP_PASSWORD together.");
        }
        if (adminRepository.count() > 0) {
            return;
        }

        String bootstrapPassword = password;
        String passwordError = passwordService.validateNewPassword(bootstrapPassword);
        if (passwordError != null) {
            throw new IllegalStateException("ADMIN_BOOTSTRAP_PASSWORD is invalid: " + passwordError);
        }
        aregister admin = new aregister();
        admin.setFullName(username);
        admin.setUsername(username);
        admin.setEmail(email);
        admin.setPassword(passwordService.encode(bootstrapPassword));
        adminRepository.save(admin);
    }
}
