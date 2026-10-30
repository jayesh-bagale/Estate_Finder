<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EstateFinders</title>
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
            margin-left: 40px;
        }
        
        .navbar-brand span {
            font-size: 1.4rem;
            font-weight: 700;
            color: white;
            letter-spacing: 0.5px;
            margin-left: 10px;
        }
        
        .navbar-nav {
            margin-right: 40px;
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
            margin-right: 30px;
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
            margin-left: 20px;
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
            gap: 30px;
        }
        
        .main-content {
            flex: 2;
        }
        
        .sidebar {
            flex: 1;
        }
        
        .property-media-section {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
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
            width: 100%;
            height: 400px;
            border-radius: 8px;
            object-fit: cover;
        }
        
        iframe {
            width: 100%;
            height: 190px;
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
            gap: 20px;
            margin: 30px 0;
            flex-wrap: wrap;
        }
        
        .card {
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            flex: 1;
            min-width: 250px;
        }
        
        .property-highlights {
            margin-top: 30px;
        }
        
        .contact-card {
            background-color: #000;
            color: white;
            padding: 25px;
            border-radius: 8px;
            position: sticky;
            top: 100px;
            margin-bottom: 30px;
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
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }
        
        .floor-plan-card {
            flex: 1;
            min-width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .floor-plan-image {
            width: 60%;
            height: 180px;
            object-fit: cover;
            margin-left: 40px;
            margin-top: 20px;
        }
        
        .floor-plan-details {
            padding: 15px;
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
		      <a class="navbar-brand" href="${pageContext.request.contextPath}/rivera">
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
  <!-- Quick Links Section -->

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
    
    <!-- Main Content Container -->
    <div class="main-container">
        <!-- Main Content Area -->
        <div class="main-content">
            <!-- Overview Section -->
            <section id="overview-section" class="section">
                <div class="property-media-section">
                    <div class="main-image-container">
                        <img src="<c:url value='/resources/images/rivera.jpg'/>" alt="rivera " class="property-image">
                    </div>
                  
                </div>

                <!-- Property Header -->
                <div class="property-header">
                    <h1>A R Rivera Sky Garden </h1>
                    <h3>S No. 49/3 Of Gangapur, Nashik</h3>
                    
                    <div class="price-info">
                        <h3>Price on Request</h3>
                        <span>|</span>
                        <p>Under Construction<br>
Possession by May, 2026</p>
                    </div>
                    
                    <h4>1, 2 BHK Apartments</h4>
                </div>
                
                <!-- Cards Section -->
                <div class="card-container">
                    <div class="card">
                        <h4 style="text-align:center;">1 BHK Apartment</h4>
                        <hr>
                        <p>Saleable area<br><strong>315.81 - 317.75sq.ft</strong></p>
                        <h4>Price on Request</h4>
                    </div>
                    
                    <div class="card">
                        <h4 style="text-align:center;">2 BHK Apartment</h4>
                        <hr>
                        <p>Saleable area<br><strong>478.35 - 482.65sq.ft</strong></p>
                        <h4>Price on Request</h4>
                    </div>
                </div>
                
                <!-- Property Highlights -->
                <div class="property-highlights">
                    <h3>’A R Rivera Sky Garden’ overview</h3>
                    
                    <div class="specs-container">
                        <div class="spec-item">
                            <h6>316 - 483 sq.ft.</h6>
                            <p>sizes-saleable area</p>
                        </div>
                        <div class="divider">|</div>
                        <div class="spec-item">
                            <h6>
0.14 acres</h6>
                            <p>Project area</p>
                        </div>
                        <div class="divider">|</div>
                        <div class="spec-item">
                            <h6>
1 building - 35 units</h6>
                            <p>property size</p>
                        </div>
                        <div class="divider">|</div>
                        <div class="spec-item">
                            <h6>Apr, 2023</h6>
                            <p>Launch date</p>
                        </div>
                    </div>
                    
                    <p><strong>Rera ID:</strong> P51600050659</p>
                    
                    
            </section>

            <!-- Floor Plans Section -->
            <section id="floor-plans-section" class="section">
                <h2 class="section-title">Floor Plans</h2>
                
                <div class="floor-plan-container">
                    <div class="floor-plan-card">
                        <img src="${pageContext.request.contextPath}/resources/images/1st.avif" alt="1 BHK Floor Plan" class="floor-plan-image">
                        <div class="floor-plan-details">
                            <h5>1 BHK Apartment</h5>
                            <p><strong>Area:</strong>315-317 sq.ft</p>
                            <p><strong>Price Range:</strong> Price on Request</p>
                        </div>
                    </div>
                    
                    <div class="floor-plan-card">
                        <img src="${pageContext.request.contextPath}/resources/images/3bh.avif" alt="3 BHK Floor Plan" class="floor-plan-image">
                        <div class="floor-plan-details">
                            <h5>2 BHK Apartment</h5>
                            <p><strong>Area:</strong> 478-482 sq.ft</p>
                            <p><strong>Price Range:</strong> Price on Request</p>
                        </div>
                    </div>
                </div>
                
                <div class="mt-4">
                    <h5>Key Features of Floor Plans:</h5>
                    <ul>
                        <li>Spacious living and dining areas</li>
                        <li>Well-ventilated bedrooms</li>
                        <li>Modern kitchen design</li>
                        <li>Attached bathrooms in all bedrooms</li>
                        <li>Balcony with each apartment</li>
                    </ul>
                </div>
            </section>

          

            <!-- Neighbourhood Section -->
           <!-- Neighbourhood Section -->
<section id="neighbourhood-section" class="section">
    <h2 class="section-title">Neighbourhood</h2>
    
    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">About the Location</h5>
            <p class="card-text">A R Rivera Sky Garden is strategically located in Gangapur, Nashik, offering excellent connectivity to key areas while maintaining a peaceful residential environment. The location provides easy access to educational institutions, healthcare facilities, shopping centers, and transportation hubs.</p>
            
            <div class="row mt-3">
                <div class="col-md-6">
                    <h6><i class="fas fa-school me-2"></i> Schools Nearby</h6>
                    <ul>
                        <li>Mount Litera Zee School (1.5 km)</li>
                        <li>Ryan International School (2 km)</li>
                        <li>Gangapur Public School (0.8 km)</li>
                        <li>Jawahar Navodaya Vidyalaya (3 km)</li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <h6><i class="fas fa-hospital me-2"></i> Hospitals Nearby</h6>
                    <ul>
                        <li>Ashoka Hospital (1.2 km)</li>
                        <li>Wockhardt Hospitals (4 km)</li>
                        <li>City Hospital (2.5 km)</li>
                        <li>Noble Hospital (3 km)</li>
                    </ul>
                </div>
            </div>
            
            <div class="row mt-3">
                <div class="col-md-6">
                    <h6><i class="fas fa-shopping-cart me-2"></i> Shopping & Entertainment</h6>
                    <ul>
                        <li>Nashik City Centre Mall (3.5 km)</li>
                        <li>Big Bazaar (2.8 km)</li>
                        <li>Gangapur Road Market (0.5 km)</li>
                        <li>Inox Cinemas (4 km)</li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <h6><i class="fas fa-subway me-2"></i> Transport & Connectivity</h6>
                    <ul>
                        <li>Gangapur Road (0.2 km)</li>
                        <li>Nashik Road Railway Station (6 km)</li>
                        <li>Mahamarg Bus Stand (3 km)</li>
                        <li>Auto/Taxi Stand (0.3 km)</li>
                    </ul>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <h6><i class="fas fa-utensils me-2"></i> Restaurants & Dining</h6>
                    <ul>
                        <li>Barbeque Nation (3 km)</li>
                        <li>Hotel Sai Palace (1 km)</li>
                        <li>Domino's Pizza (1.5 km)</li>
                        <li>McDonald's (2.5 km)</li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <h6><i class="fas fa-landmark me-2"></i> Banks & ATMs</h6>
                    <ul>
                        <li>State Bank of India (0.8 km)</li>
                        <li>HDFC Bank ATM (0.5 km)</li>
                        <li>ICICI Bank (1.2 km)</li>
                        <li>Axis Bank (1.5 km)</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Location Map</h5>
            <div class="ratio ratio-16x9">
           <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14994.197799624802!2d73.70141769787331!3d20.027415802125557!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bddec301d499201%3A0x3875ca4cb8796c0a!2sGangapur%2C%20Nashik%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1752560096342!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="mt-3">
                <a href="https://maps.google.com/?q=Shreeji+The+Crown+Govind+Nagar+Nashik" target="_blank" class="btn btn-primary">
                    <i class="fas fa-map-marked-alt me-2"></i>View on Google Maps
                </a>
        </div>
    </div>
</section>

                    <div class="mt-4">
                   <h2 class="section-title">For Booking</h2>
                    <p>"Book Now - Your Perfect Property Awaits!"</p>
                     <a href="${pageContext.request.contextPath}/elogin" class="btn btn-primary">Book Now</a>
                </div>

          

            <!-- FAQ Section -->
            <section id="faq-section" class="section">
                <h2 class="section-title">Frequently Asked Questions</h2>
                
                <div class="accordion" id="faqAccordion">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                                What is the current construction status of the project?
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                The project is currently in the final stages of construction with 90% work completed. Possession is expected within the next 6 months.
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
                                We offer multiple payment options:
                                <ul>
                                    <li>10% down payment with 90% on possession</li>
                                    <li>20% down payment with 80% in easy installments</li>
                                    <li>Bank loan assistance available</li>
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
                                The project includes:
                                <ul>
                                    <li>Clubhouse with gym</li>
                                    <li>Swimming pool</li>
                                    <li>Children's play area</li>
                                    <li>Landscaped gardens</li>
                                    <li>24/7 security</li>
                                    <li>Power backup</li>
                                    <li>Rainwater harvesting</li>
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
                                Yes, there is a maintenance charge of ₹3.5 per sq.ft per month. This includes common area maintenance, security, and basic amenities upkeep.
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFive">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive">
                                Can I visit the site to see the property?
                            </button>
                        </h2>
                        <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Yes, site visits can be arranged by appointment. Please contact our sales team to schedule a visit at your convenience.
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </section>
        </div>
        
        <!-- Sidebar with Contact Card -->
         <div class="sidebar">
            <div class="contact-card"style="margin-left:50px;width:260px;">
                <h3>Contact Information</h3>
                <p><i class="fas fa-phone me-2"></i> 123-456-7890</p>
                <p><i class="fas fa-envelope me-2"></i> info@roongtaflorenza.com</p>
                <p><i class="fas fa-map-marker-alt me-2"></i> Near Govind nagar, off 100ft.Ring road, Nashik</p>
                <a href="${pageContext.request.contextPath}/contact"><button class="btn btn-primary w-70" style="margin-top: 20px;">
                    <i class="fas fa-user-tie me-2"></i>Contact Agent
                </button>
              
               </a>
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
    <script>
      
    </script>
</body>
</html>