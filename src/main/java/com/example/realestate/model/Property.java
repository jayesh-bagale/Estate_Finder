package com.example.realestate.model;

import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "property")  
public class Property {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    @Column(length = 2000)
    private String description;
    private String ownerName;
    private double price;
    private String address;
    private String locality;
    private String postalCode;
    private String city;
    private String propertyType;
    private Integer bedrooms;
    private Integer bathrooms;
    private Integer areaSqFt;
    private String furnishing;
    @Column(length = 1000)
    private String amenities;
    private String status;
    private String listingType;
    private String imagePath;
    private Long sellerUserId;

    // getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getOwnerName() { return ownerName; }
    public void setOwnerName(String ownerName) { this.ownerName = ownerName; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getLocality() { return locality; }
    public void setLocality(String locality) { this.locality = locality; }
    public String getPostalCode() { return postalCode; }
    public void setPostalCode(String postalCode) { this.postalCode = postalCode; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    public String getPropertyType() { return propertyType; }
    public void setPropertyType(String propertyType) { this.propertyType = propertyType; }
    public Integer getBedrooms() { return bedrooms; }
    public void setBedrooms(Integer bedrooms) { this.bedrooms = bedrooms; }
    public Integer getBathrooms() { return bathrooms; }
    public void setBathrooms(Integer bathrooms) { this.bathrooms = bathrooms; }
    public Integer getAreaSqFt() { return areaSqFt; }
    public void setAreaSqFt(Integer areaSqFt) { this.areaSqFt = areaSqFt; }
    public String getFurnishing() { return furnishing; }
    public void setFurnishing(String furnishing) { this.furnishing = furnishing; }
    public String getAmenities() { return amenities; }
    public void setAmenities(String amenities) { this.amenities = amenities; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getListingType() { return listingType; }
    public void setListingType(String listingType) { this.listingType = listingType; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    public Long getSellerUserId() { return sellerUserId; }
    public void setSellerUserId(Long sellerUserId) { this.sellerUserId = sellerUserId; }
}
