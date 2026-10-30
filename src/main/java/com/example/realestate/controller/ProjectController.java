package com.example.realestate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.example.realestate.model.CityListing;
import com.example.realestate.model.Property;
import com.example.realestate.repository.CityListingRepository;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.service.CityListingCatalog;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.stream.Collectors;

@Controller

public class ProjectController {

    private final CityListingCatalog cityListingCatalog;
    private final CityListingRepository cityListingRepository;
    private final PropertyRepository propertyRepository;

    public ProjectController(CityListingCatalog cityListingCatalog) {
        this(cityListingCatalog, null, null);
    }

    @Autowired
    public ProjectController(CityListingCatalog cityListingCatalog,
                             CityListingRepository cityListingRepository,
                             PropertyRepository propertyRepository) {
        this.cityListingCatalog = cityListingCatalog;
        this.cityListingRepository = cityListingRepository;
        this.propertyRepository = propertyRepository;
    }

    public ProjectController(CityListingCatalog cityListingCatalog,
                             CityListingRepository cityListingRepository) {
        this(cityListingCatalog, cityListingRepository, null);
    }

    @GetMapping("/")
    public String rootRedirect() {
        return "redirect:/project";
    }

    // Home page
    @GetMapping("/project")
    public String home(Model model) {
        model.addAttribute("pageTitle", "EstateFinders - Find Your Dream Home");
        model.addAttribute("cityDemoListings", cityListingCatalog.findFeaturedListings());
        return "project"; // corresponds to index.jsp
    }

    @GetMapping("/home")
    public String legacyHome() {
        return "redirect:/project";
    }

    @GetMapping("/thane")
    public String thanePage(Model model) {
        model.addAttribute("pageTitle", "Thane Properties | EstateFinders");
        model.addAttribute("cityName", "Thane");
        model.addAttribute("cityDescription", "Premium apartments, luxury villas, PGs and hostels in Thane West, Ghodbunder Road, and nearby localities.");
        return "thane";
    }

    @GetMapping("/admin")
    public String adminLoginAlias() {
        return "redirect:/adminlogin";
    }

    @GetMapping("/admin/project")
    public String adminLogoutAlias(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/project";
    }

    @GetMapping("/admin/estate")
    public String adminEstateAlias() {
        return "redirect:/estate/add";
    }

    @GetMapping("/admin/propertyOverview")
    public String adminPropertyOverviewAlias() {
        return "redirect:/estate/add";
    }

    @GetMapping("/admin/sellProperty")
    public String adminSellPropertyAlias() {
        return "redirect:/property/sellproperty";
    }

    @GetMapping("/research/city-insights")
    public String cityResearchAlias() {
        return "redirect:/city";
    }

    @GetMapping("/research/housing")
    public String housingResearchAlias() {
        return "redirect:/housing";
    }

    @GetMapping({"/properties", "/properties/{slug}"})
    public String propertyDetails(@PathVariable(required = false) String slug,
                                  @RequestParam(required = false) String search,
                                  @RequestParam(required = false) String category, Model model) {
        if (cityListingCatalog.supports(slug)) {
            String cityName = cityListingCatalog.getCityName(slug);
            model.addAttribute("cityName", cityName);
            model.addAttribute("citySlug", "thane-west".equalsIgnoreCase(slug) ? "west-thane" : slug.toLowerCase(java.util.Locale.ROOT));
            model.addAttribute("listings", cityListingCatalog.findListings(slug, search, category));
            model.addAttribute("categories", CityListingCatalog.CATEGORIES);
            model.addAttribute("searchTerm", search == null ? "" : search);
            model.addAttribute("selectedCategory", category == null ? "" : category);
            return "city-properties";
        }

        String title = "Properties in Nashik";
        String location = "Nashik";
        String description = "Explore verified homes, apartments and commercial properties with EstateFinders.";
        String image = "/resources/images/estate3.jpg";

        if (slug != null) {
            switch (slug.toLowerCase()) {
                case "mumbai":
                    title = "Properties in Mumbai";
                    location = "Mumbai";
                    break;
                case "pune":
                    title = "Properties in Pune";
                    location = "Pune";
                    break;
                case "sambhajinagar":
                    title = "Properties in Chhatrapati Sambhajinagar";
                    location = "Chhatrapati Sambhajinagar";
                    break;
                case "jalgaon":
                    title = "Properties in Jalgaon";
                    location = "Jalgaon";
                    break;
                case "thane":
                case "thane-west":
                    title = "Properties in Thane";
                    location = "Thane West, Maharashtra";
                    description = "Modern apartments, premium villas and investor-friendly homes in Thane West with quick access to Mumbai, Ghodbunder Road and major business hubs.";
                    image = "/resources/images/roon.avif";
                    break;
                case "west-thane":
                    title = "Properties in West Thane";
                    location = "West Thane, Maharashtra";
                    description = "Contemporary 2 BHK to 4 BHK residences, green communities and commercial properties in West Thane designed for family living and strong rental demand.";
                    image = "/resources/images/rivera.jpg";
                    break;
                case "samraat":
                    title = "Samraat Residential Properties";
                    location = "Nashik";
                    description = "Premium residential homes with practical layouts, modern amenities and convenient city connectivity.";
                    image = "/resources/images/samr.avif";
                    break;
                case "renuka":
                    title = "Renuka Nagar Commercial Space";
                    location = "Renuka Nagar, Nashik";
                    description = "Well-connected commercial property suitable for offices, retail and professional services.";
                    image = "/resources/images/renuka4.avif";
                    break;
                case "kalpataru":
                case "mr":
                case "schandshi":
                case "csatpur":
                case "snashikro":
                    title = "Commercial Property - " + slug;
                    location = "Nashik";
                    description = "Verified commercial property with strong road connectivity and flexible business-use potential.";
                    image = "/resources/images/com.jpeg";
                    break;
                default:
                    title = "Property Search - " + slug;
                    location = slug;
            }
        }

        model.addAttribute("title", title);
        model.addAttribute("location", location);
        model.addAttribute("description", description);
        model.addAttribute("image", image);
        return "property-details";
    }

    @GetMapping("/tools")
    public String toolsPage(Model model) {
        model.addAttribute("pageTitle", "Property Calculators | EstateFinders");
        return "tools";
    }

    @GetMapping("/properties/listing/{id}")
    public String cityListingDetails(@PathVariable Long id, Model model) {
        CityListing listing = cityListingRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Listing not found."));
        if (!listing.isDemoData()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Listing not found.");
        }

        model.addAttribute("title", listing.getName());
        model.addAttribute("location", listing.getLocality());
        model.addAttribute("city", listing.getCityName());
        model.addAttribute("description", listing.getDescription());
        model.addAttribute("image", listing.getImage());
        model.addAttribute("price", listing.getPrice());
        model.addAttribute("listingType", listing.getTransactionType());
        model.addAttribute("ownerName", null);
        model.addAttribute("demoListing", true);
        model.addAttribute("propertyType", listing.getPropertyType());
        model.addAttribute("bedrooms", listing.getBedrooms());
        model.addAttribute("bathrooms", listing.getBathrooms());
        model.addAttribute("areaSqFt", listing.getAreaSqFt());
        model.addAttribute("furnishing", listing.getFurnishing());
        model.addAttribute("amenities", listing.getAmenities());
        model.addAttribute("locationName", listing.getLocality() + ", " + listing.getCityName());
        return "property-details";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "query", required = false) String query,
                         @RequestParam(value = "city", required = false) String city,
                         @RequestParam(value = "type", required = false) String type,
                         @RequestParam(value = "minPrice", required = false) String minPrice,
                         @RequestParam(value = "maxPrice", required = false) String maxPrice,
                         @RequestParam(value = "bedrooms", required = false) String bedrooms,
                         @RequestParam(value = "sort", required = false, defaultValue = "featured") String sort,
                         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                         @RequestParam(value = "perPage", required = false, defaultValue = "18") Integer perPage,
                         Model model) {
        String selectedCity = normalizeCity(city);
        String selectedType = type == null ? "" : type.trim();
        String queryTerm = query == null ? "" : query.trim();
        double minValue = parseMoney(minPrice);
        double maxValue = parseMoney(maxPrice);
        Integer minBedrooms = parseBedrooms(bedrooms);

        List<CityListing> allListings = cityListingRepository == null
                ? new ArrayList<>()
                : cityListingRepository.findAll();

        List<CityListing> filtered = allListings.stream()
                .filter(listing -> selectedCity.isEmpty() || selectedCity.equals(normalizeCity(listing.getCitySlug())))
                .filter(listing -> selectedType.isEmpty() || selectedType.equalsIgnoreCase(listing.getCategory())
                        || selectedType.equalsIgnoreCase(listing.getPropertyType()))
                .filter(listing -> queryTerm.isEmpty()
                        || contains(listing.getName(), queryTerm)
                        || contains(listing.getLocality(), queryTerm)
                        || contains(listing.getCityName(), queryTerm)
                        || contains(listing.getPropertyType(), queryTerm)
                        || contains(listing.getCategory(), queryTerm))
                .filter(listing -> minValue <= 0 || priceOf(listing) >= minValue)
                .filter(listing -> maxValue <= 0 || priceOf(listing) <= maxValue)
                .filter(listing -> minBedrooms == null || listing.getBedrooms() == null || listing.getBedrooms() >= minBedrooms)
                .sorted(sortResults(sort))
                .collect(Collectors.toList());

    List<Property> submittedProperties = propertyRepository == null
                ? new ArrayList<>()
                : propertyRepository.findByStatus("ACCEPTED").stream()
                        .filter(property -> selectedCity.isEmpty()
                                || selectedCity.equals(normalizeCity(property.getCity()))
                                || (property.getCity() == null
                                    && contains(property.getAddress(), selectedCity.replace('-', ' ')))
                                || (property.getCity() == null
                                    && contains(property.getAddress(), selectedCity)))
                        .filter(property -> selectedType.isEmpty()
                                || (("Residential Sale".equalsIgnoreCase(selectedType)
                                        || "BUY".equalsIgnoreCase(selectedType)
                                        || "SALE".equalsIgnoreCase(selectedType))
                                    && (property.getListingType() == null
                                        || "BUY".equalsIgnoreCase(property.getListingType())
                                        || "SALE".equalsIgnoreCase(property.getListingType())))
                                || (("Residential Rental".equalsIgnoreCase(selectedType)
                                        || "RENT".equalsIgnoreCase(selectedType))
                                    && "RENT".equalsIgnoreCase(property.getListingType()))
                                || (("Commercial".equalsIgnoreCase(selectedType)
                                        || "COMMERCIAL".equalsIgnoreCase(selectedType))
                                    && "COMMERCIAL".equalsIgnoreCase(property.getListingType())))
                        .filter(property -> queryTerm.isEmpty()
                                || contains(property.getTitle(), queryTerm)
                                || contains(property.getDescription(), queryTerm)
                                || contains(property.getAddress(), queryTerm))
                        .filter(property -> minValue <= 0 || property.getPrice() >= minValue)
                        .filter(property -> maxValue <= 0 || property.getPrice() <= maxValue)
                        .collect(Collectors.toList());

        int pageSize = perPage == null || (perPage != 9 && perPage != 18 && perPage != 36)
                ? 18
                : perPage;
        int currentPage = page == null || page < 1 ? 1 : page;
        int totalPages = Math.max(1, (int) Math.ceil((double) filtered.size() / pageSize));
        if (currentPage > totalPages) {
            currentPage = totalPages;
        }

        int fromIndex = (currentPage - 1) * pageSize;
        List<CityListing> pagedResults = fromIndex < filtered.size()
                ? filtered.subList(fromIndex, Math.min(fromIndex + pageSize, filtered.size()))
                : List.of();

        model.addAttribute("results", pagedResults);
        model.addAttribute("submittedProperties", submittedProperties);
        model.addAttribute("resultCount", filtered.size());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageWindowStart", Math.max(1, currentPage - 2));
        model.addAttribute("pageWindowEnd", Math.min(totalPages, currentPage + 2));
        model.addAttribute("firstResult", filtered.isEmpty() ? 0 : fromIndex + 1);
        model.addAttribute("lastResult", Math.min(fromIndex + pageSize, filtered.size()));
        model.addAttribute("selectedCity", selectedCity);
        model.addAttribute("cityDisplayName", cityDisplayName(selectedCity));
        model.addAttribute("query", queryTerm);
        model.addAttribute("type", selectedType);
        model.addAttribute("minPrice", minPrice == null ? "" : minPrice);
        model.addAttribute("maxPrice", maxPrice == null ? "" : maxPrice);
        model.addAttribute("bedrooms", bedrooms == null ? "" : bedrooms);
        model.addAttribute("sort", sort);
        model.addAttribute("pageSize", pageSize);

        return "search-results";
    }

    private Comparator<CityListing> sortResults(String sort) {
        Comparator<CityListing> byPrice = Comparator.comparingDouble(this::priceOf);
        switch (sort == null ? "featured" : sort.toLowerCase(Locale.ROOT)) {
            case "price-low-high":
                return byPrice;
            case "price-high-low":
                return byPrice.reversed();
            case "beds":
                return Comparator.comparing(listing -> listing.getBedrooms() == null ? 0 : listing.getBedrooms(), Comparator.reverseOrder());
            default:
                return Comparator.comparing(CityListing::getId);
        }
    }

    private boolean contains(String value, String query) {
        return value != null && value.toLowerCase(Locale.ROOT).contains(query.toLowerCase(Locale.ROOT));
    }

    private double priceOf(CityListing listing) {
        if (listing.getPriceAmount() != null) {
            return listing.getPriceAmount();
        }
        if (listing.getPrice() == null || listing.getPrice().isBlank()) {
            return 0d;
        }
        String normalized = listing.getPrice().replaceAll("[^0-9]", "");
        return normalized.isEmpty() ? 0d : Double.parseDouble(normalized);
    }

    private String normalizeCity(String city) {
        if (city == null) {
            return "";
        }
        String value = city.trim().toLowerCase(Locale.ROOT);
        if (value.isEmpty()) {
            return "";
        }
        if ("thane-west".equals(value) || "west thane".equals(value) || "west-thane".equals(value)) {
            return "west-thane";
        }
        if ("chhatrapati sambhajinagar".equals(value) || "ch-sambhajinagar".equals(value) || "sambhajinagar".equals(value) || "chh. sambhajinagar".equals(value)) {
            return "sambhajinagar";
        }
        return value.replace(" ", "-");
    }

    private String cityDisplayName(String city) {
        if (city == null || city.isBlank()) {
            return "All cities";
        }
        String cityName = cityListingCatalog.getCityName(city);
        return cityName == null ? city : cityName;
    }

    private double parseMoney(String value) {
        if (value == null || value.isBlank()) {
            return 0d;
        }
        try {
            return Double.parseDouble(value.replaceAll("[^0-9.\\-]", ""));
        } catch (NumberFormatException ignored) {
            return 0d;
        }
    }

    private Integer parseBedrooms(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        try {
            return Integer.parseInt(value.trim());
        } catch (NumberFormatException ignored) {
            return null;
        }
    }

    @GetMapping("/nileshpg")
    public String pgDetails(Model model) {
        model.addAttribute("title", "PG and Hostel Details");
        model.addAttribute("location", "Nashik");
        model.addAttribute("description", "Comfortable PG accommodation with sharing options, Wi-Fi, security and essential amenities for students and working professionals.");
        model.addAttribute("image", "/resources/images/nilesh.jpeg");
        return "property-details";
    }

    
}