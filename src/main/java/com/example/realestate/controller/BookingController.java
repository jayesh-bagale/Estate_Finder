package com.example.realestate.controller;

import com.example.realestate.model.Booking;
import com.example.realestate.model.User;
import com.example.realestate.model.Property;
import com.example.realestate.repository.BookingRepository;
import com.example.realestate.repository.PropertyRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@Controller
@RequestMapping("/booking")   // base URL for this controller
public class BookingController {

    private final BookingRepository bookingRepository;
    private final PropertyRepository propertyRepository;

    public BookingController(BookingRepository bookingRepository, PropertyRepository propertyRepository) {
        this.bookingRepository = bookingRepository;
        this.propertyRepository = propertyRepository;
    }

    // Show booking form (JSP)
    @GetMapping
    public String showForm(@RequestParam(required = false) Long propertyId,
                           @RequestParam(required = false) String propertyName,
                           @RequestParam(required = false) String propertyType,
                           @RequestParam(required = false) String locationName,
                           @RequestParam(required = false) String builderName,
                           Model model) {
        Booking booking = new Booking();
        if (propertyId != null) {
            applyProperty(booking, findAcceptedProperty(propertyId));
        } else {
            booking.setPropertyName(propertyName);
            booking.setPropertyType(propertyType);
            booking.setLocationName(locationName);
            booking.setBuilderName(builderName);
        }
        model.addAttribute("booking", booking);
        return "booking"; // booking.jsp
    }

    // Handle form submission
    @PostMapping
    public String saveBooking(@ModelAttribute Booking booking, Model model) {
        booking.setId(null);
        if (booking.getPropertyId() != null) {
            applyProperty(booking, findAcceptedProperty(booking.getPropertyId()));
        }
        booking.setStatus("pending");
        bookingRepository.save(booking);
        model.addAttribute("message", "Booking submitted successfully!");
        return "redirect:/project";
    }

   

    private Property findAcceptedProperty(Long propertyId) {
        Property property = propertyRepository.findById(propertyId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Property not found."));
        if (!"ACCEPTED".equalsIgnoreCase(property.getStatus())) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Property not found.");
        }
        return property;
    }

    private void applyProperty(Booking booking, Property property) {
        booking.setPropertyId(property.getId());
        booking.setPropertyName(property.getTitle());
        booking.setPropertyType(property.getListingType());
        booking.setLocationName(property.getAddress());
        booking.setBuilderName("EstateFinders listing");
    }

    // Show registration page from BookingController
    @GetMapping("/login")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User()); // needed for the registration form
        return "login"; // register.jsp
    }
   
   
}
