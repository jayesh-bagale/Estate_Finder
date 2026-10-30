package com.example.realestate.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.example.realestate.model.CityListing;
import org.junit.jupiter.api.Test;

class CityListingDemoSeederTests {

    @Test
    void buildsFiftyClearlyMarkedRecordsForEverySupportedCityAcrossAllCategories() {
        List<CityListing> listings = CityListingDemoSeeder.createSeedListings();

        assertEquals(350, listings.size());
        assertEquals(350, listings.stream().map(listing -> listing.getSeedKey()).collect(Collectors.toSet()).size());
        assertTrue(listings.stream().allMatch(listing -> listing.isDemoData()));
        assertEquals(7, listings.stream().map(listing -> listing.getCitySlug()).collect(Collectors.toSet()).size());
        assertEquals(5, listings.stream().map(listing -> listing.getCategory()).collect(Collectors.toSet()).size());
        for (String citySlug : CityListingCatalog.CITY_SLUGS) {
            assertEquals(50, listings.stream().filter(listing -> citySlug.equals(listing.getCitySlug())).count());
        }
        assertTrue(listings.stream().allMatch(listing -> listing.getPriceAmount() > 0));
        assertTrue(listings.stream().allMatch(listing -> listing.getLatitude() >= -90
                && listing.getLatitude() <= 90 && listing.getLongitude() >= -180 && listing.getLongitude() <= 180));
    }

    @Test
    void referencesExistingLocalImagesAndUsesDistinctCityLocalityAnchors() {
        List<CityListing> listings = CityListingDemoSeeder.createSeedListings();
        Set<String> localities = new HashSet<>();
        for (CityListing listing : listings) {
            assertTrue(listing.getImage().startsWith("/resources/images/"));
            assertTrue(Files.exists(Paths.get("src/main/webapp").resolve(listing.getImage().substring(1))),
                    listing.getImage());
            localities.add(listing.getCitySlug() + ":" + listing.getLatitude() + ":" + listing.getLongitude());
            assertTrue(listing.getCoordinatePrecision().contains("Approximate"));
        }
        assertFalse(localities.isEmpty());
        assertTrue(listings.stream().allMatch(listing -> listing.getDescription().contains("not a verified")));
    }
}
