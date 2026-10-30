package com.example.realestate.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.realestate.model.Property;
import com.example.realestate.model.CityListing;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.service.CityListingCatalog;

import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Controller
public class RentController {
    private final CityListingCatalog cityListingCatalog;
    private final PropertyRepository propertyRepository;

    public RentController(CityListingCatalog cityListingCatalog, PropertyRepository propertyRepository) {
        this.cityListingCatalog = cityListingCatalog;
        this.propertyRepository = propertyRepository;
    }

	 @GetMapping("/rent")
	    public String home(Model model,
                           @RequestParam(value = "city", required = false) String city,
                           @RequestParam(value = "query", required = false) String query,
                           @RequestParam(value = "minPrice", required = false) Double minPrice,
                           @RequestParam(value = "maxPrice", required = false) Double maxPrice) {
	        model.addAttribute("pageTitle", "Homes for Rent | EstateFinders");
            List<Property> rentalProperties =
                    propertyRepository.findByStatusAndListingTypeIgnoreCase("ACCEPTED", "RENT");
            model.addAttribute("properties", filterProperties(rentalProperties, city, query, minPrice, maxPrice));
            model.addAttribute("cityDemoListings", filterDemoListings(
                    cityListingCatalog.findByCategory("Residential Rental"), city, query, minPrice, maxPrice));
            model.addAttribute("selectedCity", city == null ? "" : city);
            model.addAttribute("query", query == null ? "" : query);
            model.addAttribute("minPrice", minPrice);
            model.addAttribute("maxPrice", maxPrice);
	        return "rent"; // corresponds to index.jsp
}

    public String home(Model model) {
        return home(model, null, null, null, null);
    }

    private List<Property> filterProperties(List<Property> properties, String city, String query,
                                            Double minPrice, Double maxPrice) {
        return properties.stream()
                .filter(property -> city == null || city.isBlank()
                        || matchesCity(property.getCity(), property.getAddress(), city))
                .filter(property -> query == null || query.isBlank()
                        || contains(property.getTitle(), query)
                        || contains(property.getDescription(), query)
                        || contains(property.getAddress(), query))
                .filter(property -> minPrice == null || property.getPrice() >= minPrice)
                .filter(property -> maxPrice == null || property.getPrice() <= maxPrice)
                .collect(Collectors.toList());
    }

    private List<CityListing> filterDemoListings(List<CityListing> listings, String city, String query,
                                                  Double minPrice, Double maxPrice) {
        return listings.stream()
                .filter(listing -> city == null || city.isBlank()
                        || normalize(listing.getCitySlug()).equals(normalize(city))
                        || normalize(listing.getCityName()).equals(normalize(city)))
                .filter(listing -> query == null || query.isBlank()
                        || contains(listing.getName(), query)
                        || contains(listing.getLocality(), query)
                        || contains(listing.getCityName(), query)
                        || contains(listing.getPropertyType(), query))
                .filter(listing -> minPrice == null || (listing.getPriceAmount() != null
                        && listing.getPriceAmount() >= minPrice))
                .filter(listing -> maxPrice == null || (listing.getPriceAmount() != null
                        && listing.getPriceAmount() <= maxPrice))
                .collect(Collectors.toList());
    }

    private boolean matchesCity(String propertyCity, String address, String city) {
        String selected = normalize(city);
        return (propertyCity != null && normalize(propertyCity).equals(selected))
                || (propertyCity == null && normalize(address).contains(selected));
    }

    private boolean contains(String value, String searchTerm) {
        return value != null && value.toLowerCase(Locale.ROOT).contains(searchTerm.trim().toLowerCase(Locale.ROOT));
    }

    private String normalize(String value) {
        return value == null ? "" : value.toLowerCase(Locale.ROOT).replaceAll("[^a-z0-9]", "");
    }

	@GetMapping("/rent/details/{property}")
	public String rentDetails(@PathVariable String property, Model model) {
		switch (property) {
			case "govind-nagar":
				addDetails(model, "2BHK Flats for Rent", "Govind Nagar, Nashik", "Rs. 17,000/month", "Spacious 2 BHK flats with balconies, attached bathrooms and secure parking.", "/resources/images/image copy 2.png");
				break;
			case "gangapur":
				addDetails(model, "2-3BHK Flats in Gangapur", "Gangapur, Nashik", "Rs. 18,000 - 25,000/month", "Premium apartments with modern amenities, excellent connectivity and gated security.", "/resources/images/image copy 5.png");
				break;
			case "pathardi-3bhk":
				addDetails(model, "3 BHK Flat for Rent", "Pathardi Phata, Nashik", "Rs. 18,500/month", "Well-planned 3 BHK home with landscaped surroundings, clubhouse access and 24/7 security.", "/resources/images/image copy 6.png");
				break;
			case "renuka-nagar":
				addDetails(model, "2 BHK Flat in Renuka Nagar", "Renuka Nagar, Nashik", "Rs. 22,000/month", "Large 2 BHK apartment with open-air amenities, pool access and reserved parking.", "/resources/images/image copy 8.png");
				break;
			case "pathardi-villa":
				addDetails(model, "4 BHK Villa for Rent", "Pathardi Phata, Nashik", "Rs. 49,000/month", "Private villa with spacious rooms, covered parking, smart security and a family-friendly layout.", "/resources/images/villa1.avif");
				break;
			case "pathardi-bungalow":
				addDetails(model, "3.5 BHK Villa for Rent", "Pathardi Gaon, Nashik", "Rs. 48,000/month", "Independent bungalow with generous interiors, modern architecture and quiet surroundings.", "/resources/images/vila1.avif");
				break;
			default:
				return "redirect:/rent";
		}
		return "rent-details";
	}

	private void addDetails(Model model, String title, String location, String price, String description, String image) {
		model.addAttribute("title", title);
		model.addAttribute("location", location);
		model.addAttribute("price", price);
		model.addAttribute("description", description);
		model.addAttribute("image", image);
	}
}
