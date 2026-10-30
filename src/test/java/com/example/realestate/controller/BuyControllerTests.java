package com.example.realestate.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Collections;
import java.util.List;

import com.example.realestate.model.Property;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.service.CityListingCatalog;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.ui.ExtendedModelMap;

@ExtendWith(MockitoExtension.class)
class BuyControllerTests {

    @Mock
    private PropertyRepository propertyRepository;

    @Mock
    private CityListingCatalog cityListingCatalog;

    @Test
    void showsOnlyApprovedSaleProperties() {
        List<Property> saleProperties = Collections.singletonList(new Property());
        when(propertyRepository.findByStatusAndListingTypeIgnoreCase("ACCEPTED", "BUY"))
                .thenReturn(saleProperties);
        when(propertyRepository.findByStatusAndListingTypeIsNull("ACCEPTED"))
                .thenReturn(Collections.emptyList());
        when(cityListingCatalog.findByCategory("Residential Sale")).thenReturn(Collections.emptyList());
        ExtendedModelMap model = new ExtendedModelMap();

        String view = new Buycontroller(propertyRepository, cityListingCatalog).home(model);

        assertEquals("buy", view);
        assertEquals(saleProperties, model.get("properties"));
        verify(propertyRepository).findByStatusAndListingTypeIgnoreCase("ACCEPTED", "BUY");
        verify(propertyRepository).findByStatusAndListingTypeIsNull("ACCEPTED");
    }
}
