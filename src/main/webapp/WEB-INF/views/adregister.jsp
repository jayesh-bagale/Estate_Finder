<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Registration | EstateFinders</title>

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
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
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

    h3 {
      text-align: center;
      color: #333;
      margin-top: 20px;
    }

    .container {
      max-width: 800px;
      height: auto;
      margin: 30px auto;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .form-label {
      font-weight: bold;
    }

    .form-control {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .btn-primary {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 10px 15px;
      border-radius: 5px;
      cursor: pointer;
      width:100%;
      margin-top: 10px;
      font-size:20px;
    }

    .btn-primary:hover {
      background-color: #0056b3;
    }

    .row1, .row2, .row3 {
      margin-top: 30px;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .form-field {
      flex: 1;
      min-width: 200px;
    }

    label {
      font-weight: bold;
      color: #333;
      margin-bottom: 5px;
    }

    @media (max-width: 768px) {
      .row1, .row2, .row3 {
        flex-direction: column;
      }
    }
  </style>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>

<!-- Navbar -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
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
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/about">About Us</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/contact">Contact</a></li>
            <c:if test="${empty sessionScope['estatefinder.userId']}"><li><a class="dropdown-item" href="${pageContext.request.contextPath}/adminlogin">Admin Login</a></li></c:if>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>


<!-- Registration Form -->
<div class="container">
  <h3>Create Admin Account</h3>
  <form action="${pageContext.request.contextPath}/adregister" method="post" onsubmit="return regform()">
    <input type="hidden" name="_csrf" value="<c:out value='${_csrf}'/>">
    <c:if test="${not empty error}">
      <div class="alert alert-danger" role="alert"><c:out value="${error}"/></div>
    </c:if>

    <div class="row1">
      <div class="form-field">
        <label for="name" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your full name" required>
      </div>
      <div class="form-field">
        <label for="username" class="form-label">Username</label>
        <input type="text" class="form-control" id="username" name="username" placeholder="Choose a username" required>
      </div>
    </div>
    <div class="row2">
      <div class="form-field">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
      </div>
      <div class="form-field">
        <label for="number" class="form-label">Phone Number</label>
        <input type="tel" class="form-control" id="number" name="number" placeholder="Enter your phone number" required>
      </div>
    </div>
    <div class="row3">
      <div class="form-field">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Create a strong password" minlength="8" maxlength="72" pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9\s])\S{8,72}" title="Use 8+ characters with uppercase, lowercase, a number, and a special character. No spaces." autocomplete="new-password" required>
        <small class="text-muted">Use at least 8 characters with uppercase, lowercase, a number, and a special character. No spaces.</small>
      </div>
      <div class="form-field">
        <label for="repassword" class="form-label">Re-Password</label>
        <input type="password" class="form-control" id="repassword" name="repassword" minlength="8" maxlength="72" pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9\s])\S{8,72}" title="Use the same password rules as above." autocomplete="new-password" placeholder="Re-enter your password" required>
      </div>
    </div>
    <button type="submit" class="btn btn-primary">Register</button>
	<div class="text-center mt-3">
	        Already have an admin account? <a href="${pageContext.request.contextPath}/adminlogin">Admin login</a>
	    </div>
  </form>
</div>

<!-- Validation Script -->
<script>
  function regform() {
    const name = document.getElementById("name").value.trim();
    const username = document.getElementById("username").value.trim();
    const email = document.getElementById("email").value.trim();
    const number = document.getElementById("number").value.trim();
    const password = document.getElementById("password").value;
    const repassword = document.getElementById("repassword").value;

    if (!name || !username) {
      alert("Please fill in your name and username.");
      return false;
    }

    if (!email || !number) {
      alert("Please enter both email and phone number.");
      return false;
    }

    const numberPattern = /^[0-9]{10}$/;
    if (!numberPattern.test(number)) {
      alert("Phone number must be exactly 10 digits.");
      return false;
    }

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
      alert("Invalid email format.");
      return false;
    }

    if (password !== repassword) {
      alert("Passwords do not match.");
      return false;
    }

    return true;
  }
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
