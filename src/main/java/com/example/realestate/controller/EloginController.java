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
public class EloginController {

    private static final Logger logger = LoggerFactory.getLogger(EloginController.class);

    private final UserRepository userRepository;
    private final PasswordService passwordService;

    public EloginController(UserRepository userRepository, PasswordService passwordService) {
        this.userRepository = userRepository;
        this.passwordService = passwordService;
    }

    // GET mapping for login page
    @GetMapping("/elogin")
    public String showLoginPage() {
        return "elogin"; // resolves to /WEB-INF/views/elogin.jsp
    }

    // POST mapping for login
    @PostMapping("/elogin")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               HttpServletRequest request,
                               Model model) {

        User user;
        try {
            user = authenticate(userRepository.findAllByUsernameIgnoreCase(username.trim()), password);
        } catch (DataAccessException exception) {
            logger.error("Legacy user login lookup failed.", exception);
            model.addAttribute("error", "Login is temporarily unavailable. Please try again later.");
            return "elogin";
        }

        if (user != null) {
            try {
                userRepository.save(user);
            } catch (DataAccessException exception) {
                logger.error("Could not save user after successful legacy login.", exception);
                model.addAttribute("error", "Login is temporarily unavailable. Please try again later.");
                return "elogin";
            }
            javax.servlet.http.HttpSession session = AuthenticationSession.startFresh(request);
            session.setAttribute("estatefinder.userId", user.getId());
            return "redirect:/booking";
        }
        model.addAttribute("error", "Invalid username or password");
        return "elogin";
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
