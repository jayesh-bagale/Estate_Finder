package com.example.realestate.repository;

import com.example.realestate.model.Property;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PropertyRepository extends JpaRepository<Property, Long> {
    List<Property> findByStatus(String status);

    List<Property> findBySellerUserIdOrderByIdDesc(Long sellerUserId);

    long countByStatus(String status);

    List<Property> findByStatusAndListingTypeIgnoreCase(String status, String listingType);

    List<Property> findByStatusAndListingTypeIsNull(String status);
}
