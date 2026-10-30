<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pride Laxman Ramna | EstateFinders</title>
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
            flex: 3;
        }
        
        .sidebar {
            flex: 1;
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
            height: 100px;
            margin-bottom: 15px;
        }
        
        .flat-image-card:hover {
            transform: translateY(-5px);
        }
        
        .flat-image-card img {
            width: 50%;
            height: 50%;
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
        
        /* Quick links section */
        .quick-links-section {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
            -webkit-text-fill-color: white;
            padding: 15px 0;
            position: sticky;
            top: 0;
            z-index: 1020;
            width: 100%;
        }
        
      .contact-card {
        background-color: #000;
        color: white;
        padding: 25px;
        border-radius: 8px;
         margin-right: 80px;
        margin-bottom: 30px;
        width: 100%;
        box-sizing: border-box;
        position: fixed;
       
    }
        
        /* Form styles */
        .form-control {
            width: 80%;
           
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-control.is-invalid {
            border-color: #dc3545;
        }

        .invalid-feedback {
            color: #dc3545;
            font-size: 0.875em;
            margin-top: -8px;
            margin-bottom: 10px;
        }

        .btn-light {
            background-color: #f8f9fa;
            color: #212529;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-light:hover {
            background-color: #e2e6ea;
        }

        /* Responsive styles */
        @media (max-width: 992px) {
            .main-container {
                flex-direction: column;
            }
            
            .main-content {
                order: 1;
                padding-right: 0;
            }
            
            .sidebar {
                order: 2;
            }
            
            .property-media-section {
                flex-direction: column;
            }
            
            .property-image, iframe {
                height: auto;
            }
            
            .floor-plan-container {
                flex-direction: column;
            }
            
            .floor-plan-card {
                min-width: 100%;
            }
            
            .contact-card {
                position: static;
            }
        }

        @media (max-width: 576px) {
            .navbar-brand span {
                font-size: 1.1rem;
            }
            
            .quick-links .btn {
                padding: 0.25rem 0.5rem;
                font-size: 0.7rem;
            }
            
            .property-header h1 {
                font-size: 1.5rem;
            }
            
            .property-header h3 {
                font-size: 1rem;
            }
            
            .price-info h3 {
                font-size: 1.2rem;
            }
            
            .card {
                min-width: 100%;
            }
            
            .specs-container {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .divider {
                display: none;
            }
            
            .flat-image-card {
                height: 150px;
            }
            
            .broker-card .col-md-4 {
                margin-bottom: 15px;
            }
            
            .broker-card .col-md-8 {
                padding-left: 15px;
            }
            
            .quick-links-section {
                padding: 1rem 1rem;
            }

            .quick-links a {
                flex: 1 1 100%; /* Stack buttons full width */
                text-align: center;
                 margin-right: 30px;
            }
        }

        /* Ensure images don't overflow */
        img, iframe, .floor-plan-image, .property-image {
            max-width: 100%;
            height: auto;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
    <!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		    <div class="container-fluid">
		      <a class="navbar-brand" href="${pageContext.request.contextPath}/minika">
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
   
            <div class="quick-links"style="-webkit-text-fill-color:white;">
                <div class="d-flex justify-content-center flex-wrap gap-2">
                    <a href="#overview-section" class="btn btn-outline-primary btn-sm rounded-pill px-3 active" style="background-color: var(--primary-color);">
                        <i class="fas fa-building me-1"></i> Overview
                    </a>
                    <a href="#Dealer-Details" class="btn btn-outline-primary btn-sm rounded-pill px-3" style="background-color: var(--primary-color);">
                        <i class="fas fa-layer-group me-1"></i> Seller-details
                    </a>
                    <a href="#neighbourhood-section" class="btn btn-outline-primary btn-sm rounded-pill px-3" style="background-color: var(--primary-color);">
                        <i class="fas fa-user-tie me-1"></i> Neighbourhood
                    </a>
                    <a href="#Book" class="btn btn-outline-primary btn-sm rounded-pill px-3" style="background-color: var(--primary-color);">
                        <i class="fas fa-map-marked-alt me-1"></i> Book
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
			                        <img src="<c:url value='/resources/images/arpan.avif'/>" alt="Pride Laxman Ramna" class="property-image">
                    <div class="video-container">
                        <!-- Video content would go here -->
                    </div>
                </div>

                <!-- Property Header -->
                <div class="property-header">
                    <h1>MINKA RIVERDALE</h1>
                    <h3>Independent House/Villa for Sale in in Gangapur, Nashik, Maharashtra</h3>
                    
                    <div class="price-info">
                        <h3>₹3.21 Cr</h3>
                    </div>
                    
                    <h4>4350
sq.ft</h4>
                </div>
                
                <!-- Cards Section -->
                <div class="card-container" style="width:300px;">
                    <div class="card">
                        <h4 style="text-align:center;">4.5 BHK Villa</h4>
                        <hr>
                        <p>Plot area area<br><strong>4350 sq.ft.
  </strong></p>
                        <h4>₹3.21 Cr</h4>
                    </div>
                </div>
            </section>

            <section id="Dealer-Details" class="section">
                <h2 class="section-title">Seller details</h2>
                
                <div class="floor-plan-container">
                    <div class="floor-plan-card">
                        <img src="${pageContext.request.contextPath}/resources/images/3bh.avif" alt="3 BHK Floor Plan" class="floor-plan-image1" style="margin-left:10px;">
                        <div class="floor-plan-details">
                            <p>Arpanna Group
                             seller</p>
                            <p><strong>Localities :</strong> Gangapur</p>
                            <p><strong>Address :</strong>  Gangapur road, nashik.</p>
                        </div>
                    </div>
                </div>
            </section>
            
            <section id="neighbourhood-section" class="section">
                <h2 class="section-title">Neighbourhood</h2>
                
               <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">About the Location</h5>
                        <p class="card-text">The Minika Riverdale enjoys a premium location in the upscale Gangapur area of Nashik, known for its serene environment and excellent connectivity. Situated near the Gangapur Dam Road, the property offers breathtaking views of the surrounding hills and easy access to Nashik's major attractions while maintaining a peaceful residential atmosphere.</p>
                        
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <h6><i class="fas fa-school me-2"></i> Schools Nearby</h6>
                                <ul>
                                    <li>Delhi Public School (2.5 km)</li>
                                    <li>Bharat English School (1.8 km)</li>
                                    <li>Gurukul International School (3 km)</li>
                                    <li>KTHM College (4.2 km)</li>
                                    <li>Sandipani School (5 km)</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="fas fa-hospital me-2"></i> Hospitals Nearby</h6>
                                <ul>
                                    <li>Vedant Hospital (3 km)</li>
                                    <li>Ashoka Hospital (2.5 km)</li>
                                    <li>Wockhardt Hospital (6 km)</li>
                                    <li>City Hospital (4 km)</li>
                                    <li>Nobel Hospital (7 km)</li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <h6><i class="fas fa-shopping-cart me-2"></i> Shopping & Entertainment</h6>
                                <ul>
                                    <li>Nashik City Centre Mall (5 km)</li>
                                    <li>Big Bazaar (4.5 km)</li>
                                    <li>D-Mart (3.8 km)</li>
                                    <li>Inox Cinemas (5 km)</li>
                                    <li>Gangapur Road Shopping District (2 km)</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="fas fa-subway me-2"></i> Transport & Connectivity</h6>
                                <ul>
                                    <li>Gangapur Bus Stand (1.5 km)</li>
                                    <li>Nashik Road Railway Station (8 km)</li>
                                    <li>Central Bus Stand (7 km)</li>
                                    <li>Auto/Taxi Stand (0.5 km)</li>
                                    <li>Mumbai-Agra Highway Access (3 km)</li>
                                </ul>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <h6><i class="fas fa-utensils me-2"></i> Restaurants & Dining</h6>
                                <ul>
                                    <li>Punjabi Rasoi (1.2 km)</li>
                                    <li>Barbeque Nation (5 km)</li>
                                    <li>Domino's Pizza (2.5 km)</li>
                                    <li>Hotel Abhishek (3 km)</li>
                                    <li>Gangapur Road Food Street (2 km)</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="fas fa-landmark me-2"></i> Banks & ATMs</h6>
                                <ul>
                                    <li>HDFC Bank Gangapur Branch (1.5 km)</li>
                                    <li>ICICI Bank ATM (0.8 km)</li>
                                    <li>State Bank of India (2 km)</li>
                                    <li>Axis Bank (1.8 km)</li>
                                    <li>Bank of Maharashtra (1.2 km)</li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <h6><i class="fas fa-parking me-2"></i> Landmarks</h6>
                                <ul>
                                    <li>Gangapur Dam (4 km)</li>
                                    <li>Sula Vineyards (15 km)</li>
                                    <li>Muktidham Temple (6 km)</li>
                                    <li>Pandavleni Caves (8 km)</li>
                                    <li>Gangapur Road Junction (1 km)</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="fas fa-tree me-2"></i> Parks & Recreation</h6>
                                <ul>
                                    <li>Gangapur Dam Garden (4 km)</li>
                                    <li>Nashik Municipal Corporation Park (5 km)</li>
                                    <li>Godavari Riverfront (3 km)</li>
                                    <li>Children's Park (2.5 km)</li>
                                    <li>Jogging Track within Society</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Location Map</h5>
                        <div class="ratio ratio-16x9">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3749.8765432109876!2d73.7890123456789!3d19.99876543210987!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bddeb1234567890%3A0xabcdef1234567890!2sThe%20Grand%20by%20Parksyde%2C%20Gangapur%20Road%2C%20Nashik!5e0!3m2!1sen!2sin!4v1234567890123!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        <div class="mt-3">
                            <a href="https://maps.google.com/?q=The+Grand+by+Parksyde+Gangapur+Nashik" target="_blank" class="btn btn-primary">
                                <i class="fas fa-map-marked-alt me-2"></i>View on Google Maps
                            </a>
                        </div>
                    </div>
                </div>
            </section>
            
            <section id="Book">
                <div class="mt-4">
                    <h2 class="section-title">For Booking</h2>
                    <p>"Book Now - Your Perfect Property Awaits!"</p>
                    <a href="${pageContext.request.contextPath}/elogin" class="btn btn-primary">Book Now</a>
                </div>
            </section>
        </div>
        
        <div class="sidebar">
            <div class="contact-card" style="margin-left:50px;width:260px;">
                <h3>Contact Information</h3>
                <p><i class="fas fa-phone me-2"></i> +91 9876543210</p>
                <p><i class="fas fa-envelope me-2"></i> sales@palmtown.com</p>
                <p><i class="fas fa-map-marker-alt me-2"></i> Gangapur Road, Nashik - 422013</p>
                <a href="${pageContext.request.contextPath}/contact"><button class="btn btn-primary w-100" style="margin-top: 20px;">
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