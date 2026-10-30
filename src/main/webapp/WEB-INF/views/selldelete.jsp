<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pending Listings | EstateFinders Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
    <style>
        .pending-image { width: 100px; height: 72px; object-fit: cover; border-radius: 9px; }
        .pending-description { min-width: 220px; max-width: 360px; }
    </style>
</head>
<body>
<%@ include file="admin-navigation.jspf" %>
<main class="admin-page">
    <h1 class="admin-page-title">Pending property requests</h1>
    <p class="admin-page-subtitle">Approve listings to publish them, or decline requests that should not be listed.</p>

    <div class="admin-panel table-responsive">
    <table class="table table-hover align-middle mb-0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Owner</th>
                <th>Description</th>
                <th>Price</th>
                <th>Location</th>
                <th>Features</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody class="table-group-divider">
            <c:forEach var="property" items="${properties}">
                <tr>
                    <td><c:out value="${property.id}"/></td>
                    <td><c:out value="${property.title}"/></td>
                    <td><c:out value="${property.ownerName}"/></td>
                    <td class="pending-description"><c:out value="${property.description}"/></td>
                    <td><c:out value="${property.price}"/></td>
                    <td>
                        <c:out value="${property.address}"/><br>
                        <c:out value="${property.locality}"/>, <c:out value="${property.city}"/> <c:out value="${property.postalCode}"/>
                        <c:url value="https://www.google.com/maps/search/" var="pendingMapUrl">
                            <c:param name="api" value="1"/>
                            <c:param name="query" value="${property.address}, ${property.locality}, ${property.city} ${property.postalCode}"/>
                        </c:url>
                        <br><a href="<c:out value='${pendingMapUrl}'/>" target="_blank" rel="noopener noreferrer">View map</a>
                    </td>
                    <td>
                        <c:out value="${property.propertyType}"/> · <c:out value="${property.listingType}"/><br>
                        <c:out value="${property.bedrooms}"/> bed · <c:out value="${property.bathrooms}"/> bath ·
                        <c:out value="${property.areaSqFt}"/> sq ft<br>
                        <c:out value="${property.furnishing}"/><br>
                        <c:out value="${property.amenities}"/>
                    </td>
                    <td>
                        <c:if test="${not empty property.imagePath}">
                            <img class="pending-image" src="<c:out value='${property.imagePath}'/>" alt="Property Image"/>
                        </c:if>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/property/accept/${property.id}" method="post" class="d-inline">
                            <input type="hidden" name="_csrf" value="<c:out value='${_csrf}'/>">
                            <button type="submit" class="btn admin-btn-primary me-1">Approve</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/property/decline/${property.id}" method="post" class="d-inline"
                              onsubmit="return confirm('Decline and permanently remove this property request?');">
                            <input type="hidden" name="_csrf" value="<c:out value='${_csrf}'/>">
                            <button type="submit" class="btn btn-outline-danger">Decline</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty properties}">
                <tr><td colspan="9" class="admin-empty">No property requests are waiting for review.</td></tr>
            </c:if>
        </tbody>
    </table>
    </div>
</main>
</body>
</html>
