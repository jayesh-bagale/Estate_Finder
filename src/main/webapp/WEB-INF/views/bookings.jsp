<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bookings | EstateFinders Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
  <style>
    .accepted { background-color: #ecfdf3 !important; }
    .declined { background-color: #fff1f2 !important; }
  </style>
</head>
<body>
<%@ include file="admin-navigation.jspf" %>
<main class="admin-page">
  <h1 class="admin-page-title">Booking requests</h1>
  <p class="admin-page-subtitle">Review customer requests and update each request status.</p>

  <div class="admin-panel table-responsive">
  <table class="table table-hover align-middle">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Property Type</th>
        <th>Property Name</th>
        <th>Builder</th>
        <th>Location</th>
        <th>Date</th>
        <th>Special Requests</th>
        <th>Action</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="b" items="${bookings}">
        <tr id="row-${b.id}">
          <td><c:out value="${b.id}"/></td>
          <td><c:out value="${b.firstName}"/> <c:out value="${b.lastName}"/></td>
          <td><c:out value="${b.email}"/></td>
          <td><c:out value="${b.phone}"/></td>
          <td><c:out value="${b.propertyType}"/></td>
          <td><c:out value="${b.propertyName}"/></td>
          <td><c:out value="${b.builderName}"/></td>
          <td><c:out value="${b.locationName}"/></td>
          <td><c:out value="${b.bookingDate}"/></td>
          <td><c:out value="${b.specialRequests}"/></td>
          <td>
            <button type="button" class="btn admin-btn-primary btn-sm" onclick="updateStatus(${b.id}, 'accepted', this)">
              <i class="fa-solid fa-check me-1"></i>Accept
            </button>
            <button type="button" class="btn btn-outline-danger btn-sm" onclick="updateStatus(${b.id}, 'declined', this)">
              <i class="fa-solid fa-xmark me-1"></i>Decline
            </button>
          </td>
          <td id="status-${b.id}" class="fw-bold booking-status">
            <c:choose>
              <c:when test="${b.status eq 'accepted'}"><span class="badge text-bg-success">Accepted</span></c:when>
              <c:when test="${b.status eq 'declined'}"><span class="badge text-bg-danger">Declined</span></c:when>
              <c:otherwise><span class="badge text-bg-warning">Pending</span></c:otherwise>
            </c:choose>
          </td>
        </tr>
      </c:forEach>
      <c:if test="${empty bookings}">
        <tr><td colspan="12" class="admin-empty">No booking requests yet.</td></tr>
      </c:if>
    </tbody>
  </table>
  </div>
  <div id="bookingStatusMessage" class="alert d-none mt-3" role="status" aria-live="polite"></div>
</main>

<script>
  const contextPath = '<c:out value="${pageContext.request.contextPath}"/>';
  const csrfToken = '<c:out value="${_csrf}"/>';

  function showStatusMessage(message, type) {
    const messageBox = document.getElementById("bookingStatusMessage");
    messageBox.textContent = message;
    messageBox.className = "alert alert-" + type + " mt-3";
  }

  async function updateStatus(id, status, clickedButton) {
    const row = document.getElementById("row-" + id);
    const statusCell = document.getElementById("status-" + id);
    if (!row || !statusCell || !csrfToken) {
      showStatusMessage("The booking controls could not be initialized. Refresh the page and try again.", "danger");
      return;
    }

    const buttons = row.querySelectorAll("button");
    buttons.forEach(button => { button.disabled = true; });
    const originalLabel = clickedButton.innerHTML;
    clickedButton.innerHTML = '<span class="spinner-border spinner-border-sm me-1" aria-hidden="true"></span>Saving';

    try {
      const response = await fetch(contextPath + "/admin/bookings/" + id + "/status", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8" },
        body: new URLSearchParams({ status, _csrf: csrfToken })
      });
      if (!response.ok) {
        showStatusMessage(response.status === 404
          ? "This booking no longer exists. Refresh the page."
          : response.status === 403
            ? "Your admin session expired or the security token is stale. Sign in again and retry."
            : "The booking status could not be updated. Please retry.", "danger");
        return;
      }

      row.classList.remove("accepted", "declined");
      row.classList.add(status);
      statusCell.innerHTML = status === "accepted"
        ? '<span class="badge text-bg-success">Accepted</span>'
        : '<span class="badge text-bg-danger">Declined</span>';
      statusCell.classList.remove("text-secondary", "text-danger", "text-success");
      showStatusMessage("Booking #" + id + " was " + status + ".", "success");
    } catch (error) {
      showStatusMessage("Unable to reach the server. The booking status was not changed. Please try again.", "danger");
    } finally {
      buttons.forEach(button => { button.disabled = false; });
      clickedButton.innerHTML = originalLabel;
    }
  }
</script>
</body>
</html>
