<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Request a property | EstateFinders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/site-polish.css'/>" rel="stylesheet">
    <style>
        .booking-page { width: min(760px, calc(100% - 28px)); margin: 0 auto; padding: 44px 0 60px; }
        .booking-card { padding: clamp(20px, 4vw, 36px); border: 1px solid #e6edf5; border-radius: 22px; background: #fff; box-shadow: 0 18px 38px rgba(10,35,66,.08); }
        .booking-card h1 { font-size: clamp(1.8rem, 3vw, 2.5rem); font-weight: 800; letter-spacing: -.035em; }
        .booking-intro { color: #64748b; margin-bottom: 24px; }
        .booking-card label { color: #0a2342; font-weight: 700; }
        .booking-card .form-control { min-height: 48px; border-radius: 11px; }
        .booking-card textarea.form-control { min-height: 110px; }
        .booking-submit { min-height: 50px; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="<c:url value='/project'/>">
            <i class="fa-solid fa-house me-2"></i>EstateFinders
        </a>
        <div class="ms-auto d-flex flex-wrap gap-3">
            <a class="nav-link" href="<c:url value='/buy'/>">Buy</a>
            <a class="nav-link" href="<c:url value='/rent'/>">Rent</a>
            <a class="nav-link" href="<c:url value='/contact'/>">Contact</a>
        </div>
    </div>
</nav>

<main class="booking-page">
    <section class="booking-card">
        <span class="badge rounded-pill text-bg-light mb-3">Viewing / purchase / rental inquiry</span>
        <h1>Request this property</h1>
        <p class="booking-intro">Share your contact details and our team will follow up. No online payment will be taken.</p>

        <form action="<c:url value='/booking'/>" method="post">
            <c:if test="${not empty booking.propertyId}">
                <input type="hidden" name="propertyId" value="<c:out value='${booking.propertyId}'/>">
            </c:if>
            <div class="row g-3 mb-3">
                <div class="col-sm-6">
                    <label class="form-label" for="firstName">First name</label>
                    <input class="form-control" id="firstName" type="text" name="firstName"
                           autocomplete="given-name" required>
                </div>
                <div class="col-sm-6">
                    <label class="form-label" for="lastName">Last name</label>
                    <input class="form-control" id="lastName" type="text" name="lastName"
                           autocomplete="family-name" required>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label" for="email">Email</label>
                <input class="form-control" id="email" type="email" name="email"
                       autocomplete="email" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="phone">Phone</label>
                <input class="form-control" id="phone" type="tel" name="phone"
                       autocomplete="tel" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="propertyType">Property type</label>
                <input class="form-control" id="propertyType" type="text" name="propertyType"
                       value="<c:out value='${booking.propertyType}'/>" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="propertyName">Property name</label>
                <input class="form-control" id="propertyName" type="text" name="propertyName"
                       value="<c:out value='${booking.propertyName}'/>" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="builderName">Builder / listing source</label>
                <input class="form-control" id="builderName" type="text" name="builderName"
                       value="<c:out value='${booking.builderName}'/>" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="locationName">Location</label>
                <input class="form-control" id="locationName" type="text" name="locationName"
                       value="<c:out value='${booking.locationName}'/>" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="bookingDate">Preferred visit date</label>
                <input class="form-control" id="bookingDate" type="date" name="bookingDate"
                       value="<c:out value='${booking.bookingDate}'/>">
            </div>

            <div class="mb-4">
                <label class="form-label" for="specialRequests">Additional notes</label>
                <textarea class="form-control" id="specialRequests" name="specialRequests"
                          placeholder="Tell us when you'd like to visit or ask a question"></textarea>
            </div>

            <button class="btn btn-primary booking-submit w-100" type="submit">
                Send property request
            </button>
        </form>
    </section>
</main>
</body>
</html>
