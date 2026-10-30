<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard | Real Estate</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS + FontAwesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
       :root {
        --primary-color: #2c3e50;
        --secondary-color: #e74c3c;
        --light-color: #ecf0f1;
    }
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #f8f9fa;
    }
    .wrapper {
      display: flex;
      min-height: 100vh;
      flex-direction: row;
    }
    .sidebar {
      width: 220px;
      background-color: var(--primary-color);
      color: white;
      padding: 20px;
      position: fixed;
      top: 0;
      bottom: 0;
      left: 0;
      z-index: 1000;
      transition: left 0.3s;
    }
    .dropdown-menu {
      border: none;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    .dropdown-item {
      padding: 8px 20px;
    }
    .sidebar h4 {
      color: #fff;
      margin-bottom: 30px;
    }
    .sidebar a {
      display: block;
      color: #adb5bd;
      text-decoration: none;
      padding: 10px 15px;
      margin-bottom: 10px;
      border-radius: 4px;
      transition: background 0.2s, color 0.2s;
    }
    .sidebar a:hover, .sidebar a.active {
      background-color: #495057;
      color: #fff;
    }
    .main-content {
      margin-left: 220px;
      padding: 40px 30px;
      background-color: #f8f9fa;
      width: 100%;
      transition: margin-left 0.3s;
    }
    .card-icon {
      font-size: 1.8rem;
      color: #0d6efd;
    }
    .summary-card {
      transition: transform 0.2s;
    }
    .summary-card:hover {
      transform: scale(1.02);
    }
    .booking-card {
      margin-bottom: 20px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    @media (max-width: 991.98px) {
      .sidebar {
        left: -220px;
        position: fixed;
      }
      .sidebar.active {
        left: 0;
      }
      .main-content {
        margin-left: 0;
        padding: 20px 5vw;
      }
      .sidebar-toggle {
        display: block;
        position: fixed;
        top: 15px;
        left: 15px;
        z-index: 1100;
        background: #343a40;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 8px 12px;
      }
    }
    @media (max-width: 575.98px) {
      .main-content {
        padding: 15px 2vw;
      }
      h2 {
        font-size: 1.3rem;
      }
      .summary-card h6, .summary-card h5 {
        font-size: 1rem;
      }
    }
  </style>
</head>
<body>

<div class="wrapper">
  <!-- Sidebar Toggle Button for Mobile -->
  <button class="sidebar-toggle d-lg-none" aria-label="Toggle Sidebar">
    <i class="fas fa-bars"></i>
  </button>

  <!-- Sidebar -->
  <div class="sidebar" id="sidebarMenu">
    <h4>🏢 EstateFinders</h4>
    <a href="${pageContext.request.contextPath}/adminmain"><i class="fas fa-chart-line me-2"></i>Dashboard</a>
    <div class="dropdown mb-2">
      <a class="dropdown-toggle w-100 text-start" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        Add property
      </a>
      <ul class="dropdown-menu dropdown-menu-dark w-100" aria-labelledby="menuDropdown">
        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/estate/add">Display card</a></li>
		<li><a class="dropdown-item" href="${pageContext.request.contextPath}/estate/manage">Delete card</a></li>
        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/estate/list">Property overview card</a></li>
      </ul>
    </div>
    <a href="${pageContext.request.contextPath}admin/bookings"><i class="fas fa-book me-2"></i>Bookings</a>
	<a class="dropdown-toggle w-100 text-start" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
Sell-property
	     </a>
	     <ul class="dropdown-menu dropdown-menu-dark w-100" aria-labelledby="menuDropdown">
	      
		<li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/properties">View roperty</a></li>
	       <li><a class="dropdown-item" href="${pageContext.request.contextPath}/property/sellproperty">Accept/Decline property</a></li>
	     </ul>
    <a href="${pageContext.request.contextPath}admin/users"><i class="fas fa-users me-2"></i>Users</a>
    <a href="${pageContext.request.contextPath}/admin/contact"><i class="fas fa-users me-2"></i>Contact details</a>
    <a href="${pageContext.request.contextPath}/elogin" class="text-danger"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <h2 class="mb-4">Welcome, Admin</h2>

    <!-- Summary Cards -->
    <div class="row g-4 mb-5">
      <div class="col-12 col-md-4">
        <div class="card summary-card shadow-sm p-3">
          <div class="d-flex align-items-center">
            <div class="me-3"><i class="fas fa-building card-icon"></i></div>
            <div>
              <h6>Total Properties</h6>
              <h5>${totalProperties}</h5>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 col-md-4">
        <div class="card summary-card shadow-sm p-3">
          <div class="d-flex align-items-center">
            <div class="me-3"><i class="fas fa-book card-icon"></i></div>
            <div>
              <h6>Bookings</h6>
              <h5>${totalBookings}</h5>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 col-md-4">
        <div class="card summary-card shadow-sm p-3">
          <div class="d-flex align-items-center">
            <div class="me-3"><i class="fas fa-users card-icon"></i></div>
            <div>
              <h6>Registered Users</h6>
              <h5>${totalUsers}</h5>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Recent Bookings -->
    <h4 class="mb-3">Recent Bookings</h4>
    <div id="bookingsContainer">
      <c:forEach var="booking" items="${recentBookings}">
        <div class="card booking-card p-3 mb-2">
          <div class="d-flex justify-content-between">
            <div>
              <strong><c:out value="${booking.userName}"/></strong> booked <strong><c:out value="${booking.propertyName}"/></strong>
            </div>
            <div><c:out value="${booking.bookingDate}"/></div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Sidebar toggle for mobile
  const toggleButton = document.querySelector('.sidebar-toggle');
  const sidebar = document.getElementById('sidebarMenu');
  toggleButton.addEventListener('click', () => {
    sidebar.classList.toggle('active');
  });
</script>

</body>
</html>
