package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HousingController {

    @GetMapping("/housing")
    public String showHousingPage() {
        return "housing";  // resolves to /WEB-INF/views/lalit.jsp
    }
}
