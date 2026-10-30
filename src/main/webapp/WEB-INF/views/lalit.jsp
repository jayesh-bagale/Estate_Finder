<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            line-height: 1.6; 
            color: #333; 
            background-color: #f8f9fa;
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
            flex: 0 0 auto;
            width: 300px;
            margin-right: 20px;
            margin-bottom: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        
        .property-card:hover {
            transform: translateY(-5px);
        }
        
        .card-img-container {
            height: 200px;
            overflow: hidden;
        }
        
        .card-img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s;
        }
        
        .property-card:hover .card-img-container img {
            transform: scale(1.05);
        }
        
        .card-body {
            padding: 20px;
        }
        
        .card-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--primary-color);
        }
        
        .card-text {
            margin-bottom: 8px;
            font-size: 0.95rem;
            color: #666;
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
            background-color: #f8f9fa;
            padding: 5px 10px;
            border-radius: 5px;
        }
        
        .detail-item i {
            margin-right: 5px;
            color: var(--secondary-color);
        }
        
        /* Horizontal Scroll Container */
        .horizontal-scroll-container {
            display: flex;
            overflow-x: auto;
            scroll-behavior: smooth;
            padding: 10px 5px;
            gap: 20px;
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
        
        .horizontal-scroll-container::-webkit-scrollbar {
            display: none;
        }
        
        /* Scroll buttons */
        .scroll-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: white;
            border: none;
            box-shadow: 0 2px 8px rgba(0,0,0,0.3);
            z-index: 10;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .scroll-btn:hover {
            background: #f8f9fa;
            transform: translateY(-50%) scale(1.1);
        }
        
        .scroll-btn i {
            font-size: 1.2rem;
            color: #333;
        }
        
        .scroll-btn.left {
            left: 10px;
        }
        
        .scroll-btn.right {
            right: 10px;
        }
        
        /* Section Headings */
        .section-heading {
            text-align: center;
            margin: 30px 0 20px;
            color: var(--primary-color);
            font-weight: 600;
            font-size: 1.8rem;
        }
        
        /* Contact Section */
        #contact-section {
            background-color: #f8f9fa;
            padding: 50px 0;
            margin-top: 50px;
        }
        
        .contact-container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 30px;
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
            padding: 50px 0 20px;
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
        @media (max-width: 768px) {
            .property-card {
                width: 280px;
            }
            
            .scroll-btn {
                display: none;
            }
            
            .section-heading {
                font-size: 1.5rem;
            }
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="<c:url value='/lalit'/>">
                <img src="<c:url value='/resources/images/estate1.jpg'/>" alt="Logo" width="60" class="d-inline-block align-top">
                <span>ESTATEFINDERS</span>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ms-auto me-4">
                    <li class="nav-item"><a class="nav-link active" href="<c:url value='/project'/>">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/about'/>">About us</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/login'/>">Login/Register</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="menuDropdown" role="button" data-bs-toggle="dropdown">Menu</a>
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

	<div class="properties-container">
	      <!-- First Card -->
	      <div class="card property-card">
	          <div class="row g-0">
	              <div class="col-md-5">
	                  <div class="card-img-container">
	                      <img src="<c:url value='/resources/images/lalit2.jpeg'/>" class="img-fluid" alt="Lalit Roongta Group">
	                  </div>
	              </div>
	              <div class="col-md-7">
	                  <div class="card-body">
	                      <h5 class="card-title">Lalit Roongta Group</h5>
	                      <p class="card-text">Projects: 72.</p>
	                      <p class="card-text"><small class="text-body-secondary">Founded on the values of family, Lalit Roongta Group prioritizes trust, transparency, and customer satisfaction. Embedded in this belief system, every structure is built to cater to the needs of the ever-progressive fabric of society; be it the landscaped green pockets, luxurious meeting rooms,</small></p>
	                      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                          <a href="<c:url value='/contact'/>" class="btn btn-primary">Contact Builder</a>
	                      </div>
	                  </div>
	              </div>
	          </div>
	      </div>
	       <H3  >Residental Project by Lalit Roongta Group</H3>
	      <!-- Second Card -->
	      <div class="card property-card"style="margin-top:40px;">
	          <div class="row g-0">
	              <div class="col-md-5">
	                  <div class="card-img-container">
	                      <img src="<c:url value='/resources/images/tirumla.avif'/>" class="img-fluid" alt="Shree Tirumala Magnus">
	                  </div>
	              </div>
	              <div class="col-md-7">
	                  <div class="card-body">
	                      <h5 class="card-title">Shree Tirumala Magnus</h5>
	                      <p class="card-text">3 BHK Flat in Deepali Nagar</p>
	                      <p class="card-text price-highlight">₹74.85 L</p>
	                      <div class="property-details">
	                          <div class="detail-item">
	                              <i class="fas fa-ruler-combined"></i>
	                              <span>1497 - 1538 sq.ft.</span>
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
	                              <span>Possession: Dec, 2024</span>
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
	                      <img src="<c:url value='/resources/images/exq.avif'/>" class="img-fluid" alt="Roongta Exquisite">
	                  </div>
	              </div>
	              <div class="col-md-7">
	                  <div class="card-body">
	                      <h5 class="card-title">Roongta Exquisite</h5>
	                      <p class="card-text">3 BHK Flat in Anandvalli</p>
	                      <p class="card-text price-highlight">₹85.95 L</p>
	                      <div class="property-details">
	                          <div class="detail-item">
	                              <i class="fas fa-ruler-combined"></i>
	                              <span>1719 - 1794 sq.ft.</span>
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
	                      <img src="<c:url value='/resources/images/tirumla.avif'/>" class="img-fluid" alt="Roongta Ashok Vihar">
	                  </div>
	              </div>
	              <div class="col-md-7">
	                  <div class="card-body">
	                      <h5 class="card-title">Roongta Ashok Vihar</h5>
	                      <p class="card-text">3 BHK Flat in Jagtap nagar</p>
	                      <p class="card-text price-highlight">₹1.17 Cr</p>
	                      <div class="property-details">
	                          <div class="detail-item">
	                              <i class="fas fa-ruler-combined"></i>
	                              <span>1673 - 1688 sq.ft.</span>
	                          </div>
	                          <div class="detail-item">
	                              <i class="fas fa-tag"></i>
	                              <span>₹6.99 K/sq.ft</span>
	                          </div>
	                          <div class="detail-item">
	                              <i class="fas fa-home"></i>
	                              <span>Possession Ready</span>
	                          </div>
	                          <div class="detail-item">
	                              <i class="fas fa-calendar-alt"></i>
	                              <span>Possession: Aug, 2024</span>
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
                <div class="col-md-4 mb-4 mb-md-0">
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
                    <ul class="list-unstyled">
                        <li><a href="<c:url value='/project'/>" class="text-white">Home</a></li>
                        <li><a href="<c:url value='/project'/>" class="text-white">Properties</a></li>
                        <li><a href="<c:url value='/contact'/>" class="text-white">Contact</a></li>
                        <li><a href="<c:url value='/about'/>" class="text-white">About Us</a></li>
                    </ul>
                </div>
                <div class="col-md-2">
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
                <p class="mb-0">&copy; 2025 EstateFinders. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        // Property Cards Scroll Function
        function scrollProperties(direction) {
            const container = document.getElementById('propertyScroll');
            if (container) {
                const scrollAmount = 300;
                container.scrollBy({
                    left: direction * scrollAmount,
                    behavior: 'smooth'
                });
            }
        }

        // Hide scroll buttons when at start/end
        document.addEventListener('DOMContentLoaded', function() {
            const container = document.getElementById('propertyScroll');
            const leftBtn = document.querySelector('.scroll-btn.left');
            const rightBtn = document.querySelector('.scroll-btn.right');
            
            if (container && leftBtn && rightBtn) {
                function checkScroll() {
                    if (container.scrollLeft <= 10) {
                        leftBtn.style.display = 'none';
                    } else {
                        leftBtn.style.display = 'flex';
                    }
                    
                    if (container.scrollLeft >= container.scrollWidth - container.clientWidth - 10) {
                        rightBtn.style.display = 'none';
                    } else {
                        rightBtn.style.display = 'flex';
                    }
                }
                
                // Initial check
                checkScroll();
                
                // Check on scroll
                container.addEventListener('scroll', checkScroll);
                
                // Also check on window resize
                window.addEventListener('resize', checkScroll);
            }
        });
    </script>
</body>
</html>