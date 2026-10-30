<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Estate Cards | EstateFinders Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
    <style>
        .property-image { width: 100px; height: 64px; object-fit: cover; border-radius: 9px; }
    </style>
</head>
<body>
<%@ include file="admin-navigation.jspf" %>
<main class="admin-page">
    <h1 class="admin-page-title">Manage estate cards</h1>
    <p class="admin-page-subtitle">Review and remove manually created showcase cards.</p>
    <div class="admin-panel table-responsive">
    <table class="table table-hover align-middle mb-0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Builder</th>
                <th>Location</th>
                <th>Price</th>
                <th>Main Image</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="estate" items="${estates}">
                <tr>
                    <td><c:out value="${estate.id}"/></td>
                    <td><c:out value="${estate.name}"/></td>
                    <td><c:out value="${estate.builderName}"/></td>
                    <td><c:out value="${estate.location}"/></td>
                    <td><c:out value="${estate.price}"/></td>
                    <td>
                        <c:if test="${not empty estate.mainImagePath}">
                            <img src="<c:out value='${estate.mainImagePath}'/>" class="property-image" alt="<c:out value='${estate.name}'/>">
                        </c:if>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/estate/delete/${estate.id}" method="post"
                              onsubmit="return confirm('Are you sure you want to delete this property?');">
                            <input type="hidden" name="_csrf" value="<c:out value='${_csrf}'/>">
                            <button type="submit" class="btn btn-outline-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty estates}">
                <tr><td colspan="7" class="admin-empty">No estate cards have been created.</td></tr>
            </c:if>
        </tbody>
    </table>
    </div>
</main>
</body>
</html>
