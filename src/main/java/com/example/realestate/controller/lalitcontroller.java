package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class lalitcontroller {

    @GetMapping("/lalit")
    public String showLalitPage() {
        return "lalit";  // resolves to /WEB-INF/views/lalit.jsp
    }
}
