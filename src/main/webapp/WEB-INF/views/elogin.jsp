<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
	:root {
	            --primary-color: #2c3e50;
	            --secondary-color: #e74c3c;
	            --accent-color: #3498db;
	            --light-color: #ecf0f1;
	            --dark-color: #2c3e50;
	        }

	    body {
	      background-color: white;
	      font-family: Arial, sans-serif;
	      margin: 0;
	      padding: 0;
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

	    .form-container {
	      max-width: 500px;
	      margin: 80px auto;
	      padding: 30px;
	      background-color: #fff;
	      border-radius: 10px;
	      box-shadow: 0 0 15px rgba(0,0,0,0.3);
	      color: black;
	    }

	    h1 {
	      text-align: center;
	      margin-bottom: 30px;
	      font-size: 32px;
	      color: #333;
	    }

	    form label {
	      display: block;
	      margin-bottom: 8px;
	      font-size: 16px;
	      font-weight: bold;
	    }

	    form input[type="text"],
	    form input[type="email"],
	    form input[type="password"] {
	      width: 100%;
	      padding: 10px;
	      font-size: 15px;
	      color: #333;
	      background-color: #f9f9f9;
	      border: 1px solid #ccc;
	      border-radius: 5px;
	      margin-bottom: 20px;
	    }

	    form input[type="submit"] {
	      width: 100%;
	      padding: 12px;
	      font-size: 16px;
	      background-color: #007bff;
	      color: white;
	      border: none;
	      border-radius: 5px;
	      cursor: pointer;
	      transition: background-color 0.3s;
	    }

	    form input[type="submit"]:hover {
	      background-color: #0056b3;
	    }

	    .form-container p {
	      text-align: center;
	      margin-top: 20px;
	    }

	    .form-container p a {
	      color: #007bff;
	      text-decoration: none;
	    }

	    .form-container p a:hover {
	      text-decoration: underline;
	    }
	  </style>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark">
	    <div class="container-fluid">
	        <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/">
	            <img src="<c:url value='/resources/images/estate1.jpg'/>" alt="Logo" width="60" height="60" class="d-inline-block align-top me-2">
	            <span class="fs-4 fw-bold text-white">ESTATEFINDERS</span>
	        </a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
	                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>

	        <div class="collapse navbar-collapse" id="navbarNavDropdown">
	            <ul class="navbar-nav ms-auto">
	                <li class="nav-item">
	                    <a class="nav-link active" href="${pageContext.request.contextPath}/project">Home</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/register">Login/Register</a>
	                </li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" href="#" id="menuDropdown" role="button" data-bs-toggle="dropdown"
	                       aria-expanded="false">Menu</a>
	                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="menuDropdown">
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

<!-- Login Form -->
<div class="form-container">
  <h1>Login</h1>
  <c:if test="${not empty error}">
      <div class="error" role="alert"><c:out value="${error}"/></div>
  </c:if>
  <form action="${pageContext.request.contextPath}/elogin" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" placeholder="Enter your username" autocomplete="username" required/>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" placeholder="Enter your password" autocomplete="current-password" required/>

    <input type="submit" value="Login"/>
  </form>
  <p style="text-align:center;">Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
