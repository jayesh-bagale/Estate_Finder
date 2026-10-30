<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard | EstateFinders</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">

</head>
<body>
<%@ include file="admin-navigation.jspf" %>
<main class="admin-page">
    <section class="dashboard-welcome">
      <div>
        <span class="dashboard-eyebrow"><i class="fa-solid fa-chart-line"></i> Workspace overview</span>
        <h1 class="admin-page-title">Admin dashboard</h1>
        <p class="admin-page-subtitle">Manage listings, bookings and customer enquiries from one place.</p>
      </div>
      <a class="btn admin-btn-primary dashboard-add-button" href="<c:url value='/estate/add'/>">
        <i class="fa-solid fa-plus"></i> Add a property
      </a>
    </section>

    <section aria-label="Platform summary">
    <div class="row g-3 g-xl-4 mb-5">
      <div class="col-12 col-md-3">
        <a class="dashboard-summary" href="<c:url value='/admin/properties'/>">
          <span class="dashboard-icon dashboard-icon-blue"><i class="fa-solid fa-building"></i></span>
          <span class="dashboard-metric">
            <span class="dashboard-label">Total properties</span>
            <strong>${totalProperties}</strong>
            <span class="dashboard-hint">View all listings <i class="fa-solid fa-arrow-right"></i></span>
          </span>
        </a>
      </div>
      <div class="col-12 col-md-3">
        <a class="dashboard-summary" href="<c:url value='/admin/bookings'/>">
          <span class="dashboard-icon dashboard-icon-orange"><i class="fa-solid fa-calendar-check"></i></span>
          <span class="dashboard-metric">
            <span class="dashboard-label">Bookings</span>
            <strong>${totalBookings}</strong>
            <span class="dashboard-hint">Review requests <i class="fa-solid fa-arrow-right"></i></span>
          </span>
        </a>
      </div>
      <div class="col-12 col-md-3">
        <a class="dashboard-summary" href="<c:url value='/admin/users'/>">
          <span class="dashboard-icon dashboard-icon-green"><i class="fa-solid fa-users"></i></span>
          <span class="dashboard-metric">
            <span class="dashboard-label">Registered users</span>
            <strong>${totalUsers}</strong>
            <span class="dashboard-hint">View user accounts <i class="fa-solid fa-arrow-right"></i></span>
          </span>
        </a>
      </div>
      <div class="col-12 col-md-3">
        <a class="dashboard-summary" href="<c:url value='/property/sellproperty'/>">
          <span class="dashboard-icon dashboard-icon-purple"><i class="fa-solid fa-hourglass-half"></i></span>
          <span class="dashboard-metric">
            <span class="dashboard-label">Pending listings</span>
            <strong>${pendingProperties}</strong>
            <span class="dashboard-hint">Review submissions <i class="fa-solid fa-arrow-right"></i></span>
          </span>
        </a>
      </div>
    </div>
    </section>

    <section class="dashboard-shortcuts mb-5" aria-labelledby="shortcutsTitle">
      <div>
        <h2 id="shortcutsTitle" class="dashboard-section-title">Quick actions</h2>
        <p class="dashboard-section-subtitle">Jump straight to a common admin task.</p>
      </div>
      <div class="dashboard-shortcut-links">
        <a href="<c:url value='/property/sellproperty'/>"><i class="fa-solid fa-list-check"></i> Review listings</a>
        <a href="<c:url value='/admin/bookings'/>"><i class="fa-solid fa-calendar-check"></i> Manage bookings</a>
        <a href="<c:url value='/admin/contact'/>"><i class="fa-solid fa-envelope"></i> View messages</a>
      </div>
    </section>

    <section aria-labelledby="recentBookingsTitle">
    <div class="dashboard-section-heading">
      <div>
        <h2 id="recentBookingsTitle" class="dashboard-section-title">Recent bookings</h2>
        <p class="dashboard-section-subtitle">The latest property viewing requests.</p>
      </div>
      <a class="btn admin-btn-primary dashboard-view-all" href="<c:url value='/admin/bookings'/>">
        View all bookings <i class="fa-solid fa-arrow-right"></i>
      </a>
    </div>
    <div class="dashboard-bookings">
      <c:forEach var="booking" items="${recentBookings}">
        <article class="dashboard-booking">
          <span class="dashboard-booking-icon"><i class="fa-solid fa-house"></i></span>
          <div class="dashboard-booking-details">
            <strong><c:out value="${booking.propertyName}"/></strong>
            <span>
              <c:out value="${booking.firstName}"/> <c:out value="${booking.lastName}"/>
              <c:if test="${not empty booking.locationName}"> · <c:out value="${booking.locationName}"/></c:if>
            </span>
          </div>
          <div class="dashboard-booking-meta">
            <span class="dashboard-status"><c:out value="${booking.status}"/></span>
            <time><c:out value="${booking.bookingDate}"/></time>
          </div>
        </article>
      </c:forEach>
    </div>
    <c:if test="${empty recentBookings}">
      <div class="admin-card admin-empty dashboard-empty">
        <span class="dashboard-empty-icon"><i class="fa-regular fa-calendar"></i></span>
        <strong>No bookings yet</strong>
        <span>New property viewing requests will appear here.</span>
      </div>
    </c:if>
    </section>
</main>
</body>
</html>
