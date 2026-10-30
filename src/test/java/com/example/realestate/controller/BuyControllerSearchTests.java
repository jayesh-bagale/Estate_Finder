package com.example.realestate.controller;

import com.example.realestate.model.Property;
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
class BuyControllerSearchTests {
    @Mock
    private PropertyRepository propertyRepository;
    @Mock
    private CityListingCatalog cityListingCatalog;

    @Test
    void filtersSalePropertiesByCityKeywordAndPriceRange() {
        Property matching = property("Gangapur villa", "nashik", "Gangapur, Nashik", 5_000_000);
        Property wrongCity = property("Gangapur villa", "pune", "Gangapur, Pune", 5_000_000);
        Property wrongPrice = property("Gangapur villa", "nashik", "Gangapur, Nashik", 9_000_000);
        when(propertyRepository.findByStatusAndListingTypeIgnoreCase("ACCEPTED", "BUY"))
                .thenReturn(Arrays.asList(matching, wrongCity, wrongPrice));
        when(propertyRepository.findByStatusAndListingTypeIsNull("ACCEPTED")).thenReturn(Collections.emptyList());
        when(cityListingCatalog.findByCategory("Residential Sale")).thenReturn(Collections.emptyList());

        ExtendedModelMap model = new ExtendedModelMap();
        new Buycontroller(propertyRepository, cityListingCatalog)
                .home(model, "nashik", "villa", 1_000_000d, 8_000_000d);

        @SuppressWarnings("unchecked")
        List<Property> results = (List<Property>) model.get("properties");
        assertEquals(Collections.singletonList(matching), results);
    }

    private Property property(String title, String city, String address, double price) {
        Property property = new Property();
        property.setTitle(title);
        property.setCity(city);
        property.setAddress(address);
        property.setPrice(price);
        return property;
    }
}
