package com.example.realestate.model;

import javax.persistence.*;

@Entity
@Table(name = "estate")
public class Estate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;          // property name
    private String builderName;
    private Double price;
    private String location;

    @Column(length = 2000)
    private String description;

    private String sqft;   // area in square feet

    private int bedrooms;  // ✅ added
    private int bathrooms; // ✅ added

    // separate image paths
    private String floorPlanImagePath;   // floor plan image
    private String mainImagePath;        // main property image

    @Column(length = 2000)
    private String faq;

    // --- Getters and Setters ---
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getBuilderName() {
        return builderName;
    }
    public void setBuilderName(String builderName) {
        this.builderName = builderName;
    }

    public Double getPrice() {
        return price;
    }
    public void setPrice(Double price) {
        this.price = price;
    }

    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public String getSqft() {
        return sqft;
    }
    public void setSqft(String sqft) {
        this.sqft = sqft;
    }

    public int getBedrooms() {
        return bedrooms;
    }
    public void setBedrooms(int bedrooms) {
        this.bedrooms = bedrooms;
    }

    public int getBathrooms() {
        return bathrooms;
    }
    public void setBathrooms(int bathrooms) {
        this.bathrooms = bathrooms;
    }

    public String getFloorPlanImagePath() {
        return floorPlanImagePath;
    }
    public void setFloorPlanImagePath(String floorPlanImagePath) {
        this.floorPlanImagePath = floorPlanImagePath;
    }

    public String getMainImagePath() {
        return mainImagePath;
    }
    public void setMainImagePath(String mainImagePath) {
        this.mainImagePath = mainImagePath;
    }

    public String getFaq() {
        return faq;
    }
    public void setFaq(String faq) {
        this.faq = faq;
    }
}
