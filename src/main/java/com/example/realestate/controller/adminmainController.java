package com.example.realestate.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adminmainController {

    @GetMapping("/adminmain")
    public String home() {
        return "redirect:/admindashboard";
    }
}
