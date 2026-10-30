package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.realestate.model.aregister;
import com.example.realestate.repository.aregisterRepository;
import com.example.realestate.security.AuthenticationSession;
import com.example.realestate.security.AdminAuthenticationInterceptor;
import com.example.realestate.security.PasswordService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AdminLoginController {

    private final aregisterRepository aregisterRepository;
    private final PasswordService passwordService;

    public AdminLoginController(aregisterRepository aregisterRepository, PasswordService passwordService) {
        this.aregisterRepository = aregisterRepository;
        this.passwordService = passwordService;
    }

    // Show login page
    @GetMapping("/adminlogin")
    public String showLoginPage() {
        return "adminlogin";  // /WEB-INF/views/adminlogin.jsp
    }

    // Handle login form submit
    @PostMapping("/adminlogin")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               HttpServletRequest request,
                               Model model) {
        aregister admin = aregisterRepository.findByUsername(username.trim());

        if (admin != null && passwordService.matchesAndUpgrade(password, admin.getPassword(), admin::setPassword)) {
            aregisterRepository.save(admin);
            HttpSession session = AuthenticationSession.startFresh(request);
            session.setAttribute(AdminAuthenticationInterceptor.ADMIN_SESSION_ATTRIBUTE, admin.getId());
            return "redirect:/admindashboard";
        }
        model.addAttribute("error", "Invalid username or password");
        return "adminlogin";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/project";
    }
}
