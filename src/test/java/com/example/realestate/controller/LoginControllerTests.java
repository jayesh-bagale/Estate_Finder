package com.example.realestate.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import com.example.realestate.model.User;
import com.example.realestate.repository.UserRepository;
import com.example.realestate.security.PasswordService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.ui.ExtendedModelMap;

@ExtendWith(MockitoExtension.class)
class LoginControllerTests {

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordService passwordService;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpSession session;

    private LoginController controller;

    @BeforeEach
    void setUp() {
        controller = new LoginController(userRepository, passwordService);
    }

    @Test
    void showsLoginErrorForUnknownAccountWithoutSaving() {
        when(userRepository.findAllByEmailIgnoreCase("unknown@example.com")).thenReturn(List.of());
        when(userRepository.findAllByUsernameIgnoreCase("unknown@example.com")).thenReturn(List.of());
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.loginUser(" unknown@example.com ", "wrong-password", request, model);

        assertEquals("login", view);
        assertEquals("Invalid email/username or password.", model.get("error"));
        verify(userRepository, never()).save(org.mockito.ArgumentMatchers.any());
    }

    @Test
    void showsTemporaryUnavailableMessageWhenUserLookupFails() {
        when(userRepository.findAllByEmailIgnoreCase("demo@example.com"))
                .thenThrow(new DataAccessResourceFailureException("database unavailable"));
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.loginUser("demo@example.com", "password", request, model);

        assertEquals("login", view);
        assertEquals("Login is temporarily unavailable. Please try again later.", model.get("error"));
    }

    @Test
    void looksUpLegacyUsernameWhenEmailDoesNotMatch() {
        User user = new User();
        user.setPassword("stored-password");
        when(userRepository.findAllByEmailIgnoreCase("legacy-user")).thenReturn(List.of());
        when(userRepository.findAllByUsernameIgnoreCase("legacy-user")).thenReturn(List.of(user));
        when(passwordService.matchesAndUpgrade(eq("wrong-password"), eq("stored-password"), any()))
                .thenReturn(false);
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.loginUser(" legacy-user ", "wrong-password", request, model);

        assertEquals("login", view);
        assertEquals("Invalid email/username or password.", model.get("error"));
        verify(userRepository, never()).save(org.mockito.ArgumentMatchers.any());
    }

    @Test
    void checksAllDuplicateEmailMatchesUntilCredentialsMatch() {
        User otherUser = new User();
        otherUser.setPassword("different-password");
        User expectedUser = new User();
        expectedUser.setId(42L);
        expectedUser.setPassword("legacy-password");
        when(userRepository.findAllByEmailIgnoreCase("shared@example.com"))
                .thenReturn(List.of(otherUser, expectedUser));
        when(passwordService.matchesAndUpgrade(eq("legacy-password"), eq("different-password"), any()))
                .thenReturn(false);
        when(passwordService.matchesAndUpgrade(eq("legacy-password"), eq("legacy-password"), any()))
                .thenReturn(true);
        doReturn(null).when(request).getSession(false);
        doReturn(session).when(request).getSession(true);
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.loginUser("shared@example.com", "legacy-password", request, model);

        assertEquals("redirect:/project", view);
        verify(userRepository).save(expectedUser);
    }
}
