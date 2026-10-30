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
class RentControllerSearchTests {
    @Mock
    private PropertyRepository propertyRepository;
    @Mock
    private CityListingCatalog cityListingCatalog;

    @Test
    void filtersRentalPropertiesByCityKeywordAndPriceRange() {
        Property matching = property("Gangapur apartment", "nashik", "Gangapur, Nashik", 20_000);
        Property wrongCity = property("Gangapur apartment", "pune", "Gangapur, Pune", 20_000);
        Property wrongPrice = property("Gangapur apartment", "nashik", "Gangapur, Nashik", 35_000);
        when(propertyRepository.findByStatusAndListingTypeIgnoreCase("ACCEPTED", "RENT"))
                .thenReturn(Arrays.asList(matching, wrongCity, wrongPrice));
        when(cityListingCatalog.findByCategory("Residential Rental")).thenReturn(Collections.emptyList());

        ExtendedModelMap model = new ExtendedModelMap();
        new RentController(cityListingCatalog, propertyRepository)
                .home(model, "nashik", "apartment", 10_000d, 30_000d);

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
