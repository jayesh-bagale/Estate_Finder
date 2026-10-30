package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.realestate.service.CityListingCatalog;

@Controller

public class Commercial { // Home page
    private final CityListingCatalog cityListingCatalog;

    public Commercial(CityListingCatalog cityListingCatalog) {
        this.cityListingCatalog = cityListingCatalog;
    }

    @GetMapping("/commercial")
    public String home(Model model) {
        model.addAttribute("pageTitle", "EstateFinders - Find Your Dream Home");
        model.addAttribute("cityDemoListings", cityListingCatalog.findByCategory("Commercial Space"));
        return "Commercial"; // corresponds to index.jsp
    }}
