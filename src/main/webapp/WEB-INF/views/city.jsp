<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nashik City Insight</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
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

        :root {
            --primary-color: #2c3e50;
            --secondary-color: #e74c3c;
            --accent-color: #3498db;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
        }

        body {
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
        }
        
        header {
            background: url('<c:url value="/resources/images/nashik.jpeg"/>') no-repeat center center/cover;
            height: 60vh;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }

        header h1 {
            font-size: 3rem;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px;
            border-radius: 10px;
        }

        nav {
            background-color: white;
            display: flex;
            justify-content: center;
            padding: 15px 0;
        }

        nav a {
            color: #3e4a61;
            text-decoration: none;
            margin: 0 20px;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #ffd700;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 40px 20px;
        }

        section {
            margin-bottom: 60px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        p {
            margin-bottom: 20px;
        }

        ul {
            margin-left: 20px;
        }

        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .gallery img {
            width: 100%;
            border-radius: 10px;
            height: 200px;
            object-fit: cover;
        }

        footer {
            background-color: #3e4a61;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        .contact-info {
            background-color: #eaeaea;
            padding: 20px;
            border-left: 5px solid #3e4a61;
        }

        @media (max-width: 768px) {
            header h1 {
                font-size: 2rem;
            }
            nav a {
                margin: 0 10px;
            }
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
   <!-- Navbar -->
   <nav class="navbar navbar-expand-lg navbar-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/contact">
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

    <!-- Section Navigation -->
    <nav>
        <a href="#overview">Overview</a>
        <a href="#attractions">Attractions</a>
        <a href="#culture">Culture</a>
        <a href="#food">Food</a>
        <a href="#gallery">Gallery</a>
        <a href="#contact">Contact</a>
    </nav>

    <!-- Header -->
    <header>
        <img src="<c:url value='/resources/images/nk2.jpg'/>" alt="nashik" width="1500px" height="450px">
    </header>

    <div class="container">
        <section id="overview">
            <h2>City Overview</h2>
            <p>Nashik is a historically significant city in the state of Maharashtra, located on the banks of the Godavari River...</p>
        </section>

        <section id="attractions">
            <h2>Major Attractions</h2>
            <ul>
                <li><strong>Trimbakeshwar Temple:</strong> One of the twelve Jyotirlingas of Lord Shiva.</li>
                <li><strong>Sula Vineyards:</strong> India’s most famous vineyard...</li>
                <li><strong>Pandav Leni:</strong> Ancient Buddhist caves...</li>
                <li><strong>Kalaram Temple:</strong> Historic Hindu temple...</li>
                <li><strong>Godavari Ghat:</strong> A peaceful riverbank...</li>
            </ul>
        </section>

        <section id="culture">
            <h2>Local Culture & Festivals</h2>
            <p>Nashik reflects the rich Marathi culture through its traditions...</p>
        </section>

        <section id="food">
            <h2>Local Cuisine</h2>
            <ul>
                <li>Misal Pav</li>
                <li>Sabudana Khichdi</li>
                <li>Vada Pav</li>
                <li>Puran Poli</li>
                <li>Traditional Thali</li>
            </ul>
        </section>

        <section id="gallery">
            <h2>Gallery</h2>
            <div class="gallery">
                <img src="<c:url value='/resources/images/sula.jpeg'/>" alt="Sula Vineyards">
                <img src="<c:url value='/resources/images/trim.jpeg'/>" alt="Trimbakeshwar Temple">
                <img src="<c:url value='/resources/images/pan2.jpeg'/>" alt="Pandav Leni Caves">
                <img src="<c:url value='/resources/images/goda.jpeg'/>" alt="Godavari Ghat">
            </div>
        </section>

        <section id="contact">
            <h2>Contact Information</h2>
            <div class="contact-info">
                <p><strong>Email:</strong> tourism@nashik.gov.in</p>
                <p><strong>Phone:</strong> +91-2552-123456</p>
                <p><strong>Address:</strong> Nashik Tourism Office, Trimbak Road, Nashik, Maharashtra, India</p>
            </div>
        </section>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>EstateFinders</h5>
                    <p>Find your dream home with our premium real estate services across India.</p>
                </div>
                <div class="col-md-2">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="<c:url value='/project'/>" class="text-white">Home</a></li>
                        <li><a href="<c:url value='/properties'/>" class="text-white">Properties</a></li>
                        <li><a href="#" class="text-white">Services</a></li>
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
                <p class="mb-0">&copy; 2023 EstateFinders. All rights reserved.</p>
            </div>
        </div>
        <h3 class="mt-4" style="color: aliceblue;text-align: center;">Follow Us On</h3>
        <div class="social-icons" style="display: flex; justify-content: center; gap: 15px; margin-top: 15px;">
            <a href="#"><img src="<c:url value='/resources/images/insta.jpg'/>" alt="Instagram" style="width: 30px; height: 30px;"></a>
            <a href="#"><img src="<c:url value='/resources/images/estate1.jpg'/>" alt="Facebook" style="width: 30px; height: 30px;"></a>
            <a href="#"><img src="<c:url value='/resources/images/whatt.jpg'/>" alt="WhatsApp" style="width: 30px; height: 30px;"></a>
            <a href="#"><img src="<c:url value='/resources/images/estate1.jpg'/>" alt="Twitter" style="width: 30px; height: 30px;"></a>
            <a href="#"><img src="<c:url value='/resources/images/estate1.jpg'/>" alt="Telegram" style="width: 30px; height: 30px;"></a>
        </div>
    </footer>
</body>
</html>
