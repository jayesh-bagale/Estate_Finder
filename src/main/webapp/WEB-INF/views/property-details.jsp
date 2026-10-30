<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${title}"/> | EstateFinders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root { --housing-blue:#0a2342; --housing-orange:#ff6a3d; --housing-soft:#f5f7fb; --housing-muted:#64748b; --housing-line:#e9eef5; }
        * { box-sizing:border-box; }
        body { margin:0; font-family:"Segoe UI", Arial, sans-serif; background: linear-gradient(180deg,#f8fbff,#edf4ff); color:var(--housing-blue); }
        a { text-decoration:none; }
        .topbar { background: rgba(10,35,66,0.97); position: sticky; top:0; z-index:20; }
        .topbar-inner { width:min(1180px, calc(100% - 28px)); margin:0 auto; min-height:72px; display:flex; align-items:center; justify-content:space-between; gap:18px; }
        .brand { display:inline-flex; align-items:center; gap:10px; color:#fff; font-weight:800; }
        .brand-mark { width:36px; height:36px; border-radius:12px; display:inline-flex; align-items:center; justify-content:center; background: linear-gradient(135deg,#ff6a3d,#ff9d2f); }
        .nav-links { display:flex; flex-wrap:wrap; gap:16px; }
        .nav-links a { color: rgba(255,255,255,0.8); font-weight:600; }
        .nav-links a:hover { color:#fff; }
        .cta-btn { display:inline-flex; align-items:center; justify-content:center; border-radius:999px; padding:10px 18px; background:linear-gradient(135deg,#ff6a3d,#ff8f59); color:#fff; font-weight:700; }
        .container-custom { width:min(1180px, calc(100% - 28px)); margin: 0 auto; padding: 42px 0 60px; }
        .details-grid { display:grid; grid-template-columns: 1.2fr .8fr; gap:22px; align-items:start; }
        .image-card, .info-card { background:white; border:1px solid var(--housing-line); border-radius:24px; box-shadow: 0 18px 38px rgba(10,35,66,0.06); }
        .image-card img { display:block; width:100%; height: 500px; object-fit:cover; border-radius:24px; }
        .info-card { padding: 28px; }
        .badge { display:inline-flex; align-items:center; padding:7px 12px; border-radius:999px; background: rgba(34,197,94,0.08); color: #15803d; font-weight:800; font-size:0.75rem; }
        .info-card h1 { margin: 16px 0 8px; font-size: clamp(2rem, 3vw, 2.8rem); font-weight:800; letter-spacing:-0.04em; }
        .location { color: var(--housing-muted); font-size:1rem; margin-bottom:18px; }
        .desc { color: var(--housing-muted); line-height:1.8; margin:0; }
        .price { margin: 18px 0; color: var(--housing-orange); font-size: 1.8rem; font-weight: 850; }
        .detail-section { margin-top: 24px; padding: 24px; background: #fff; border:1px solid var(--housing-line); border-radius:20px; box-shadow: 0 12px 28px rgba(10,35,66,0.05); }
        .detail-section h2 { margin:0 0 18px; font-size:1.25rem; font-weight:800; }
        .facts-grid { display:grid; grid-template-columns:repeat(2,minmax(0,1fr)); gap:12px; }
        .fact { min-width:0; padding:14px; border-radius:14px; background:#f8faff; }
        .fact-label { display:block; margin-bottom:5px; color:var(--housing-muted); font-size:.78rem; font-weight:700; text-transform:uppercase; letter-spacing:.04em; }
        .fact-value { color:var(--housing-blue); font-weight:700; overflow-wrap:anywhere; }
        .map-frame { display:block; width:100%; height:350px; border:0; border-radius:14px; background:#f1f5f9; }
        .map-link { display:inline-flex; margin-top:12px; color:#155eaa; font-weight:700; }
        .demo-note { color:var(--housing-muted); font-size:.85rem; }
        .cta-row { margin-top:20px; }
        .cta-row a { display:inline-flex; align-items:center; justify-content:center; width:100%; min-height:52px; border-radius:12px; }
        @media (max-width: 860px) { .details-grid { grid-template-columns: 1fr; } }
        @media (max-width:640px) { .topbar-inner { flex-wrap:wrap; justify-content:center; padding:12px 0; } .nav-links { justify-content:center; } .image-card img { height:300px; } .facts-grid { grid-template-columns:1fr; } .detail-section { padding:18px; } .map-frame { height:280px; } }
    </style>
</head>
<body>
    <nav class="topbar">
      <div class="topbar-inner">
        <a href="${pageContext.request.contextPath}/project" class="brand">
          <span class="brand-mark"><i class="fa-solid fa-house"></i></span>
          <span>EstateFinders</span>
        </a>
        <div class="nav-links">
          <a href="${pageContext.request.contextPath}/buy">Buy</a>
          <a href="${pageContext.request.contextPath}/rent">Rent</a>
          <a href="${pageContext.request.contextPath}/property/sell-property">Sell</a>
          <a href="${pageContext.request.contextPath}/search">Explore</a>
          <a href="${pageContext.request.contextPath}/contact">Contact</a>
        </div>
        <c:choose>
          <c:when test="${not empty sessionScope['estatefinder.userId']}">
            <a class="cta-btn" href="${pageContext.request.contextPath}/profile">My Profile</a>
            <form action="${pageContext.request.contextPath}/customer/logout" method="post">
              <button class="cta-btn" type="submit">Logout</button>
            </form>
          </c:when>
          <c:otherwise><a class="cta-btn" href="${pageContext.request.contextPath}/login">Login</a></c:otherwise>
        </c:choose>
        <a class="cta-btn" href="${pageContext.request.contextPath}/property/sell-property">Sell Property</a>
      </div>
    </nav>

    <main class="container-custom">
        <c:set var="mapLocation" value="${location}${not empty city ? ', ' : ''}${city}${not empty postalCode ? ' ' : ''}${postalCode}"/>
        <c:url value="https://www.google.com/maps" var="mapEmbedUrl">
            <c:param name="q" value="${mapLocation}"/>
            <c:param name="output" value="embed"/>
        </c:url>
        <c:url value="https://www.google.com/maps/search/" var="mapSearchUrl">
            <c:param name="api" value="1"/>
            <c:param name="query" value="${mapLocation}"/>
        </c:url>
        <div class="details-grid">
            <div class="image-card">
                <img src="<c:url value='${image}'/>" alt="<c:out value='${title}'/>">
            </div>
            <div class="info-card">
                <span class="badge"><c:choose><c:when test="${demoListing}">Demo listing</c:when><c:otherwise>Approved listing</c:otherwise></c:choose></span>
                <h1><c:out value="${title}"/></h1>
                <div class="location"><i class="fa-solid fa-location-dot"></i> <c:out value="${mapLocation}"/></div>
                <div class="price">
                    <c:choose>
                        <c:when test="${demoListing}"><c:out value="${price}"/></c:when>
                        <c:otherwise>₹<c:out value="${price}"/></c:otherwise>
                    </c:choose>
                </div>
                <p class="desc"><c:out value="${description}"/></p>
                <div class="cta-row">
                    <c:choose>
                        <c:when test="${not empty propertyId}">
                            <c:url value="/booking" var="bookingUrl">
                                <c:param name="propertyId" value="${propertyId}"/>
                                <c:param name="propertyName" value="${title}"/>
                                <c:param name="propertyType" value="${listingType}"/>
                                <c:param name="locationName" value="${mapLocation}"/>
                            </c:url>
                            <a class="btn btn-primary" href="${bookingUrl}">Request a viewing</a>
                        </c:when>
                        <c:when test="${demoListing}">
                            <c:url value="/booking" var="demoBookingUrl">
                                <c:param name="propertyName" value="${title}"/>
                                <c:param name="propertyType" value="${propertyType}"/>
                                <c:param name="locationName" value="${mapLocation}"/>
                                <c:param name="builderName" value="EstateFinders demo listing"/>
                            </c:url>
                            <a class="btn btn-primary" href="${demoBookingUrl}">Request a viewing</a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/contact">Contact team</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <section class="detail-section" aria-labelledby="propertyOverviewTitle">
            <h2 id="propertyOverviewTitle"><i class="fa-solid fa-circle-info me-2"></i>Property overview</h2>
            <div class="facts-grid">
                <div class="fact">
                    <span class="fact-label">Owner</span>
                    <span class="fact-value">
                        <c:choose>
                            <c:when test="${not empty ownerName}"><c:out value="${ownerName}"/></c:when>
                            <c:when test="${demoListing}">Not provided for this demo listing</c:when>
                            <c:otherwise>Owner details not provided</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="fact">
                    <span class="fact-label">Listing type</span>
                    <span class="fact-value"><c:out value="${not empty propertyType ? propertyType : listingType}"/></span>
                </div>
                <c:if test="${not empty postalCode}">
                    <div class="fact"><span class="fact-label">PIN code</span><span class="fact-value"><c:out value="${postalCode}"/></span></div>
                </c:if>
                <c:if test="${not empty bedrooms}">
                    <div class="fact"><span class="fact-label">Bedrooms</span><span class="fact-value"><c:out value="${bedrooms}"/></span></div>
                </c:if>
                <c:if test="${not empty bathrooms}">
                    <div class="fact"><span class="fact-label">Bathrooms</span><span class="fact-value"><c:out value="${bathrooms}"/></span></div>
                </c:if>
                <c:if test="${not empty areaSqFt}">
                    <div class="fact"><span class="fact-label">Area</span><span class="fact-value"><c:out value="${areaSqFt}"/> sq ft</span></div>
                </c:if>
                <c:if test="${not empty furnishing}">
                    <div class="fact"><span class="fact-label">Furnishing</span><span class="fact-value"><c:out value="${furnishing}"/></span></div>
                </c:if>
                <c:if test="${not empty amenities}">
                    <div class="fact"><span class="fact-label">Amenities</span><span class="fact-value"><c:out value="${amenities}"/></span></div>
                </c:if>
            </div>
            <c:if test="${demoListing}">
                <p class="demo-note mt-3 mb-0">This is an illustrative preview listing. Details and map results may be approximate.</p>
            </c:if>
        </section>
        <c:if test="${not empty location}">
            <section class="detail-section" aria-labelledby="propertyLocationTitle">
                <h2 id="propertyLocationTitle"><i class="fa-solid fa-map-location-dot me-2"></i>Location &amp; map</h2>
                <p class="location"><c:out value="${mapLocation}"/></p>
                <iframe class="map-frame" src="<c:out value='${mapEmbedUrl}'/>" title="Google map for <c:out value='${mapLocation}'/>"
                        loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                <a class="map-link" href="<c:out value='${mapSearchUrl}'/>" target="_blank" rel="noopener noreferrer">
                    Open location in Google Maps <i class="fa-solid fa-arrow-up-right-from-square ms-2"></i>
                </a>
                <p class="demo-note mt-2 mb-0">Map results are based on the address and may be approximate.</p>
            </section>
        </c:if>
    </main>
</body>
</html>
