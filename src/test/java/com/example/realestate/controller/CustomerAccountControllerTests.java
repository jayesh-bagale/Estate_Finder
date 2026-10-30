package com.example.realestate.controller;

import com.example.realestate.model.User;
import com.example.realestate.model.Booking;
import com.example.realestate.model.Property;
import com.example.realestate.repository.BookingRepository;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.repository.UserRepository;
import com.example.realestate.security.PasswordService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.mockito.Mockito.never;

@ExtendWith(MockitoExtension.class)
class CustomerAccountControllerTests {
    @Mock
    private UserRepository userRepository;

    @Mock
    private BookingRepository bookingRepository;

    @Mock
    private PropertyRepository propertyRepository;

    @Mock
    private PasswordService passwordService;

    @Test
    void profileLoadsTheSignedInUser() {
        User user = new User();
        user.setId(42L);
        user.setFullName("Test User");
        user.setEmail("test@example.com");
        when(userRepository.findById(42L)).thenReturn(Optional.of(user));
        Booking pending = new Booking();
        pending.setStatus("pending");
        Booking accepted = new Booking();
        accepted.setStatus("accepted");
        when(bookingRepository.findByEmailIgnoreCaseOrderByBookingDateDesc("test@example.com"))
                .thenReturn(List.of(pending, accepted));
        Property listing = new Property();
        listing.setStatus("PENDING");
        when(propertyRepository.findBySellerUserIdOrderByIdDesc(42L)).thenReturn(List.of(listing));
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.getSession(true).setAttribute("estatefinder.userId", 42L);
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller().profile(request, model);

        assertEquals("profile", view);
        assertSame(user, model.get("profileUser"));
        assertEquals(2, model.get("bookingCount"));
        assertEquals(1L, model.get("pendingCount"));
        assertEquals(1L, model.get("acceptedCount"));
        assertEquals(1, model.get("listedPropertyCount"));
        assertSame(listing, ((List<?>) model.get("listedProperties")).get(0));
        verify(userRepository).findById(42L);
    }

    @Test
    void profileRedirectsWhenCustomerIsNotSignedIn() {
        String view = controller()
                .profile(new MockHttpServletRequest(), new ExtendedModelMap());

        assertEquals("redirect:/login", view);
    }

    @Test
    void updatesNameAndPhoneForSignedInCustomer() {
        User user = new User();
        user.setId(42L);
        when(userRepository.findById(42L)).thenReturn(Optional.of(user));
        MockHttpServletRequest request = signedInRequest();
        RedirectAttributesModelMap flash = new RedirectAttributesModelMap();

        String view = controller().updateProfile(request, " Updated Name ", "1234567890", flash);

        assertEquals("redirect:/profile", view);
        assertEquals("Updated Name", user.getFullName());
        assertEquals("1234567890", user.getPhoneNumber());
        assertEquals("Your profile details were updated.", flash.getFlashAttributes().get("profileSuccess"));
        verify(userRepository).save(user);
    }

    @Test
    void rejectsInvalidPhoneWithoutSavingProfile() {
        User user = new User();
        when(userRepository.findById(42L)).thenReturn(Optional.of(user));
        RedirectAttributesModelMap flash = new RedirectAttributesModelMap();

        String view = controller().updateProfile(signedInRequest(), "Updated Name", "123", flash);

        assertEquals("redirect:/profile", view);
        assertEquals("Enter your name (up to 120 characters) and a valid 10-digit phone number.",
                flash.getFlashAttributes().get("profileError"));
        verify(userRepository, never()).save(any(User.class));
    }

    @Test
    void changesPasswordOnlyWhenCurrentPasswordMatchesAndConfirmationIsValid() {
        User user = new User();
        user.setId(42L);
        user.setPassword("old-hash");
        when(userRepository.findById(42L)).thenReturn(Optional.of(user));
        when(passwordService.matchesAndUpgrade(eq("current-pass"), eq("old-hash"),
                org.mockito.ArgumentMatchers.<Consumer<String>>any())).thenReturn(true);
        when(passwordService.encode("NewPassword1!")).thenReturn("new-hash");
        RedirectAttributesModelMap flash = new RedirectAttributesModelMap();

        String view = controller().changePassword(
                signedInRequest(), "current-pass", "NewPassword1!", "NewPassword1!", flash);

        assertEquals("redirect:/profile", view);
        assertEquals("new-hash", user.getPassword());
        assertEquals("Your password was changed.", flash.getFlashAttributes().get("passwordSuccess"));
        verify(userRepository).save(user);
    }

    @Test
    void rejectsWeakNewPasswordWithoutSaving() {
        User user = new User();
        user.setPassword("old-hash");
        when(userRepository.findById(42L)).thenReturn(Optional.of(user));
        when(passwordService.matchesAndUpgrade(eq("current-pass"), eq("old-hash"),
                org.mockito.ArgumentMatchers.<Consumer<String>>any())).thenReturn(true);
        when(passwordService.validateNewPassword("weakpassword"))
                .thenReturn("Password must include at least one uppercase letter.");
        RedirectAttributesModelMap flash = new RedirectAttributesModelMap();

        String view = controller().changePassword(
                signedInRequest(), "current-pass", "weakpassword", "weakpassword", flash);

        assertEquals("redirect:/profile", view);
        assertEquals("Password must include at least one uppercase letter.",
                flash.getFlashAttributes().get("passwordError"));
        verify(userRepository, never()).save(any(User.class));
    }

    @Test
    void rejectsIncorrectCurrentPasswordWithoutSaving() {
        User user = new User();
        user.setPassword("old-hash");
        when(userRepository.findById(42L)).thenReturn(Optional.of(user));
        when(passwordService.matchesAndUpgrade(eq("wrong-pass"), eq("old-hash"),
                org.mockito.ArgumentMatchers.<Consumer<String>>any())).thenReturn(false);
        RedirectAttributesModelMap flash = new RedirectAttributesModelMap();

        String view = controller().changePassword(
                signedInRequest(), "wrong-pass", "new-password", "new-password", flash);

        assertEquals("redirect:/profile", view);
        assertEquals("Your current password is incorrect.", flash.getFlashAttributes().get("passwordError"));
        verify(userRepository, never()).save(any(User.class));
    }

    @Test
    void customerLogoutInvalidatesTheSession() {
        MockHttpServletRequest request = new MockHttpServletRequest();
        MockHttpSession session = new MockHttpSession();
        request.setSession(session);

        String view = controller().logout(request);

        assertEquals("redirect:/project", view);
        assertTrue(session.isInvalid());
    }

    private CustomerAccountController controller() {
        return new CustomerAccountController(userRepository, bookingRepository, propertyRepository, passwordService);
    }

    private MockHttpServletRequest signedInRequest() {
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.getSession(true).setAttribute("estatefinder.userId", 42L);
        return request;
    }
}
