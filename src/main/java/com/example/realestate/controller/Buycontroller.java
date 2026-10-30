package com.example.realestate.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.Locale;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.realestate.model.CityListing;
import com.example.realestate.model.Property;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.service.CityListingCatalog;

@Controller
public class Buycontroller {

    private final PropertyRepository propertyRepository;
    private final CityListingCatalog cityListingCatalog;

    public Buycontroller(PropertyRepository propertyRepository, CityListingCatalog cityListingCatalog) {
        this.propertyRepository = propertyRepository;
        this.cityListingCatalog = cityListingCatalog;
    }

    // Home page for Buy section
    @GetMapping("/buy")
    public String home(Model model,
                       @RequestParam(value = "city", required = false) String city,
                       @RequestParam(value = "query", required = false) String query,
                       @RequestParam(value = "minPrice", required = false) Double minPrice,
                       @RequestParam(value = "maxPrice", required = false) Double maxPrice) {
        model.addAttribute("pageTitle", "Homes for Sale | EstateFinders");
        List<Property> saleProperties = propertyRepository.findByStatusAndListingTypeIgnoreCase("ACCEPTED", "BUY");
        saleProperties = new ArrayList<>(saleProperties);
        saleProperties.addAll(propertyRepository.findByStatusAndListingTypeIsNull("ACCEPTED"));
        model.addAttribute("properties", filterProperties(saleProperties, city, query, minPrice, maxPrice));
        model.addAttribute("cityDemoListings", filterDemoListings(
                cityListingCatalog.findByCategory("Residential Sale"), city, query, minPrice, maxPrice));
        model.addAttribute("selectedCity", city == null ? "" : city);
        model.addAttribute("query", query == null ? "" : query);
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);
        return "buy"; // buy.jsp will iterate over accepted properties
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

    // Optional: Separate endpoint if needed for "estate list"
    @GetMapping("/buy/estate/add")
    public String showEstateList(Model model) {
        List<Property> acceptedProperties = propertyRepository.findByStatus("ACCEPTED");
        model.addAttribute("properties", acceptedProperties);
        model.addAttribute("cityDemoListings", cityListingCatalog.findByCategory("Residential Sale"));
        return "estate-list"; // estate-list.jsp will iterate over accepted properties
    }

}
