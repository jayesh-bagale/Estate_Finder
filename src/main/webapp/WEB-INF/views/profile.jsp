<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>My account | EstateFinders</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css" />
  <style>
    :root { --profile-navy:#0a2342; --profile-orange:#ff6a3d; --profile-muted:#64748b; --profile-line:#e6edf5; }
    body { background:#f4f7fb; }
    .profile-page { max-width:1160px; }
    .profile-hero { position:relative; overflow:hidden; border:0; border-radius:24px; color:#fff; background:linear-gradient(120deg,#0a2342,#1b4777); }
    .profile-hero:after { content:""; position:absolute; width:240px; height:240px; right:-70px; top:-105px; border:38px solid rgba(255,255,255,.07); border-radius:50%; }
    .avatar { display:flex; align-items:center; justify-content:center; width:70px; height:70px; border-radius:22px; background:linear-gradient(135deg,#ff6a3d,#ff9d2f); color:white; font-size:1.75rem; font-weight:800; }
    .profile-hero .btn { position:relative; z-index:1; }
    .summary-card,.panel-card { height:100%; border:1px solid var(--profile-line); border-radius:18px; background:#fff; box-shadow:0 12px 30px rgba(10,35,66,.05); }
    .summary-icon { display:flex; width:44px; height:44px; align-items:center; justify-content:center; border-radius:14px; color:var(--profile-orange); background:#fff0eb; }
    .summary-value { color:var(--profile-navy); font-size:1.75rem; font-weight:800; }
    .section-title { color:var(--profile-navy); font-weight:800; }
    .form-label { color:#334155; font-weight:700; }
    .form-control { min-height:46px; }
    .readonly-field { background:#f4f7fb !important; color:#526174; }
    .booking-row:last-child { border-bottom:0 !important; }
    .status-badge { display:inline-block; padding:6px 10px; border-radius:999px; font-size:.75rem; font-weight:800; text-transform:uppercase; }
    .status-pending { color:#8a5a00; background:#fff2cc; }
    .status-accepted { color:#176b3a; background:#dff7e8; }
    .status-declined { color:#a52a2a; background:#ffe3e3; }
    .quick-link { display:flex; align-items:center; gap:12px; padding:14px 16px; border:1px solid var(--profile-line); border-radius:14px; color:var(--profile-navy); font-weight:700; transition:transform .18s ease, box-shadow .18s ease; }
    .quick-link:hover { transform:translateY(-2px); color:var(--profile-orange); box-shadow:0 8px 20px rgba(10,35,66,.08); }
    .quick-link i { width:20px; color:var(--profile-orange); }
    @media (max-width:575px) { .profile-hero .btn { width:100%; } .profile-hero .hero-actions { width:100%; } }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand fw-bold" href="<c:url value='/project'/>"><i class="fa-solid fa-house me-2"></i>EstateFinders</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#profileNav" aria-controls="profileNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="profileNav">
      <div class="navbar-nav ms-auto align-items-lg-center">
        <a class="nav-link" href="<c:url value='/project'/>">Home</a>
        <a class="nav-link" href="<c:url value='/buy'/>">Buy</a>
        <a class="nav-link" href="<c:url value='/rent'/>">Rent</a>
        <a class="nav-link" href="<c:url value='/property/sell-property'/>">Sell property</a>
        <form action="<c:url value='/customer/logout'/>" method="post" class="ms-lg-3 mt-2 mt-lg-0">
          <button type="submit" class="btn btn-outline-light btn-sm"><i class="fa-solid fa-arrow-right-from-bracket me-1"></i>Log out</button>
        </form>
      </div>
    </div>
  </div>
</nav>

<main class="container profile-page py-4 py-lg-5">
  <section class="profile-hero p-4 p-md-5 mb-4">
    <div class="d-flex flex-column flex-md-row align-items-md-center gap-3 position-relative">
      <div class="avatar"><c:choose><c:when test="${not empty profileUser.fullName}"><c:out value="${fn:toUpperCase(fn:substring(profileUser.fullName, 0, 1))}" /></c:when><c:otherwise><i class="fa-solid fa-user"></i></c:otherwise></c:choose></div>
      <div class="flex-grow-1">
        <p class="mb-1 text-white-50">CUSTOMER DASHBOARD</p>
        <h1 class="h2 fw-bold mb-1">Welcome, <c:out value="${profileUser.fullName}" /></h1>
        <p class="mb-0 text-white-50">Manage your account and keep track of your property enquiries.</p>
      </div>
      <div class="hero-actions d-flex flex-column flex-sm-row gap-2">
        <a href="<c:url value='/buy'/>" class="btn btn-light fw-bold"><i class="fa-solid fa-magnifying-glass me-2"></i>Explore homes</a>
      </div>
    </div>
  </section>

  <c:if test="${not empty profileSuccess}"><div class="alert alert-success" role="alert"><c:out value="${profileSuccess}"/></div></c:if>
  <c:if test="${not empty profileError}"><div class="alert alert-danger" role="alert"><c:out value="${profileError}"/></div></c:if>
  <c:if test="${not empty passwordSuccess}"><div class="alert alert-success" role="alert"><c:out value="${passwordSuccess}"/></div></c:if>
  <c:if test="${not empty passwordError}"><div class="alert alert-danger" role="alert"><c:out value="${passwordError}"/></div></c:if>
  <c:if test="${not empty successMessage}"><div class="alert alert-success" role="alert"><c:out value="${successMessage}"/></div></c:if>

  <section class="row g-3 mb-4" aria-label="Account overview">
    <div class="col-sm-4">
      <div class="summary-card p-3 p-md-4 d-flex align-items-center gap-3">
        <span class="summary-icon"><i class="fa-regular fa-paper-plane"></i></span>
        <div><div class="summary-value"><c:out value="${bookingCount}"/></div><div class="text-secondary">Total enquiries</div></div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="summary-card p-3 p-md-4 d-flex align-items-center gap-3">
        <span class="summary-icon"><i class="fa-regular fa-clock"></i></span>
        <div><div class="summary-value"><c:out value="${pendingCount}"/></div><div class="text-secondary">Pending replies</div></div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="summary-card p-3 p-md-4 d-flex align-items-center gap-3">
        <span class="summary-icon"><i class="fa-solid fa-circle-check"></i></span>
        <div><div class="summary-value"><c:out value="${acceptedCount}"/></div><div class="text-secondary">Accepted enquiries</div></div>
      </div>
    </div>
  </section>

  <section class="panel-card p-4 p-md-5 mb-4">
    <c:url value="/resources/images/estate3.jpg" var="propertyImageFallback"/>
    <div class="d-flex flex-column flex-sm-row justify-content-between gap-2 mb-4">
      <div><h2 class="h4 section-title mb-1">Personal information</h2><p class="text-secondary mb-0">Update your name and contact number.</p></div>
      <span class="text-secondary small align-self-sm-center"><i class="fa-solid fa-shield-halved me-1"></i>Email and username are kept as account identifiers.</span>
    </div>
    <form action="<c:url value='/profile/update'/>" method="post">
      <div class="row g-3">
        <div class="col-md-6">
          <label for="fullName" class="form-label">Full name</label>
          <input id="fullName" name="fullName" class="form-control" value="<c:out value='${profileUser.fullName}'/>" maxlength="120" required />
        </div>
        <div class="col-md-6">
          <label for="phoneNumber" class="form-label">Phone number</label>
          <input id="phoneNumber" name="phoneNumber" class="form-control" type="tel" value="<c:out value='${profileUser.phoneNumber}'/>" pattern="[0-9]{10}" maxlength="10" inputmode="numeric" required />
        </div>
        <div class="col-md-6">
          <label for="username" class="form-label">Username</label>
          <input id="username" class="form-control readonly-field" value="<c:out value='${profileUser.username}'/>" readonly />
        </div>
        <div class="col-md-6">
          <label for="email" class="form-label">Email address</label>
          <input id="email" class="form-control readonly-field" value="<c:out value='${profileUser.email}'/>" readonly />
        </div>
      </div>
      <button type="submit" class="btn btn-primary mt-4"><i class="fa-solid fa-floppy-disk me-2"></i>Save profile</button>
    </form>
  </section>

  <section class="panel-card p-4 p-md-5 mb-4">
    <div class="d-flex flex-column flex-sm-row justify-content-between gap-2 mb-4">
      <div>
        <h2 class="h4 section-title mb-1">My listed properties</h2>
        <p class="text-secondary mb-0">See the review status of properties you submitted.</p>
      </div>
      <span class="badge rounded-pill text-bg-light align-self-sm-center"><c:out value="${listedPropertyCount}"/> listings</span>
    </div>
    <c:choose>
      <c:when test="${not empty listedProperties}">
        <div class="table-responsive">
          <table class="table align-middle mb-0">
            <thead>
              <tr><th>Property</th><th>Purpose</th><th>Price</th><th>Review status</th></tr>
            </thead>
            <tbody>
              <c:forEach var="property" items="${listedProperties}">
                <tr>
                  <td>
                    <div class="d-flex align-items-center gap-3">
                      <c:choose>
                        <c:when test="${not empty property.imagePath}">
                          <img src="<c:url value='${property.imagePath}'/>" alt="" width="68" height="52" class="rounded-3" style="object-fit:cover" onerror="this.onerror=null;this.src='${propertyImageFallback}';">
                        </c:when>
                        <c:otherwise>
                          <img src="${propertyImageFallback}" alt="" width="68" height="52" class="rounded-3" style="object-fit:cover">
                        </c:otherwise>
                      </c:choose>
                      <div>
                        <div class="fw-bold">
                          <c:choose>
                            <c:when test="${property.status eq 'ACCEPTED'}">
                              <a href="<c:url value='/property/${property.id}'/>" class="text-decoration-none"><c:out value="${property.title}"/></a>
                            </c:when>
                            <c:otherwise><c:out value="${property.title}"/></c:otherwise>
                          </c:choose>
                        </div>
                        <small class="text-secondary"><c:out value="${property.locality}"/>, <c:out value="${property.city}"/></small>
                      </div>
                    </div>
                  </td>
                  <td><c:out value="${property.listingType}"/></td>
                  <td>₹<c:out value="${property.price}"/></td>
                  <td>
                    <c:choose>
                      <c:when test="${property.status eq 'ACCEPTED'}"><span class="status-badge status-accepted">Approved</span></c:when>
                      <c:when test="${property.status eq 'DECLINED' or property.status eq 'REJECTED'}"><span class="status-badge status-declined">Declined</span></c:when>
                      <c:otherwise><span class="status-badge status-pending">Pending review</span></c:otherwise>
                    </c:choose>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </c:when>
      <c:otherwise>
        <div class="text-center rounded-4 p-4" style="background:#f6f8fc">
          <div class="summary-icon mx-auto mb-3"><i class="fa-solid fa-house-circle-check"></i></div>
          <h3 class="h6 fw-bold">You have not listed a property yet</h3>
          <p class="text-secondary mb-3">Submit a property and its approval status will appear here.</p>
          <a href="<c:url value='/property/sell-property'/>" class="btn btn-primary btn-sm">List a property</a>
        </div>
      </c:otherwise>
    </c:choose>
  </section>

  <section class="row g-4 mb-4">
    <div class="col-lg-7">
      <div class="panel-card p-4 p-md-5">
        <h2 class="h4 section-title mb-1">My property enquiries</h2>
        <p class="text-secondary mb-4">Bookings submitted with your account email.</p>
        <c:choose>
          <c:when test="${not empty bookings}">
            <div class="table-responsive">
              <table class="table align-middle mb-0">
                <thead><tr><th>Property</th><th>Visit date</th><th>Status</th></tr></thead>
                <tbody>
                  <c:forEach var="booking" items="${bookings}">
                    <tr class="booking-row">
                      <td><div class="fw-bold"><c:out value="${booking.propertyName}"/></div><small class="text-secondary"><c:out value="${booking.locationName}"/></small></td>
                      <td><c:choose><c:when test="${not empty booking.bookingDate}"><c:out value="${booking.bookingDate}"/></c:when><c:otherwise>Not scheduled</c:otherwise></c:choose></td>
                      <td>
                        <c:choose>
                          <c:when test="${booking.status eq 'accepted' or booking.status eq 'APPROVED'}"><span class="status-badge status-accepted">Accepted</span></c:when>
                          <c:when test="${booking.status eq 'declined' or booking.status eq 'DECLINED'}"><span class="status-badge status-declined">Declined</span></c:when>
                          <c:otherwise><span class="status-badge status-pending"><c:out value="${booking.status}"/></span></c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </c:when>
          <c:otherwise>
            <div class="text-center rounded-4 p-4" style="background:#f6f8fc">
              <div class="summary-icon mx-auto mb-3"><i class="fa-regular fa-folder-open"></i></div>
              <h3 class="h6 fw-bold">No enquiries yet</h3>
              <p class="text-secondary mb-3">When you request a property visit, its status will appear here.</p>
              <a href="<c:url value='/buy'/>" class="btn btn-primary btn-sm">Find a home</a>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
    <div class="col-lg-5">
      <div class="panel-card p-4 p-md-5">
        <h2 class="h4 section-title mb-1">Security</h2>
        <p class="text-secondary mb-4">Use 8+ characters with uppercase, lowercase, a number, and a special character. No spaces; maximum 72 UTF-8 bytes.</p>
        <form action="<c:url value='/profile/password'/>" method="post">
          <div class="mb-3">
            <label for="currentPassword" class="form-label">Current password</label>
            <input id="currentPassword" name="currentPassword" type="password" class="form-control" autocomplete="current-password" required />
          </div>
          <div class="mb-3">
            <label for="newPassword" class="form-label">New password</label>
            <input id="newPassword" name="newPassword" type="password" class="form-control" minlength="8" maxlength="72" pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9\s])\S{8,72}" title="Use 8+ characters with uppercase, lowercase, a number, and a special character. No spaces." autocomplete="new-password" required />
          </div>
          <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm new password</label>
            <input id="confirmPassword" name="confirmPassword" type="password" class="form-control" minlength="8" maxlength="72" pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9\s])\S{8,72}" title="Use the same password rules as above." autocomplete="new-password" required />
          </div>
          <button type="submit" class="btn btn-outline-primary w-100"><i class="fa-solid fa-key me-2"></i>Change password</button>
        </form>
      </div>
    </div>
  </section>

  <section class="panel-card p-4 p-md-5">
    <h2 class="h4 section-title mb-3">Quick links</h2>
    <div class="row g-3">
      <div class="col-sm-6 col-lg-3"><a class="quick-link" href="<c:url value='/buy'/>"><i class="fa-solid fa-house"></i>Buy a property</a></div>
      <div class="col-sm-6 col-lg-3"><a class="quick-link" href="<c:url value='/rent'/>"><i class="fa-solid fa-key"></i>Find a rental</a></div>
      <div class="col-sm-6 col-lg-3"><a class="quick-link" href="<c:url value='/property/sell-property'/>"><i class="fa-solid fa-tag"></i>Sell a property</a></div>
      <div class="col-sm-6 col-lg-3"><a class="quick-link" href="<c:url value='/contact'/>"><i class="fa-regular fa-message"></i>Contact support</a></div>
    </div>
  </section>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
