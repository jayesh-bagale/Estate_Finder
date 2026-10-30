<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estate Cards | EstateFinders Admin</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
     <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">

    <style>
        .property-card { height: auto; border: 1px solid var(--admin-line); border-radius: 18px; overflow: hidden; }
        .property-image-container img { min-height: 240px; max-height: 360px; object-fit: cover; width: 100%; }
        .property-price { font-weight: 800; font-size: 1.2rem; color: var(--admin-navy); }
        .why-choose-card { border: 0; border-left: 1px solid var(--admin-line); border-radius: 0; }
        @media(max-width: 992px) { .why-choose-card { border-left: 0; border-top: 1px solid var(--admin-line); } }
    </style>
</head>
<body>
<%@ include file="admin-navigation.jspf" %>
<main class="admin-page">
    <h1 class="admin-page-title">Estate showcase cards</h1>
    <p class="admin-page-subtitle">Manage details added through the admin property form.</p>

    <c:forEach var="estate" items="${estates}">
        <!-- Estate Card -->
        <div class="property-card admin-card card mb-4 p-0" data-location="<c:out value='${estate.location}'/>">
            <div class="row g-0">
                <!-- Property Image and Details -->
                <div class="col-lg-8">
                    <div class="row g-0">
                        <div class="col-md-4 property-image-container">
                            <c:if test="${not empty estate.mainImagePath}">
                                <img src="<c:out value='${estate.mainImagePath}'/>" class="img-fluid" alt="<c:out value='${estate.name}'/>">
                            </c:if>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body h-100 d-flex flex-column">
                                <h5 class="card-title"><c:out value="${estate.name}"/> - <c:out value="${estate.builderName}"/></h5>
                                <p class="card-text flex-grow-1">
                                    Premium apartments located in <c:out value="${estate.location}"/>. Modern design,
                                    great connectivity, and amenities for comfortable living.
                                </p>
                                <div class="property-details">
                                    <p class="card-text mb-1"><i class="fas fa-map-marker-alt me-2"></i> <c:out value="${estate.location}"/></p>
                                    
                                    <p class="card-text"><i class="fas fa-ruler-combined me-2"></i><c:out value="${estate.sqft}"/> sq ft</p>
                                </div>
                                <div class="d-flex flex-wrap justify-content-between align-items-center mt-auto">
                                    <span class="property-price"><c:out value="${estate.price}"/></span>
                                    <div class="mt-2 mt-sm-0">
                                        <a href="${pageContext.request.contextPath}/estate/details/${estate.id}" class="btn btn-outline-primary me-2">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Why Choose Section -->
                <div class="col-lg-4">
                    <div class="card h-100 why-choose-card">
                        <div class="card-header bg-primary text-white py-2">
                            <h6 class="mb-0"><i class="fas fa-star me-2"></i>Why Choose Us?</h6>
                        </div>
                        <div class="card-body p-3">
                            <ul class="list-unstyled mb-0">
                                <li class="mb-3 d-flex align-items-start">
                                    <i class="fas fa-swimming-pool text-primary mt-1 me-2"></i>
                                    <div>
                                        <h6 class="mb-0">Luxury Amenities</h6>
                                        <p class="mb-0 text-muted small">Swimming pool & clubhouse</p>
                                    </div>
                                </li>
                                <li class="mb-3 d-flex align-items-start">
                                    <i class="fas fa-shield-alt text-primary mt-1 me-2"></i>
                                    <div>
                                        <h6 class="mb-0">24/7 Security</h6>
                                        <p class="mb-0 text-muted small">Gated community with CCTV</p>
                                    </div>
                                </li>
                                <li class="mb-3 d-flex align-items-start">
                                    <i class="fas fa-parking text-primary mt-1 me-2"></i>
                                    <div>
                                        <h6 class="mb-0">Parking Space</h6>
                                        <p class="mb-0 text-muted small">Dedicated parking for all</p>
                                    </div>
                                </li>
                                <li class="d-flex align-items-start">
                                    <i class="fas fa-leaf text-primary mt-1 me-2"></i>
                                    <div>
                                        <h6 class="mb-0">Green Living</h6>
                                        <p class="mb-0 text-muted small">Eco-friendly environment</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:if test="${empty estates}">
        <div class="admin-card admin-empty">No estate showcase cards have been added.</div>
    </c:if>
</main>
	
</body>
</html>
