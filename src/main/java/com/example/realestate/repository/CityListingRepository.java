package com.example.realestate.repository;

import java.util.List;

import com.example.realestate.model.CityListing;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CityListingRepository extends JpaRepository<CityListing, Long> {

    List<CityListing> findByCitySlugOrderByIdAsc(String citySlug);

    List<CityListing> findByCategoryIgnoreCaseAndDemoDataTrueOrderByCitySlugAscIdAsc(String category);

    List<CityListing> findBySeedKeyStartingWith(String seedKeyPrefix);

    List<CityListing> findTop12ByDemoDataTrueOrderByIdAsc();
}
