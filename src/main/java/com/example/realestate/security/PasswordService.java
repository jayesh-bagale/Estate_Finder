package com.example.realestate.security;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.function.Consumer;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class PasswordService {

    private static final int MIN_PASSWORD_LENGTH = 8;
    private static final int MAX_BCRYPT_PASSWORD_BYTES = 72;

    private final PasswordEncoder passwordEncoder;

    public PasswordService(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    public String encode(String rawPassword) {
        if (rawPassword == null) {
            throw new IllegalArgumentException("Password must not be null.");
        }
        return passwordEncoder.encode(rawPassword);
    }

    public String validateNewPassword(String rawPassword) {
        if (rawPassword == null || rawPassword.length() < MIN_PASSWORD_LENGTH) {
            return "Password must be at least 8 characters long.";
        }
        if (rawPassword.getBytes(StandardCharsets.UTF_8).length > MAX_BCRYPT_PASSWORD_BYTES) {
            return "Password must be no more than 72 UTF-8 bytes.";
        }
        if (rawPassword.chars().anyMatch(Character::isWhitespace)) {
            return "Password must not contain spaces or whitespace.";
        }
        if (!rawPassword.matches(".*[A-Z].*")) {
            return "Password must include at least one uppercase letter.";
        }
        if (!rawPassword.matches(".*[a-z].*")) {
            return "Password must include at least one lowercase letter.";
        }
        if (!rawPassword.matches(".*[0-9].*")) {
            return "Password must include at least one number.";
        }
        if (!rawPassword.matches(".*[^A-Za-z0-9\\s].*")) {
            return "Password must include at least one special character.";
        }
        return null;
    }

    public boolean matchesAndUpgrade(String rawPassword, String storedPassword,
                                     Consumer<String> persistUpgradedPassword) {
        if (rawPassword == null || storedPassword == null) {
            return false;
        }

        if (storedPassword.startsWith("$2a$") || storedPassword.startsWith("$2b$")
                || storedPassword.startsWith("$2y$")) {
            try {
                return passwordEncoder.matches(rawPassword, storedPassword);
            } catch (IllegalArgumentException exception) {
                return false;
            }
        }

        boolean matches = MessageDigest.isEqual(
                rawPassword.getBytes(StandardCharsets.UTF_8),
                storedPassword.getBytes(StandardCharsets.UTF_8));
        if (matches) {
            persistUpgradedPassword.accept(passwordEncoder.encode(rawPassword));
        }
        return matches;
    }
}
