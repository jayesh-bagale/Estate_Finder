<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>My requests | EstateFinders</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/project">EstateFinders</a>
    <a class="nav-link" href="${pageContext.request.contextPath}/project">Back to homes</a>
  </div>
</nav>
<main class="container py-5">
  <h1 class="mb-2">My property requests</h1>
  <p class="text-muted mb-4">Check the latest status of your property enquiries.</p>
  <div class="table-responsive bg-white rounded-4 shadow-sm p-2">
  <table class="table table-hover align-middle mb-0">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Property</th>
        <th>Builder</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="b" items="${bookings}">
        <tr>
          <td><c:out value="${b.id}"/></td>
          <td><c:out value="${b.propertyName}"/></td>
          <td><c:out value="${b.builderName}"/></td>
          <td><c:out value="${b.email}"/></td>
          <td><c:out value="${b.phone}"/></td>
          <td>
            <c:choose>
              <c:when test="${b.status == 'accepted' || b.status == 'APPROVED'}">
                <span class="badge text-bg-success">ACCEPTED</span>
              </c:when>
              <c:when test="${b.status == 'declined' || b.status == 'DECLINED'}">
                <span class="badge text-bg-danger">DECLINED</span>
              </c:when>
              <c:otherwise>
                <span class="badge text-bg-warning">PENDING</span>
              </c:otherwise>
            </c:choose>
          </td>
        </tr>
      </c:forEach>
      <c:if test="${empty bookings}">
        <tr><td colspan="6" class="text-center text-muted py-5">You have not submitted any property requests yet.</td></tr>
      </c:if>
    </tbody>
  </table>
  </div>
</main>
</body>
</html>
