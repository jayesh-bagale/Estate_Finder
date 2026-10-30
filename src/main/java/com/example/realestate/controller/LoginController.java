package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.dao.DataAccessException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.example.realestate.model.User;
import com.example.realestate.repository.UserRepository;
import com.example.realestate.security.AuthenticationSession;
import com.example.realestate.security.PasswordService;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    private final UserRepository userRepository;
    private final PasswordService passwordService;

    public LoginController(UserRepository userRepository, PasswordService passwordService) {
        this.userRepository = userRepository;
        this.passwordService = passwordService;
    }

    // Show login page
    @GetMapping("/login")
    public String showLoginForm() {
        return "login"; // login.jsp
    }

    // Handle login submission
    @PostMapping("/login")
    public String loginUser(
            @RequestParam("email") String emailOrUsername,
            @RequestParam("password") String password,
            HttpServletRequest request,
            Model model) {

        String loginId = emailOrUsername.trim();
        User user;
        try {
            user = authenticate(userRepository.findAllByEmailIgnoreCase(loginId), password);
            if (user == null) {
                user = authenticate(userRepository.findAllByUsernameIgnoreCase(loginId), password);
            }
        } catch (DataAccessException exception) {
            logger.error("User login lookup failed.", exception);
            model.addAttribute("error", "Login is temporarily unavailable. Please try again later.");
            return "login";
        }

        if (user == null) {
            model.addAttribute("error", "Invalid email/username or password.");
            return "login";
        }

        try {
            userRepository.save(user);
        } catch (DataAccessException exception) {
            logger.error("Could not save user after successful login.", exception);
            model.addAttribute("error", "Login is temporarily unavailable. Please try again later.");
            return "login";
        }
        javax.servlet.http.HttpSession session = AuthenticationSession.startFresh(request);
        session.setAttribute("estatefinder.userId", user.getId());
        return "redirect:/project";
    }

    private User authenticate(List<User> users, String password) {
        for (User user : users) {
            if (passwordService.matchesAndUpgrade(password, user.getPassword(), user::setPassword)) {
                return user;
            }
        }
        return null;
    }
}
