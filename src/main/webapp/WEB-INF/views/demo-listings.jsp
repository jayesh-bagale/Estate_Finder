<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty cityDemoListings}">
    <section class="container my-5" aria-labelledby="demoListingsHeading">
        <h2 id="demoListingsHeading" class="mb-3">Property listings</h2>
        <div class="row g-3">
            <c:forEach var="listing" items="${cityDemoListings}">
                <div class="col-sm-6 col-xl-4">
                    <article class="card h-100 shadow-sm">
                        <img class="card-img-top" src="<c:out value='${listing.image}'/>"
                             alt="Illustrative image for <c:out value='${listing.name}'/>"
                             loading="lazy" style="height:200px;object-fit:cover"
                             onerror="this.onerror=null;this.src='<c:url value='/resources/images/estate3.jpg'/>';">
                        <div class="card-body d-flex flex-column">
                            <span class="badge text-bg-warning align-self-start mb-2">Demo preview</span>
                            <span class="badge text-bg-secondary align-self-start mb-2">
                                <c:out value="${listing.category}"/> · <c:out value="${listing.transactionType}"/>
                            </span>
                            <h3 class="h5"><c:out value="${listing.name}"/></h3>
                            <p class="text-muted mb-2">
                                <c:out value="${listing.locality}"/>, <c:out value="${listing.cityName}"/>
                            </p>
                            <p><c:out value="${listing.description}"/></p>
                            <p class="small text-muted">
                                <c:out value="${listing.propertyType}"/> · <c:out value="${listing.furnishing}"/>
                                · <c:out value="${listing.areaSqFt}"/> sq ft
                            </p>
                            <p class="fw-bold mt-auto"><c:out value="${listing.price}"/></p>
                            <a class="btn btn-outline-primary mb-2"
                               href="<c:url value='/properties/listing/${listing.id}'/>">View details</a>
                            <c:url var="propertyRequestUrl" value="/booking">
                                <c:param name="propertyName" value="${listing.name}"/>
                                <c:param name="propertyType" value="${listing.propertyType}"/>
                                <c:param name="locationName" value="${listing.locality}, ${listing.cityName}"/>
                                <c:param name="builderName" value="EstateFinders demo listing"/>
                            </c:url>
                            <a class="btn btn-primary" href="<c:out value='${propertyRequestUrl}'/>">
                                <c:choose>
                                    <c:when test="${listing.transactionType eq 'SALE'}">Buy this property</c:when>
                                    <c:otherwise>Rent this property</c:otherwise>
                                </c:choose>
                            </a>
                            <a class="small mt-2" target="_blank" rel="noopener"
                               href="https://www.openstreetmap.org/?mlat=<c:out value='${listing.latitude}'/>&amp;mlon=<c:out value='${listing.longitude}'/>&amp;zoom=16">
                                Approximate locality map
                            </a>
                        </div>
                    </article>
                </div>
            </c:forEach>
        </div>
    </section>
</c:if>
