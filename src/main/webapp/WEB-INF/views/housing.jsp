<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Nashik Housing Research | EstateFinders</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            color: #333;
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
    header {
      background: url('/resources/images/nashik.jpeg') no-repeat center center/cover;
      height: 50vh;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      color: white;
      position: relative;
    }

    header::after {
      content: "";
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 0;
    }

    header h1 {
      position: relative;
      font-size: 3rem;
      z-index: 1;
    }

    .container {
      max-width: 1100px;
      margin: auto;
      padding: 40px 20px;
    }

    h2 {
      color: var(--primary);
      margin-bottom: 20px;
    }

    section {
      margin-bottom: 60px;
    }

    .stats {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 20px;
    }

    .stat-box {
      background: white;
      border-left: 5px solid var(--secondary);
      padding: 20px;
      box-shadow: 0 0 8px rgba(0, 0, 0, 0.05);
    }

    .hotspots, .property-types {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }

    .hotspot, .property {
      flex: 1 1 250px;
      background: white;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 0 8px rgba(0,0,0,0.1);
    }

    .cta {
      background-color: var(--primary);
      color: black;
      padding: 40px 20px;
      text-align: center;
      border-radius: 10px;
    }

    .cta h3 {
      margin-bottom: 20px;
    }

    .cta a {
      display: inline-block;
      margin-top: 10px;
      padding: 12px 25px;
    
      color: black;
      text-decoration: none;
      border-radius: 5px;
      transition: background 0.3s;
    }

   

    footer {
      text-align: center;
      padding: 20px;
      background: #2c3e50;
      color: white;
    }

    @media (max-width: 768px) {
      header h1 {
        font-size: 2rem;
      }
    }
  </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark">
	    <div class="container-fluid">
	      <a class="navbar-brand" href="${pageContext.request.contextPath}/housing">
	        <img src="<c:url value='/resources/images/estate1.jpg'/>" alt="Logo" width="60" class="d-inline-block align-top">
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
	            <a class="nav-link" href="${pageContext.request.contextPath}/register" style="margin-right:30px;">Login/Register</a>
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
  <header>
    <h1>Nashik Housing Research</h1>
  </header>

  <div class="container">
	<section>
	     <h2>City Overview</h2>
	     <p>Nashik, a rapidly developing city in Maharashtra, is gaining attention for its mix of tradition and progress. Known for its spiritual heritage, vineyards, and improving infrastructure, it has become a top destination for homebuyers and real estate investors. With the advent of smart city initiatives and proximity to Mumbai and Pune, Nashik is poised for sustainable growth in the housing sector.</p>
	   </section>

	   <section>
	     <h2>Market Trends (2024 - 2025)</h2>
	     <div class="stats">
	       <div class="stat-box">
	         <h3>₹4,800 / sq.ft</h3>
	         <p><strong>Avg. Residential Price</strong></p>
	       </div>
	       <div class="stat-box">
	         <h3>₹25,000 / month</h3>
	         <p><strong>Avg. 2BHK Rent</strong></p>
	       </div>
	       <div class="stat-box">
	         <h3>+7.2%</h3>
	         <p><strong>YoY Price Growth</strong></p>
	       </div>
	       <div class="stat-box">
	         <h3>68%</h3>
	         <p><strong>Occupancy Rate</strong></p>
	       </div>
	     </div>
	   </section>

	   <section>
	     <h2>Popular Property Types</h2>
	     <div class="property-types">
	       <div class="property">
	         <h4>Apartments</h4>
	         <p>High demand in central locations like Gangapur Road, Canada Corner, and College Road.</p>
	       </div>
	       <div class="property">
	         <h4>Independent Houses</h4>
	         <p>Favored by families in suburbs like Indira Nagar, Nashik Road, and Satpur.</p>
	       </div>
	       <div class="property">
	         <h4>Plots & Land</h4>
	         <p>Investors show increasing interest in plots in areas like Adgaon and Pathardi Phata.</p>
	       </div>
	       <div class="property">
	         <h4>Villas</h4>
	         <p>Luxury housing on the rise in areas like Gangapur and Pandavleni.</p>
	       </div>
	     </div>
	   </section>

	   <section>
	     <h2>Top Investment Hotspots</h2>
	     <div class="hotspots">
	       <div class="hotspot">
	         <h4>Gangapur Road</h4>
	         <p>High-end residential area with access to schools, malls, and vineyards.</p>
	       </div>
	       <div class="hotspot">
	         <h4>Pathardi Phata</h4>
	         <p>Emerging area with new residential projects and good highway connectivity.</p>
	       </div>
	       <div class="hotspot">
	         <h4>Indira Nagar</h4>
	         <p>Affordable housing and rental demand from working professionals.</p>
	       </div>
	       <div class="hotspot">
	         <h4>Nashik Road</h4>
	         <p>Well-connected, with affordable housing and proximity to railways.</p>
	       </div>
	     </div>
	   </section>

	   <section>
	     <h2>Tools for Buyers & Investors</h2>
	     <ul>
	       <li><strong>Price Trend Tracker:</strong> Compare property prices over the past 5 years.</li>
	       <li><strong>EMI Calculator:</strong> Estimate your home loan EMI instantly.</li>
	       <li><strong>Rental Yield Calculator:</strong> Assess investment profitability.</li>
	       <li><strong>Property Comparison Tool:</strong> Compare multiple listings side-by-side.</li>
	     </ul>
	   </section>

	   <section class="cta">
	     <h3>Start Your Real Estate Journey in Nashik</h3>
	     <p>Find the perfect property, backed by real research.</p>
	    <a href="${pageContext.request.contextPath}/contact" class="btn btn-primary">Talk to Expert</a>
	   </section>

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
                        <li><a href="<%=request.getContextPath()%>/project" class="text-white">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/properties" class="text-white">Properties</a></li>
                        <li><a href="<%=request.getContextPath()%>/contact" class="text-white">Contact</a></li>
                        <li><a href="<%=request.getContextPath()%>/about" class="text-white">About Us</a></li>
                    </ul>
                </div>
                <div class="col-md-2 mb-4 mb-md-0">
                    <h5>Services</h5>
                    <ul class="list-unstyled">
                        <li><a href="<%=request.getContextPath()%>/buy" class="text-white">Buy</a></li>
                        <li><a href="<%=request.getContextPath()%>/rent" class="text-white">Rent</a></li>
                        <li><a href="<%=request.getContextPath()%>/commercial" class="text-white">Commercial</a></li>
                        <li><a href="<%=request.getContextPath()%>/pg" class="text-white">PG/Hostel</a></li>
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
</body>
</html>
