package com.example.realestate.security;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.concurrent.atomic.AtomicReference;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

class PasswordServiceTests {

    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    private final PasswordService passwordService = new PasswordService(encoder);

    @Test
    void upgradesLegacyPlaintextPasswordAfterSuccessfulMatch() {
        AtomicReference<String> savedPassword = new AtomicReference<>();

        assertTrue(passwordService.matchesAndUpgrade("legacy-password", "legacy-password", savedPassword::set));

        String upgradedPassword = savedPassword.get();
        assertNotEquals("legacy-password", upgradedPassword);
        assertTrue(encoder.matches("legacy-password", upgradedPassword));
    }

    @Test
    void rejectsIncorrectLegacyPasswordWithoutChangingIt() {
        AtomicReference<String> savedPassword = new AtomicReference<>();

        assertFalse(passwordService.matchesAndUpgrade("wrong-password", "legacy-password", savedPassword::set));

        assertNull(savedPassword.get());
    }

    @Test
    void acceptsBcryptPasswordWithoutRewritingIt() {
        String hashedPassword = passwordService.encode("current-password");
        AtomicReference<String> savedPassword = new AtomicReference<>();

        assertTrue(passwordService.matchesAndUpgrade("current-password", hashedPassword, savedPassword::set));

        assertNull(savedPassword.get());
    }

    @Test
    void treatsBcryptInputErrorsAsInvalidCredentials() {
        PasswordEncoder encoder = mock(PasswordEncoder.class);
        when(encoder.matches("too-long-password", "$2a$stored-hash"))
                .thenThrow(new IllegalArgumentException("Invalid password input"));
        PasswordService service = new PasswordService(encoder);

        assertFalse(service.matchesAndUpgrade("too-long-password", "$2a$stored-hash", ignored -> {
        }));
    }

    @Test
    void acceptsPasswordMeetingAllNewPasswordRules() {
        assertNull(passwordService.validateNewPassword("StrongPassword1!"));
    }

    @Test
    void reportsTheFirstPasswordRuleThatIsNotMet() {
        assertTrue(passwordService.validateNewPassword("weakpassword").contains("uppercase"));
        assertTrue(passwordService.validateNewPassword("NoNumber!").contains("number"));
        assertTrue(passwordService.validateNewPassword("NoSpecial1").contains("special"));
        assertTrue(passwordService.validateNewPassword("Has Space1!").contains("spaces"));
        assertTrue(passwordService.validateNewPassword("Ab1!").contains("8 characters"));
        assertTrue(passwordService.validateNewPassword("A".repeat(70) + "b1!")
                .contains("72 UTF-8 bytes"));
    }
}
