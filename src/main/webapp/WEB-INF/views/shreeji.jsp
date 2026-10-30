<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EstateFinders - Property Listings</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
		:root {
			     --primary-color: #2c3e50;
			     --secondary-color: #e74c3c;
			     --accent-color: #3498db;
			     --light-color: #ecf0f1;
			     --dark-color: #2c3e50;
			   }
			   
			   * {
			     margin: 0;
			     padding: 0;
			     box-sizing: border-box;
			     font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			   }
			   
			   body {
			     background-color: #f9f9f9;
			     color: #333;
			     line-height: 1.6;
			   }
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
			             font-size: 1.4rem;
			             font-weight: 700;
			             color: white;
			             letter-spacing: 0.5px;
			             margin-left: 10px;
			         }
			         
			         .nav-link {
			             color: white !important;
			             font-family: Verdana, sans-serif;
			             font-size: 1rem;
			             padding: 8px 15px !important;
			             transition: color 0.3s;
			         }
			         
			         .nav-link:hover {
			             color: var(--secondary-color) !important;
			         }
			         
			         .dropdown-menu {
			             background-color: var(--primary-color);
			         }
			         
			         .dropdown-item {
			             color: white !important;
			         }
			         
			         .dropdown-item:hover {
			             background-color: var(--secondary-color);
			             color: var(--primary-color) !important;
			         }
			         
			         .dropdown-header {
			             color: var(--secondary-color);
			         }
			         
			         /* Property Cards */
			         .properties-container {
			             padding: 30px 15px;
			         }
			         
			         .property-card {
			             width: 100%;
			             margin-bottom: 30px;
			             box-shadow: 0 4px 8px rgba(0,0,0,0.1);
			             border: none;
			             border-radius: 10px;
			             overflow: hidden;
			         }
			         
			         .card-img-container {
			             height: 250px;
			             overflow: hidden;
			         }
			         
			         .card-img-container img {
			             width: 100%;
			             height: 100%;
			             object-fit: cover;
			             transition: transform 0.3s;
			         }
			         
			         .property-card:hover .card-img-container img {
			             transform: scale(1.03);
			         }
			         
			         .card-body {
			             padding: 20px;
			         }
			         
			         .card-title {
			             font-size: 1.3rem;
			             font-weight: 600;
			             margin-bottom: 10px;
			         }
			         
			         .card-text {
			             margin-bottom: 8px;
			             font-size: 0.95rem;
			         }
			         
			         .price-highlight {
			             font-size: 1.1rem;
			             color: #28a745;
			             font-weight: 600;
			         }
			         
			         .property-details {
			             display: flex;
			             flex-wrap: wrap;
			             gap: 10px;
			             margin: 15px 0;
			         }
			         
			         .detail-item {
			             display: flex;
			             align-items: center;
			             font-size: 0.85rem;
			         }
			         
			         .detail-item i {
			             margin-right: 5px;
			             color: var(--secondary-color);
			         }
			         
			         /* Section Headings */
			         .section-heading {
			             text-align: center;
			             margin: 20px 0;
			             color: var(--primary-color);
			             font-weight: 600;
			         }
			         
			         /* Contact Section */
			         #contact-section {
			             background-color: #f8f9fa;
			             padding: 30px 0;
			             margin-top: 30px;
			         }
			         
			         .contact-container {
			             width: 100%;
			             margin: 0 auto;
			             background: white;
			             padding: 20px;
			             border-radius: 10px;
			             box-shadow: 0 4px 8px rgba(0,0,0,0.1);
			         }
			         
			         .contact-title {
			             text-align: center;
			             margin-bottom: 20px;
			             color: var(--primary-color);
			         }
			         
			         /* Footer */
			         footer {
			             background-color: var(--primary-color);
			             color: white;
			             padding: 30px 0 15px;
			         }
			         
			         .social-icons a {
			             color: white;
			             font-size: 1.2rem;
			             margin-right: 15px;
			             transition: color 0.3s;
			         }
			         
			         .social-icons a:hover {
			             color: var(--secondary-color);
			         }
			         
			         .footer-links {
			             list-style: none;
			             padding-left: 0;
			         }
			         
			         .footer-links li {
			             margin-bottom: 8px;
			         }
			         
			         .footer-links a {
			             color: #adb5bd;
			             text-decoration: none;
			             transition: color 0.3s;
			             font-size: 0.9rem;
			         }
			         
			         .footer-links a:hover {
			             color: white;
			         }
			         
			         /* Responsive adjustments */
			         @media (min-width: 768px) {
			             /* Tablet and desktop styles */
			             .properties-container {
			                 max-width: 900px;
			                 margin: 0 auto;
			                 padding: 40px 0;
			             }
			             
			             .property-card {
			                 width: 100%;
			             }
			             
			             .card-img-container {
			                 height: 300px;
			             }
			             
			             .card-body {
			                 padding: 25px;
			             }
			             
			             .card-title {
			                 font-size: 1.5rem;
			             }
			             
			             .card-text {
			                 font-size: 1rem;
			             }
			             
			             .price-highlight {
			                 font-size: 1.2rem;
			             }
			             
			             .detail-item {
			                 font-size: 0.95rem;
			             }
			             
			             .section-heading {
			                 margin: 30px 0;
			                 font-size: 1.8rem;
			             }
			             
			             #contact-section {
			                 padding: 50px 0;
			                 margin-top: 50px;
			             }
			             
			             .contact-container {
			                 max-width: 900px;
			                 padding: 30px;
			             }
			             
			             footer {
			                 padding: 50px 0 20px;
			             }
			             
			             .footer-links a {
			                 font-size: 1rem;
			             }
			         }
			         
			         @media (min-width: 992px) {
			             /* Large desktop styles */
			             .card-img-container {
			                 height: 350px;
			             }
			         }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="<c:url value='/shreeji'/>">
                <img src="<c:url value='/resources/images/estate1.jpg'/>" alt="Logo" width="60" class="d-inline-block align-top">
                <span>ESTATEFINDERS</span>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ms-auto me-4">
					<li class="nav-item"><a class="nav-link active" href="<c:url value='/project'/>">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/about'/>">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/login'/>">Login/Register</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="menuDropdown" data-bs-toggle="dropdown">Menu</a>
                        <ul class="dropdown-menu" aria-labelledby="menuDropdown">
                            <li><h6 class="dropdown-header">Services</h6></li>
                            <li><a class="dropdown-item" href="<c:url value='/buy'/>">Buy</a></li>
                            <li><a class="dropdown-item" href="<c:url value='/rent'/>">Rent</a></li>
                            <li><a class="dropdown-item" href="<c:url value='/commercial'/>">Commercial</a></li>
                            <li><a class="dropdown-item" href="<c:url value='/pg'/>">PG/Hostel</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<c:url value='/about'/>">About Us</a></li>
                            <li><a class="dropdown-item" href="<c:url value='/contact'/>">Contact</a></li>
                            <c:if test="${empty sessionScope['estatefinder.userId']}"><li><a class="dropdown-item" href="<c:url value='/admin'/>">Admin Login</a></li></c:if>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

	<div class="properties-container">
	       <!-- First Card -->
	       <div class="card property-card">
	           <div class="row g-0">
	               <div class="col-md-5">
	                   <div class="card-img-container">
	                       <img src="<c:url value='/resources/images/shriji.jpg'/>" class="img-fluid" alt="Lalit Roongta Group">
	                   </div>
	               </div>
	               <div class="col-md-7">
	                   <div class="card-body">
	                       <h5 class="card-title">Shreeji Group</h5>
	                       <p class="card-text">Projects: 22.</p>
	                       <p class="card-text"><small class="text-body-secondary">In 2007, if someone told me that Shreeji would become this big, I would probably not have believed it in the first go. You see, not everyone knows about the number of people and brains that work behind creating one beautiful living space. </small></p>
	                       <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                            <a href="<c:url value='/contact'/>" class="btn btn-primary">Contact Builder</a>
	                       </div>
	                   </div>
	               </div>
	           </div>
	       </div>
	       
	       <h3>Residental Project by Shreeji Group</h3>
	       
	       <!-- Second Card -->
	       <div class="card property-card">
	           <div class="row g-0">
	               <div class="col-md-5">
	                   <div class="card-img-container">
	                       <img src="<c:url value='/resources/images/ele2.avif'/>" class="img-fluid" alt="Lalit Roongta Group">
	                   </div>
	               </div>
	               <div class="col-md-7">
	                   <div class="card-body">
	                       <h5 class="card-title">Shreeji Elevate</h5>
	                       <p class="card-text">2,3 BHK Flat in Indira Nagar</p>
	                       <p class="card-text price-highlight">₹45.04L-₹62.06L</p>
	                       <div class="property-details">
	                           <div class="detail-item">
	                               <i class="fas fa-ruler-combined"></i>
	                               <span>1019 - 1429 sq.ft.</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-tag"></i>
	                               <span>₹4.39 K/sq.ft</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-hard-hat"></i>
	                               <span>Under Construction</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-calendar-alt"></i>
	                               <span>Possession: Dec, 2028</span>
	                           </div>
	                       </div>
	                       <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                           <a href="<c:url value='/contact'/>" class="btn btn-primary">Contact Agent</a>
	                       </div>
	                   </div>
	               </div>
	           </div>
	       </div>

	       <!-- Third Card -->
	       <div class="card property-card">
	           <div class="row g-0">
	               <div class="col-md-5">
	                   <div class="card-img-container">
	                       <img src="<c:url value='/resources/images/cele.avif'/>" class="img-fluid" alt="Roongta Exquisite">
	                   </div>
	               </div>
	               <div class="col-md-7">
	                   <div class="card-body">
	                       <h5 class="card-title">Shreeji the celestia</h5>
	                       <p class="card-text">2,3,4 BHK Flat in Govind Nagar</p>
	                       <p class="card-text price-highlight">₹78.66L-₹1.44cr</p>
	                       <div class="property-details">
	                           <div class="detail-item">
	                               <i class="fas fa-ruler-combined"></i>
	                               <span>1168 - 2111 sq.ft.</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-tag"></i>
	                               <span>₹6.78 K/sq.ft</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-hard-hat"></i>
	                               <span>Under Construction</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-calendar-alt"></i>
	                               <span>Possession: Mar, 2026</span>
	                           </div>
	                       </div>
	                       <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                            <a href="<c:url value='/contact'/>" class="btn btn-primary">Contact Agent</a>
	                       </div>
	                   </div>
	               </div>
	           </div>
	       </div>

	       <!-- Fourth Card -->
	       <div class="card property-card">
	           <div class="row g-0">
	               <div class="col-md-5">
	                   <div class="card-img-container">
	                       <img src="<c:url value='/resources/images/flo.avif'/>" class="img-fluid" alt="Roongta Ashok Vihar">
	                   </div>
	               </div>
	               <div class="col-md-7">
	                   <div class="card-body">
	                       <h5 class="card-title">Shreeji Floating Villas</h5>
	                       <p class="card-text">4 BHK Flat in Jagtap nagar</p>
	                       <p class="card-text price-highlight">₹2.02 Cr-₹2.17 Cr</p>
	                       <div class="property-details">
	                           <div class="detail-item">
	                               <i class="fas fa-ruler-combined"></i>
	                               <span>1746 - 2888 sq.ft.</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-tag"></i>
	                               <span>₹7.64 K/sq.ft</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-home"></i>
	                               <span>Possession Ready</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-calendar-alt"></i>
	                               <span>Possession: Mar,2022</span>
	                           </div>
	                       </div>
	                       <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                          <a href="<c:url value='/contact'/>" class="btn btn-primary">Contact Agent</a>
	                       </div>
	                   </div>
	               </div>
	           </div>
	       </div>
	   </div>

	   

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>EstateFinders</h5>
                    <p>Find your dream home with our premium real estate services across India.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-md-2">
                    <h5>Quick Links</h5>
                    <ul class="footer-links">
						<li><a href="<c:url value='/project'/>">Home</a></li>
                        <li><a href="<c:url value='/properties'/>">Properties</a></li>
                        <li><a href="<c:url value='/contact'/>">Contact</a></li>
                        <li><a href="<c:url value='/about'/>">About Us</a></li>
                    </ul>
                </div>
                <div class="col-md-2">
                    <h5>Services</h5>
                    <ul class="footer-links">
                        <li><a href="<c:url value='/buy'/>">Buy</a></li>
                        <li><a href="<c:url value='/rent'/>">Rent</a></li>
                        <li><a href="<c:url value='/commercial'/>">Commercial</a></li>
                        <li><a href="<c:url value='/pg'/>">PG/Hostel</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contact Info</h5>
                    <ul class="footer-links">
                        <li><i class="fas fa-map-marker-alt me-2"></i> 123 Estate Street, Mumbai, India</li>
                        <li><i class="fas fa-phone me-2"></i> +91 1234567890</li>
                        <li><i class="fas fa-envelope me-2"></i> info@estatefinders.com</li>
                    </ul>
                </div>
            </div>
            <hr>
            <div class="text-center">&copy; 2023 EstateFinders. All rights reserved.</div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
