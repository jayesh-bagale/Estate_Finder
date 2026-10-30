package com.example.realestate.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.when;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import com.example.realestate.model.CityListing;
import com.example.realestate.repository.CityListingRepository;
import com.example.realestate.service.CityListingCatalog;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

@ExtendWith(MockitoExtension.class)
class ProjectControllerTests {

    @Mock
    private CityListingCatalog catalog;

    @Mock
    private CityListingRepository cityListingRepository;

    private ProjectController controller;

    @BeforeEach
    void setUp() {
        controller = new ProjectController(catalog);
    }

    @Test
    void cityLinksRenderTheirDatabaseBackedListingView() {
        when(catalog.supports("mumbai")).thenReturn(true);
        when(catalog.getCityName("mumbai")).thenReturn("Mumbai");
        when(catalog.findListings("mumbai", null, null)).thenReturn(Collections.emptyList());
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.propertyDetails("mumbai", null, null, model);

        assertEquals("city-properties", view);
        assertEquals("Mumbai", model.get("cityName"));
        assertEquals("mumbai", model.get("citySlug"));
    }

    @Test
    void forwardsCitySearchAndCategoryToTheCatalog() {
        when(catalog.supports("nashik")).thenReturn(true);
        when(catalog.getCityName("nashik")).thenReturn("Nashik");
        when(catalog.findListings("nashik", "gangapur", "Residential Rental"))
                .thenReturn(Collections.emptyList());
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.propertyDetails("nashik", "gangapur", "Residential Rental", model);

        assertEquals("city-properties", view);
        assertEquals("Residential Rental", model.get("selectedCategory"));
        assertEquals("gangapur", model.get("searchTerm"));
    }

    @Test
    void showsDetailsForDemoCityListings() {
        CityListing listing = new CityListing();
        listing.setId(31L);
        listing.setName("Sample Apartment");
        listing.setLocality("Gangapur");
        listing.setCityName("Nashik");
        listing.setDescription("A sample listing.");
        listing.setTransactionType("SALE");
        listing.setDemoData(true);
        when(cityListingRepository.findById(31L)).thenReturn(Optional.of(listing));
        ExtendedModelMap model = new ExtendedModelMap();

        String view = new ProjectController(catalog, cityListingRepository).cityListingDetails(31L, model);

        assertEquals("property-details", view);
        assertEquals("Sample Apartment", model.get("title"));
        assertEquals("Gangapur", model.get("location"));
        assertEquals(true, model.get("demoListing"));
    }

    @Test
    void hidesNonDemoCityListingsFromTheShowcaseDetailsRoute() {
        CityListing listing = new CityListing();
        listing.setDemoData(false);
        when(cityListingRepository.findById(31L)).thenReturn(Optional.of(listing));

        ResponseStatusException exception = assertThrows(ResponseStatusException.class,
                () -> new ProjectController(catalog, cityListingRepository).cityListingDetails(
                        31L, new ExtendedModelMap()));

        assertEquals(HttpStatus.NOT_FOUND, exception.getStatus());
    }

    @Test
    void paginatesAllSearchMatchesAndProvidesPurchaseActionsData() {
        List<CityListing> listings = IntStream.rangeClosed(1, 350)
                .mapToObj(id -> {
                    CityListing listing = new CityListing();
                    listing.setId((long) id);
                    listing.setName("Home " + id);
                    listing.setCitySlug("nashik");
                    listing.setCityName("Nashik");
                    listing.setLocality("Gangapur");
                    listing.setCategory("Residential Sale");
                    listing.setPropertyType("Apartment");
                    listing.setTransactionType("SALE");
                    listing.setPrice("₹50 lakh");
                    return listing;
                })
                .collect(Collectors.toList());
        when(cityListingRepository.findAll()).thenReturn(listings);
        ExtendedModelMap model = new ExtendedModelMap();

        String view = new ProjectController(catalog, cityListingRepository)
                .search(null, null, null, null, null, null, "featured", 2, 18, model);

        @SuppressWarnings("unchecked")
        List<CityListing> results = (List<CityListing>) model.get("results");
        assertEquals("search-results", view);
        assertEquals(350, model.get("resultCount"));
        assertEquals(20, model.get("totalPages"));
        assertEquals(2, model.get("currentPage"));
        assertEquals(18, results.size());
        assertEquals("Home 19", results.get(0).getName());
        assertEquals(19, model.get("firstResult"));
        assertEquals(36, model.get("lastResult"));
    }
}
