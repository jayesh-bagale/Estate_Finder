package com.example.realestate.controller;

import com.example.realestate.model.Estate;
import com.example.realestate.repository.EstateRepository;
import com.example.realestate.security.UploadStorageService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.util.Objects;
@Controller
@RequestMapping("/estate")
public class EstateController {

    private final EstateRepository estateRepository;
    private final UploadStorageService uploadStorageService;

    public EstateController(EstateRepository estateRepository, UploadStorageService uploadStorageService) {
        this.estateRepository = estateRepository;
        this.uploadStorageService = uploadStorageService;
    }

    // Show add form
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("estate", new Estate());
        return "add-estate"; // JSP page for adding estate
    }

    // Save property with images
    @PostMapping("/save")
    public String saveEstate(
            @ModelAttribute Estate estate,
            @RequestParam("mainImage") MultipartFile mainImage,
            @RequestParam("floorPlanImage") MultipartFile floorPlanImage
    ) throws IOException {

        estate.setId(null);
        estate.setMainImagePath(uploadStorageService.storeImage(mainImage));
        estate.setFloorPlanImagePath(uploadStorageService.storeImage(floorPlanImage));

        // Save estate in DB
        estateRepository.save(estate);
        return "redirect:/estate/list";
    }

    // Show all properties
    @GetMapping("/list")
    public String listEstates(Model model) {
        model.addAttribute("estates", estateRepository.findAll());
        return "estate-list"; // JSP page to display all estates
    }

    // Show property details
    @GetMapping("/details/{id}")
    public String estateDetails(@PathVariable @org.springframework.lang.NonNull Long id, Model model) {
        Estate estate = estateRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Property not found."));
        model.addAttribute("estate", estate);
        return "estate-details"; // JSP page to show estate details
    }
    @PostMapping("/delete/{id}")
    public String deleteEstate(@PathVariable @org.springframework.lang.NonNull Long id) {
        Estate estate = estateRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Property not found."));
        estateRepository.delete(Objects.requireNonNull(estate));
        return "redirect:/estate/list";
    }
 // Show all properties for management (delete option)
    @GetMapping("/manage")
    public String manageProperties(Model model) {
        model.addAttribute("estates", estateRepository.findAll());
        return "admindelete"; // JSP page with table and delete button
    }
  

}
