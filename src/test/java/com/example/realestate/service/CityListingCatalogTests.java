package com.example.realestate.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import com.example.realestate.model.CityListing;
import com.example.realestate.repository.CityListingRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class CityListingCatalogTests {

    @Mock
    private CityListingRepository repository;

    private CityListingCatalog catalog;

    @BeforeEach
    void setUp() {
        catalog = new CityListingCatalog(repository);
    }

    @Test
    void supportsEveryCityUsedByTheHomepageSelector() {
        List<String> citySlugs = Arrays.asList(
                "nashik", "mumbai", "pune", "sambhajinagar", "jalgaon", "thane", "west-thane");

        citySlugs.forEach(slug -> assertTrue(catalog.supports(slug)));
        assertEquals("Thane", catalog.getCityName("thane-west"));
    }

    @Test
    void filtersDatabaseListingsByLocalityAndCategory() {
        CityListing matching = listing("Govind Nagar", "Residential Rental");
        CityListing notMatchingCategory = listing("Gangapur Road", "Residential Sale");
        when(repository.findByCitySlugOrderByIdAsc("nashik"))
                .thenReturn(Arrays.asList(matching, notMatchingCategory));

        List<CityListing> results = catalog.findListings("nashik", "govind", "Residential Rental");

        assertEquals(Collections.singletonList(matching), results);
    }

    @Test
    void unknownCitiesAndCategoriesReturnNoListings() {
        assertTrue(catalog.findListings("unknown-city", null).isEmpty());
        assertTrue(catalog.findListings("nashik", null, "Unknown Category").isEmpty());
    }

    private CityListing listing(String locality, String category) {
        CityListing listing = new CityListing();
        listing.setCitySlug("nashik");
        listing.setLocality(locality);
        listing.setCategory(category);
        listing.setName("Demo " + locality);
        listing.setPropertyType("Apartment");
        return listing;
    }
}
