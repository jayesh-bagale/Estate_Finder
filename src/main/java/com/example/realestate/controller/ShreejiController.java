package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShreejiController {

    @GetMapping("/shreeji")
    public String showShreejiPage() {
        return "shreeji";  // resolves to /WEB-INF/views/shreeji.jsp
    }
}
