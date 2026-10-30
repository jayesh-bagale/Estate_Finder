<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>EstateFinders | Find your dream home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --housing-blue: #0a2342;
            --housing-navy: #112b4e;
            --housing-orange: #ff6a3d;
            --housing-gold: #ffc947;
            --housing-soft: #f4f6fb;
            --housing-text: #1a2334;
            --housing-muted: #64748b;
            --housing-card: #ffffff;
            --housing-line: #e4eaf3;
            --shadow-sm: 0 10px 25px rgba(17, 43, 78, 0.08);
            --shadow-md: 0 18px 40px rgba(17, 43, 78, 0.12);
        }

        * {
            box-sizing: border-box;
        }

        html, body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(180deg, #f8fafc 0%, #eef4ff 100%);
            color: var(--housing-text);
        }

        body {
            line-height: 1.5;
        }

        a {
            text-decoration: none;
        }

        .container-custom {
            width: min(1180px, calc(100% - 28px));
            margin: 0 auto;
        }

        .topbar {
            background: rgba(10, 35, 66, 0.94);
            color: #fff;
            position: sticky;
            top: 0;
            z-index: 50;
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .topbar-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            min-height: 74px;
            gap: 18px;
        }

        .brand {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            color: #fff;
            font-weight: 800;
            letter-spacing: 0.04em;
            font-size: 1.3rem;
        }

        .brand-mark {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--housing-orange), #ff9d2f);
            color: white;
            font-size: 1.05rem;
            box-shadow: 0 10px 24px rgba(255, 106, 61, 0.35);
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 14px;
            flex-wrap: wrap;
        }

        .nav-links a {
            color: rgba(255,255,255,0.8);
            font-size: 0.92rem;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .nav-links a:hover {
            color: #fff;
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .outline-btn, .solid-btn, .chip-btn {
            border-radius: 999px;
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-weight: 700;
            transition: 0.2s ease;
            text-decoration: none;
        }

        .outline-btn {
            background: transparent;
            color: #fff;
            border: 1px solid rgba(255,255,255,0.28);
            padding: 10px 18px;
        }

        .solid-btn {
            background: linear-gradient(135deg, var(--housing-orange), #ff8a59);
            color: #fff;
            padding: 10px 18px;
            box-shadow: 0 14px 22px rgba(255, 106, 61, 0.28);
        }

        .hero {
            background:
                linear-gradient(135deg, rgba(7, 20, 38, 0.6), rgba(13, 43, 69, 0.45)),
                url('https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=1800&q=80') center/cover no-repeat;
            min-height: 660px;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: "";
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, rgba(12, 36, 66, 0.18), rgba(12, 36, 66, 0.5));
        }

        .hero-inner {
            position: relative;
            z-index: 1;
            width: min(1180px, calc(100% - 28px));
            margin: 0 auto;
            padding: 56px 0 80px;
        }

        .hero-copy {
            max-width: 680px;
            color: white;
            margin-top: 28px;
        }

        .eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 14px;
            border-radius: 999px;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.14);
            color: #eaf1ff;
            font-size: 0.8rem;
            font-weight: 700;
            letter-spacing: 0.06em;
            text-transform: uppercase;
        }

        .hero h1 {
            font-size: clamp(2.4rem, 4vw, 4.5rem);
            line-height: 1.05;
            font-weight: 800;
            letter-spacing: -0.04em;
            margin: 18px 0 14px;
        }

        .hero p {
            color: rgba(255,255,255,0.8);
            font-size: 1.08rem;
            margin: 0 0 24px;
            max-width: 560px;
        }

        .hero-row {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 14px;
            margin-bottom: 30px;
        }

        .stat-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.14);
            border-radius: 999px;
            padding: 8px 12px;
            color: white;
            font-weight: 600;
        }

        .search-panel {
            background: rgba(255,255,255,0.96);
            border: 1px solid rgba(255,255,255,0.6);
            border-radius: 24px;
            box-shadow: var(--shadow-md);
            padding: 18px 18px 14px;
            max-width: 1060px;
            margin-top: 26px;
        }

        .search-form {
            display: grid;
            grid-template-columns: 1.4fr 1.2fr 1.5fr 1fr;
            gap: 12px;
            align-items: end;
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 8px;
            min-width: 0;
        }

        .field label {
            font-size: 0.78rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--housing-muted);
            font-weight: 700;
        }

        .field select,
        .field input {
            width: 100%;
            min-height: 52px;
            border: 1px solid var(--housing-line);
            border-radius: 14px;
            background: #fff;
            padding: 0 16px;
            font-size: 1rem;
            color: var(--housing-text);
            outline: none;
        }

        .search-btn {
            min-height: 52px;
            border: none;
            background: linear-gradient(135deg, var(--housing-orange), #ff8a59);
            color: white;
            border-radius: 14px;
            font-size: 1rem;
            font-weight: 800;
            box-shadow: 0 16px 24px rgba(255, 106, 61, 0.18);
        }

        .quick-links-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 16px;
        }

        .chip-btn {
            background: rgba(10, 35, 66, 0.04);
            color: var(--housing-blue);
            padding: 8px 14px;
            font-size: 0.8rem;
            font-weight: 700;
            border: 1px solid rgba(10, 35, 66, 0.08);
        }

        main {
            padding: 44px 0 60px;
        }

        .section {
            margin-bottom: 42px;
        }

        .section-head {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            margin-bottom: 18px;
        }

        .section-head h2 {
            margin: 0;
            font-size: clamp(1.6rem, 2vw, 2.3rem);
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .section-head a {
            color: var(--housing-orange);
            font-weight: 700;
        }

        .category-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 18px;
        }

        .category-card {
            background: var(--housing-card);
            border-radius: 20px;
            padding: 22px 18px;
            border: 1px solid var(--housing-line);
            box-shadow: var(--shadow-sm);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .category-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        .category-icon {
            width: 52px;
            height: 52px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 16px;
            background: linear-gradient(135deg, rgba(255, 106, 61, 0.12), rgba(255, 201, 71, 0.18));
            color: var(--housing-orange);
            font-size: 1.3rem;
            margin-bottom: 14px;
        }

        .category-card h3 {
            margin: 0 0 7px;
            font-size: 1.2rem;
            font-weight: 800;
        }

        .category-card p {
            margin: 0;
            color: var(--housing-muted);
            font-size: 0.96rem;
        }

        .listing-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 22px;
        }

        .listing-card {
            background: var(--housing-card);
            border: 1px solid var(--housing-line);
            border-radius: 22px;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .listing-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-md);
        }

        .listing-image {
            position: relative;
            height: 200px;
            overflow: hidden;
        }

        .listing-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .listing-badge {
            position: absolute;
            top: 14px;
            left: 14px;
            padding: 7px 10px;
            border-radius: 999px;
            background: rgba(255,255,255,0.9);
            color: var(--housing-blue);
            font-size: 0.72rem;
            font-weight: 800;
            letter-spacing: 0.03em;
            text-transform: uppercase;
        }

        .listing-body {
            padding: 18px 18px 20px;
        }

        .listing-topline {
            display: flex;
            justify-content: space-between;
            gap: 12px;
            color: var(--housing-muted);
            font-size: 0.8rem;
            margin-bottom: 10px;
        }

        .listing-body h3 {
            margin: 0 0 10px;
            font-size: 1.18rem;
            font-weight: 800;
            line-height: 1.3;
        }

        .listing-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            color: var(--housing-muted);
            margin-bottom: 12px;
            font-size: 0.85rem;
        }

        .listing-meta span {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #f8faff;
            padding: 7px 8px;
            border-radius: 10px;
        }

        .listing-price {
            display: flex;
            align-items: baseline;
            justify-content: space-between;
            gap: 10px;
            margin-top: 10px;
        }

        .listing-price strong {
            color: var(--housing-blue);
            font-size: 1.4rem;
            letter-spacing: -0.03em;
        }

        .listing-price span {
            font-size: 0.82rem;
            color: var(--housing-muted);
            font-weight: 700;
        }

        .city-showcase {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
        }

        .city-card {
            position: relative;
            min-height: 250px;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            background: linear-gradient(180deg, rgba(9, 17, 31, 0.1), rgba(9, 17, 31, 0.64)),
                url('https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=900&q=80') center/cover no-repeat;
        }

        .city-card:nth-child(2) {
            background: linear-gradient(180deg, rgba(9, 17, 31, 0.1), rgba(9, 17, 31, 0.64)),
                url('https://images.unsplash.com/photo-1523217582562-09d0def993a6?auto=format&fit=crop&w=900&q=80') center/cover no-repeat;
        }

        .city-card:nth-child(3) {
            background: linear-gradient(180deg, rgba(9, 17, 31, 0.1), rgba(9, 17, 31, 0.64)),
                url('https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=900&q=80') center/cover no-repeat;
        }

        .city-card-inner {
            position: absolute;
            inset: 0;
            display: flex;
            flex-direction: column;
            justify-content: end;
            padding: 22px;
            color: white;
            background: linear-gradient(180deg, transparent, rgba(7,21,39,0.66));
        }

        .city-card-inner h3 {
            margin: 0 0 6px;
            font-size: 1.7rem;
            font-weight: 800;
        }

        .city-card-inner p {
            margin: 0;
            color: rgba(255,255,255,0.8);
            font-weight: 600;
        }

        .feature-box {
            background: var(--housing-card);
            border: 1px solid var(--housing-line);
            box-shadow: var(--shadow-sm);
            border-radius: 24px;
            padding: 30px 28px;
        }

        .feature-box-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 18px;
        }

        .feature-item {
            padding: 18px 12px;
            border-radius: 18px;
            background: linear-gradient(180deg, #f9fbff 0%, #f4f8ff 100%);
            border: 1px solid #edf2ff;
        }

        .feature-item .icon {
            width: 46px;
            height: 46px;
            border-radius: 14px;
            background: linear-gradient(135deg, rgba(255,106,61,0.12), rgba(255,201,71,0.18));
            color: var(--housing-orange);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.15rem;
            margin-bottom: 12px;
        }

        .feature-item h4 {
            margin: 0 0 8px;
            font-size: 1.1rem;
            font-weight: 800;
        }

        .feature-item p {
            margin: 0;
            color: var(--housing-muted);
            font-size: 0.96rem;
        }

        .cta-strip {
            background: linear-gradient(135deg, #0d2344, #123b72);
            border-radius: 28px;
            padding: 32px 28px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            box-shadow: var(--shadow-md);
        }

        .cta-strip h3 {
            margin: 0 0 6px;
            font-size: clamp(1.7rem, 2.5vw, 2.6rem);
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .cta-strip p {
            margin: 0;
            color: rgba(255,255,255,0.75);
        }

        footer {
            background: #091b30;
            color: rgba(255,255,255,0.8);
            padding: 42px 0 18px;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: 1.5fr 1fr 1fr 1.3fr;
            gap: 24px;
        }

        .footer-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 16px;
            color: white;
            font-weight: 800;
            font-size: 1.4rem;
        }

        .footer p,
        .footer li,
        .footer a {
            color: rgba(255,255,255,0.72);
            font-size: 0.96rem;
        }

        .footer ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .footer-bottom {
            margin-top: 26px;
            border-top: 1px solid rgba(255,255,255,0.12);
            padding-top: 18px;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            color: rgba(255,255,255,0.7);
        }

        @media (max-width: 1100px) {
            .search-form {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
            .category-grid,
            .listing-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
            .footer-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 760px) {
            .topbar-inner {
                flex-wrap: wrap;
                padding: 12px 0;
            }
            .nav-links {
                width: 100%;
                justify-content: center;
            }
            .nav-actions {
                width: 100%;
                justify-content: center;
            }
            .search-form,
            .category-grid,
            .listing-grid,
            .city-showcase,
            .feature-box-grid,
            .footer-grid {
                grid-template-columns: 1fr;
            }
            .hero {
                min-height: 760px;
            }
            .cta-strip {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <nav class="topbar">
        <div class="container-custom topbar-inner">
            <a class="brand" href="<c:url value='/project'/>">
                <span class="brand-mark"><i class="fa-solid fa-house"></i></span>
                <span>EstateFinders</span>
            </a>

            <div class="nav-links">
                <a href="<c:url value='/buy'/>">Buy</a>
                <a href="<c:url value='/rent'/>">Rent</a>
                <a href="<c:url value='/property/sell-property'/>">Sell</a>
                <a href="<c:url value='/search?city=nashik'/>">New Projects</a>
                <a href="<c:url value='/search?type=Commercial%20Space'/>">Commercial</a>
                <a href="<c:url value='/tools'/>">Tools</a>
                <a href="<c:url value='/about'/>">About</a>
            </div>

            <div class="nav-actions">
                <c:choose>
                    <c:when test="${not empty sessionScope['estatefinder.userId']}">
                        <a class="outline-btn" href="<c:url value='/profile'/>">My Profile</a>
                        <form action="<c:url value='/customer/logout'/>" method="post" class="d-inline">
                            <button class="outline-btn" type="submit">Logout</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <a class="outline-btn" href="<c:url value='/login'/>">Login</a>
                    </c:otherwise>
                </c:choose>
                <c:if test="${empty sessionScope['estatefinder.userId']}">
                    <a class="outline-btn" href="<c:url value='/adminlogin'/>">
                        <i class="fa-solid fa-user-shield" aria-hidden="true"></i> Admin Login
                    </a>
                </c:if>
                <a class="solid-btn" href="<c:url value='/property/sell-property'/>">Sell Property</a>
            </div>
        </div>
    </nav>

    <c:if test="${not empty successMessage}">
        <div class="container-custom" role="status">
            <div class="alert alert-success mt-3 mb-0">${successMessage}</div>
        </div>
    </c:if>

    <header class="hero">
        <div class="hero-inner">
            <div class="hero-copy">
                <div class="eyebrow"><i class="fa-solid fa-map-location-dot"></i> Real estate made simple</div>
                <h1>Find homes that match your life.</h1>
                <p>Explore verified apartments, villas, rental homes and commercial spaces across India’s top cities. Smart search, transparent pricing and trusted listings.</p>
                <div class="hero-row">
                    <div class="stat-pill"><i class="fa-solid fa-circle-check"></i> 10,000+ verified listings</div>
                    <div class="stat-pill"><i class="fa-solid fa-building-columns"></i> Trusted by families & investors</div>
                </div>
            </div>

            <div class="search-panel">
                <form class="search-form" action="<c:url value='/search'/>" method="get">
                    <div class="field">
                        <label for="city">Location</label>
                        <select id="city" name="city">
                            <option value="">Select city</option>
                            <option value="nashik">Nashik</option>
                            <option value="mumbai">Mumbai</option>
                            <option value="pune">Pune</option>
                            <option value="sambhajinagar">Chhatrapati Sambhajinagar</option>
                            <option value="jalgaon">Jalgaon</option>
                            <option value="thane">Thane</option>
                            <option value="west-thane">West Thane</option>
                        </select>
                    </div>

                    <div class="field">
                        <label for="type">Type</label>
                        <select id="type" name="type">
                            <option value="">Buy or rent</option>
                            <option value="Residential Sale">Residential Sale</option>
                            <option value="Residential Rental">Residential Rental</option>
                            <option value="Commercial Space">Commercial Space</option>
                            <option value="Developer Project">Developer Project</option>
                        </select>
                    </div>

                    <div class="field">
                        <label for="query">Search</label>
                        <input id="query" type="text" name="query" placeholder="Locality, property or project" />
                    </div>

                    <button class="search-btn" type="submit"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
                </form>

                <div class="quick-links-row">
                    <a class="chip-btn" href="<c:url value='/search?city=thane&type=Residential%20Sale'/>">Apartments in Thane</a>
                    <a class="chip-btn" href="<c:url value='/search?city=nashik&type=Residential%20Rental'/>">Rent in Nashik</a>
                    <a class="chip-btn" href="<c:url value='/search?type=Commercial%20Space'/>">Commercial spaces</a>
                    <a class="chip-btn" href="<c:url value='/tools'/>">Home loan tools</a>
                </div>
            </div>
        </div>
    </header>

    <main>
        <div class="container-custom">
            <section class="section">
                <div class="section-head">
                    <h2>Browse by property type</h2>
                    <a href="<c:url value='/search'/>">Explore all</a>
                </div>

                <div class="category-grid">
                    <div class="category-card">
                        <div class="category-icon"><i class="fa-solid fa-building"></i></div>
                        <h3>Buy a home</h3>
                        <p>Explore apartments, villas and premium homes in fast-growing neighborhoods.</p>
                    </div>

                    <div class="category-card">
                        <div class="category-icon"><i class="fa-solid fa-key"></i></div>
                        <h3>Rent</h3>
                        <p>Short-term and long-term homes with verified landlords and flexible moves.</p>
                    </div>

                    <div class="category-card">
                        <div class="category-icon"><i class="fa-solid fa-city"></i></div>
                        <h3>Commercial</h3>
                        <p>Prime office and retail spaces for your next business move.</p>
                    </div>

                    <div class="category-card">
                        <div class="category-icon"><i class="fa-solid fa-house-user"></i></div>
                        <h3>PG & hostels</h3>
                        <p>Comfortable shared living options for students and professionals.</p>
                    </div>
                </div>
            </section>

            <section class="section">
                <div class="section-head">
                    <h2>Featured homes</h2>
                    <a href="<c:url value='/search?city=nashik'/>">View more</a>
                </div>

                <div class="listing-grid">
                    <c:forEach var="listing" items="${cityDemoListings}">
                        <article class="listing-card">
                            <div class="listing-image">
                                <a href="<c:url value='/properties/listing/${listing.id}'/>">
                                    <img src="${not empty listing.image ? listing.image : '/resources/images/estate3.jpg'}" alt="${listing.name}" onerror="this.onerror=null;this.src='/resources/images/estate3.jpg';">
                                </a>
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
                                <a class="btn btn-outline-primary w-100 mt-3"
                                   href="<c:url value='/properties/listing/${listing.id}'/>">View details</a>
                            </div>
                        </article>
                    </c:forEach>
                </div>
            </section>

            <section class="section">
                <div class="section-head">
                    <h2>Explore by city</h2>
                    <a href="<c:url value='/search'/>">See all cities</a>
                </div>

                <div class="city-showcase">
                    <div class="city-card">
                        <div class="city-card-inner">
                            <h3>Nashik</h3>
                            <p>1,240+ properties</p>
                        </div>
                    </div>
                    <div class="city-card">
                        <div class="city-card-inner">
                            <h3>Mumbai</h3>
                            <p>4,800+ homes</p>
                        </div>
                    </div>
                    <div class="city-card">
                        <div class="city-card-inner">
                            <h3>Pune</h3>
                            <p>2,940+ listings</p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section">
                <div class="feature-box">
                    <div class="section-head" style="margin-bottom: 22px;">
                        <h2>Why buyers and renters choose EstateFinders</h2>
                    </div>

                    <div class="feature-box-grid">
                        <div class="feature-item">
                            <div class="icon"><i class="fa-solid fa-shield-heart"></i></div>
                            <h4>Verified homes</h4>
                            <p>Explore trusted listings, transparent pricing and neighborhood insights before you visit.</p>
                        </div>

                        <div class="feature-item">
                            <div class="icon"><i class="fa-solid fa-chart-line"></i></div>
                            <h4>Market-driven pricing</h4>
                            <p>Compare local rates and find homes aligned with your budget and preferred lifestyle.</p>
                        </div>

                        <div class="feature-item">
                            <div class="icon"><i class="fa-solid fa-headset"></i></div>
                            <h4>Expert assistance</h4>
                            <p>Get guided support from property experts and move through sales or rentals smoothly.</p>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </main>

    <footer>
        <div class="container-custom">
            <div class="footer-grid">
                <div>
                    <div class="footer-brand">
                        <span class="brand-mark"><i class="fa-solid fa-house"></i></span>
                        <span>EstateFinders</span>
                    </div>
                    <p>A smarter way to discover homes, neighborhoods and investment opportunities across the city.</p>
                </div>
                <div>
                    <h4 style="color: white; margin-bottom: 14px;">Explore</h4>
                    <ul>
                        <li><a href="<c:url value='/buy'/>">Buy</a></li>
                        <li><a href="<c:url value='/rent'/>">Rent</a></li>
                        <li><a href="<c:url value='/search'/>">New projects</a></li>
                    </ul>
                </div>
                <div>
                    <h4 style="color: white; margin-bottom: 14px;">Company</h4>
                    <ul>
                        <li><a href="<c:url value='/about'/>">About</a></li>
                        <li><a href="<c:url value='/contact'/>">Contact us</a></li>
                        <li><a href="<c:url value='/tools'/>">Tools</a></li>
                    </ul>
                </div>
                <div>
                    <h4 style="color: white; margin-bottom: 14px;">Need help?</h4>
                    <ul>
                        <li><a href="<c:url value='/login'/>">Login</a></li>
                        <li><a href="<c:url value='/property/sell-property'/>">Sell with us</a></li>
                        <c:if test="${empty sessionScope['estatefinder.userId']}">
                            <li><a href="<c:url value='/adminlogin'/>">Admin</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                <span>© 2026 EstateFinders</span>
                <span>Designed for a modern home search experience</span>
            </div>
        </div>
    </footer>
</body>
</html>
