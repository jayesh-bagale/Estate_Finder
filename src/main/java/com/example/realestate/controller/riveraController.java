package com.example.realestate.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class riveraController {
	 @GetMapping("/rivera")
	    public String home(Model model) {
	        model.addAttribute("pageTitle", "EstateFinders - Find Your Dream Home");
	        return "rivera"; // corresponds to index.jsp
	    }}


