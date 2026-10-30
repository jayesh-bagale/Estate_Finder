<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Properties List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
    <style>
		:root {
		     --primary-color: #2c3e50;
		     --secondary-color: #e74c3c;
		     --light-color: #ecf0f1;
		   }
		   body {
		     font-family: Arial, sans-serif;
		     line-height: 1.6;
		     padding-top: 70px;
		   }
		   body { padding-top: 0; }
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
    <h1 class="admin-page-title">Available properties</h1>
    <p class="admin-page-subtitle">Review published listings and remove properties that are no longer available.</p>

    <c:if test="${empty properties}">
        <div class="admin-card admin-empty">No available property listings yet.</div>
    </c:if>

    <c:forEach var="property" items="${properties}">
        <!-- Property Card -->
        <div class="property-card admin-card card mb-4 p-0">
            <div class="row g-0">
                <!-- Property Image and Details -->
                <div class="col-lg-8">
                    <div class="row g-0">
                        <div class="col-md-4 property-image-container">
                            <c:choose>
                                <c:when test="${not empty property.imagePath}">
                                    <img src="<c:out value='${property.imagePath}'/>" class="img-fluid" alt="<c:out value='${property.title}'/>">
                                </c:when>
                                <c:otherwise>
                                    <img src="/images/default.jpg" class="img-fluid" alt="Default Property">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body h-100 d-flex flex-column">
                                <h5 class="card-title"><c:out value="${property.title}"/></h5>
                                <p class="card-text flex-grow-1"><c:out value="${property.description}"/></p>
                                <div class="property-details">
                                    <p class="card-text mb-1"><i class="fas fa-map-marker-alt me-2"></i> <c:out value="${property.address}"/></p>
                                    <p class="card-text mb-1"><i class="fas fa-tag me-2"></i> Status: <c:out value="${property.status}"/></p>
                                  
                                </div>
                                <div class="">
                                    <span class="property-price"><c:out value="${property.price}"/></span>
                                    <div class="mt-2 mt-sm-0">
                                        <a href="${pageContext.request.contextPath}/property/${property.id}" 
                                           class="btn btn-outline-primary me-2">View Details</a>
                                        <form action="<c:url value='/admin/properties/${property.id}/delete'/>"
                                              method="post" class="d-inline"
                                              onsubmit="return confirm('Delete this property permanently? This cannot be undone.');">
                                            <input type="hidden" name="_csrf" value="<c:out value='${_csrf}'/>">
                                            <button type="submit" class="btn btn-outline-danger">
                                                <i class="fas fa-trash-alt me-1"></i>Delete property
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Why Choose Section -->
                <div class="col-lg-4">
                    <div class="card h-100 why-choose-card">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"><i class="fas fa-star me-2"></i> Why Choose <c:out value="${property.title}"/>?</h5>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled">
                                <li class="mb-3 d-flex">
                                    <div class="flex-shrink-0 text-primary me-3">
                                        <i class="fas fa-map-marked-alt"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-1">Prime Location</h6>
                                        <p class="mb-0 text-muted"><c:out value="${property.address}"/></p>
                                    </div>
                                </li>
                                <li class="mb-3 d-flex">
                                    <div class="flex-shrink-0 text-primary me-3">
                                        <i class="fas fa-building"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-1">Spacious Design</h6>
                                        <p class="mb-0 text-muted">Well-planned layouts & premium finishes</p>
                                    </div>
                                </li>
                                <li class="mb-3 d-flex">
                                    <div class="flex-shrink-0 text-primary me-3">
                                        <i class="fas fa-swimming-pool"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-1">Modern Amenities</h6>
                                        <p class="mb-0 text-muted">Lifestyle features for comfortable living</p>
                                    </div>
                                </li>
                                <li class="d-flex">
                                    <div class="flex-shrink-0 text-primary me-3">
                                        <i class="fas fa-hard-hat"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-1">Trusted Developer</h6>
                                        <p class="mb-0 text-muted">Delivered quality projects on time</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="card-footer bg-light">
                            <small class="text-muted"><i class="fas fa-info-circle me-1"></i> RERA Registered Project</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</main>
</body>
</html>
