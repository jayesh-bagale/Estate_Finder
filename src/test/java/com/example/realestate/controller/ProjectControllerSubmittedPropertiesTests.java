package com.example.realestate.controller;

import com.example.realestate.model.Property;
import com.example.realestate.repository.CityListingRepository;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.service.CityListingCatalog;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.ui.ExtendedModelMap;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ProjectControllerSubmittedPropertiesTests {
    @Mock
    private CityListingCatalog cityListingCatalog;
    @Mock
    private CityListingRepository cityListingRepository;
    @Mock
    private PropertyRepository propertyRepository;

    @Test
    void includesApprovedSellerPropertiesMatchingGeneralSearchFilters() {
        Property matching = property("Gangapur villa", "nashik", "Gangapur, Nashik", "BUY", 5_000_000);
        Property wrongCity = property("Gangapur villa", "pune", "Gangapur, Pune", "BUY", 5_000_000);
        Property wrongType = property("Gangapur villa", "nashik", "Gangapur, Nashik", "RENT", 5_000_000);
        when(cityListingRepository.findAll()).thenReturn(Collections.emptyList());
        when(propertyRepository.findByStatus("ACCEPTED"))
                .thenReturn(Arrays.asList(matching, wrongCity, wrongType));

        ExtendedModelMap model = new ExtendedModelMap();
        ProjectController controller = new ProjectController(
                cityListingCatalog, cityListingRepository, propertyRepository);
        controller.search("villa", "nashik", "Residential Sale", null, null,
                null, "featured", 1, 18, model);

        @SuppressWarnings("unchecked")
        List<Property> results = (List<Property>) model.get("submittedProperties");
        assertEquals(Collections.singletonList(matching), results);
    }

    private Property property(String title, String city, String address, String listingType, double price) {
        Property property = new Property();
        property.setTitle(title);
        property.setCity(city);
        property.setAddress(address);
        property.setListingType(listingType);
        property.setPrice(price);
        return property;
    }
}
