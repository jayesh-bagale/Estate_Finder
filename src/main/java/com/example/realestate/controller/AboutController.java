package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AboutController {

    // Mapping for the About Us page
    @GetMapping("/about")
    public String about() {
        // This returns the JSP page located at /WEB-INF/views/about.jsp
        return "about";
    }
}
