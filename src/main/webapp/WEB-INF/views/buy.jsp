<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Buy homes | EstateFinders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --housing-blue: #0a2342;
            --housing-orange: #ff6a3d;
            --housing-soft: #f5f7fb;
            --housing-muted: #627188;
            --housing-line: #e6edf5;
            --shadow-sm: 0 12px 28px rgba(10,35,66,0.08);
        }
        body { margin: 0; background: linear-gradient(180deg,#f7f9fc,#eef4ff); color: var(--housing-blue); font-family: "Segoe UI", sans-serif; }
        a { text-decoration: none; }
        .topbar { background: rgba(10,35,66,0.96); color: white; position: sticky; top:0; z-index:20; }
        .topbar-inner { width:min(1440px, calc(100% - 32px)); min-height:72px; margin:0 auto; display:flex; align-items:center; justify-content:space-between; gap:18px; }
        .brand { display:inline-flex; align-items:center; gap:10px; color:#fff; font-weight:800; }
        .brand-mark { width:36px; height:36px; border-radius:12px; display:inline-flex; align-items:center; justify-content:center; background: linear-gradient(135deg,#ff6a3d,#ff9d2f); }
        .nav-links { display:flex; flex-wrap:wrap; gap:14px; }
        .nav-links a { color: rgba(255,255,255,0.8); font-weight:600; }
        .nav-links a:hover { color:#fff; }
        .nav-actions { display:flex; align-items:center; justify-content:flex-end; gap:10px; flex-shrink:0; }
        .login-btn { display:inline-flex; align-items:center; justify-content:center; min-height:42px; padding:9px 16px; border:1px solid rgba(255,255,255,.4); border-radius:999px; color:#fff; font-weight:700; white-space:nowrap; }
        .login-btn:hover { border-color:#fff; background:rgba(255,255,255,.1); color:#fff; }
        .btn-primary { background: linear-gradient(135deg,#ff6a3d,#ff8f59); border:none; border-radius:999px; padding:10px 18px; font-weight:700; }
        .hero { background: linear-gradient(135deg, rgba(11, 32, 58, 0.72), rgba(17, 51, 93, 0.52)), url('https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=1800&q=80') center/cover no-repeat; min-height: 280px; display:flex; align-items:center; }
        .hero-inner { width:min(1180px, calc(100% - 28px)); margin:0 auto; color:white; }
        .hero h1 { font-size: clamp(2.2rem, 3.5vw, 3.5rem); font-weight:800; letter-spacing:-0.04em; margin:0 0 10px; }
        .hero p { color: rgba(255,255,255,0.8); margin:0; font-size:1.05rem; }
        .container-custom { width:min(1180px, calc(100% - 28px)); margin:0 auto; padding:32px 0 48px; }
        .result-grid { display:grid; grid-template-columns: repeat(3, minmax(0,1fr)); gap:22px; }
        .listing-card { background:white; border:1px solid var(--housing-line); border-radius:22px; overflow:hidden; box-shadow:var(--shadow-sm); }
        .listing-image { position:relative; height:220px; overflow:hidden; }
        .listing-image img { width:100%; height:100%; object-fit:cover; }
        .listing-badge { position:absolute; top:14px; left:14px; background: rgba(255,255,255,0.92); color: var(--housing-blue); padding:7px 10px; border-radius:999px; font-size:0.72rem; font-weight:800; }
        .listing-body { padding:18px; }
        .listing-topline { display:flex; justify-content:space-between; color: var(--housing-muted); font-size:0.8rem; margin-bottom:10px; }
        .listing-body h3 { margin:0 0 12px; font-weight:800; font-size:1.2rem; }
        .listing-meta { display:flex; flex-wrap:wrap; gap:8px; color: var(--housing-muted); font-size:0.85rem; }
        .listing-meta span { background:#f7f9fd; border-radius:10px; padding:7px 8px; }
        .listing-price { display:flex; justify-content:space-between; align-items:baseline; margin-top:16px; }
        .listing-price strong { color: var(--housing-blue); font-size:1.5rem; }
        .listing-price span { color: var(--housing-muted); font-size:0.78rem; font-weight:700; }
        @media (max-width: 900px) { .result-grid { grid-template-columns: repeat(2,minmax(0,1fr)); } }
        @media (max-width: 900px) {
            .topbar-inner { flex-wrap:wrap; justify-content:center; padding:12px 0; }
            .nav-links { order:3; width:100%; justify-content:center; }
            .nav-actions { justify-content:center; }
        }
        @media (max-width: 600px) { .result-grid { grid-template-columns:1fr; } .topbar-inner { gap:12px; } .nav-actions { width:100%; } .nav-actions > a { flex:1; } }
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
            <div class="nav-actions">
                <c:choose>
                    <c:when test="${not empty sessionScope['estatefinder.userId']}">
                        <a class="login-btn" href="<c:url value='/profile'/>">My Profile</a>
                        <form action="<c:url value='/customer/logout'/>" method="post" class="m-0">
                            <button class="btn btn-outline-light btn-sm" type="submit">Logout</button>
                        </form>
                    </c:when>
                    <c:otherwise><a class="login-btn" href="<c:url value='/login'/>"><i class="fa-solid fa-right-to-bracket me-2"></i>Login</a></c:otherwise>
                </c:choose>
                <a class="btn btn-primary" href="<c:url value='/property/sell-property'/>">Sell Property</a>
            </div>
        </div>
    </nav>

    <header class="hero">
        <div class="hero-inner">
            <h1>Buy homes that fit your lifestyle</h1>
            <p>Curated homes, apartments and premium properties across top neighborhoods.</p>
        </div>
    </header>

    <main class="container-custom">
        <form class="row g-2 align-items-end mb-4 p-3 bg-white rounded-4 shadow-sm" action="<c:url value='/buy'/>" method="get">
            <div class="col-12 col-md-3">
                <label class="form-label" for="buy-city">City</label>
                <select class="form-select" id="buy-city" name="city">
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
            <div class="col-12 col-md-3">
                <label class="form-label" for="buy-query">Keyword or locality</label>
                <input class="form-control" id="buy-query" type="search" name="query" value="<c:out value='${query}'/>" placeholder="e.g. apartment, Gangapur">
            </div>
            <div class="col-6 col-md-2">
                <label class="form-label" for="buy-min-price">Min price</label>
                <input class="form-control" id="buy-min-price" type="number" name="minPrice" min="0" value="${minPrice}" placeholder="Any">
            </div>
            <div class="col-6 col-md-2">
                <label class="form-label" for="buy-max-price">Max price</label>
                <input class="form-control" id="buy-max-price" type="number" name="maxPrice" min="0" value="${maxPrice}" placeholder="Any">
            </div>
            <div class="col-12 col-md-2 d-grid">
                <button class="btn btn-primary" type="submit"><i class="fa-solid fa-magnifying-glass me-1"></i>Search homes</button>
            </div>
        </form>
        <div class="result-grid">
            <c:choose>
                <c:when test="${not empty properties}">
                    <c:forEach var="property" items="${properties}">
                        <article class="listing-card">
                            <div class="listing-image">
                                <img src="${not empty property.imagePath ? property.imagePath : '/resources/images/estate3.jpg'}" alt="${property.title}" onerror="this.onerror=null;this.src='/resources/images/estate3.jpg';">
                                <span class="listing-badge">${property.status}</span>
                            </div>
                            <div class="listing-body">
                                <div class="listing-topline">
                                    <span>Verified</span>
                                    <span>${property.address}</span>
                                </div>
                                <h3>${property.title}</h3>
                                <div class="listing-meta">
                                    <span><i class="fa-solid fa-bed"></i> 2-4 BHK</span>
                                    <span><i class="fa-solid fa-ruler-combined"></i> Spacious</span>
                                </div>
                                <div class="listing-price">
                                    <strong>₹${property.price}</strong>
                                    <span>${not empty property.listingType ? property.listingType : 'Residential sale'}</span>
                                </div>
                                <a class="btn btn-primary w-100 mt-3" href="<c:url value='/property/${property.id}'/>">View property</a>
                            </div>
                        </article>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach var="listing" items="${cityDemoListings}">
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
                                <h3>${listing.name}</h3>
                                <div class="listing-meta">
                                    <span><i class="fa-solid fa-bed"></i> ${listing.bedrooms} BHK</span>
                                    <span><i class="fa-solid fa-ruler-combined"></i> ${listing.areaSqFt} sq ft</span>
                                </div>
                                <div class="listing-price">
                                    <strong>${listing.price}</strong>
                                    <span>${listing.propertyType}</span>
                                </div>
                                <c:url value="/booking" var="demoBookingUrl">
                                    <c:param name="propertyName" value="${listing.name}"/>
                                    <c:param name="propertyType" value="${listing.propertyType}"/>
                                    <c:param name="locationName" value="${listing.locality}, ${listing.cityName}"/>
                                    <c:param name="builderName" value="EstateFinders demo listing"/>
                                </c:url>
                                <a class="btn btn-outline-primary w-100 mt-3" href="<c:url value='/properties/listing/${listing.id}'/>">View details</a>
                                <a class="btn btn-primary w-100 mt-2" href="${demoBookingUrl}">Request a viewing</a>
                            </div>
                        </article>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</body>
</html>
