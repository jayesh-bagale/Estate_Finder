<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search results | EstateFinders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --housing-blue: #0a2342;
            --housing-orange: #ff6a3d;
            --housing-soft: #f5f7fb;
            --housing-muted: #627188;
            --housing-line: #eaf0f7;
        }
        body { margin:0; background:#f7f9fc; color:var(--housing-blue); font-family:'Segoe UI',sans-serif; }
        a { text-decoration:none; }
        .topbar { background: rgba(10,35,66,0.96); color:#fff; position:sticky; top:0; z-index:10; }
        .topbar-inner { min-height:72px; display:flex; align-items:center; justify-content:space-between; padding:0 18px; }
        .brand { display:inline-flex; align-items:center; gap:10px; color:#fff; font-weight:800; }
        .brand-mark { width:36px; height:36px; display:inline-flex; align-items:center; justify-content:center; background:linear-gradient(135deg,#ff6a3d,#ff9d2f); border-radius:12px; }
        .nav-links { display:flex; gap:14px; flex-wrap:wrap; }
        .nav-links a { color: rgba(255,255,255,0.8); font-weight:600; }
        .header { background: linear-gradient(135deg,#0a2342,#123f70); color:white; padding: 42px 0 32px; }
        .container-custom { width:min(1180px, calc(100% - 28px)); margin:0 auto; }
        .search-wrap { background: rgba(255,255,255,0.08); border:1px solid rgba(255,255,255,0.1); border-radius:24px; padding:18px; }
        .search-form { display:grid; grid-template-columns: 1.2fr 1fr 1.5fr 1fr 1fr; gap:12px; }
        .field { display:flex; flex-direction:column; gap:8px; }
        .field label { font-size:0.75rem; text-transform:uppercase; letter-spacing:0.04em; color: rgba(255,255,255,0.7); font-weight:700; }
        .field input, .field select { min-height:50px; border:1px solid rgba(255,255,255,0.16); background:rgba(255,255,255,0.96); border-radius:14px; padding:0 14px; }
        .search-btn { min-height:50px; border:none; border-radius:14px; background:linear-gradient(135deg,#ff6a3d,#ff8f59); color:white; font-weight:800; }
        .results-section { padding:28px 0 50px; }
        .result-header { display:flex; justify-content:space-between; align-items:center; gap:12px; margin-bottom:18px; }
        .result-header h2 { margin:0; font-weight:800; }
        .result-tools { display:flex; align-items:center; flex-wrap:wrap; gap:10px; }
        .page-size-form { display:flex; align-items:center; gap:8px; color:var(--housing-muted); font-size:0.9rem; }
        .page-size-form select { min-height:40px; border:1px solid var(--housing-line); border-radius:999px; padding:0 12px; background:white; }
        .result-grid { display:grid; grid-template-columns: repeat(3, minmax(0,1fr)); gap:22px; }
        .listing-card { background:white; border:1px solid var(--housing-line); border-radius:22px; overflow:hidden; box-shadow:0 12px 28px rgba(10,35,66,0.08); }
        .listing-image { position:relative; display:block; height:220px; overflow:hidden; }
        .listing-image img { width:100%; height:100%; object-fit:cover; }
        .listing-badge { position:absolute; top:14px; left:14px; background: rgba(255,255,255,0.92); color:var(--housing-blue); padding:7px 10px; border-radius:999px; font-size:0.72rem; font-weight:800; }
        .listing-body { padding:18px; }
        .listing-topline { display:flex; justify-content:space-between; color:var(--housing-muted); font-size:0.8rem; margin-bottom:10px; }
        .listing-body h3 { margin:0 0 10px; font-size:1.2rem; font-weight:800; }
        .listing-meta { display:flex; flex-wrap:wrap; gap:8px; color:var(--housing-muted); font-size:0.85rem; }
        .listing-meta span { background:#f7f9fd; border-radius:10px; padding:7px 8px; }
        .listing-price { display:flex; justify-content:space-between; align-items:baseline; margin-top:14px; }
        .listing-price strong { color:var(--housing-blue); font-size:1.45rem; }
        .listing-price span { color:var(--housing-muted); font-size:0.8rem; }
        .result-count { color:var(--housing-muted); margin:0 0 18px; }
        .pagination { justify-content:center; flex-wrap:wrap; margin-top:28px; }
        .pagination .page-link { color:var(--housing-blue); }
        .pagination .active .page-link { background:var(--housing-blue); border-color:var(--housing-blue); color:#fff; }
        .empty-state { padding:28px; background:white; border:1px solid var(--housing-line); border-radius:18px; color:var(--housing-muted); text-align:center; }
        @media (max-width: 980px) { .search-form { grid-template-columns: repeat(2, minmax(0,1fr)); } .result-grid { grid-template-columns: repeat(2,minmax(0,1fr)); } }
        @media (max-width: 640px) { .search-form, .result-grid { grid-template-columns:1fr; } .topbar-inner { flex-wrap:wrap; justify-content:center; padding:12px 0; } }
    </style>
</head>
<body>
    <nav class="topbar">
        <div class="topbar-inner">
            <a href="<c:url value='/project'/>" class="brand">
                <span class="brand-mark"><i class="fa-solid fa-house"></i></span>
                <span>EstateFinders</span>
            </a>
            <div class="nav-links">
                <a href="<c:url value='/buy'/>">Buy</a>
                <a href="<c:url value='/rent'/>">Rent</a>
                <a href="<c:url value='/property/sell-property'/>">Sell</a>
                <a href="<c:url value='/search'/>">Explore</a>
                <a href="<c:url value='/tools'/>">Tools</a>
            </div>
            <div class="d-flex align-items-center gap-2">
                <c:choose>
                    <c:when test="${not empty sessionScope['estatefinder.userId']}">
                        <a class="text-white fw-bold" href="<c:url value='/profile'/>">My Profile</a>
                        <form action="<c:url value='/customer/logout'/>" method="post" class="m-0">
                            <button class="btn btn-outline-light btn-sm" type="submit">Logout</button>
                        </form>
                    </c:when>
                    <c:otherwise><a class="text-white fw-bold" href="<c:url value='/login'/>">Login</a></c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>

    <header class="header">
        <div class="container-custom">
            <div style="margin-bottom:16px; font-weight:700; letter-spacing:0.08em; text-transform:uppercase; opacity:0.8;">Property search</div>
            <h1 style="margin:0 0 18px; font-size: clamp(2.2rem,3.5vw,3.8rem); font-weight:800; letter-spacing:-0.04em;">${cityDisplayName}</h1>
            <div class="search-wrap">
                <form class="search-form" action="<c:url value='/search'/>" method="get">
                    <div class="field">
                        <label for="city">City</label>
                        <select id="city" name="city">
                            <option value="">All cities</option>
                            <option value="nashik" <c:if test="${selectedCity eq 'nashik'}">selected</c:if>>Nashik</option>
                            <option value="mumbai" <c:if test="${selectedCity eq 'mumbai'}">selected</c:if>>Mumbai</option>
                            <option value="pune" <c:if test="${selectedCity eq 'pune'}">selected</c:if>>Pune</option>
                            <option value="sambhajinagar" <c:if test="${selectedCity eq 'sambhajinagar'}">selected</c:if>>Chhatrapati Sambhajinagar</option>
                            <option value="jalgaon" <c:if test="${selectedCity eq 'jalgaon'}">selected</c:if>>Jalgaon</option>
                            <option value="thane" <c:if test="${selectedCity eq 'thane'}">selected</c:if>>Thane</option>
                            <option value="west-thane" <c:if test="${selectedCity eq 'west-thane'}">selected</c:if>>West Thane</option>
                        </select>
                    </div>
                    <div class="field">
                        <label for="type">Property type</label>
                        <select id="type" name="type">
                            <option value="">All types</option>
                            <option value="Residential Rental" <c:if test="${type eq 'Residential Rental'}">selected</c:if>>Residential Rental</option>
                            <option value="Residential Sale" <c:if test="${type eq 'Residential Sale'}">selected</c:if>>Residential Sale</option>
                            <option value="Commercial Space" <c:if test="${type eq 'Commercial Space'}">selected</c:if>>Commercial Space</option>
                            <option value="Developer Project" <c:if test="${type eq 'Developer Project'}">selected</c:if>>Developer Project</option>
                        </select>
                    </div>
                    <div class="field">
                        <label for="query">Search</label>
                        <input id="query" type="text" name="query" value="${query}" placeholder="Locality or project" />
                    </div>
                    <div class="field">
                        <label for="minPrice">Min price</label>
                        <input id="minPrice" type="text" name="minPrice" value="${minPrice}" placeholder="₹ 25L" />
                    </div>
                    <div class="field">
                        <label for="maxPrice">Max price</label>
                        <input id="maxPrice" type="text" name="maxPrice" value="${maxPrice}" placeholder="₹ 1Cr" />
                    </div>
                    <div class="field" style="grid-column: span 5; margin-top: 8px;">
                        <button type="submit" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i> Search homes</button>
                    </div>
                </form>
            </div>
        </div>
    </header>

    <main class="container-custom results-section">
        <div class="result-header">
            <h2><c:out value='${resultCount}' default='0'/> properties found</h2>
            <div class="result-tools">
                <form action="<c:url value='/search'/>" method="get" class="page-size-form">
                    <input type="hidden" name="city" value="<c:out value='${selectedCity}'/>">
                    <input type="hidden" name="type" value="<c:out value='${type}'/>">
                    <input type="hidden" name="query" value="<c:out value='${query}'/>">
                    <input type="hidden" name="minPrice" value="<c:out value='${minPrice}'/>">
                    <input type="hidden" name="maxPrice" value="<c:out value='${maxPrice}'/>">
                    <input type="hidden" name="bedrooms" value="<c:out value='${bedrooms}'/>">
                    <input type="hidden" name="sort" value="<c:out value='${sort}'/>">
                    <label for="perPage">Show</label>
                    <select id="perPage" name="perPage">
                        <option value="9" <c:if test="${pageSize eq 9}">selected</c:if>>9</option>
                        <option value="18" <c:if test="${pageSize eq 18}">selected</c:if>>18</option>
                        <option value="36" <c:if test="${pageSize eq 36}">selected</c:if>>36</option>
                    </select>
                    <span>per page</span>
                    <button class="btn btn-outline-primary rounded-pill" type="submit">Apply</button>
                </form>
                <a href="<c:url value='/project'/>" class="btn btn-outline-dark rounded-pill">Back to home</a>
            </div>
        </div>
        <c:if test="${resultCount gt 0}">
            <p class="result-count">
                Showing <c:out value="${firstResult}"/>–<c:out value="${lastResult}"/> of
                <c:out value="${resultCount}"/> properties · <c:out value="${pageSize}"/> per page
            </p>
        </c:if>

        <c:if test="${not empty results}">
            <div class="result-grid">
                <c:forEach var="listing" items="${results}">
                    <article class="listing-card">
                        <div class="listing-image">
                            <img src="${not empty listing.image ? listing.image : '/resources/images/estate3.jpg'}" alt="${listing.name}" onerror="this.onerror=null;this.src='/resources/images/estate3.jpg';">
                            <span class="listing-badge">${listing.category}</span>
                        </div>
                        <div class="listing-body">
                            <div class="listing-topline">
                                <span>${listing.cityName}</span>
                                <span>${listing.locality}</span>
                            </div>
                            <h3><a href="<c:url value='/properties/listing/${listing.id}'/>">${listing.name}</a></h3>
                            <div class="listing-meta">
                                <span><i class="fa-solid fa-bed"></i> ${listing.bedrooms} BHK</span>
                                <span><i class="fa-solid fa-ruler-combined"></i> ${listing.areaSqFt} sq ft</span>
                            </div>
                            <div class="listing-price">
                                <strong>${listing.price}</strong>
                                <span>${listing.propertyType}</span>
                            </div>
                            <c:url value="/booking" var="listingRequestUrl">
                                <c:param name="propertyName" value="${listing.name}"/>
                                <c:param name="propertyType" value="${listing.propertyType}"/>
                                <c:param name="locationName" value="${listing.locality}, ${listing.cityName}"/>
                                <c:param name="builderName" value="EstateFinders listing"/>
                            </c:url>
                            <a class="btn btn-outline-primary w-100 mt-3"
                               href="<c:url value='/properties/listing/${listing.id}'/>">View details</a>
                            <a class="btn btn-primary w-100 mt-2" href="${listingRequestUrl}">
                                <c:choose>
                                    <c:when test="${listing.transactionType eq 'SALE'}">Buy this property</c:when>
                                    <c:when test="${listing.transactionType eq 'RENT'}">Rent this property</c:when>
                                    <c:otherwise>Request property details</c:otherwise>
                                </c:choose>
                            </a>
                        </div>
                    </article>
                </c:forEach>
            </div>
            <c:if test="${totalPages gt 1}">
                <nav aria-label="Search result pages">
                    <ul class="pagination">
                        <c:if test="${currentPage gt 1}">
                            <c:url value="/search" var="previousPageUrl">
                                <c:param name="city" value="${selectedCity}"/>
                                <c:param name="type" value="${type}"/>
                                <c:param name="query" value="${query}"/>
                                <c:param name="minPrice" value="${minPrice}"/>
                                <c:param name="maxPrice" value="${maxPrice}"/>
                                <c:param name="bedrooms" value="${bedrooms}"/>
                                <c:param name="sort" value="${sort}"/>
                                <c:param name="perPage" value="${pageSize}"/>
                                <c:param name="page" value="${currentPage - 1}"/>
                            </c:url>
                            <li class="page-item"><a class="page-link" href="${previousPageUrl}">Previous</a></li>
                        </c:if>
                        <c:if test="${pageWindowStart gt 1}">
                            <c:url value="/search" var="firstPageUrl">
                                <c:param name="city" value="${selectedCity}"/>
                                <c:param name="type" value="${type}"/>
                                <c:param name="query" value="${query}"/>
                                <c:param name="minPrice" value="${minPrice}"/>
                                <c:param name="maxPrice" value="${maxPrice}"/>
                                <c:param name="bedrooms" value="${bedrooms}"/>
                                <c:param name="sort" value="${sort}"/>
                                <c:param name="perPage" value="${pageSize}"/>
                                <c:param name="page" value="1"/>
                            </c:url>
                            <li class="page-item"><a class="page-link" href="${firstPageUrl}">1</a></li>
                            <li class="page-item disabled"><span class="page-link">…</span></li>
                        </c:if>
                        <c:forEach begin="${pageWindowStart}" end="${pageWindowEnd}" var="pageNumber">
                            <c:url value="/search" var="pageUrl">
                                <c:param name="city" value="${selectedCity}"/>
                                <c:param name="type" value="${type}"/>
                                <c:param name="query" value="${query}"/>
                                <c:param name="minPrice" value="${minPrice}"/>
                                <c:param name="maxPrice" value="${maxPrice}"/>
                                <c:param name="bedrooms" value="${bedrooms}"/>
                                <c:param name="sort" value="${sort}"/>
                                <c:param name="perPage" value="${pageSize}"/>
                                <c:param name="page" value="${pageNumber}"/>
                            </c:url>
                            <li class="page-item <c:if test='${pageNumber eq currentPage}'>active</c:if>">
                                <a class="page-link" href="${pageUrl}" <c:if test="${pageNumber eq currentPage}">aria-current="page"</c:if>>
                                    <c:out value="${pageNumber}"/>
                                </a>
                            </li>
                        </c:forEach>
                        <c:if test="${pageWindowEnd lt totalPages}">
                            <li class="page-item disabled"><span class="page-link">…</span></li>
                            <c:url value="/search" var="lastPageUrl">
                                <c:param name="city" value="${selectedCity}"/>
                                <c:param name="type" value="${type}"/>
                                <c:param name="query" value="${query}"/>
                                <c:param name="minPrice" value="${minPrice}"/>
                                <c:param name="maxPrice" value="${maxPrice}"/>
                                <c:param name="bedrooms" value="${bedrooms}"/>
                                <c:param name="sort" value="${sort}"/>
                                <c:param name="perPage" value="${pageSize}"/>
                                <c:param name="page" value="${totalPages}"/>
                            </c:url>
                            <li class="page-item"><a class="page-link" href="${lastPageUrl}"><c:out value="${totalPages}"/></a></li>
                        </c:if>
                        <c:if test="${currentPage lt totalPages}">
                            <c:url value="/search" var="nextPageUrl">
                                <c:param name="city" value="${selectedCity}"/>
                                <c:param name="type" value="${type}"/>
                                <c:param name="query" value="${query}"/>
                                <c:param name="minPrice" value="${minPrice}"/>
                                <c:param name="maxPrice" value="${maxPrice}"/>
                                <c:param name="bedrooms" value="${bedrooms}"/>
                                <c:param name="sort" value="${sort}"/>
                                <c:param name="perPage" value="${pageSize}"/>
                                <c:param name="page" value="${currentPage + 1}"/>
                            </c:url>
                            <li class="page-item"><a class="page-link" href="${nextPageUrl}">Next</a></li>
                        </c:if>
                    </ul>
                </nav>
            </c:if>
        </c:if>

        <c:if test="${empty results}">
            <div class="empty-state">No properties match your selected filters. Try a broader area or different property type.</div>
        </c:if>
    </main>
    <c:if test="${not empty submittedProperties}">
        <c:url value="/resources/images/estate3.jpg" var="sellerImageFallback"/>
        <section class="container-custom results-section" aria-labelledby="seller-listings-heading">
            <div class="result-header">
                <h2 id="seller-listings-heading">Approved properties from sellers</h2>
                <span>${submittedProperties.size()} listings</span>
            </div>
            <div class="result-grid">
                <c:forEach var="property" items="${submittedProperties}">
                    <article class="listing-card">
                        <a class="listing-image" href="<c:url value='/property/${property.id}'/>">
                            <c:choose>
                                <c:when test="${not empty property.imagePath}">
                                    <img src="<c:url value='${property.imagePath}'/>"
                                         alt="<c:out value='${property.title}'/>"
                                         onerror="this.onerror=null;this.src='${sellerImageFallback}';">
                                </c:when>
                                <c:otherwise>
                                    <img src="${sellerImageFallback}" alt="<c:out value='${property.title}'/>">
                                </c:otherwise>
                            </c:choose>
                            <span class="listing-badge">Seller listed</span>
                        </a>
                        <div class="listing-body">
                            <div class="listing-topline">
                                <span><c:out value="${property.city}"/></span>
                                <span><c:out value="${property.listingType}"/></span>
                            </div>
                            <h3><a href="<c:url value='/property/${property.id}'/>"><c:out value="${property.title}"/></a></h3>
                            <div class="listing-meta"><span><c:out value="${property.address}"/></span></div>
                            <div class="listing-price">
                                <strong>₹${property.price}</strong>
                                <span>Approved listing</span>
                            </div>
                        </div>
                    </article>
                </c:forEach>
            </div>
        </section>
    </c:if>
</body>
</html>
