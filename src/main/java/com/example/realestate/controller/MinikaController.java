package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MinikaController {

    @GetMapping("/minika")
    public String showMinikaPage() {
        return "minika";  // resolves to /WEB-INF/views/lalit.jsp
    }
}
