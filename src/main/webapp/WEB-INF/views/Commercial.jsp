<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EstateFinders - Commercial Property Listings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #e74c3c;
            --accent-color: #3498db;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
        }
        
        /* Header Section */
        .header-container {
            position: relative;
            width: 100%;
            height: 400px;
            overflow: hidden;
        }
        
        .header-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        /* Navbar */
        .navbar {
            background-color: var(--primary-color) !important;
            padding: 10px 0;
        }
        
        .navbar-brand {
            display: flex;
            align-items: center;
            margin-left: 15px;
        }
        
        .navbar-brand span {
            font-size: 1.2rem;
            font-weight: 700;
            color: white;
            letter-spacing: 0.5px;
            margin-left: 8px;
        }
        
        .nav-link {
            color: white !important;
            font-family: Verdana, sans-serif;
            font-size: 0.9rem;
            padding: 8px 12px;
            transition: color 0.3s;
        }
        
        .nav-link:hover {
            color: var(--secondary-color) !important;
        }
        
        /* Hero Search */
        .hero-search {
            position: absolute;
            top: 70%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 90%;
            max-width: 600px;
            background-color: transparent;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .search-form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        
        .search-form .dropdown,
        .search-form input,
        .search-form button {
            width: 100%;
        }
        
        .quick-links {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 8px;
            margin-top: 15px;
        }
        
        .quick-links a {
            color: #2c3e50;
            text-decoration: none;
            transition: all 0.3s;
            padding: 6px 12px;
            font-size: 0.8rem;
            border-radius: 20px;
            background-color: rgba(255, 255, 255, 0.8);
        }
        
        .quick-links a:hover {
            background-color: var(--primary-color);
            color: white !important;
        }
        
        /* Property Cards */
        .property-card {
            margin: 20px 0;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border: none;
            border-radius: 10px;
            overflow: hidden;
        }
        
        .property-image-container {
            height: 250px;
            overflow: hidden;
        }
        
        .property-image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .property-details {
            margin-bottom: 1rem;
        }
        
        .property-price {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--primary-color);
        }
        
        /* Why Choose Card */
        .why-choose-card {
            height: 100%;
            border-left: none;
            border-radius: 0 0 10px 10px;
        }
        
        /* Section Headings */
        .section-heading {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 10px;
        }
        
        .section-heading::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background-color: var(--accent-color);
        }
        
        /* Footer */
        .footer {
            background-color: var(--dark-color);
            color: white;
            padding: 30px 0;
        }
        
        .footer h5 {
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }
        
        .footer ul {
            padding-left: 0;
            list-style: none;
        }
        
        .footer ul li {
            margin-bottom: 0.5rem;
        }
        
        .footer a {
            color: var(--light-color);
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer a:hover {
            color: var(--accent-color);
        }
        
        .social-icons a {
            display: inline-block;
            margin-right: 10px;
            color: white;
            font-size: 1.2rem;
        }
        
        /* Responsive Adjustments */
        @media (min-width: 576px) {
            .search-form {
                flex-direction: row;
                align-items: center;
            }
            
            .search-form .dropdown {
                width: auto;
            }
            
            .search-form input {
                flex-grow: 1;
            }
            
            .quick-links a {
                font-size: 0.9rem;
                padding: 6px 15px;
            }
        }
        
        @media (min-width: 768px) {
            .header-container {
                height: 500px;
            }
            
            .navbar-brand {
                margin-left: 30px;
            }
            
            .navbar-brand span {
                font-size: 1.4rem;
            }
            
            .nav-link {
                font-size: 1rem;
                padding: 8px 15px;
            }
            
            .hero-search {
                padding: 20px;
            }
            
            .why-choose-card {
                border-radius: 0 10px 10px 0;
                border-left: 1px solid rgba(0,0,0,0.1);
            }
            
            .property-image-container {
                height: 100%;
            }
        }
        
        @media (min-width: 992px) {
            .section-heading {
                font-size: 2rem;
            }
        }
        @media (max-width: 767.98px) {
            .property-card {
                max-width: 100%;
            }
            .property-image-container {
                min-height: 250px;
            }
            .why-choose-card {
                margin-top: 1rem !important;
                border-radius: 0.375rem !important;
            }
            .card-body {
                padding: 1.25rem !important;
            }
        }
        
        @media (min-width: 768px) {
            .property-card {
                border-radius: 0.5rem;
                overflow: hidden;
            }
            .why-choose-card {
                border-left: 1px solid #dee2e6 !important;
            }
        }
        
        .property-price {
            color: #0d6efd;
            font-weight: 600;
        }
        
        .why-choose-card .card-header {
            font-size: 0.9rem;
        }
        
        .why-choose-card h6 {
            font-size: 0.85rem;
        }
        
        .why-choose-card .text-muted {
            font-size: 0.75rem;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/commercial">
                <img src="<c:url value='/resources/images/estate1.jpg' />" alt="Logo" width="50" class="d-inline-block align-top">
                <span>ESTATEFINDERS</span>
            </a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/project" style="margin-right:30px;">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/about" style="margin-right:30px;">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login" style="margin-right:30px;">Login/Register</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="menuDropdown" role="button" data-bs-toggle="dropdown" style="margin-right:30px;">
                            Menu
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="menuDropdown">
                            <li><h4 class="dropdown-header">Services</h4></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/buy">Buy</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/rent">Rent</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/commercial">Commercial</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/pg">PG/Hostel</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/about">About Us</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/contact">Contact</a></li>
                            <c:if test="${empty sessionScope['estatefinder.userId']}"><li><a class="dropdown-item" href="${pageContext.request.contextPath}/adminlogin">Admin Login</a></li></c:if>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header with Search -->
    <div class="header-container">
        <img src="<c:url value='/resources/images/estate3.jpg'/>" alt="Real Estate Banner" />
        
        <!-- Search bar with quick links below -->
        <div class="hero-search">
            <form class="search-form" role="search" id="propertySearchForm">
                <div class="dropdown">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Nashik
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item location-option" href="${pageContext.request.contextPath}/properties/nashik" data-location="Nashik">Nashik</a></li>
                        <li><a class="dropdown-item location-option" href="${pageContext.request.contextPath}/properties/mumbai" data-location="Mumbai">Mumbai</a></li>
                        <li><a class="dropdown-item location-option" href="${pageContext.request.contextPath}/properties/pune" data-location="Pune">Pune</a></li>
                        <li><a class="dropdown-item location-option" href="${pageContext.request.contextPath}/properties/sambhajinagar" data-location="Ch.Sambhajinagar">Ch.Sambhajinagar</a></li>
                        <li><a class="dropdown-item location-option" href="${pageContext.request.contextPath}/properties/jalgaon" data-location="Jalgaon">Jalgaon</a></li>
                        <li><a class="dropdown-item location-option" href="${pageContext.request.contextPath}/properties/thane" data-location="Thane">Thane</a></li>
                        <li><a class="dropdown-item location-option" href="${pageContext.request.contextPath}/properties/west-thane" data-location="West Thane">West Thane</a></li>
                    </ul>
                </div>
                <input class="form-control" type="search" 
                    placeholder="Enter location, property type..." aria-label="Search" id="propertySearchInput" list="locationSuggestions">
                <datalist id="locationSuggestions">
                    <option value="Nashik">
                    <option value="Pathardi Phata">
                    <option value="Nashik road">
                    <option value="Govind nagar">
                    <option value="Gangapur">
                    <option value="Chandshi">
                    <option value="Cidco">
                    <option value="Satpur">
                    <option value="Renuka nagar">
                    <option value="Kalpataru nagar">
                </datalist>
                <button class="btn btn-primary" type="submit">Search</button>
            </form>
        </div>
    </div>

    <jsp:include page="demo-listings.jsp"/>

    <!-- Property Listings Section -->
    <section id="buy-section" class="container mt-5">
        <h2 class="section-heading text-center">Commercial Properties</h2>
        
        <!-- Roongta Florenza -->
        <div class="property-card card mb-5" data-location="Renuka nagar" style="max-width: 1200px;margin-left:25px;height:300px;">
            <div class="row g-0">
                <!-- Property Image and Details -->
                <div class="col-lg-8">
                    <div class="row g-0">
                        <div class="col-md-4 property-image-container">
                            <img src="<c:url value='/resources/images/1st.avif' />" class="img-fluid" alt="Loongta Florenza" style="height:300px;">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body h-100 d-flex flex-column">
                                <h5 class="card-title">Commercial Plot</h5>
                                <p class="card-text flex-grow-1">
                                    This modern Commercial Plot designed with luxury facilities in the heart of Nashik at Renuka Nagar is an ideal investment option. Built as per high-quality construction standards
                                </p>
                                <div class="property-details">
                                    <p class="card-text mb-1"><i class="fas fa-map-marker-alt me-2"></i> Renuka nagar, Nashik</p>
                                    <p class="card-text"><i class="fas fa-ruler-combined me-2"></i> 1112 sq ft</p>
                                </div>
                                <div class="d-flex flex-wrap justify-content-between align-items-center mt-auto">
                                    <span class="property-price">₹20L</span>
                                    <div class="mt-2 mt-sm-0">
                                        <a href="${pageContext.request.contextPath}/properties/renuka" class="btn btn-outline-primary me-2">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Why Choose Section -->
                <div class="col-lg-4">
                    <div class="card h-100 why-choose-card">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"><i class="fas fa-star me-2"></i>Why Choose Roongta Florenza?</h5>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled">
                                <li class="mb-3 d-flex">
                                    <div class="flex-shrink-0 text-primary me-3">
                                        <i class="fas fa-map-marked-alt"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-1">Spacious Living</h6>
                                        <p class="mb-0 text-muted">1.5 acre project for comfortable lifestyle</p>
                                    </div>
                                </li>
                                <li class="mb-3 d-flex">
                                    <div class="flex-shrink-0 text-primary me-3">
                                        <i class="fas fa-building"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-1">Exclusive Community</h6>
                                        <p class="mb-0 text-muted">196 units across 7 towers (low density)</p>
                                    </div>
                                </li>
                                <li class="mb-3 d-flex">
                                    <div class="flex-shrink-0 text-primary me-3">
                                        <i class="fas fa-swimming-pool"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-1">Premium Amenities</h6>
                                        <p class="mb-0 text-muted">15+ luxury lifestyle amenities</p>
                                    </div>
                                </li>
                                <li class="d-flex">
                                    <div class="flex-shrink-0 text-primary me-3">
                                        <i class="fas fa-hard-hat"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-1">Trusted Developer</h6>
                                        <p class="mb-0 text-muted">By Dugad properts</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="card-footer bg-light">
                            <small class="text-muted"><i class="fas fa-info-circle me-1"></i>RERA Registered: P123456789</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="property-card card mb-5" data-location="Kalpataru nagar" style="max-width: 1200px; margin-left:25px;">
    <div class="row g-0 align-items-stretch">
        <div class="col-lg-8">
            <div class="row g-0 h-100">
                <div class="col-md-4 property-image-container d-flex align-items-center justify-content-center" style="height:300px;">
                    <img src="<c:url value='/resources/images/k1.avif' />" class="img-fluid h-100 w-100 object-fit-cover" alt="Shreeji The Crown" style="object-fit:cover; border-radius:8px 0 0 8px;">
                </div>
                <div class="col-md-8">
                    <div class="card-body h-100 d-flex flex-column">
                        <h5 class="card-title">Suriya Estate</h5>
                        <p class="card-text flex-grow-1">
                            Are you looking for a suitable office space for your business? Check this property located in Nashik. It is nestled in the heart of Nashik at Kalpataru Nagar. The property is equipped with modern-day facilities such as lifts including 1 passenger, 1 service lifts and parking space including 1 private, 5 public parking.
                        </p>
                        <div class="property-details">
                            <p class="card-text mb-1"><i class="fas fa-map-marker-alt me-2"></i> Kalpataru Nagar, Nashik, Maharashtra</p>
                            <p class="card-text"><i class="fas fa-ruler-combined me-2"></i> 250 sq ft</p>
                        </div>
                        <div class="d-flex flex-wrap justify-content-between align-items-center mt-auto">
                            <span class="property-price">₹26.0L</span>
                            <div class="mt-2 mt-sm-0">
                                <a href="${pageContext.request.contextPath}/properties/kalpataru" class="btn btn-outline-primary me-2">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Why Choose Section remains unchanged -->
        <div class="col-lg-4">
            <div class="card h-100 why-choose-card">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0"><i class="fas fa-star me-2"></i>Why Choose Shreeji The Crown?</h5>
                </div>
                <div class="card-body">
                    <ul class="list-unstyled">
                        <li class="mb-3 d-flex">
                            <div class="flex-shrink-0 text-primary me-3">
                                <i class="fas fa-building"></i>
                            </div>
                            <div>
                                <h6 class="mb-1">Premium Construction</h6>
                                <p class="mb-0 text-muted">High-quality materials and finishes</p>
                            </div>
                        </li>
                        <li class="mb-3 d-flex">
                            <div class="flex-shrink-0 text-primary me-3">
                                <i class="fas fa-tree"></i>
                            </div>
                            <div>
                                <h6 class="mb-1">Green Spaces</h6>
                                <p class="mb-0 text-muted">Beautifully landscaped gardens</p>
                            </div>
                        </li>
                        <li class="mb-3 d-flex">
                            <div class="flex-shrink-0 text-primary me-3">
                                <i class="fas fa-swimming-pool"></i>
                            </div>
                            <div>
                                <h6 class="mb-1">Luxury Amenities</h6>
                                <p class="mb-0 text-muted">B + G + 28 Storey Iconic High-Rise Tower</p>
                            </div>
                        </li>
                        <li class="d-flex">
                            <div class="flex-shrink-0 text-primary me-3">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <div>
                                <h6 class="mb-1">24/7 Security</h6>
                                <p class="mb-0 text-muted">Gated community with CCTV surveillance</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
       
        <!--card2 -->
        <div class="property-card card mb-5 mx-auto" data-location="Chandshi" style="max-width: 1200px;margin-left:25px;">
            <div class="row g-0">
                <div class="col-md-4 property-image-container">
                    <img src="<c:url value='/resources/images/pl2.avif' />" class="img-fluid" alt="bungalow" style="height:300px; width:100%;">
                </div>
                <div class="col-md-5">
                    <div class="card-body h-100 d-flex flex-column">
                        <h5 class="card-title">M R Enterprices Golden Shower</h5>
                        <h5 class="card-title">Chandshi, Nashik</h5>
                        <div class="property-details">
                            <p class="card-text mb-1">25 acres</p>
                            <p class="card-text"><i class="fas fa-ruler-combined me-2"></i>775 - 4500 sq.ft.</p>
                        </div>
                        <div class="d-flex flex-wrap justify-content-between align-items-center mt-auto">
                            <span class="property-price">₹14.11 L - 81.9 L</span>
                            <div class="mt-2 mt-sm-0">
                                <a href="${pageContext.request.contextPath}/properties/mr" class="btn btn-outline-primary me-2">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card h-100 why-choose-card border-0" style="width: 100%;">
                        <div class="card-header bg-primary text-white py-2">
                            <h6 class="mb-0"><i class="fas fa-star me-2"></i>Why Choose Us?</h6>
                        </div>
                        <div class="card-body p-2">
                            <ul class="list-unstyled mb-0">
                                <li class="mb-2 d-flex align-items-start">
                                    <i class="fas fa-building text-primary mt-1 me-2"></i>
                                    <div>
                                        <h6 class="mb-0">Modern Architecture</h6>
                                        <p class="mb-0 text-muted small">Contemporary and functional design</p>
                                    </div>
                                </li>
                                <li class="mb-2 d-flex align-items-start">
                                    <i class="fas fa-tree text-primary mt-1 me-2"></i>
                                    <div>
                                        <h6 class="mb-0">Eco-Friendly</h6>
                                        <p class="mb-0 text-muted small">Solar panels & water harvesting</p>
                                    </div>
                                </li>
                                <li class="mb-2 d-flex align-items-start">
                                    <i class="fas fa-parking text-primary mt-1 me-2"></i>
                                    <div>
                                        <h6 class="mb-0">Spacious Parking</h6>
                                        <p class="mb-0 text-muted small">Covered & open areas</p>
                                    </div>
                                </li>
                                <li class="d-flex align-items-start">
                                    <i class="fas fa-cctv text-primary mt-1 me-2"></i>
                                    <div>
                                        <h6 class="mb-0">Smart Security</h6>
                                        <p class="mb-0 text-muted small">CCTV & access control</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!--Commercial-->
        <section id="Commercial-section">
            <!--card1-->
            <div class="property-card card mb-5 mx-auto" data-location="Chandshi" style="max-width: 1200px;margin-left:25px;">
                <div class="row g-0">
                    <div class="col-md-4 property-image-container">
                        <img src="<c:url value='/resources/images/chand.avif' />" class="img-fluid" alt="bungalow" style="height:300px; width:100%;">
                    </div>
                    <div class="col-md-5">
                        <div class="card-body h-100 d-flex flex-column">
                            <h5 class="card-title">Shop for sale in Chandshi</h5>
                            <h5 class="card-title">Chandshi, Nashik</h5>
                            <div class="property-details">
                                <p class="card-text mb-1">4 floors</p>
                                <p class="card-text"><i class="fas fa-ruler-combined me-2"></i>159 sq.ft</p>
                            </div>
                            <div class="d-flex flex-wrap justify-content-between align-items-center mt-auto">
                                <span class="property-price">₹34.0 L</span>
                                <div class="mt-2 mt-sm-0">
                                    <a href="${pageContext.request.contextPath}/properties/schandshi" class="btn btn-outline-primary me-2">View Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card h-100 why-choose-card border-0" style="width: 100%;">
                            <div class="card-header bg-primary text-white py-2">
                                <h6 class="mb-0"><i class="fas fa-star me-2"></i>Why Choose Us?</h6>
                            </div>
                            <div class="card-body p-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-2 d-flex align-items-start">
                                        <i class="fas fa-building text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Modern Architecture</h6>
                                            <p class="mb-0 text-muted small">Contemporary and functional design</p>
                                        </div>
                                    </li>
                                    <li class="mb-2 d-flex align-items-start">
                                        <i class="fas fa-tree text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Eco-Friendly</h6>
                                            <p class="mb-0 text-muted small">Solar panels & water harvesting</p>
                                        </div>
                                    </li>
                                    <li class="mb-2 d-flex align-items-start">
                                        <i class="fas fa-parking text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Spacious Parking</h6>
                                            <p class="mb-0 text-muted small">Covered & open areas</p>
                                        </div>
                                    </li>
                                    <li class="d-flex align-items-start">
                                        <i class="fas fa-cctv text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Smart Security</h6>
                                            <p class="mb-0 text-muted small">CCTV & access control</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--card2-->
            <div class="property-card card mb-5 mx-auto" data-location="Satpur" style="max-width: 1200px;margin-left:25px;">
                <div class="row g-0">
                    <div class="col-md-4 property-image-container">
                        <img src="<c:url value='/resources/images/sat.jpg' />" class="img-fluid" alt="bungalow" style="height:300px; width:100%;">
                    </div>
                    <div class="col-md-5">
                        <div class="card-body h-100 d-flex flex-column">
                            <h5 class="card-title">Commercial Property for sale in Satpur</h5>
                            <h5 class="card-title">Satpur, Nashik</h5>
                            <div class="property-details">
                                <p class="card-text mb-1">2 floors</p>
                                <p class="card-text"><i class="fas fa-ruler-combined me-2"></i>8,300 sq.ft</p>
                            </div>
                            <div class="d-flex flex-wrap justify-content-between align-items-center mt-auto">
                                <span class="property-price">₹4.6 Cr</span>
                                <div class="mt-2 mt-sm-0">
                                    <a href="${pageContext.request.contextPath}/properties/csatpur" class="btn btn-outline-primary me-2">View Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card h-100 why-choose-card border-0" style="width: 100%;">
                            <div class="card-header bg-primary text-white py-2">
                                <h6 class="mb-0"><i class="fas fa-star me-2"></i>Why Choose Us?</h6>
                            </div>
                            <div class="card-body p-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-2 d-flex align-items-start">
                                        <i class="fas fa-building text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Modern Architecture</h6>
                                            <p class="mb-0 text-muted small">Contemporary and functional design</p>
                                        </div>
                                    </li>
                                    <li class="mb-2 d-flex align-items-start">
                                        <i class="fas fa-tree text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Eco-Friendly</h6>
                                            <p class="mb-0 text-muted small">Solar panels & water harvesting</p>
                                        </div>
                                    </li>
                                    <li class="mb-2 d-flex align-items-start">
                                        <i class="fas fa-parking text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Spacious Parking</h6>
                                            <p class="mb-0 text-muted small">Covered & open areas</p>
                                        </div>
                                    </li>
                                    <li class="d-flex align-items-start">
                                        <i class="fas fa-cctv text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Smart Security</h6>
                                            <p class="mb-0 text-muted small">CCTV & access control</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--card3-->
            <div class="property-card card mb-5 mx-auto" data-location="Nashik road" style="max-width: 1200px;margin-left:25px;">
                <div class="row g-0">
                    <div class="col-md-4 property-image-container">
                        <img src="<c:url value='/resources/images/nak.avif' />" class="img-fluid" alt="bungalow" style="height:300px; width:100%;">
                    </div>
                    <div class="col-md-5">
                        <div class="card-body h-100 d-flex flex-column">
                            <h5 class="card-title">Shop for sale in Nashik Road</h5>
                            <h5 class="card-title">Nashik road, Nashik</h5>
                            <div class="property-details">
                                <p class="card-text mb-1">3 floors</p>
                                <p class="card-text"><i class="fas fa-ruler-combined me-2"></i>250 sq.ft</p>
                            </div>
                            <div class="d-flex flex-wrap justify-content-between align-items-center mt-auto">
                                <span class="property-price">₹1.0 Cr</span>
                                <div class="mt-2 mt-sm-0">
                                    <a href="${pageContext.request.contextPath}/properties/snashikro" class="btn btn-outline-primary me-2">View Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card h-100 why-choose-card border-0" style="width: 100%;">
                            <div class="card-header bg-primary text-white py-2">
                                <h6 class="mb-0"><i class="fas fa-star me-2"></i>Why Choose Us?</h6>
                            </div>
                            <div class="card-body p-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-2 d-flex align-items-start">
                                        <i class="fas fa-building text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Modern Architecture</h6>
                                            <p class="mb-0 text-muted small">Contemporary and functional design</p>
                                        </div>
                                    </li>
                                    <li class="mb-2 d-flex align-items-start">
                                        <i class="fas fa-tree text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Eco-Friendly</h6>
                                            <p class="mb-0 text-muted small">Solar panels & water harvesting</p>
                                        </div>
                                    </li>
                                    <li class="mb-2 d-flex align-items-start">
                                        <i class="fas fa-parking text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Spacious Parking</h6>
                                            <p class="mb-0 text-muted small">Covered & open areas</p>
                                        </div>
                                    </li>
                                    <li class="d-flex align-items-start">
                                        <i class="fas fa-cctv text-primary mt-1 me-2"></i>
                                        <div>
                                            <h6 class="mb-0">Smart Security</h6>
                                            <p class="mb-0 text-muted small">CCTV & access control</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <!-- Footer Section -->
     <footer class="bg-dark text-white py-4 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4 mb-md-0">
                    <h5>EstateFinders</h5>
                    <p>Find your dream home with our premium real estate services across India.</p>
                    <div class="social-icons">
                        <a href="#" class="text-white me-2"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="text-white me-2"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-white me-2"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="text-white me-2"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-md-2 mb-4 mb-md-0">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="${pageContext.request.contextPath}/" class="text-white">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/properties" class="text-white">Properties</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact" class="text-white">Contact</a></li>
                        <li><a href="${pageContext.request.contextPath}/about" class="text-white">About Us</a></li>
                    </ul>
                </div>
                <div class="col-md-2 mb-4 mb-md-0">
                    <h5>Services</h5>
                    <ul class="list-unstyled">
                        <li><a href="${pageContext.request.contextPath}/buy" class="text-white">Buy</a></li>
                        <li><a href="${pageContext.request.contextPath}/rent" class="text-white">Rent</a></li>
                        <li><a href="${pageContext.request.contextPath}/commercial" class="text-white">Commercial</a></li>
                        <li><a href="${pageContext.request.contextPath}/pg" class="text-white">PG/Hostel</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contact Info</h5>
                    <ul class="list-unstyled">
                        <li><i class="fas fa-map-marker-alt me-2"></i> 123 Estate Street, Mumbai, India</li>
                        <li><i class="fas fa-phone me-2"></i> +91 1234567890</li>
                        <li><i class="fas fa-envelope me-2"></i> info@estatefinders.com</li>
                    </ul>
                </div>
            </div>
            <hr>
            <div class="text-center">
                <p class="mb-0">&copy; 2023 EstateFinders. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Results Container (for search functionality) -->
    <div id="searchResults" class="container mt-4" style="display: none;">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>Properties in <span id="locationName"></span></h3>
            <div id="resultCount" class="badge bg-primary"></div>
        </div>
        <div class="row" id="propertyResults"></div>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchForm = document.getElementById('propertySearchForm');
        const searchInput = document.getElementById('propertySearchInput');
        const searchResults = document.getElementById('searchResults');
        const locationName = document.getElementById('locationName');
        const propertyResults = document.getElementById('propertyResults');
        const resultCount = document.getElementById('resultCount');
        
        // Property data
        const properties = {
            'Govind nagar': [
                { 
                    name: 'Lalait Roongta Group', 
                    project: 'Loongta Florenza', 
                    type: '2-3 BHK', 
                    price: '₹46L Crore', 
                    location: 'Govind Nagar', 
                    image: 'lon.avif',
                    details: {
                        area: '991 to 1001 sq ft'
                    }
                },
                {
                    name:'shreeji the crown',
                    project:'shreeji the crown',
                    type: '3 BHK', 
                    price: '₹1.o5cr to 1.11cr', 
                    location: 'Govind Nagar', 
                    image: 'shree.avif',
                    details: {
                        area: '1613 sq ft'
                    }
                }
            ],
            'Gangapur': [
                { 
                    name: 'Arpana Group', 
                    project: ' Rivera sky', 
                    type: '3 BHK', 
                    price: '₹1.1 Crore', 
                    location: 'Gangapur', 
                    image: 'arpan.avif',
                    details: {
                        bedrooms: 3,
                        bathrooms: 2,
                        area: '1,800 sq ft'
                    }
                },
                { 
                    name: 'Arpana Group', 
                    project: ' Minika riverdale', 
                    type: '3 BHK', 
                    price: '₹1.1 Crore', 
                    location: 'Gangapur', 
                    image: 'arpan.avif',
                    details: {
                        bedrooms: 3,
                        bathrooms: 2,
                        area: '1,800 sq ft'
                    }
                },
                { 
                    name: 'The grand parksyde', 
                    project: 'The grandparksyde', 
                    type: '3 BHK', 
                    price: '₹1.1 Crore', 
                    location: 'Gangapur', 
                    image: 'arpan.avif',
                    details: {
                        bedrooms: 3,
                        bathrooms: 2,
                        area: '1,800 sq ft'
                    }
                },
                { 
                    name: 'Aakar Millennium', 
                    project: 'Aakar Millennium', 
                    type: '2-3 BHK', 
                    price: '₹1.1 Crore', 
                    location: 'Gangapur', 
                    image: 'aakar.avif',
                    details: {
                        bedrooms: 3,
                        bathrooms: 2,
                        area: '1,800 sq ft'
                    }
                },
                { 
                    name: 'Daksh Avlon', 
                    project: 'Daksh Avlon', 
                    type: '3-4 BHK', 
                    price: '₹1.1 Crore', 
                    location: 'Gangapur', 
                    image: 'aakar.avif',
                    details: {
                        bedrooms: 3,
                        bathrooms: 2,
                        area: '1,800 sq ft'
                    }
                }
            ],
            'Nashik road': [
                { 
                    name: 'Ac Bel', 
                    project: 'Loongta Florenza', 
                    type: '2-3 -4-5 BHK', 
                    price: '₹2.7Crore', 
                    location: 'Nashik road', 
                    image: 'lon.avif',
                    details: {
                        area: '4730sq ft'
                    }
                },
                {
                    name:'Ac Aaradhya residency',
                    project:'Aradhya residency',
                    type: '3 BHK', 
                    price: '₹1.o5cr to 1.11cr', 
                    location: 'Govind Nagar', 
                    image: 'shree.avif',
                    details: {
                        area: '1613 sq ft'
                    }
                },
                {
                    name:'bills',
                    project:'Orchid residency',
                    type: '3 BHK', 
                    price: 'price request', 
                    location: 'Pathardi phata', 
                    image: 'orchid.jpg',
                    details: {
                        area: '1649 to 1922 sq ft'
                    }
                },
                {
                    name:'Pride Laxmi',
                    project:'pride Laxmi',
                    type: '3 BHK', 
                    price: 'price request', 
                    location: 'Govind Nagar', 
                    image: 'orchid.jpg',
                    details: {
                        area: '1649 to 1922 sq ft'
                    }
                }
            ],
            'Pathardi Phata':[
                {
                    name:'bills',
                    project:'Orchid residency',
                    type: '3 BHK', 
                    price: 'price request', 
                    location: 'Pathardi phata', 
                    image: 'orchid.jpg',
                    details: {
                        area: '1649 to 1922 sq ft'
                    }
                },
                {
                    name:'vedant',
                    project:'Orchid residency',
                    type: '3 BHK', 
                    price: 'price request', 
                    location: 'Pathardi Phata', 
                    image: 'orchid.jpg',
                    details: {
                        area: '1649 to 1922 sq ft'
                    }
                }
            ],
           
            'Chandshi': [
                { 
                    name: 'Lalait Roongta Group', 
                    project: 'Loongta Florenza', 
                    type: '2-3 BHK', 
                    price: '₹46L Crore', 
                    location: 'Govind Nagar', 
                    image: 'lon.avif',
                    details: {
                        area: '991 to 1001 sq ft'
                    }
                },
               
            ],
        
            'Satpur': [
                { 
                    name: 'Royals', 
                    project: 'Loongta Florenza', 
                    type: '2-3 BHK', 
                    price: '₹46L Crore', 
                    location: 'satpur', 
                    image: 'lon.avif',
                    details: {
                        area: '991 to 1001 sq ft'
                    }
                },
               
            ],
              'Cidco': [
                { 
                    name: 'Malpani', 
                    project: 'Loongta Florenza', 
                    type: '2-3 BHK', 
                    price: '₹46L Crore', 
                    location: 'satpur', 
                    image: 'lon.avif',
                    details: {
                        area: '991 to 1001 sq ft'
                    }
                },
               
            ],
             'Renuka nagar': [
                { 
                    name: 'commercial', 
                    project: 'Loongta Florenza', 
                    type: '2-3 BHK', 
                    price: '₹46L Crore', 
                    location: 'Govind Nagar', 
                    image: 'lon.avif',
                    details: {
                        area: '991 to 1001 sq ft'
                    }
                },
            ],
             'Kalpataru nagar': [
                { 
                    name: 'Surya estate', 
                    project: 'Loongta Florenza', 
                    type: '2-3 BHK', 
                    price: '₹46L Crore', 
                    location: 'Govind Nagar', 
                    image: 'lon.avif',
                    details: {
                        area: '991 to 1001 sq ft'
                    }
                },
            ]
        };

        // Handle dropdown location selection
        document.querySelectorAll('.location-option').forEach(item => {
            item.addEventListener('click', function(e) {
                e.preventDefault();
                searchInput.value = this.getAttribute('data-location');
                performSearch(this.getAttribute('data-location'));
            });
        });

        // Handle form submission
        searchForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const location = searchInput.value.trim();
            if (location) {
                performSearch(location);
            }
        });

        function performSearch(location) {
            locationName.textContent = location;
            
            // Hide all property cards initially
            document.querySelectorAll('.property-card').forEach(card => {
                card.style.display = 'none';
            });

            const matchedLocations = Object.keys(properties).filter(
                loc => loc.toLowerCase().includes(location.toLowerCase())
            );
            
            if (matchedLocations.length > 0) {
                let totalProperties = 0;
                
                // Show cards that match the searched location
                matchedLocations.forEach(matchedLocation => {
                    document.querySelectorAll(`.property-card[data-location="${matchedLocation}"]`).forEach(card => {
                        card.style.display = 'block';
                        totalProperties++;
                    });
                });
                
                resultCount.textContent = `${totalProperties} Properties`;
                searchResults.style.display = 'none';
            } else {
                propertyResults.innerHTML = `
                    <div class="col-12 text-center py-5">
                        <i class="fas fa-search fa-3x mb-3 text-muted"></i>
                        <h4>No properties found for "${location}"</h4>
                        <p class="text-muted">Try searching for another location</p>
                    </div>
                `;
                resultCount.textContent = '0 Properties';
                searchResults.style.display = 'block';
                
                // Hide all property cards when no results
                document.querySelectorAll('.property-card').forEach(card => {
                    card.style.display = 'none';
                });
            }
            
            searchResults.scrollIntoView({ behavior: 'smooth' });
        }
    });
    </script>
</body>
</html>