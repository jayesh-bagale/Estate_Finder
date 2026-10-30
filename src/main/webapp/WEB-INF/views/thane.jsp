<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thane Properties | EstateFinders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #0d3b66;
            --secondary: #f4b942;
            --light: #f5f7fb;
            --muted: #5c6470;
            --card: #ffffff;
            --border: #e7ebf0;
        }
        body {
            background: linear-gradient(180deg, #f8fbff 0%, #eef4fb 100%);
            color: #1d2b39;
            font-family: Arial, sans-serif;
        }
        .topbar {
            background: var(--primary);
            color: white;
            padding: 14px 0;
        }
        .nav-link, .brand {
            color: white !important;
            text-decoration: none;
            font-weight: 600;
        }
        .hero {
            background: linear-gradient(rgba(12, 41, 64, 0.68), rgba(12, 41, 64, 0.68)),
                        url('<c:url value="/resources/images/estate3.jpg"/>') center/cover no-repeat;
            min-height: 360px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            padding: 30px 20px;
        }
        .hero h1 {
            font-size: clamp(2.2rem, 4vw, 4rem);
            font-weight: 800;
            margin-bottom: 12px;
        }
        .hero p {
            font-size: 1.1rem;
            max-width: 760px;
            margin: 0 auto;
            color: rgba(255,255,255,0.9);
        }
        .container-wrap {
            max-width: 1200px;
            margin: auto;
            padding: 30px 15px 80px;
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 18px;
            margin-top: -35px;
            margin-bottom: 35px;
        }
        .stat {
            background: white;
            border: 1px solid var(--border);
            border-radius: 18px;
            padding: 20px 18px;
            box-shadow: 0 10px 26px rgba(14, 49, 68, 0.08);
            text-align: center;
        }
        .stat .number {
            display: block;
            font-size: 2rem;
            font-weight: 800;
            color: var(--primary);
        }
        .stat .label {
            color: var(--muted);
            font-size: 0.95rem;
            margin-top: 6px;
        }
        .section-head {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 30px 0 18px;
            flex-wrap: wrap;
            gap: 10px;
        }
        .section-head h2 {
            font-size: 2rem;
            font-weight: 800;
            color: var(--primary);
            margin: 0;
        }
        .chip {
            display: inline-block;
            padding: 8px 14px;
            background: #edf5ff;
            color: var(--primary);
            border-radius: 999px;
            font-weight: 600;
            font-size: 0.82rem;
        }
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 22px;
        }
        .property-card {
            border: 1px solid var(--border);
            border-radius: 18px;
            overflow: hidden;
            background: var(--card);
            box-shadow: 0 12px 30px rgba(18, 39, 58, 0.08);
            transition: transform 0.2s ease;
        }
        .property-card:hover {
            transform: translateY(-4px);
        }
        .property-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }
        .property-card .body {
            padding: 18px 16px 20px;
        }
        .property-card h3 {
            font-size: 1.18rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 8px;
        }
        .property-card .meta {
            color: var(--muted);
            font-size: 0.92rem;
            margin-bottom: 10px;
        }
        .price {
            font-weight: 800;
            color: #17683b;
            font-size: 1.04rem;
            margin-bottom: 12px;
        }
        .tag-row {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 14px;
        }
        .tag {
            padding: 6px 8px;
            border-radius: 999px;
            background: #f1f7ff;
            color: var(--primary);
            font-size: 0.8rem;
            font-weight: 600;
        }
        .btn-primary-custom {
            background: var(--primary);
            border: 0;
            padding: 10px 14px;
            border-radius: 10px;
            color: white;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
        }
        .btn-secondary-custom {
            background: #f4b942;
            border: 0;
            color: #1f2d3d;
            padding: 10px 14px;
            border-radius: 10px;
            font-weight: 700;
            text-decoration: none;
            display: inline-block;
        }
        .cta {
            margin-top: 30px;
            text-align: center;
        }
        @media (max-width: 768px) {
            .hero {
                min-height: 300px;
            }
            .section-head h2 {
                font-size: 1.5rem;
            }
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
    <div class="topbar">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="brand" href="${pageContext.request.contextPath}/project">ESTATEFINDERS</a>
            <div>
                <a class="nav-link d-inline-block me-3" href="${pageContext.request.contextPath}/project">Home</a>
                <a class="nav-link d-inline-block me-3" href="${pageContext.request.contextPath}/buy">Buy</a>
                <a class="nav-link d-inline-block me-3" href="${pageContext.request.contextPath}/rent">Rent</a>
                <a class="nav-link d-inline-block" href="${pageContext.request.contextPath}/contact">Contact</a>
            </div>
        </div>
    </div>

    <section class="hero">
        <div>
            <h1>Thane Property Hub</h1>
            <p>Explore homes, flats, villas, PGs and hostels in Thane West, Ghodbunder Road, and top residential pockets with premium amenities and strong connectivity.</p>
        </div>
    </section>

    <div class="container-wrap">
        <div class="stats">
            <div class="stat">
                <span class="number">600+</span>
                <div class="label">Verified listings</div>
            </div>
            <div class="stat">
                <span class="number">2BHK</span>
                <div class="label">Most popular</div>
            </div>
            <div class="stat">
                <span class="number">PG</span>
                <div class="label">Student & working stays</div>
            </div>
            <div class="stat">
                <span class="number">24/7</span>
                <div class="label">Security & support</div>
            </div>
        </div>

        <div class="section-head">
            <h2>Featured Properties in Thane</h2>
            <span class="chip">Luxury homes • Budget homes • Ready to move</span>
        </div>
        <div class="card-grid">
            <article class="property-card">
                <img src="<c:url value='/resources/images/roon.avif'/>" alt="Wadhwa The Address Thane West">
                <div class="body">
                    <h3>Wadhwa The Address</h3>
                    <div class="meta">Thane West, Maharashtra</div>
                    <div class="tag-row">
                        <span class="tag">2 BHK</span>
                        <span class="tag">3 BHK</span>
                        <span class="tag">Family living</span>
                    </div>
                    <div class="price">₹1.15 Cr - ₹2.05 Cr</div>
                    <a class="btn-primary-custom" href="${pageContext.request.contextPath}/properties/thane">View Details</a>
                </div>
            </article>

            <article class="property-card">
                <img src="<c:url value='/resources/images/rivera.jpg'/>" alt="Hiranandani Green Park West Thane">
                <div class="body">
                    <h3>Hiranandani Green Park</h3>
                    <div class="meta">West Thane, Maharashtra</div>
                    <div class="tag-row">
                        <span class="tag">2 BHK</span>
                        <span class="tag">3 BHK</span>
                        <span class="tag">4 BHK</span>
                    </div>
                    <div class="price">₹1.4 Cr - ₹3.2 Cr</div>
                    <a class="btn-primary-custom" href="${pageContext.request.contextPath}/properties/west-thane">View Details</a>
                </div>
            </article>

            <article class="property-card">
                <img src="<c:url value='/resources/images/samr.avif'/>" alt="Lake Vista Residence">
                <div class="body">
                    <h3>Lake Vista Residence</h3>
                    <div class="meta">Ghodbunder Road, Thane</div>
                    <div class="tag-row">
                        <span class="tag">1 BHK</span>
                        <span class="tag">2 BHK</span>
                        <span class="tag">3 BHK</span>
                    </div>
                    <div class="price">₹62 L - ₹1.8 Cr</div>
                    <a class="btn-primary-custom" href="${pageContext.request.contextPath}/properties/thane">View Details</a>
                </div>
            </article>

            <article class="property-card">
                <img src="<c:url value='/resources/images/villa1.avif'/>" alt="Viviana Heights villa">
                <div class="body">
                    <h3>Viviana Heights</h3>
                    <div class="meta">Majiwada, Thane</div>
                    <div class="tag-row">
                        <span class="tag">Smart homes</span>
                        <span class="tag">Green area</span>
                    </div>
                    <div class="price">₹88 L - ₹1.6 Cr</div>
                    <a class="btn-primary-custom" href="${pageContext.request.contextPath}/properties/thane">View Details</a>
                </div>
            </article>
        </div>

        <div class="section-head">
            <h2>Flats & Apartments</h2>
            <span class="chip">Ready for move-in</span>
        </div>
        <div class="card-grid">
            <article class="property-card">
                <img src="<c:url value='/resources/images/1st.avif'/>" alt="Thane 1 BHK flat">
                <div class="body">
                    <h3>Urban Nest 1BHK</h3>
                    <div class="meta">Pokhran Road, Thane West</div>
                    <div class="price">₹38 L onwards</div>
                    <a class="btn-secondary-custom" href="${pageContext.request.contextPath}/buy">Explore</a>
                </div>
            </article>

            <article class="property-card">
                <img src="<c:url value='/resources/images/2bh.avif'/>" alt="Thane 2 BHK flat">
                <div class="body">
                    <h3>Sunrise Residency</h3>
                    <div class="meta">Kalwa, Thane</div>
                    <div class="price">₹58 L onwards</div>
                    <a class="btn-secondary-custom" href="${pageContext.request.contextPath}/buy">Explore</a>
                </div>
            </article>

            <article class="property-card">
                <img src="<c:url value='/resources/images/3bh.avif'/>" alt="Thane 3 BHK flat">
                <div class="body">
                    <h3>Riverview Classic</h3>
                    <div class="meta">Airoli, Thane</div>
                    <div class="price">₹86 L onwards</div>
                    <a class="btn-secondary-custom" href="${pageContext.request.contextPath}/buy">Explore</a>
                </div>
            </article>

            <article class="property-card">
                <img src="<c:url value='/resources/images/3rd.avif'/>" alt="Thane premium apartment">
                <div class="body">
                    <h3>Skyline Horizon</h3>
                    <div class="meta">Dombivli Road, Thane</div>
                    <div class="price">₹1.2 Cr onwards</div>
                    <a class="btn-secondary-custom" href="${pageContext.request.contextPath}/buy">Explore</a>
                </div>
            </article>
        </div>

        <div class="section-head">
            <h2>PG & Hostel Stays</h2>
            <span class="chip">Safe • Affordable • Managed</span>
        </div>
        <div class="card-grid">
            <article class="property-card">
                <img src="<c:url value='/resources/images/estate1.jpg'/>" alt="PG in Thane">
                <div class="body">
                    <h3>City Comfort PG</h3>
                    <div class="meta">Thane West</div>
                    <div class="price">₹7,500/month</div>
                    <div class="tag-row">
                        <span class="tag">Wi-Fi</span>
                        <span class="tag">Meals</span>
                        <span class="tag">Security</span>
                    </div>
                    <a class="btn-secondary-custom" href="${pageContext.request.contextPath}/pg">Book Stay</a>
                </div>
            </article>

            <article class="property-card">
                <img src="<c:url value='/resources/images/estate2.jpg'/>" alt="Hostel in Thane">
                <div class="body">
                    <h3>Campus Nest Hostel</h3>
                    <div class="meta">Majiwada, Thane</div>
                    <div class="price">₹8,500/month</div>
                    <div class="tag-row">
                        <span class="tag">Shared room</span>
                        <span class="tag">Laundry</span>
                    </div>
                    <a class="btn-secondary-custom" href="${pageContext.request.contextPath}/pg">Book Stay</a>
                </div>
            </article>

            <article class="property-card">
                <img src="<c:url value='/resources/images/nilesh.jpeg'/>" alt="PG for working professionals">
                <div class="body">
                    <h3>Professional Stay</h3>
                    <div class="meta">Ghodbunder Road, Thane</div>
                    <div class="price">₹11,000/month</div>
                    <div class="tag-row">
                        <span class="tag">AC</span>
                        <span class="tag">Working professionals</span>
                    </div>
                    <a class="btn-secondary-custom" href="${pageContext.request.contextPath}/pg">Book Stay</a>
                </div>
            </article>
        </div>

        <div class="section-head">
            <h2>Luxury Villas</h2>
            <span class="chip">Premium lifestyle</span>
        </div>
        <div class="card-grid">
            <article class="property-card">
                <img src="<c:url value='/resources/images/villa2.avif'/>" alt="Villa in Thane">
                <div class="body">
                    <h3>Oakwood Villa</h3>
                    <div class="meta">Bhayander Road, Thane</div>
                    <div class="price">₹2.2 Cr</div>
                    <a class="btn-primary-custom" href="${pageContext.request.contextPath}/buy">View Villa</a>
                </div>
            </article>

            <article class="property-card">
                <img src="<c:url value='/resources/images/villa3.avif'/>" alt="Luxury villa in Thane">
                <div class="body">
                    <h3>Garden Heights</h3>
                    <div class="meta">Hiranandani Estate</div>
                    <div class="price">₹2.8 Cr</div>
                    <a class="btn-primary-custom" href="${pageContext.request.contextPath}/buy">View Villa</a>
                </div>
            </article>

            <article class="property-card">
                <img src="<c:url value='/resources/images/villa4.avif'/>" alt="Modern residency in Thane">
                <div class="body">
                    <h3>Silver Crest Villa</h3>
                    <div class="meta">Manpada, Thane</div>
                    <div class="price">₹3.1 Cr</div>
                    <a class="btn-primary-custom" href="${pageContext.request.contextPath}/buy">View Villa</a>
                </div>
            </article>
        </div>

        <div class="section-head">
            <h2>Location Map</h2>
            <span class="chip">Thane West connectivity</span>
        </div>

        <div class="row g-4 align-items-stretch">
            <div class="col-lg-7">
                <div style="border:1px solid var(--border); border-radius:18px; overflow:hidden; box-shadow:0 12px 30px rgba(18,39,58,0.08); height:100%; min-height:420px; background:#fff;">
                    <iframe
                        src="https://www.google.com/maps?q=Thane%20West%2C%20Maharashtra&z=12&output=embed"
                        width="100%"
                        height="420"
                        style="border:0; display:block;"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
            </div>
            <div class="col-lg-5">
                <div style="background:#fff; border:1px solid var(--border); border-radius:18px; padding:24px; box-shadow:0 12px 30px rgba(18,39,58,0.08); height:100%;">
                    <h3 style="color:var(--primary); font-weight:800; margin-bottom:18px;">Why buyers choose Thane</h3>
                    <ul style="list-style:none; padding:0; margin:0; color:var(--muted); line-height:2; font-size:0.98rem;">
                        <li>• Easy access to Mumbai via Eastern Expressway and Ghodbunder Road</li>
                        <li>• High rental demand in Thane West and Majiwada</li>
                        <li>• Mix of premium apartments, villas and affordable homes</li>
                        <li>• Strong schools, hospitals, malls and business hubs nearby</li>
                    </ul>
                    <div style="margin-top:18px;">
                        <a class="btn-primary-custom" href="https://maps.google.com/?q=Thane%20West%2C%20Maharashtra" target="_blank" rel="noopener">Open in Google Maps</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="cta">
            <a class="btn-primary-custom" href="${pageContext.request.contextPath}/contact">Talk to a Thane Property Expert</a>
        </div>
    </div>
</body>
</html>
