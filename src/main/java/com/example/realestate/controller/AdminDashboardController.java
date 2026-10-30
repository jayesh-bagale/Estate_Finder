package com.example.realestate.controller;

import com.example.realestate.model.Booking;
import com.example.realestate.model.Contact;
import com.example.realestate.model.Property;
import com.example.realestate.model.User;
import com.example.realestate.repository.BookingRepository;
import com.example.realestate.repository.ContactRepository;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.repository.UserRepository;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller
public class AdminDashboardController {

    private final PropertyRepository propertyRepository;
    private final BookingRepository bookingRepository;
    private final UserRepository userRepository;
    private final ContactRepository contactRepository;
    public AdminDashboardController(
            PropertyRepository propertyRepository,
            BookingRepository bookingRepository,
            UserRepository userRepository,
            ContactRepository contactRepository)
    {
        this.propertyRepository = propertyRepository;
        this.bookingRepository = bookingRepository;
        this.userRepository = userRepository;
        this.contactRepository = contactRepository;
    }

    // ✅ Admin Dashboard (summary + recent bookings)
    @GetMapping("/admindashboard")
    public String showDashboard(Model model) {
        long totalProperties = propertyRepository.count();
        long pendingProperties = propertyRepository.countByStatus("PENDING");
        long totalBookings = bookingRepository.count();
        long totalUsers = userRepository.count();
        // Show recent 5 bookings
        List<Booking> recentBookings = bookingRepository.findTop5ByOrderByBookingDateDesc();

        model.addAttribute("totalProperties", totalProperties);
        model.addAttribute("pendingProperties", pendingProperties);
        model.addAttribute("totalBookings", totalBookings);
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("recentBookings", recentBookings);

        return "adminDashboard";  // → adminDashboard.jsp
    }

    // ✅ Show all Properties
    @GetMapping("/admin/properties")
    public String showAllProperties(Model model) {
        List<Property> properties = propertyRepository.findAll();
        model.addAttribute("properties", properties);
        return "properties"; // → properties.jsp
    }

    @PostMapping("/admin/properties/{id}/delete")
    public String deleteProperty(@PathVariable Long id) {
        Property property = propertyRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Property not found."));
        propertyRepository.delete(property);
        return "redirect:/admin/properties";
    }

    // ✅ Show all Bookings
    @GetMapping("/admin/bookings")
    public String showAllBookings(Model model) {
        List<Booking> bookings = bookingRepository.findAll();
        model.addAttribute("bookings", bookings);
        return "bookings"; // → bookings.jsp
    }

    @PostMapping("/admin/bookings/{id}/status")
    @ResponseBody
    public ResponseEntity<Void> updateBookingStatus(
            @PathVariable @org.springframework.lang.NonNull Long id, @RequestParam String status) {
        if (!"accepted".equals(status) && !"declined".equals(status)) {
            return ResponseEntity.badRequest().build();
        }

        return bookingRepository.findById(id)
                .map(booking -> {
                    booking.setStatus(status);
                    bookingRepository.save(booking);
                    return ResponseEntity.ok().<Void>build();
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    // ✅ Show all Users
    @GetMapping("/admin/users")
    public String showAllUsers(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "users"; // → users.jsp
    }

    // ✅ Show Contact Messages
    @GetMapping("/admin/contact")
    public String showAllContacts(Model model) {
        List<Contact> contacts = contactRepository.findAll();
        model.addAttribute("contacts", contacts);
        return "contact-list"; // → contact-list.jsp
    }

    @PostMapping("/admin/contact/{id}/delete")
    public String deleteContact(@PathVariable Long id) {
        Contact contact = contactRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Contact message not found."));
        contactRepository.delete(contact);
        return "redirect:/admin/contact";
    }
   
    
   
    }
