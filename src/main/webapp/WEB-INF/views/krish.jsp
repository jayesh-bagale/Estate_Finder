<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			          
					  /* Property Cards */
					  .property-card {
					      width: 80%;              /* decrease width from 100% → 80% */
					      margin: 20px auto;       /* center the card */
					      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
					      border: none;
					      border-radius: 10px;
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

    <!-- ✅ Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="<c:url value='/krishna'/>">
                <img src="<c:url value='/resources/images/estate1.jpg'/>" alt="Logo" width="60">
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
                        <ul class="dropdown-menu">
                            <li><h6 class="dropdown-header">Services</h6></li>
                            <li><a class="dropdown-item" href="<c:url value='/buy'/>">Buy</a></li>
                            <li><a class="dropdown-item" href="<c:url value='/rent'/>">Rent</a></li>
                            <li><a class="dropdown-item" href="<c:url value='/commercial'/>">Commercial</a></li>
                            <li><a class="dropdown-item" href="<c:url value='/pg'/>">PG/Hostel</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<c:url value='/about'/>">About Us</a></li>
                            <li><a class="dropdown-item" href="<c:url value='/contact'/>">Contact</a></li>
                            <c:if test="${empty sessionScope['estatefinder.userId']}"><li><a class="dropdown-item" href="<c:url value='/adminlogin'/>">Admin Login</a></li></c:if>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

	     <h2 class="section-heading">Featured Properties</h2>
	       
	       <!-- First Card -->
	       <div class="card property-card"style="width:80%;">
	           <div class="row g-0">
	               <div class="col-md-5">
	                   <div class="card-img-container">
	                       <img src="<c:url value='/resources/images/krish.avif'/>" class="img-fluid" alt="Krish Builders">
	                   </div>
	               </div>
	               <div class="col-md-7">
	                   <div class="card-body">
	                       <h5 class="card-title">Krish Builders and Land Developer</h5>
	                       <p class="card-text">Projects: 72</p>
	                       <p class="card-text"><small class="text-body-secondary">Founded on the values of family, Krish Builders prioritizes trust, transparency, and customer satisfaction. Every structure is built to cater to the needs of the ever-progressive fabric of society.</small></p>
	                       <div class="d-grid gap-2 d-md-flex justify-content-md-end">
							   <a href="<c:url value='/contact'/>" class="btn btn-primary">Contact Builder</a>
	                       </div>
	                   </div>
	               </div>
	           </div>
	       </div>
	       
	       <h3 class="section-heading">Residential Projects by Krish Builders</h3>
	       
	       <!-- Second Card -->
	       <div class="card property-card"style="width:80%;">
	           <div class="row g-0">
	               <div class="col-md-5">
	                   <div class="card-img-container">
	                       <img src="<c:url value='/resources/images/vi.avif'/>" class="img-fluid" alt="Krishh Vraj Landmark">
	                   </div>
	               </div>
	               <div class="col-md-7">
	                   <div class="card-body">
	                       <h5 class="card-title">Krishh Vraj Landmark 1B</h5>
	                       <p class="card-text">2,3 BHK Flat in Makhmalabad</p>
	                       <p class="card-text price-highlight">Price on request</p>
	                       <div class="property-details">
	                           <div class="detail-item">
	                               <i class="fas fa-ruler-combined"></i>
	                               <span>704-1107 sq.ft.</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-tag"></i>
	                               <span>₹5 K/sq.ft</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-hard-hat"></i>
	                               <span>Under Construction</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-calendar-alt"></i>
	                               <span>Possession: June,2031</span>
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
	       <div class="card property-card"style="width:80%;">
	           <div class="row g-0">
	               <div class="col-md-5">
	                   <div class="card-img-container">
	                       <img src="<c:url value='/resources/images/met.avif'/>" class="img-fluid" alt="Vraj Metropolis">
	                   </div>
	               </div>
	               <div class="col-md-7">
	                   <div class="card-body">
	                       <h5 class="card-title">Vraj Metropolis</h5>
	                       <p class="card-text">2, 3, 4, 5 BHK Flats in Dwarka</p>
	                       <p class="card-text price-highlight">₹48.99 L-1.66cr</p>
	                       <div class="property-details">
	                           <div class="detail-item">
	                               <i class="fas fa-ruler-combined"></i>
	                               <span>1115 - 3715 sq.ft.</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-tag"></i>
	                               <span>₹4.43 K/sq.ft</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-hard-hat"></i>
	                               <span>Ready to move</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-calendar-alt"></i>
	                               <span>Possession: Dec,2024</span>
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
	       <div class="card property-card"style="width:80%;">
	           <div class="row g-0">
	               <div class="col-md-5">
	                   <div class="card-img-container">
	                       <img src="<c:url value='/resources/images/sam.avif'/>" class="img-fluid" alt="Vraj Samarth Sky">
	                   </div>
	               </div>
	               <div class="col-md-7">
	                   <div class="card-body">
	                       <h5 class="card-title">Vraj Samarth Sky</h5>
	                       <p class="card-text">2, 3 BHK Flats in Balram Nagar</p>
	                       <p class="card-text price-highlight">₹40L-50L</p>
	                       <div class="property-details">
	                           <div class="detail-item">
	                               <i class="fas fa-ruler-combined"></i>
	                               <span>1119- 1366 sq.ft.</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-tag"></i>
	                               <span>₹3.66 K/sq.ft</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-home"></i>
	                               <span>Under construction</span>
	                           </div>
	                           <div class="detail-item">
	                               <i class="fas fa-calendar-alt"></i>
	                               <span>Possession: Dec,2026</span>
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
	                       <li><a href="<c:url value='/project'/>" class="text-white">Home</a></li>
	                       <li><a href="<c:url value='/properties'/>" class="text-white">Properties</a></li>
	                       <li><a href="<c:url value='/contact'/>" class="text-white">Contact</a></li>
	                       <li><a href="<c:url value='/about'/>" class="text-white">About Us</a></li>
	                   </ul>
	               </div>
	               <div class="col-md-2 mb-4 mb-md-0">
	                   <h5>Services</h5>
	                   <ul class="list-unstyled">
	                       <li><a href="<c:url value='/buy'/>" class="text-white">Buy</a></li>
	                       <li><a href="<c:url value='/rent'/>" class="text-white">Rent</a></li>
	                       <li><a href="<c:url value='/commercial'/>" class="text-white">Commercial</a></li>
	                       <li><a href="<c:url value='/pg'/>" class="text-white">PG/Hostel</a></li>
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
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
