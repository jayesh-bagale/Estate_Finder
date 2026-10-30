<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Homes in <c:out value="${cityName}"/> | EstateFinders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f5f7fa; color: #243447; }
        .navbar { background: #20384c; }
        .page-heading { background: linear-gradient(120deg, #20384c, #35627b); color: white; padding: 48px 0; }
        .listing-card { height: 100%; border: 0; box-shadow: 0 8px 24px rgba(27, 48, 65, .1); }
        .listing-card img { height: 220px; object-fit: cover; }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="<c:url value='/project'/>">ESTATEFINDERS</a>
        <div class="ms-auto d-flex gap-2">
            <a class="btn btn-outline-light" href="<c:url value='/project'/>">Home</a>
            <c:choose>
                <c:when test="${not empty sessionScope['estatefinder.userId']}">
                    <a class="btn btn-light" href="<c:url value='/profile'/>">My account</a>
                    <form action="<c:url value='/customer/logout'/>" method="post">
                        <button type="submit" class="btn btn-outline-light">Log out</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-light" href="<c:url value='/login'/>">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<header class="page-heading">
    <div class="container">
        <p class="text-uppercase mb-2">Explore homes by location</p>
        <h1 class="display-5 fw-bold">Properties in <c:out value="${cityName}"/></h1>
        <p class="mb-0">Browse illustrative preview listings stored in the EstateFinders database.</p>
    </div>
</header>

<main class="container py-4 py-md-5">
    <c:url var="citySearchUrl" value="/properties/${citySlug}"/>
    <form action="<c:out value='${citySearchUrl}'/>" method="get" class="row g-2 mb-4">
        <div class="col-12 col-md">
            <label class="visually-hidden" for="listingSearch">Search this city</label>
            <input class="form-control" id="listingSearch" type="search" name="search"
                   value="<c:out value='${searchTerm}'/>" placeholder="Search locality or property type">
        </div>
        <div class="col-12 col-md-4">
            <label class="visually-hidden" for="listingCategory">Filter by category</label>
            <select class="form-select" id="listingCategory" name="category">
                <option value="">All categories</option>
                <c:forEach var="category" items="${categories}">
                    <option value="<c:out value='${category}'/>"
                            <c:if test="${selectedCategory eq category}">selected</c:if>>
                        <c:out value="${category}"/>
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="col-12 col-md-auto">
            <button class="btn btn-outline-primary" type="submit">Search this city</button>
        </div>
    </form>

    <c:if test="${not empty searchTerm}">
        <p class="text-muted">Showing matches for “<c:out value="${searchTerm}"/>”.</p>
    </c:if>

    <div class="row g-4">
        <c:forEach var="listing" items="${listings}">
            <div class="col-md-6 col-xl-4">
                <article class="card listing-card">
                    <img class="card-img-top" src="<c:out value='${listing.image}'/>"
                         alt="<c:out value='${listing.name}'/>"
                         onerror="this.onerror=null;this.src='<c:url value='/images/estate3.jpg'/>';">
                    <div class="card-body d-flex flex-column">
                        <span class="badge text-bg-warning align-self-start mb-2">Demo preview</span>
                        <span class="badge text-bg-primary align-self-start mb-2">
                            <c:out value="${listing.propertyType}"/>
                        </span>
                        <span class="badge text-bg-secondary align-self-start mb-2">
                            <c:out value="${listing.category}"/> · <c:out value="${listing.transactionType}"/>
                        </span>
                        <h2 class="h5 card-title"><c:out value="${listing.name}"/></h2>
                        <p class="text-muted mb-2">
                            <c:out value="${listing.locality}"/>, <c:out value="${cityName}"/>
                        </p>
                        <p class="card-text"><c:out value="${listing.description}"/></p>
                        <p class="small text-muted mb-2">
                            <c:out value="${listing.furnishing}"/> · <c:out value="${listing.areaSqFt}"/> sq ft
                        </p>
                        <div class="mt-auto">
                            <p class="fw-bold fs-5 mb-3"><c:out value="${listing.price}"/></p>
                            <c:url var="propertyRequestUrl" value="/booking">
                                <c:param name="propertyName" value="${listing.name}"/>
                                <c:param name="propertyType" value="${listing.propertyType}"/>
                                <c:param name="locationName" value="${listing.locality}, ${cityName}"/>
                                <c:param name="builderName" value="EstateFinders demo listing"/>
                            </c:url>
                            <a class="btn btn-outline-primary w-100 mb-2"
                               href="<c:url value='/properties/listing/${listing.id}'/>">View full details</a>
                            <a class="btn btn-primary w-100" href="<c:out value='${propertyRequestUrl}'/>">
                                <c:choose>
                                    <c:when test="${listing.transactionType eq 'SALE'}">Buy this property</c:when>
                                    <c:otherwise>Rent this property</c:otherwise>
                                </c:choose>
                            </a>
                        </div>
                    </div>
                </article>
            </div>
        </c:forEach>
    </div>

    <c:if test="${empty listings}">
        <div class="alert alert-info mt-4" role="status">
            No showcase listings match that search in <c:out value="${cityName}"/>.
            Try a locality or property type such as “apartment”.
        </div>
    </c:if>
</main>
</body>
</html>
