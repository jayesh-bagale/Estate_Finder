<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Palm Town | EstateFinders</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
   :root {
        --primary-color: #2c3e50;
        --secondary-color: #e74c3c;
        --light-color: #ecf0f1;
    }
    
    body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        position: relative;
    }

    .navbar {
        background-color: var(--primary-color) !important;
        padding: 15px 0;
    }
    
    .navbar-brand {
        display: flex;
        align-items: center;
        margin-left: 20px;
    }
    
    .navbar-brand span {
        font-size: 1.4rem;
        font-weight: 700;
        color: white;
        letter-spacing: 0.5px;
        margin-left: 10px;
    }
    
    .navbar-nav {
        margin-right: 20px;
    }
    
    .nav-link {
        color: white !important;
        font-family: Verdana, sans-serif;
        font-size: 1rem;
        padding: 8px 15px;
        transition: color 0.3s;
    }
    
    .nav-link:hover {
        color: var(--secondary-color) !important;
    }
    
    .dropdown-menu {
        border: none;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .dropdown-item {
        padding: 8px 20px;
    }
    
    .navbar-nav .nav-item {
        margin-right: 15px;
    }
    
    .navbar-nav .nav-item:last-child {
        margin-right: 0;
    }
    
    .quick-links-section {
        background-color: #f8f9fa;
        border-bottom: 1px solid #dee2e6;
        padding: 15px 0;
        position: sticky;
        top: 0;
        z-index: 1020;
    }
    
    .quick-links .btn {
        margin: 5px;
        color: var(--primary-color);
        border: 2px solid var(--primary-color);
        font-weight: 500;
        transition: all 0.3s;
    }
    
    .quick-links .btn:hover {
        background-color: var(--primary-color);
        color: white;
    }
    
    .quick-links .btn.active {
        background-color: var(--primary-color);
        color: white;
    }
    
    /* Space between navbar and quick links */
    .content-separator {
        height: 10px;
        background-color: #f1f1f1;
    }
    
    .main-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        display: flex;
        flex-direction: column;
        gap: 30px;
    }
    
    .main-content {
        order: 2;
        width: 100%;
    }
    
    .sidebar {
        order: 1;
        width: 100%;
    }
    
    .property-media-section {
        display: flex;
        flex-direction: column;
        gap: 20px;
        margin-bottom: 30px;
    }
    
    .main-image-container {
        width: 100%;
    }
    
    .video-container {
        width: 100%;
    }
    
    .property-image {
        width: 100%;
        height: auto;
        max-height: 400px;
        border-radius: 8px;
        object-fit: cover;
    }
    
    iframe {
        width: 100%;
        height: 300px;
        border-radius: 8px;
    }
    
    .property-header {
        margin-bottom: 20px;
    }
    
    .price-info {
        display: flex;
        align-items: center;
        gap: 10px;
        margin: 15px 0;
    }
    
    .card-container {
        display: flex;
        flex-direction: column;
        gap: 20px;
        margin: 30px 0;
    }
    
    .card {
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        width: 100%;
    }
    
    .property-highlights {
        margin-top: 30px;
    }
    
    .contact-card {
        background-color: #000;
        color: white;
        padding: 25px;
        border-radius: 8px;
        margin-bottom: 30px;
        width: 100%;
        box-sizing: border-box;
    }
    
    .specs-container {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        margin: 20px 0;
        align-items: center;
    }
    
    .spec-item {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }
    
    .divider {
        color: #ddd;
    }
    
    /* Section styling */
    .section {
        padding: 40px 0;
        border-bottom: 1px solid #eee;
    }
    
    .section-title {
        margin-bottom: 30px;
        color: var(--primary-color);
        position: relative;
        padding-bottom: 10px;
    }
    
    .section-title::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 60px;
        height: 3px;
        background-color: var(--secondary-color);
    }
    
    /* Floor plans section */
    .floor-plan-container {
        display: flex;
        flex-direction: column;
        gap: 20px;
        margin-top: 20px;
    }
    
    .floor-plan-card {
        width: 100%;
        border: 1px solid #ddd;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .floor-plan-image {
        width: 100%;
        height: auto;
        max-height: 350px;
        object-fit: contain;
    }
    
    .floor-plan-details {
        padding: 15px;
    }
    
    .flats-gallery {
        margin: 20px 0;
    }
    
    .flat-image-card {
        position: relative;
        overflow: hidden;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        transition: transform 0.3s ease;
        height: 200px;
        margin-bottom: 15px;
    }
    
    .flat-image-card:hover {
        transform: translateY(-5px);
    }
    
    .flat-image-card img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }
    
    .flat-image-card:hover img {
        transform: scale(1.05);
    }
    
    .flat-caption {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0,0,0,0.7);
        color: white;
        padding: 8px 12px;
        font-weight: 500;
        text-align: center;
    }
    
    /* Broker card */
    .broker-card {
        width: 100%;
    }
    
    .broker-card img {
        width: 100%;
        height: auto;
        max-height: 300px;
        object-fit: cover;
    }
    
    /* Responsive adjustments */
    @media (min-width: 768px) {
        .main-container {
            flex-direction: row;
        }
        
        .main-content {
            flex: 2;
            order: 1;
            padding-right: 20px;
        }
        
        .sidebar {
            flex: 1;
            order: 2;
            position: relative;
        }
        
        .property-media-section {
            flex-direction: row;
        }
        
        .main-image-container {
            flex: 2;
        }
        
        .video-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .property-image {
            height: 400px;
        }
        
        iframe {
            height: 250px;
        }
        
        .card-container {
            flex-direction: row;
            flex-wrap: wrap;
        }
        
        .card {
            flex: 1;
            min-width: 250px;
        }
        
        .floor-plan-container {
            flex-direction: row;
            flex-wrap: wrap;
        }
        
        .floor-plan-card {
            flex: 1;
            min-width: 300px;
        }
        
        .contact-card {
            position: sticky;
            top: 100px;
            width: 100%;
            margin-left: 0;
        }
        
        .broker-card {
            width: 100%;
        }
        
        .broker-card img {
            height: 100%;
            max-height: none;
        }
    }
    
    @media (max-width: 767px) {
        .contact-card {
            margin-left: 0;
            width: 100%;
        }
        
        .navbar-brand {
            margin-left: 10px;
        }
        
        .navbar-brand span {
            font-size: 1.2rem;
        }
        
        .quick-links .btn {
            padding: 5px 5px;
            font-size: 0.8rem;
        }
        
        .property-header h1 {
            font-size: 1.8rem;
        }
        
        .property-header h3 {
            font-size: 1.2rem;
        }
        
        .price-info h3 {
            font-size: 1.5rem;
        }
        
        .section-title {
            font-size: 1.5rem;
        }
    }
    
    @media (max-width: 575px) {
        .specs-container {
            flex-direction: column;
            align-items: flex-start;
        }
        
        .divider {
            display: none;
        }
        
        .quick-links .btn {
            margin: 3px;
            padding: 4px 8px;
            font-size: 0.7rem;
        }
        
        .property-header h1 {
            font-size: 1.5rem;
        }
        
        .property-header h3 {
            font-size: 1rem;
        }
        
        .section {
            padding: 30px 0;
        }
        @media (max-width: 576px) {
    .quick-links-section {
        padding: 1rem 1rem;
    }

    .quick-links a {
        flex: 1 1 100%; /* Stack buttons full width */
        text-align: center;
          margin-right: 30px;
    }
}

    }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
    <!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		    <div class="container-fluid">
		      <a class="navbar-brand" href="${pageContext.request.contextPath}/palm">
		        <img src="<c:url value='/resources/images/estate1.jpg' />"  alt="Logo" width="60" class="d-inline-block align-top">
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
		            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" style="margin-right:30px;">Menu</a>
		            <ul class="dropdown-menu dropdown-menu-dark">
		              <li><h6 class="dropdown-header">Services</h6></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/buy">Buy</a></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/rent">Rent</a></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/commercial">Commercial</a></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/pg">PG/Hostel</a></li>
		              <li><hr class="dropdown-divider"></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/contact">Contact</a></li>
		              <c:if test="${empty sessionScope['estatefinder.userId']}"><li><a class="dropdown-item" href="${pageContext.request.contextPath}/adminlogin">Admin Login</a></li></c:if>
		            </ul>
		          </li>
		        </ul>
		      </div>
		    </div>
		  </nav>

    <!-- Separator Space -->
    <div class="content-separator"></div>

    <!-- Quick Links Section -->
    <div class="quick-links-section">
        <div class="container">
            <div class="quick-links">
                <div class="d-flex justify-content-center flex-wrap gap-2">
                    <a href="#overview-section" class="btn btn-outline-primary btn-sm rounded-pill px-3 active">
                        <i class="fas fa-building me-1"></i> Overview
                    </a>
                    <a href="#floor-plans-section" class="btn btn-outline-primary btn-sm rounded-pill px-3">
                        <i class="fas fa-layer-group me-1"></i> Floor Plans
                    </a>
                    <a href="#broker-section" class="btn btn-outline-primary btn-sm rounded-pill px-3">
                        <i class="fas fa-user-tie me-1"></i> Broker
                    </a>
                    <a href="#neighbourhood-section" class="btn btn-outline-primary btn-sm rounded-pill px-3">
                        <i class="fas fa-map-marked-alt me-1"></i> Neighbourhood
                    </a>
                    <a href="#flats-for-sale-section" class="btn btn-outline-primary btn-sm rounded-pill px-3">
                        <i class="fas fa-home me-1"></i> Flats for Sale
                    </a>
                    <a href="#faq-section" class="btn btn-outline-primary btn-sm rounded-pill px-3">
                        <i class="fas fa-question-circle me-1"></i> FAQ
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content Container -->
    <div class="main-container">
        <!-- Main Content Area -->
        <div class="main-content">
            <!-- Overview Section -->
            <section id="overview-section" class="section">
                <div class="property-media-section">
                    <div class="main-image-container">
                        <img src="${pageContext.request.contextPath}/resources/images/palm.jpeg" alt="Palm Town" class="property-image">
                    </div>
                    <div class="video-container">
                        <iframe width="1280" height="522" src="https://www.youtube.com/embed/4n93VJnZauE" title="2, 3 BHK Apartments starting at Rs.59.5 L | Palm Town | Upper Mahatma Nagar, Nashik" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                    </div>
                </div>

                <!-- Property Header -->
                <div class="property-header">
                    <h1>Palm Town</h1>
                    <h3>Near Gangapur Road, Upper Mahatma Nagar, Nashik</h3>
                    
                    <div class="price-info">
                        <h3>₹59.5 L - 75.5 L</h3>
                    </div>
                    
                    <h4>2-3 BHK Luxury Apartments</h4>
                </div>
                
                <!-- Cards Section -->
                <div class="card-container">
                    <div class="card">
                        <h4 style="text-align:center;">2 BHK Apartments</h4>
                        <hr>
                        <p>Saleable area<br><strong>1132
sq.ft</strong></p>
                        <h4>₹59.5 L</h4>
                    </div>
                    <div class="card">
                        <h4 style="text-align:center;">3 BHK Apartments</h4>
                        <hr>
                        <p>Saleable area<br><strong>1460
sq.ft</strong></p>
                        <h4>₹75.5 L</h4>
                    </div>
                </div>
                
                <!-- Property Highlights -->
                <div class="property-highlights">
                    <h3>'Palm Town' Overview</h3>
                    
                    <div class="specs-container">
                        <div class="spec-item">
                            <h6>1132 - 1460 sq.ft.</h6>
                            <p>sizes-saleable area</p>
                        </div>
                        <div class="divider">|</div>
                        <div class="spec-item">
                            <h6>
1.2 acres (33% open)</h6>
                            <p>Project area</p>
                        </div>
                        <div class="divider">|</div>
                        <div class="spec-item">
                            <h6>
6 buildings </h6>
                            <p>164 units</p>
                        </div>
                        <div class="divider">|</div>
                        <div class="spec-item">
                            <h6>
Apr, 2022</h6>
                            <p>Launch date</p>
                        </div>
                    </div>
                    
                    <p><strong>Rera ID:</strong> PP51600034576</p>
                    
                    <div style="margin-top:30px;">
                        <h5>Property Highlights</h5>
                        <ul style="padding-left:20px;">
                            <li>Luxury  2 & 3 BHK Flats</li>
                            <li>Prime Location in Gangapur</li>
                            <li>Premium Amenities and Lifestyle Facilities</li>
                            <li>Gated Community with 24/7 Security</li>
                            <li>Landscaped Gardens and Palm Tree Avenue</li>
                            <li>Infinity Pool and Clubhouse</li>
                            <li>Close to Godavari River and Educational Institutions</li>
                        </ul>
                    </div>
                </div>
            </section>

            <!-- Floor Plans Section -->
            <section id="floor-plans-section" class="section">
                <h2 class="section-title">Floor Plans</h2>
                
                <div class="floor-plan-container">
                    <div class="floor-plan-card">
                        <img src="${pageContext.request.contextPath}/resources/images/p1.jpg" alt="2 BHK Floor Plan" class="floor-plan-image">
                        <div class="floor-plan-details">
                            <h5>2 BHK Apartment</h5>
                            <p><strong>Area:</strong> 1132 sq.ft</p>
                            <p><strong>Price Range:</strong> ₹ 59.5 L</p>
                        </div>
                    </div>
                    <div class="floor-plan-card">
                        <img src="${pageContext.request.contextPath}/resources/images/2bh2.avif" alt="3 BHK Floor Plan" class="floor-plan-image">
                        <div class="floor-plan-details">
                            <h5>3 BHK Apartment</h5>
                            <p><strong>Area:</strong> 1460 sq.ft</p>
                            <p><strong>Price Range:</strong> ₹ 75.5 L</p>
                        </div>
                    </div>
                </div>
                
                <div class="mt-4">
                    <h5>Key Features of Floor Plans:</h5>
                    <ul>
                        <li>Spacious living and dining areas with balcony access</li>
                        <li>Master bedroom with walk-in closet</li>
                        <li>Modern modular kitchen with utility area</li>
                        <li>Attached bathrooms in all bedrooms</li>
                        <li>Balcony with each apartment</li>
                        <li>Optimal space utilization with Vaastu compliance</li>
                    </ul>
                </div>
            </section>

            <!-- Broker Section -->
            <section id="broker-section" class="section">
                <h2 class="section-title">Broker Information</h2>
                
                <div class="card">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=80" class="img-fluid rounded-start" alt="Broker Image">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Rajesh Deshmukh</h5>
                                <p class="card-text"><strong>Certified Property Consultant</strong></p>
                                <p class="card-text"><i class="fas fa-star text-warning"></i> 4.9 (127 reviews)</p>
                                <p class="card-text"><i class="fas fa-check-circle text-success"></i> Verified by EstateFinders</p>
                                <p class="card-text"><i class="fas fa-home"></i> 10+ years experience in Nashik properties</p>
                                <a class="btn btn-primary mt-2" href="${pageContext.request.contextPath}/contact">Contact Broker</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="mt-4">
                    <h5>Why work with our broker?</h5>
                    <ul>
                        <li>Specializes in Gangapur properties</li>
                        <li>Excellent negotiation skills for best pricing</li>
                        <li>Assistance with home loans and legal formalities</li>
                        <li>Access to exclusive deals and offers</li>
                        <li>Post-sale support and guidance</li>
                    </ul>
                </div>
            </section>

            <!-- Neighbourhood Section -->
            <section id="neighbourhood-section" class="section">
                <h2 class="section-title">Neighbourhood</h2>
                
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">About the Location</h5>
                        <p class="card-text">Palm Town is located in the prestigious Gangapur area of Nashik, known for its serene environment and proximity to the Godavari River. The location offers excellent connectivity to major IT parks, educational institutions, healthcare facilities, and shopping centers while maintaining a peaceful residential environment.</p>
                        
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <h6><i class="fas fa-school me-2"></i> Schools Nearby</h6>
                                <ul>
                                    <li>Delhi Public School (2 km)</li>
                                    <li>Bharat English School (1.5 km)</li>
                                    <li>KTHM College (3 km)</li>
                                    <li>Sandipani School (2.5 km)</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="fas fa-hospital me-2"></i> Hospitals Nearby</h6>
                                <ul>
                                    <li>Wockhardt Hospital (3 km)</li>
                                    <li>Vedant Hospital (2.5 km)</li>
                                    <li>Nobel Hospital (4 km)</li>
                                    <li>City Hospital (1.8 km)</li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <h6><i class="fas fa-shopping-cart me-2"></i> Shopping & Entertainment</h6>
                                <ul>
                                    <li>Big Bazaar (Gangapur Road) (2 km)</li>
                                    <li>Nashik City Centre Mall (6 km)</li>
                                    <li>D-Mart (3 km)</li>
                                    <li>Inox Cinemas (5 km)</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="fas fa-subway me-2"></i> Transport & Connectivity</h6>
                                <ul>
                                    <li>Gangapur Bus Stand (0.5 km)</li>
                                    <li>Nashik Road Railway Station (8 km)</li>
                                    <li>Central Bus Stand (7 km)</li>
                                    <li>Auto/Taxi Stand (0.3 km)</li>
                                    <li>Mumbai-Agra Highway Access (2 km)</li>
                                </ul>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <h6><i class="fas fa-utensils me-2"></i> Restaurants & Dining</h6>
                                <ul>
                                    <li>Barbeque Nation (4 km)</li>
                                    <li>Hotel Sai Palace (1.5 km)</li>
                                    <li>Domino's Pizza (1 km)</li>
                                    <li>McDonald's (3 km)</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="fas fa-landmark me-2"></i> Banks & ATMs</h6>
                                <ul>
                                    <li>HDFC Bank (0.5 km)</li>
                                    <li>ICICI Bank ATM (0.3 km)</li>
                                    <li>State Bank of India (1 km)</li>
                                    <li>Axis Bank (0.8 km)</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Location Map</h5>
                        <div class="ratio ratio-16x9">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3749.8765432109876!2d73.7890123154312!3d19.998765432101234!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bddeb1234567890%3A0xabcdef1234567890!2sPalm%20Town%2C%20Gangapur%2C%20Nashik!5e0!3m2!1sen!2sin!4v1234567890123!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        <div class="mt-3">
                            <a href="https://maps.google.com/?q=Palm+Town+Gangapur+Nashik" target="_blank" class="btn btn-primary">
                                <i class="fas fa-map-marked-alt me-2"></i>View on Google Maps
                            </a>
                        </div>
                    </div>
                </div>
            </section>

            <div class="mt-4">
                <h2 class="section-title">For Booking</h2>
                <p>"Book Now - Your Perfect Property Awaits!"</p>
                <a href="${pageContext.request.contextPath}/elogin" class="btn btn-primary">Book Now</a>
            </div>

            <!-- Flats for Sale Section -->
            <section id="flats-for-sale-section" class="section">
                <h3>Flats for sale in Palm Town</h3>
                <div class="flats-gallery mt-4">
                    <div class="row g-3">
                       
                        <div class="col-md-3 col-6">
                            <div class="flat-image-card">
                                <img src="<c:url value='/resources/images/pl2.avif'/>" class="img-fluid rounded" alt="2 BHK Flat">
                                <div class="flat-caption">2 BHK Apartment</div>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="flat-image-card">
                                <img src="<c:url value='/resources/images/pl3.avif'/>" class="img-fluid rounded" alt="3 BHK Flat">
                                <div class="flat-caption">3 BHK Apartment</div>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="flat-image-card">
                                <img src="<c:url value='/resources/images/palm2.avif'/>" class="img-fluid rounded" alt="Clubhouse">
                                <div class="flat-caption">Clubhouse</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- FAQ Section -->
            <section id="faq-section" class="section">
                <h2 class="section-title">Frequently Asked Questions</h2>
                
                <div class="accordion" id="faqAccordion">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                                What is the current construction status of Palm Town?
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Palm Town is currently under construction with 60% work completed. The possession is expected by December 2025.
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                                What are the payment plan options available?
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                We offer flexible payment options:
                                <ul>
                                    <li>10% down payment with 90% on possession</li>
                                    <li>20% down payment with 80% in easy installments</li>
                                    <li>Construction-linked payment plan</li>
                                    <li>Bank loan assistance available from all major banks</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                                What amenities are included in the project?
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Palm Town offers premium amenities including:
                                <ul>
                                    <li>Luxury clubhouse with gym and spa</li>
                                    <li>Infinity swimming pool</li>
                                    <li>Children's play area and daycare</li>
                                    <li>Landscaped gardens with palm trees</li>
                                    <li>24/7 security with CCTV surveillance</li>
                                    <li>Power backup for entire premises</li>
                                    <li>Rainwater harvesting system</li>
                                    <li>Jogging track and yoga deck</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour">
                                Is there any maintenance charge? If yes, how much?
                            </button>
                        </h2>
                        <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Yes, there is a maintenance charge of ₹3.5 per sq.ft per month. This includes:
                                <ul>
                                    <li>Common area maintenance</li>
                                    <li>24/7 security services</li>
                                    <li>Lift maintenance</li>
                                    <li>Garden and landscape upkeep</li>
                                    <li>Basic amenities maintenance</li>
                                    <li>Clubhouse access</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFive">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive">
                                What makes Gangapur a good location to invest in?
                            </button>
                        </h2>
                        <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Gangapur is one of Nashik's most prestigious areas due to:
                                <ul>
                                    <li>Proximity to Godavari River and scenic views</li>
                                    <li>Excellent connectivity to Mumbai-Agra Highway</li>
                                    <li>Presence of premium educational institutions</li>
                                    <li>Availability of all urban amenities</li>
                                    <li>Upcoming infrastructure projects</li>
                                    <li>Peaceful residential environment</li>
                                    <li>High appreciation potential (15-20% annually)</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        
        <!-- Sidebar with Contact Card -->
        <div class="sidebar">
            <div class="contact-card" style="margin-left:50px;width:260px;">
                <h3>Contact Information</h3>
                <p><i class="fas fa-phone me-2"></i> +91 9876543210</p>
                <p><i class="fas fa-envelope me-2"></i> sales@palmtown.com</p>
                <p><i class="fas fa-map-marker-alt me-2"></i> Gangapur Road, Nashik - 422013</p>
                <a href="${pageContext.request.contextPath}/contact"><button class="btn btn-primary w-70" style="margin-top: 20px;">
                    <i class="fas fa-user-tie me-2"></i>Contact Sales Team
                </button></a>
            </div>
        </div>
    </div>

    <!-- Footer -->
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
                        <li><a href="${pageContext.request.contextPath}/project" class="text-white">Home</a></li>
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

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>