package com.example.realestate.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.realestate.service.CityListingCatalog;

@Controller
public class PgController {
    private final CityListingCatalog cityListingCatalog;

    public PgController(CityListingCatalog cityListingCatalog) {
        this.cityListingCatalog = cityListingCatalog;
    }

	 @GetMapping("/pg")
	    public String home(Model model) {
	        model.addAttribute("pageTitle", "EstateFinders - Find Your Dream Home");
            model.addAttribute("cityDemoListings", cityListingCatalog.findByCategory("Student Accommodation"));
	        return "pg"; // corresponds to index.jsp
}
}