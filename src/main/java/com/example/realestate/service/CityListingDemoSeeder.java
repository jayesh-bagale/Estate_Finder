package com.example.realestate.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import com.example.realestate.model.CityListing;
import com.example.realestate.repository.CityListingRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

@Component
@ConditionalOnProperty(name = "app.demo-seed.enabled", havingValue = "true")
public class CityListingDemoSeeder implements ApplicationRunner {

    private static final Logger LOGGER = LoggerFactory.getLogger(CityListingDemoSeeder.class);
    private static final List<CategorySeed> CATEGORY_SEEDS = Arrays.asList(
            new CategorySeed("Residential Rental", "RENT", 18_000, 2_000, "monthly",
                    new String[] {"1 BHK Apartment", "2 BHK Apartment"},
                    new String[] {"2bh.avif", "3bh.avif", "villa1.avif"}),
            new CategorySeed("Residential Sale", "SALE", 5_500_000, 800_000, "sale",
                    new String[] {"2 BHK Apartment", "Residential Plot"},
                    new String[] {"estate1.jpg", "real4.png", "palm.jpeg"}),
            new CategorySeed("Student Accommodation", "RENT", 6_500, 750, "monthly",
                    new String[] {"Shared Student PG", "Private Student Room"},
                    new String[] {"nilesh.jpeg", "vatsalya.jpeg", "sweet.jpg"}),
            new CategorySeed("Commercial Space", "RENT", 24_000, 3_500, "monthly",
                    new String[] {"Retail Shop", "Small Office"},
                    new String[] {"com.jpeg", "est.jpg", "estate2.jpg"}),
            new CategorySeed("Developer Project", "SALE", 7_000_000, 1_000_000, "sale",
                    new String[] {"Apartment Project", "Villa Project"},
                    new String[] {"roon.avif", "samr.avif", "rivera.jpg"}));

    private final CityListingRepository repository;

    public CityListingDemoSeeder(CityListingRepository repository) {
        this.repository = repository;
    }

    @Override
    @Transactional
    public void run(ApplicationArguments args) {
        List<CityListing> seedListings = createSeedListings();
        Set<String> existingKeys = new HashSet<>();
        repository.findBySeedKeyStartingWith("demo-v1-")
                .forEach(listing -> existingKeys.add(listing.getSeedKey()));

        List<CityListing> missingListings = new ArrayList<>();
        for (CityListing listing : seedListings) {
            if (!existingKeys.contains(listing.getSeedKey())) {
                missingListings.add(listing);
            }
        }
        if (!missingListings.isEmpty()) {
            repository.saveAll(missingListings);
        }

        LOGGER.info("Demo property seed complete: {} inserted, {} already present, {} total demo records.",
                missingListings.size(), seedListings.size() - missingListings.size(), seedListings.size());
    }

    static List<CityListing> createSeedListings() {
        List<CityListing> listings = new ArrayList<>();
        int cityIndex = 0;
        for (CitySeed city : cities()) {
            int recordNumber = 1;
            for (LocationSeed locality : city.localities) {
                for (CategorySeed category : CATEGORY_SEEDS) {
                    for (int variant = 0; variant < 2; variant++) {
                        listings.add(createListing(city, cityIndex, locality, category, variant, recordNumber++));
                    }
                }
            }
            cityIndex++;
        }
        return listings;
    }

    private static CityListing createListing(CitySeed city, int cityIndex, LocationSeed locality,
                                             CategorySeed category, int variant, int recordNumber) {
        int typeIndex = variant;
        int imageIndex = (recordNumber + variant) % category.images.length;
        long price = category.basePrice + (cityIndex * category.priceStep / 2L)
                + (locality.index * category.priceStep) + (variant * category.priceStep / 2L);
        String priceText = category.priceUnit.equals("monthly")
                ? String.format("Illustrative: Rs. %,d/month", price)
                : String.format("Illustrative: Rs. %.2f crore", price / 10_000_000.0);

        CityListing listing = new CityListing();
        listing.setSeedKey(String.format("demo-v1-%s-%03d", city.slug, recordNumber));
        listing.setCitySlug(city.slug);
        listing.setCityName(city.name);
        listing.setLocality(locality.name);
        listing.setCategory(category.name);
        listing.setTransactionType(category.transactionType);
        listing.setPropertyType(category.types[typeIndex]);
        listing.setName(String.format("%s in %s - Demo %02d",
                category.types[typeIndex], locality.name, recordNumber));
        listing.setPriceAmount((double) price);
        listing.setPrice(priceText);
        listing.setDescription("Illustrative demo listing for " + category.name.toLowerCase()
                + " in " + locality.name + ", " + city.name
                + ". This is generated preview data, not a verified property offer.");
        listing.setImage("/resources/images/" + category.images[imageIndex]);
        listing.setFurnishing(variant == 0 ? "Semi-furnished (illustrative)" : "Unfurnished (illustrative)");
        listing.setBedrooms(category.name.equals("Student Accommodation") ? 1 : variant + 1);
        listing.setBathrooms(variant + 1);
        listing.setAreaSqFt(variant == 0 ? 650 + locality.index * 35 : 950 + locality.index * 50);
        listing.setAmenities("Illustrative: parking, security, water");
        listing.setLatitude(locality.latitude);
        listing.setLongitude(locality.longitude);
        listing.setCoordinatePrecision("Approximate locality centre for demo only");
        listing.setDemoData(true);
        return listing;
    }

    private static List<CitySeed> cities() {
        return Arrays.asList(
                city("nashik", "Nashik",
                        loc("Govind Nagar", 19.9685, 73.7760),
                        loc("Gangapur Road", 20.0060, 73.7420),
                        loc("College Road", 20.0030, 73.7630),
                        loc("Panchavati", 20.0110, 73.7900),
                        loc("Pathardi Phata", 19.9510, 73.7590)),
                city("mumbai", "Mumbai",
                        loc("Chembur", 19.0522, 72.8990),
                        loc("Andheri East", 19.1150, 72.8690),
                        loc("Kandivali West", 19.2040, 72.8520),
                        loc("Powai", 19.1176, 72.9060),
                        loc("Borivali West", 19.2300, 72.8560)),
                city("pune", "Pune",
                        loc("Baner", 18.5590, 73.7860),
                        loc("Wakad", 18.5980, 73.7630),
                        loc("Kharadi", 18.5520, 73.9470),
                        loc("Hinjewadi", 18.5910, 73.7380),
                        loc("Hadapsar", 18.5010, 73.9260)),
                city("sambhajinagar", "Chhatrapati Sambhajinagar",
                        loc("CIDCO", 19.8760, 75.3570),
                        loc("Garkheda", 19.8620, 75.3430),
                        loc("Chikalthana", 19.8760, 75.3980),
                        loc("Osmanpura", 19.8650, 75.3220),
                        loc("Beed Bypass", 19.8420, 75.3430)),
                city("jalgaon", "Jalgaon",
                        loc("Mehrun", 21.0110, 75.5540),
                        loc("Ring Road", 21.0070, 75.5630),
                        loc("Gandhi Nagar", 21.0050, 75.5550),
                        loc("Shivaji Nagar", 21.0190, 75.5620),
                        loc("MIDC", 21.0200, 75.5900)),
                city("thane", "Thane",
                        loc("Ghodbunder Road", 19.2410, 72.9780),
                        loc("Majiwada", 19.2080, 72.9780),
                        loc("Pokhran Road", 19.2140, 72.9660),
                        loc("Manpada", 19.2360, 72.9750),
                        loc("Kasarvadavali", 19.2630, 72.9730)),
                city("west-thane", "West Thane",
                        loc("Manpada", 19.2360, 72.9750),
                        loc("Brahmand", 19.2380, 72.9700),
                        loc("Kasarvadavali", 19.2630, 72.9730),
                        loc("Hiranandani Estate", 19.2580, 72.9720),
                        loc("Waghbil", 19.2500, 72.9760)));
    }

    private static CitySeed city(String slug, String name, LocationSeed... locations) {
        List<LocationSeed> indexedLocations = new ArrayList<>();
        for (int index = 0; index < locations.length; index++) {
            LocationSeed location = locations[index];
            indexedLocations.add(new LocationSeed(location.name, location.latitude, location.longitude, index));
        }
        return new CitySeed(slug, name, indexedLocations);
    }

    private static LocationSeed loc(String name, double latitude, double longitude) {
        return new LocationSeed(name, latitude, longitude, 0);
    }

    private static class CitySeed {
        private final String slug;
        private final String name;
        private final List<LocationSeed> localities;

        private CitySeed(String slug, String name, List<LocationSeed> localities) {
            this.slug = slug;
            this.name = name;
            this.localities = localities;
        }
    }

    private static class LocationSeed {
        private final String name;
        private final double latitude;
        private final double longitude;
        private final int index;

        private LocationSeed(String name, double latitude, double longitude, int index) {
            this.name = name;
            this.latitude = latitude;
            this.longitude = longitude;
            this.index = index;
        }
    }

    private static class CategorySeed {
        private final String name;
        private final String transactionType;
        private final long basePrice;
        private final int priceStep;
        private final String priceUnit;
        private final String[] types;
        private final String[] images;

        private CategorySeed(String name, String transactionType, long basePrice, int priceStep,
                             String priceUnit, String[] types, String[] images) {
            this.name = name;
            this.transactionType = transactionType;
            this.basePrice = basePrice;
            this.priceStep = priceStep;
            this.priceUnit = priceUnit;
            this.types = types;
            this.images = images;
        }
    }
}
