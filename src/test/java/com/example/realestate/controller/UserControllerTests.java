package com.example.realestate.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import javax.servlet.http.HttpServletRequest;

import com.example.realestate.repository.UserRepository;
import com.example.realestate.security.PasswordService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.ui.ExtendedModelMap;

@ExtendWith(MockitoExtension.class)
@SuppressWarnings("null")
class UserControllerTests {

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordService passwordService;

    @Mock
    private HttpServletRequest request;

    private UserController controller;

    @BeforeEach
    void setUp() {
        controller = new UserController(userRepository, passwordService);
    }

    @Test
    void rejectsMismatchedPasswordsWithoutSaving() {
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.registerUser(
                "Demo User", "demo", "demo@example.com", "1234567890",
                "GoodPassword1!", "DifferentPassword2@", request, model);

        assertEquals("registration", view);
        assertEquals("Passwords do not match.", model.get("error"));
        verify(userRepository, never()).save(org.mockito.ArgumentMatchers.any());
    }

    @Test
    void showsFriendlyMessageForAnExistingUsername() {
        when(userRepository.existsByUsernameIgnoreCase("demo")).thenReturn(true);
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.registerUser(
                "Demo User", " demo ", "demo@example.com", "1234567890",
                "GoodPassword1!", "GoodPassword1!", request, model);

        assertEquals("registration", view);
        assertEquals("That username is already registered. Please choose another.", model.get("error"));
        verify(userRepository, never()).save(org.mockito.ArgumentMatchers.any());
    }

    @Test
    void rejectsInvalidPhoneNumbersBeforeSaving() {
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.registerUser(
                "Demo User", "demo", "demo@example.com", "123",
                "GoodPassword1!", "GoodPassword1!", request, model);

        assertEquals("registration", view);
        assertEquals("Enter your name, username, valid email and a 10-digit phone number.", model.get("error"));
        verify(userRepository, never()).save(org.mockito.ArgumentMatchers.any());
    }

    @Test
    void rejectsWeakPasswordBeforeSaving() {
        when(passwordService.validateNewPassword("weakpassword"))
                .thenReturn("Password must include at least one uppercase letter.");
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.registerUser(
                "Demo User", "demo", "demo@example.com", "1234567890",
                "weakpassword", "weakpassword", request, model);

        assertEquals("registration", view);
        assertEquals("Password must include at least one uppercase letter.", model.get("error"));
        verify(userRepository, never()).save(org.mockito.ArgumentMatchers.any());
    }
}
