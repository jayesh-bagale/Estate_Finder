<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title} | EstateFinders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f5f7fa; color: #243447; }
        .navbar { background: #123047; }
        .hero { max-width: 1100px; margin: 48px auto; }
        .property-image { width: 100%; height: 420px; object-fit: cover; border-radius: 12px; }
        .detail-panel { background: #fff; border-radius: 12px; padding: 32px; box-shadow: 0 8px 28px rgba(18, 48, 71, .12); }
        .price { color: #0b7285; font-size: 1.6rem; font-weight: 700; }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
<nav class="navbar navbar-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">ESTATEFINDERS</a>
        <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/rent">Back to Rent</a>
    </div>
</nav>
<main class="container hero">
    <div class="row g-4 align-items-center">
        <div class="col-lg-7">
            <img class="property-image" src="<c:url value='${image}'/>" alt="${title}">
        </div>
        <div class="col-lg-5">
            <section class="detail-panel">
                <span class="badge text-bg-success mb-3">Available for Rent</span>
                <h1 class="h2">${title}</h1>
                <p class="text-muted mb-3"><i class="bi bi-geo-alt"></i>${location}</p>
                <p class="price">${price}</p>
                <p class="mt-4">${description}</p>
                <hr>
                <div class="row text-muted small mb-4">
                    <div class="col-6">Verified listing</div>
                    <div class="col-6">Site visit available</div>
                </div>
                <a class="btn btn-primary w-100" href="${pageContext.request.contextPath}/contact">Contact for Visit</a>
            </section>
        </div>
    </div>
</main>
</body>
</html>
