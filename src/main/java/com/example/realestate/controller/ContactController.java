package com.example.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.realestate.model.Contact;
import com.example.realestate.repository.ContactRepository;

@Controller
public class ContactController {

    private final ContactRepository contactRepository;

    public ContactController(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    // Show Contact Form Page
    @GetMapping("/contact")
    public String showContactForm() {
        return "contact"; // contact.jsp
    }

    // Handle Form Submission
    @PostMapping("/contact")
    public String submitContact(@RequestParam("name") String name,
                                @RequestParam("email") String email,
                                @RequestParam(value = "phone", required = false) String phone,
                                @RequestParam("subject") String subject,
                                @RequestParam("message") String message,
                                Model model) {

        Contact contact = new Contact(name, email, phone, subject, message);
        contactRepository.save(contact);

        model.addAttribute("successMessage", "Thank you! Your message has been submitted.");
        return "redirect:/project"; // redirect to table view
    }

    
    
}
