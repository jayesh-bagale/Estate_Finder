
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>PG & Hostels in Nashik</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root { --primary-color: #2c3e50; --secondary-color: #e74c3c; --light-color: #ecf0f1; }
    body { font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; }
    .navbar { background-color: var(--primary-color) !important; }
    .navbar-brand { display: flex; align-items: center; }
    .navbar-brand span { font-size: 1.2rem; font-weight: 700; color: white; margin-left: 10px; }
    .nav-link { color: white !important; padding: 8px 12px; }
    .nav-link:hover { color: var(--secondary-color) !important; }
    .header-img { width: 100%; height: 250px; object-fit: cover; }
    @media (min-width: 768px) { .header-img { height: 350px; } }
    .container { padding: 1rem; }
    @media (min-width: 768px) { .container { padding: 2rem; } }
    .property-card { margin-bottom: 2rem; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 6px rgba(0,0,0,0.1); transition: transform 0.2s; background: white; opacity: 0; transform: translateY(20px); animation: fadeIn 0.5s forwards; }
    .property-card:hover { transform: translateY(-4px); }
    .property-image-container { padding: 0; }
    .property-image-container img { width: 100%; height: 200px; object-fit: cover; }
    @media (min-width: 768px) { .property-image-container img { height: 100%; min-height: 250px; } }
    .card-body { padding: 1rem; }
    .property-details { margin: 1rem 0; }
    .property-price { font-weight: bold; color: var(--primary-color); }
    footer { background-color: #004080; color: white; }
    .footer-col { margin-bottom: 1.5rem; }
    .social-icons a { color: white; margin-right: 10px; }
    @keyframes fadeIn { to { opacity: 1; transform: translateY(0); } }
    .property-card:nth-child(1) { animation-delay: 0.1s; }
    .property-card:nth-child(2) { animation-delay: 0.2s; }
    .property-card:nth-child(3) { animation-delay: 0.3s; }
    .property-card:nth-child(4) { animation-delay: 0.4s; }
    .property-card:nth-child(5) { animation-delay: 0.5s; }
  </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/project">
        <img src="<c:url value='/resources/images/estate1.jpg'/>" alt="Logo" width="50" class="d-inline-block align-top">
        <span>ESTATEFINDERS</span>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/project">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">Login/Register</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="menuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Menu</a>
            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="menuDropdown">
              <li><h6 class="dropdown-header">Services</h6></li>
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

  <!-- Header -->
  <header>
    <img src="<c:url value='/resources/images/estate3.jpg'/>" alt="Real Estate Banner" class="header-img">
  </header>

  <jsp:include page="demo-listings.jsp"/>

  <!-- Main Content -->
  <div class="container">
    <h1 class="mb-4">PG & Hostels in Nashik</h1>
    <div class="row">
      <!-- Example PG Card -->
      <div class="col-12 mb-4">
        <div class="property-card card h-100" data-location="Ashwin Nagar">
          <div class="row g-0 h-100">
            <div class="col-md-4">
              <img src="<c:url value='/resources/images/nilesh.jpeg'/>" class="img-fluid h-100" alt="Nilesh PG" style="object-fit: cover;">
            </div>
            <div class="col-md-8">
              <div class="card-body d-flex flex-column h-100">
                <h5 class="card-title">Nilesh PG (Unisex)</h5>
                <p class="card-text">Single-sharing rooms with Wi-Fi, RO, CCTV. Walking distance from Symbiosis Institute. Suitable for students and working professionals.</p>
                <div class="property-details mt-auto">
                  <p class="card-text mb-1"><i class="fas fa-map-marker-alt me-2"></i> Ashwin Nagar, Nashik</p>
                  <p class="card-text mb-1"><i class="fas fa-bed me-2"></i> Single Sharing</p>
                  <p class="card-text mb-3"><i class="fas fa-wifi me-2"></i> Wi-Fi, RO, CCTV</p>
                </div>
                <div class="d-flex flex-wrap justify-content-between align-items-center">
                  <span class="property-price">Contact for Price</span>
                                <a href="${pageContext.request.contextPath}/nileshpg" class="btn btn-outline-primary">View Details</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

	  <div class="col-12 mb-4">
	         <div class="property-card card h-100" data-location="Panchavati">
	           <div class="row g-0 h-100">
	             <div class="col-md-4">
	               <img src="<c:url value='/resources/images/aksar.jpg'/>" class="img-fluid h-100" alt="Aksar Heights" style="object-fit: cover;">
	             </div>
	             <div class="col-md-8">
	               <div class="card-body d-flex flex-column h-100">
	                 <h5 class="card-title">Aksar Heights PG (Girls)</h5>
	                 <p class="card-text">
	                   Twin sharing, Power backup, Wi-Fi. Located near KK Wagh Institute. Safe and well-connected area.
	                 </p>
	                 <div class="property-details mt-auto">
	                   <p class="card-text mb-1"><i class="fas fa-map-marker-alt me-2"></i> Panchavati, Nashik</p>
	                   <p class="card-text mb-1"><i class="fas fa-bed me-2"></i> Twin Sharing</p>
	                   <p class="card-text mb-3"><i class="fas fa-wifi me-2"></i> Power Backup, Wi-Fi</p>
	                 </div>
	                 <div class="d-flex flex-wrap justify-content-between align-items-center">
	                   <span class="property-price">Contact for Price</span>
	                                <a href="${pageContext.request.contextPath}/nileshpg" class="btn btn-outline-primary">View Details</a>
	                 </div>
	               </div>
	             </div>
	           </div>
	         </div>
	       </div>

	       <!-- Sweet Home PG -->
	       <div class="col-12 mb-4">
	         <div class="property-card card h-100" data-location="Indira Nagar">
	           <div class="row g-0 h-100">
	             <div class="col-md-4">
	               <img src="<c:url value='/resources/images/sweet.jpg'/>" class="img-fluid h-100" alt="Sweet Home PG" style="object-fit: cover;">
	             </div>
	             <div class="col-md-8">
	               <div class="card-body d-flex flex-column h-100">
	                 <h5 class="card-title">Sweet Home PG (Boys)</h5>
	                 <p class="card-text">
	                   Single & twin rooms, TV, meals included, power backup. Ideal for working individuals in Nashik city.
	                 </p>
	                 <div class="property-details mt-auto">
	                   <p class="card-text mb-1"><i class="fas fa-map-marker-alt me-2"></i> Indira Nagar, Nashik</p>
	                   <p class="card-text mb-1"><i class="fas fa-bed me-2"></i> Single & Twin Sharing</p>
	                   <p class="card-text mb-3"><i class="fas fa-tv me-2"></i> TV, Meals Included, Power Backup</p>
	                 </div>
	                 <div class="d-flex flex-wrap justify-content-between align-items-center">
	                   <span class="property-price">Contact for Price</span>
	                                  <a href="${pageContext.request.contextPath}/nileshpg" class="btn btn-outline-primary">View Details</a>
	                 </div>
	               </div>
	             </div>
	           </div>
	         </div>
	       </div>

	       <!-- Vatsalya PG -->
	       <div class="col-12 mb-4">
	         <div class="property-card card h-100" data-location="Indira Nagar">
	           <div class="row g-0 h-100">
	             <div class="col-md-4">
	               <img src="<c:url value='/resources/images/vatsalya.jpeg'/>" class="img-fluid h-100" alt="Vatsalya PG" style="object-fit: cover;">
	             </div>
	             <div class="col-md-8">
	               <div class="card-body d-flex flex-column h-100">
	                 <h5 class="card-title">Vatsalya PG (Girls)</h5>
	                 <p class="card-text">
	                   Twin sharing, modern amenities, peaceful location. Close to educational and shopping centers.
	                 </p>
	                 <div class="property-details mt-auto">
	                   <p class="card-text mb-1"><i class="fas fa-map-marker-alt me-2"></i> Indira Nagar, Nashik</p>
	                   <p class="card-text mb-1"><i class="fas fa-bed me-2"></i> Twin Sharing</p>
	                   <p class="card-text mb-3"><i class="fas fa-wifi me-2"></i> Wi-Fi, Modern Amenities, Security</p>
	                 </div>
	                 <div class="d-flex flex-wrap justify-content-between align-items-center">
	                   <span class="property-price">Contact for Price</span>
	                                  <a href="${pageContext.request.contextPath}/nileshpg" class="btn btn-outline-primary">View Details</a>
	                 </div>
	               </div>
	             </div>
	           </div>
	         </div>
	       </div>

	       <!-- Ramkrupa PG -->
	       <div class="col-12 mb-4">
	         <div class="property-card card h-100" data-location="Nashik Road">
	           <div class="row g-0 h-100">
	             <div class="col-md-4">
	               <img src="<c:url value='/resources/images/ramkrupa.jpg'/>" class="img-fluid h-100" alt="Ramkrupa PG" style="object-fit: cover;">
	             </div>
	             <div class="col-md-8">
	               <div class="card-body d-flex flex-column h-100">
	                 <h5 class="card-title">Ramkrupa PG (Boys)</h5>
	                 <p class="card-text">
	                   Single, twin & quad sharing rooms. Optional meals, cleanliness-focused, suitable for students & workers.
	                 </p>
	                 <div class="property-details mt-auto">
	                   <p class="card-text mb-1"><i class="fas fa-map-marker-alt me-2"></i> Nashik Road, Nashik</p>
	                   <p class="card-text mb-1"><i class="fas fa-bed me-2"></i> Single/Twin/Quad Sharing</p>
	                   <p class="card-text mb-3"><i class="fas fa-wifi me-2"></i> Wi-Fi, Meals (Optional), CCTV</p>
	                 </div>
	                 <div class="d-flex flex-wrap justify-content-between align-items-center">
	                   <span class="property-price">From ₹3,800/month</span>
	                                  <a href="${pageContext.request.contextPath}/nileshpg" class="btn btn-outline-primary">View Details</a>
	                 </div>
	               </div>
	             </div>
	           </div>
	         </div>
	       </div>
	     </div>
	   </div>

    </div>
  </div>

  <!-- Footer -->
  <footer class="bg-dark text-white py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-col">
          <h5>EstateFinders</h5>
          <p>Find your dream home with our premium real estate services across India.</p>
          <div class="social-icons">
            <a href="#" class="text-white me-2"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="text-white me-2"><i class="fab fa-twitter"></i></a>
            <a href="#" class="text-white me-2"><i class="fab fa-instagram"></i></a>
            <a href="#" class="text-white me-2"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
        <div class="col-md-2 footer-col">
          <h5>Quick Links</h5>
          <ul class="list-unstyled">
            <li><a href="${pageContext.request.contextPath}/project" class="text-white">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/project" class="text-white">Properties</a></li>
            <li><a href="${pageContext.request.contextPath}/contact" class="text-white">Contact</a></li>
            <li><a href="${pageContext.request.contextPath}/about" class="text-white">About Us</a></li>
          </ul>
        </div>
        <div class="col-md-2 footer-col">
          <h5>Services</h5>
          <ul class="list-unstyled">
            <li><a href="${pageContext.request.contextPath}/buy" class="text-white">Buy</a></li>
            <li><a href="${pageContext.request.contextPath}/rent" class="text-white">Rent</a></li>
            <li><a href="${pageContext.request.contextPath}/commercial" class="text-white">Commercial</a></li>
            <li><a href="${pageContext.request.contextPath}/pg" class="text-white">PG/Hostel</a></li>
          </ul>
        </div>
        <div class="col-md-4 footer-col">
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

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
