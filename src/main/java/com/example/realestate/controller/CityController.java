package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CityController {

    @GetMapping("/city")
    public String showCityPage() {
        return "city";  // resolves to /WEB-INF/views/lalit.jsp
    }
}
