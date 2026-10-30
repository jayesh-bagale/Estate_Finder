
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Users | EstateFinders Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
</head>
<body>
<%@ include file="admin-navigation.jspf" %>
<main class="admin-page">
  <h1 class="admin-page-title">Registered users</h1>
  <p class="admin-page-subtitle">Customer accounts registered on EstateFinders.</p>
  <div class="admin-panel table-responsive">
  <table class="table table-hover align-middle">
    <thead>
      <tr>
        <th>Full Name</th>
        <th>Username</th>
        <th>Email</th>
        <th>Phone Number</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="user" items="${users}">
        <tr>
          <td><c:out value="${user.fullName}"/></td>
          <td><c:out value="${user.username}"/></td>
          <td><c:out value="${user.email}"/></td>
          <td><c:out value="${user.phoneNumber}"/></td>

        </tr>
      </c:forEach>
      <c:if test="${empty users}">
        <tr>
          <td colspan="4" class="text-center">No users registered yet.</td>
        </tr>
      </c:if>
    </tbody>
  </table>
  </div>
  <a href="<c:url value='/register'/>" class="btn admin-btn-primary mt-3 px-3 py-2">Register a user</a>
</main>
</body>
</html>
