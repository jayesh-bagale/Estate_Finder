package com.example.realestate.controller;

import com.example.realestate.model.Property;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.security.UploadStorageService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/property")
public class PropertyController {

    private final PropertyRepository propertyRepository;
    private final UploadStorageService uploadStorageService;

    public PropertyController(PropertyRepository propertyRepository, UploadStorageService uploadStorageService) {
        this.propertyRepository = propertyRepository;
        this.uploadStorageService = uploadStorageService;
    }

    // Submit new property (Sell form)
    @PostMapping("/submit-property")
    public String submitProperty(@RequestParam("title") String title,
                                 @RequestParam("description") String description,
                                 @RequestParam("ownerName") String ownerName,
                                 @RequestParam("price") double price,
                                 @RequestParam("address") String address,
                                 @RequestParam("locality") String locality,
                                 @RequestParam("postalCode") String postalCode,
                                 @RequestParam("city") String city,
                                 @RequestParam("propertyType") String propertyType,
                                 @RequestParam("bedrooms") int bedrooms,
                                 @RequestParam("bathrooms") int bathrooms,
                                 @RequestParam("areaSqFt") int areaSqFt,
                                 @RequestParam("furnishing") String furnishing,
                                 @RequestParam("amenities") String amenities,
                                 @RequestParam("listingType") String listingType,
                                 @RequestParam("image") MultipartFile imageFile,
                                 HttpServletRequest request,
                                 RedirectAttributes redirectAttributes) throws IOException {

        if (!Double.isFinite(price) || price <= 0) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Price must be greater than zero.");
        }

        if (bedrooms < 0 || bathrooms < 0 || areaSqFt <= 0) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                    "Bedrooms and bathrooms cannot be negative, and area must be greater than zero.");
        }
        if (imageFile.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "A property image is required.");
        }
        if (bedrooms > 50 || bathrooms > 50) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Bedrooms and bathrooms must be 50 or fewer.");
        }

        String normalizedListingType = normalizeListingType(listingType);
        String normalizedPropertyType = requireChoice(propertyType, "Property type",
                "Apartment", "Independent house", "Villa", "Plot", "Commercial space", "Other");
        String normalizedFurnishing = requireChoice(furnishing, "Furnishing",
                "Unfurnished", "Semi-furnished", "Fully furnished", "Not applicable");
        String normalizedCity = requireChoice(city, "City",
                "nashik", "mumbai", "pune", "sambhajinagar", "jalgaon", "thane", "west-thane");
        String normalizedPostalCode = requireText(postalCode, "Postal code");
        if (!normalizedPostalCode.matches("\\d{6}")) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Enter a valid 6-digit Indian PIN code.");
        }

        Property property = new Property();
        property.setTitle(requireText(title, "Title"));
        property.setDescription(requireText(description, "Description"));
        property.setOwnerName(requireText(ownerName, "Owner name"));
        property.setPrice(price);
        property.setAddress(requireText(address, "Street address"));
        property.setLocality(requireText(locality, "Locality"));
        property.setPostalCode(normalizedPostalCode);
        property.setCity(normalizedCity);
        property.setPropertyType(normalizedPropertyType);
        property.setBedrooms(bedrooms);
        property.setBathrooms(bathrooms);
        property.setAreaSqFt(areaSqFt);
        property.setFurnishing(normalizedFurnishing);
        property.setAmenities(requireText(amenities, "Amenities"));
        property.setListingType(normalizedListingType);
        property.setStatus("PENDING");
        HttpSession session = request.getSession(false);
        Object sessionUserId = session == null ? null : session.getAttribute("estatefinder.userId");
        Long sellerUserId = sessionUserId instanceof Number ? ((Number) sessionUserId).longValue() : null;
        property.setSellerUserId(sellerUserId);
        property.setImagePath(uploadStorageService.storeImage(imageFile));
        propertyRepository.save(property);

        redirectAttributes.addFlashAttribute("successMessage",
                "Your property has been submitted for review. It will appear in listings after admin approval.");
        return sellerUserId == null ? "redirect:/project" : "redirect:/profile";
    }

    private String requireText(String value, String fieldName) {
        if (value == null || value.isBlank()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, fieldName + " is required.");
        }
        return value.trim();
    }

    private String requireChoice(String value, String fieldName, String... allowedValues) {
        String normalizedValue = requireText(value, fieldName);
        return Arrays.stream(allowedValues)
                .filter(allowedValue -> allowedValue.equalsIgnoreCase(normalizedValue))
                .findFirst()
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.BAD_REQUEST, "Select a valid " + fieldName.toLowerCase() + "."));
    }

    private String normalizeListingType(String listingType) {
        if (listingType != null && !listingType.isBlank()) {
            String value = listingType.trim().toUpperCase();
            if ("BUY".equals(value) || "SALE".equals(value)) {
                return "BUY";
            }
            if ("RENT".equals(value) || "LEASE".equals(value)) {
                return "RENT";
            }
            if ("COMMERCIAL".equals(value)) {
                return "COMMERCIAL";
            }
        }

        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Select a valid listing purpose.");
    }

    // Admin page: show all accepted properties
    @GetMapping("/properties")
    public String viewAcceptedProperties(Model model) {
        List<Property> acceptedProperties = propertyRepository.findByStatus("ACCEPTED");
        model.addAttribute("properties", acceptedProperties);
        return "properties"; // JSP showing accepted properties
    }

    @GetMapping("/{id}")
    public String propertyDetails(@PathVariable long id, Model model) {
        Property property = propertyRepository.findById(id).orElse(null);
        if (property == null || !"ACCEPTED".equalsIgnoreCase(property.getStatus())) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Property not found.");
        }
        model.addAttribute("title", property.getTitle());
        model.addAttribute("location", property.getAddress() + ", " + property.getLocality());
        model.addAttribute("city", property.getCity());
        model.addAttribute("postalCode", property.getPostalCode());
        model.addAttribute("description", property.getDescription());
        model.addAttribute("ownerName", property.getOwnerName());
        model.addAttribute("image", property.getImagePath());
        model.addAttribute("propertyId", property.getId());
        model.addAttribute("price", property.getPrice());
        model.addAttribute("listingType", property.getListingType());
        model.addAttribute("propertyType", property.getPropertyType());
        model.addAttribute("bedrooms", property.getBedrooms());
        model.addAttribute("bathrooms", property.getBathrooms());
        model.addAttribute("areaSqFt", property.getAreaSqFt());
        model.addAttribute("furnishing", property.getFurnishing());
        model.addAttribute("amenities", property.getAmenities());
        model.addAttribute("postalCode", property.getPostalCode());
        return "property-details";
    }

    // Admin page: show pending properties for approval
    @GetMapping("/sellproperty")
    public String viewPendingSellRequests(Model model) {
        List<Property> pendingProperties = propertyRepository.findByStatus("PENDING");
        model.addAttribute("properties", pendingProperties);
        return "selldelete"; // JSP with accept/decline buttons
    }

    // Accept a pending property
    @PostMapping("/accept/{id}")
    public String acceptProperty(@PathVariable long id) {
        Property property = propertyRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Property not found."));
        property.setStatus("ACCEPTED");
        propertyRepository.save(property);
        return "redirect:/admin/properties";
    }

    // Keep declined listings so their owner can see the review outcome.
    @PostMapping("/decline/{id}")
    public String declineProperty(@PathVariable long id) {
        Property property = propertyRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Property not found."));
        property.setStatus("DECLINED");
        propertyRepository.save(property);
        return "redirect:/property/sellproperty";
    }

    // Buy page: show accepted properties
    @GetMapping("/buy")
    public String showBuyPropertyPage(Model model) {
        List<Property> accepted = propertyRepository.findByStatus("ACCEPTED");
        model.addAttribute("properties", accepted);
        return "buy";
    }

    // Sell property form (user)
    @GetMapping("/sell-property")
    public String showSellPropertyForm() {
        return "sell-property";
    }

    // Rent page
    @GetMapping("/rent")
    public String showRentPropertyPage() {
        return "rent";
    }
}
