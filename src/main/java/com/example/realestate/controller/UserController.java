package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.realestate.model.User;
import com.example.realestate.repository.UserRepository;
import com.example.realestate.security.AuthenticationSession;
import com.example.realestate.security.PasswordService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.dao.DataIntegrityViolationException;

@Controller

public class UserController {

    private final UserRepository userRepository;
    private final PasswordService passwordService;

    public UserController(UserRepository userRepository, PasswordService passwordService) {
        this.userRepository = userRepository;
        this.passwordService = passwordService;
    }

    // Show registration form
    @GetMapping("/register")
    public String showRegisterForm() {
        return "registration";   // loads register.jsp
    }

    // Handle form submission
    @PostMapping("/register")
    public String registerUser(
            @RequestParam("name") String fullName,
            @RequestParam("username") String username,
            @RequestParam("email") String email,
            @RequestParam("number") String phoneNumber,
            @RequestParam("password") String password,
            @RequestParam("repassword") String confirmationPassword,
            HttpServletRequest request,
            Model model) {

        fullName = fullName.trim();
        username = username.trim();
        email = email.trim().toLowerCase(java.util.Locale.ROOT);
        phoneNumber = phoneNumber.trim();

        if (fullName.isEmpty() || username.isEmpty() || email.isEmpty() || !phoneNumber.matches("[0-9]{10}")) {
            model.addAttribute("error", "Enter your name, username, valid email and a 10-digit phone number.");
            return "registration";
        }
        if (!email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            model.addAttribute("error", "Enter a valid email address.");
            return "registration";
        }
        String passwordError = passwordService.validateNewPassword(password);
        if (passwordError != null) {
            model.addAttribute("error", passwordError);
            return "registration";
        }
        if (!password.equals(confirmationPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            return "registration";
        }
        if (userRepository.existsByUsernameIgnoreCase(username)) {
            model.addAttribute("error", "That username is already registered. Please choose another.");
            return "registration";
        }
        if (userRepository.existsByEmailIgnoreCase(email)) {
            model.addAttribute("error", "That email is already registered. Please log in instead.");
            return "registration";
        }

        User user = new User();
        user.setFullName(fullName);
        user.setUsername(username);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setPassword(passwordService.encode(password));

        try {
            userRepository.save(user);
        } catch (DataIntegrityViolationException exception) {
            model.addAttribute("error", "An account with that username or email already exists.");
            return "registration";
        }
        javax.servlet.http.HttpSession session = AuthenticationSession.startFresh(request);
        session.setAttribute("estatefinder.userId", user.getId());
        return "redirect:/project";
    }
}
