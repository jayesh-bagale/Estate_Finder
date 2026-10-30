package com.example.realestate.service;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import com.example.realestate.model.CityListing;
import com.example.realestate.repository.CityListingRepository;
import org.springframework.stereotype.Component;

@Component
public class CityListingCatalog {

    public static final List<String> CITY_SLUGS = Collections.unmodifiableList(Arrays.asList(
            "nashik", "mumbai", "pune", "sambhajinagar", "jalgaon", "thane", "west-thane"));

    public static final List<String> CATEGORIES = Collections.unmodifiableList(Arrays.asList(
            "Residential Rental", "Residential Sale", "Student Accommodation", "Commercial Space",
            "Developer Project"));

    private final CityListingRepository cityListingRepository;
    private final Map<String, String> cityNames;

    public CityListingCatalog(CityListingRepository cityListingRepository) {
        this.cityListingRepository = cityListingRepository;
        Map<String, String> names = new LinkedHashMap<>();
        names.put("nashik", "Nashik");
        names.put("mumbai", "Mumbai");
        names.put("pune", "Pune");
        names.put("sambhajinagar", "Chhatrapati Sambhajinagar");
        names.put("jalgaon", "Jalgaon");
        names.put("thane", "Thane");
        names.put("west-thane", "West Thane");
        this.cityNames = Collections.unmodifiableMap(names);
    }

    public boolean supports(String slug) {
        return cityNames.containsKey(normalize(slug));
    }

    public String getCityName(String slug) {
        return cityNames.get(normalize(slug));
    }

    public List<CityListing> findListings(String slug, String searchTerm) {
        return findListings(slug, searchTerm, null);
    }

    public List<CityListing> findListings(String slug, String searchTerm, String category) {
        String normalizedSlug = normalize(slug);
        if (!cityNames.containsKey(normalizedSlug)) {
            return Collections.emptyList();
        }
        String query = searchTerm == null ? "" : searchTerm.trim().toLowerCase(Locale.ROOT);
        String selectedCategory = category == null ? "" : category.trim();
        if (!selectedCategory.isEmpty() && !CATEGORIES.contains(selectedCategory)) {
            return Collections.emptyList();
        }
        return cityListingRepository.findByCitySlugOrderByIdAsc(normalizedSlug).stream()
                .filter(listing -> selectedCategory.isEmpty() || selectedCategory.equals(listing.getCategory()))
                .filter(listing -> query.isEmpty()
                        || contains(listing.getName(), query)
                        || contains(listing.getLocality(), query)
                        || contains(listing.getPropertyType(), query)
                        || contains(listing.getCategory(), query))
                .collect(Collectors.toList());
    }

    public List<CityListing> findByCategory(String category) {
        return cityListingRepository.findByCategoryIgnoreCaseAndDemoDataTrueOrderByCitySlugAscIdAsc(category);
    }

    public List<CityListing> findFeaturedListings() {
        return cityListingRepository.findTop12ByDemoDataTrueOrderByIdAsc();
    }

    private boolean contains(String value, String query) {
        return value != null && value.toLowerCase(Locale.ROOT).contains(query);
    }

    private String normalize(String slug) {
        String normalized = slug == null ? "" : slug.trim().toLowerCase(Locale.ROOT);
        return "thane-west".equals(normalized) ? "thane" : normalized;
    }
}
