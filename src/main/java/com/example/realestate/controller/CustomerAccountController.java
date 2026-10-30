package com.example.realestate.controller;

import com.example.realestate.model.User;
import com.example.realestate.model.Booking;
import com.example.realestate.model.Property;
import com.example.realestate.repository.BookingRepository;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.repository.UserRepository;
import com.example.realestate.security.PasswordService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CustomerAccountController {
    private static final String CUSTOMER_ID_ATTRIBUTE = "estatefinder.userId";
    private static final Logger logger = LoggerFactory.getLogger(CustomerAccountController.class);
    private final UserRepository userRepository;
    private final BookingRepository bookingRepository;
    private final PropertyRepository propertyRepository;
    private final PasswordService passwordService;

    public CustomerAccountController(UserRepository userRepository,
                                     BookingRepository bookingRepository,
                                     PropertyRepository propertyRepository,
                                     PasswordService passwordService) {
        this.userRepository = userRepository;
        this.bookingRepository = bookingRepository;
        this.propertyRepository = propertyRepository;
        this.passwordService = passwordService;
    }

    @GetMapping("/profile")
    public String profile(HttpServletRequest request, Model model) {
        User user = getSignedInUser(request);
        if (user == null) {
            return "redirect:/login";
        }

        List<Booking> bookings = bookingRepository.findByEmailIgnoreCaseOrderByBookingDateDesc(user.getEmail());
        List<Property> listedProperties = propertyRepository.findBySellerUserIdOrderByIdDesc(user.getId());
        model.addAttribute("profileUser", user);
        model.addAttribute("bookings", bookings);
        model.addAttribute("listedProperties", listedProperties);
        model.addAttribute("listedPropertyCount", listedProperties.size());
        model.addAttribute("bookingCount", bookings.size());
        model.addAttribute("pendingCount", bookings.stream()
                .filter(booking -> "pending".equalsIgnoreCase(booking.getStatus()))
                .count());
        model.addAttribute("acceptedCount", bookings.stream()
                .filter(booking -> "accepted".equalsIgnoreCase(booking.getStatus())
                        || "approved".equalsIgnoreCase(booking.getStatus()))
                .count());
        return "profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(HttpServletRequest request,
                                @RequestParam("fullName") String fullName,
                                @RequestParam("phoneNumber") String phoneNumber,
                                RedirectAttributes redirectAttributes) {
        User user = getSignedInUser(request);
        if (user == null) {
            return "redirect:/login";
        }

        String normalizedName = fullName.trim();
        String normalizedPhone = phoneNumber.trim();
        if (normalizedName.isEmpty() || normalizedName.length() > 120
                || !normalizedPhone.matches("[0-9]{10}")) {
            redirectAttributes.addFlashAttribute("profileError",
                    "Enter your name (up to 120 characters) and a valid 10-digit phone number.");
            return "redirect:/profile";
        }

        user.setFullName(normalizedName);
        user.setPhoneNumber(normalizedPhone);
        try {
            userRepository.save(user);
        } catch (DataAccessException exception) {
            logger.error("Could not update customer profile for user id {}.", user.getId(), exception);
            redirectAttributes.addFlashAttribute("profileError",
                    "We could not update your profile right now. Please try again.");
            return "redirect:/profile";
        }
        redirectAttributes.addFlashAttribute("profileSuccess", "Your profile details were updated.");
        return "redirect:/profile";
    }

    @PostMapping("/profile/password")
    public String changePassword(HttpServletRequest request,
                                 @RequestParam("currentPassword") String currentPassword,
                                 @RequestParam("newPassword") String newPassword,
                                 @RequestParam("confirmPassword") String confirmPassword,
                                 RedirectAttributes redirectAttributes) {
        User user = getSignedInUser(request);
        if (user == null) {
            return "redirect:/login";
        }

        if (!passwordService.matchesAndUpgrade(currentPassword, user.getPassword(), ignored -> { })) {
            redirectAttributes.addFlashAttribute("passwordError", "Your current password is incorrect.");
            return "redirect:/profile";
        }
        String passwordError = passwordService.validateNewPassword(newPassword);
        if (passwordError != null) {
            redirectAttributes.addFlashAttribute("passwordError", passwordError);
            return "redirect:/profile";
        }
        if (!newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("passwordError", "New passwords do not match.");
            return "redirect:/profile";
        }

        user.setPassword(passwordService.encode(newPassword));
        try {
            userRepository.save(user);
        } catch (DataAccessException exception) {
            logger.error("Could not change password for user id {}.", user.getId(), exception);
            redirectAttributes.addFlashAttribute("passwordError",
                    "We could not change your password right now. Please try again.");
            return "redirect:/profile";
        }
        redirectAttributes.addFlashAttribute("passwordSuccess", "Your password was changed.");
        return "redirect:/profile";
    }

    @PostMapping("/customer/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/project";
    }

    private User getSignedInUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Object sessionUserId = session == null ? null : session.getAttribute(CUSTOMER_ID_ATTRIBUTE);
        if (!(sessionUserId instanceof Number)) {
            return null;
        }
        User user = userRepository.findById(((Number) sessionUserId).longValue()).orElse(null);
        if (user == null && session != null) {
            session.invalidate();
        }
        return user;
    }
}
