package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.dao.DataIntegrityViolationException;

import com.example.realestate.model.aregister;
import com.example.realestate.repository.aregisterRepository;
import com.example.realestate.security.PasswordService;

@Controller
public class aregisterController {

    private final aregisterRepository adregisterRepository;
    private final PasswordService passwordService;

    public aregisterController(aregisterRepository adregisterRepository, PasswordService passwordService) {
        this.adregisterRepository = adregisterRepository;
        this.passwordService = passwordService;
    }

    // Show registration form
    @GetMapping("/adregister")
    public String ashowRegisterForm() {
        return "adregister";   // loads adregister.jsp
    }

    // Handle form submission
    @PostMapping("/adregister")
    public String aregisterUser(
            @RequestParam("name") String fullName,
            @RequestParam("username") String username,
            @RequestParam("email") String email,
            @RequestParam("number") String phoneNumber,
            @RequestParam("password") String password,
            @RequestParam("repassword") String repeatedPassword,
            Model model) {

        fullName = fullName.trim();
        username = username.trim();
        email = email.trim();
        phoneNumber = phoneNumber.trim();
        if (fullName.isEmpty() || username.isEmpty()
                || !email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")
                || !phoneNumber.matches("^[0-9]{10}$")) {
            model.addAttribute("error", "Enter a name, valid email, and 10-digit phone number.");
            return "adregister";
        }
        String passwordError = passwordService.validateNewPassword(password);
        if (passwordError != null) {
            model.addAttribute("error", passwordError);
            return "adregister";
        }
        if (!password.equals(repeatedPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            return "adregister";
        }
        if (adregisterRepository.existsByUsernameIgnoreCase(username)) {
            model.addAttribute("error", "That username is already registered. Please choose another.");
            return "adregister";
        }
        if (adregisterRepository.existsByEmailIgnoreCase(email)) {
            model.addAttribute("error", "That email is already registered. Please use another email.");
            return "adregister";
        }

        aregister adregister = new aregister();
        adregister.setFullName(fullName);
        adregister.setUsername(username);
        adregister.setEmail(email);
        adregister.setPhoneNumber(phoneNumber);
        adregister.setPassword(passwordService.encode(password));

        try {
            adregisterRepository.save(adregister);
        } catch (DataIntegrityViolationException exception) {
            model.addAttribute("error", "That username or email is already registered. Please choose another.");
            return "adregister";
        }
        return "redirect:/adminlogin?registered";
    }
}
