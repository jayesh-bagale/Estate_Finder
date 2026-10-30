package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class KrishController {

    @GetMapping("/krishna")
    public String showKrishPage() {
        return "krish";  // resolves to /WEB-INF/views/krish.jsp
    }
}
