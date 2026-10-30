package com.example.realestate.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.example.realestate.model.aregister;
import com.example.realestate.repository.aregisterRepository;
import com.example.realestate.security.PasswordService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.ui.ExtendedModelMap;

@ExtendWith(MockitoExtension.class)
@SuppressWarnings("null")
class AregisterControllerTests {

    @Mock
    private aregisterRepository adminRepository;

    @Mock
    private PasswordService passwordService;

    private aregisterController controller;

    @BeforeEach
    void setUp() {
        controller = new aregisterController(adminRepository, passwordService);
    }

    @Test
    void savesValidatedAdminWithEncodedPassword() {
        when(adminRepository.existsByUsernameIgnoreCase("newadmin")).thenReturn(false);
        when(adminRepository.existsByEmailIgnoreCase("admin@example.com")).thenReturn(false);
        when(passwordService.encode("StrongPassword1!")).thenReturn("encoded-password");
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.aregisterUser(
                " New Admin ", " newadmin ", " admin@example.com ", "1234567890",
                "StrongPassword1!", "StrongPassword1!", model);

        assertEquals("redirect:/adminlogin?registered", view);
        verify(adminRepository).save(any(aregister.class));
        verify(passwordService).encode("StrongPassword1!");
    }

    @Test
    void rejectsPasswordMismatch() {
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.aregisterUser(
                "New Admin", "newadmin", "admin@example.com", "1234567890",
                "StrongPassword1!", "DifferentPassword2@", model);

        assertEquals("adregister", view);
        assertEquals("Passwords do not match.", model.get("error"));
        verify(adminRepository, never()).save(any(aregister.class));
    }

    @Test
    void rejectsExistingUsernameWithoutSaving() {
        when(adminRepository.existsByUsernameIgnoreCase("newadmin")).thenReturn(true);
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.aregisterUser(
                "New Admin", "newadmin", "admin@example.com", "1234567890",
                "StrongPassword1!", "StrongPassword1!", model);

        assertEquals("adregister", view);
        assertEquals("That username is already registered. Please choose another.", model.get("error"));
        verify(adminRepository, never()).save(any(aregister.class));
    }

    @Test
    void rejectsWeakPassword() {
        when(passwordService.validateNewPassword("weakpassword"))
                .thenReturn("Password must include at least one uppercase letter.");
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.aregisterUser(
                "New Admin", "newadmin", "admin@example.com", "1234567890",
                "weakpassword", "weakpassword", model);

        assertEquals("adregister", view);
        assertEquals("Password must include at least one uppercase letter.", model.get("error"));
        verify(adminRepository, never()).save(any(aregister.class));
    }
}
