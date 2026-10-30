<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>About Us | EstateFinders</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --housing-blue: #0a2342;
      --housing-orange: #ff6a3d;
      --housing-soft: #f4f7fb;
      --housing-text: #1d2c3d;
      --housing-muted: #64748b;
      --housing-line: #e7edf5;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: "Segoe UI", Arial, sans-serif;
      color: var(--housing-text);
      background: linear-gradient(180deg, #f8fbff 0%, #edf2fb 100%);
    }
    a { text-decoration: none; }
    .topbar { background: rgba(10,35,66,0.97); position: sticky; top: 0; z-index: 20; }
    .topbar-inner { width: min(1180px, calc(100% - 28px)); margin: 0 auto; min-height: 72px; display: flex; align-items: center; justify-content: space-between; gap: 18px; }
    .brand { display:inline-flex; align-items:center; gap:10px; color:#fff; font-weight:800; }
    .brand-mark { width:36px; height:36px; display:inline-flex; align-items:center; justify-content:center; border-radius:12px; background: linear-gradient(135deg,#ff6a3d,#ff9d2f); }
    .nav-links { display:flex; flex-wrap:wrap; gap:16px; }
    .nav-links a { color: rgba(255,255,255,0.8); font-weight:600; }
    .nav-links a:hover { color:#fff; }
    .cta-btn { display:inline-flex; align-items:center; justify-content:center; border-radius:999px; padding:10px 18px; background: linear-gradient(135deg,#ff6a3d,#ff8f59); color:#fff; font-weight:700; }
    .hero { background: linear-gradient(135deg, rgba(10,35,66,0.82), rgba(18,63,112,0.68)), url('https://images.unsplash.com/photo-1460317442991-0ec209397118?auto=format&fit=crop&w=1800&q=80') center/cover no-repeat; min-height: 300px; display:flex; align-items:center; }
    .hero-inner { width: min(1180px, calc(100% - 28px)); margin: 0 auto; color:white; }
    .hero h1 { font-size: clamp(2.2rem, 4vw, 3.8rem); font-weight: 800; letter-spacing:-0.04em; margin:0 0 10px; }
    .hero p { margin:0; color: rgba(255,255,255,0.8); font-size:1.05rem; }
    .container-custom { width: min(1180px, calc(100% - 28px)); margin: 0 auto; padding: 48px 0 60px; }
    .story-grid { display:grid; grid-template-columns: 1.1fr 1.1fr; gap:26px; align-items:center; }
    .story-card, .feature-card, .quote-card { background:white; border:1px solid var(--housing-line); border-radius:24px; box-shadow: 0 18px 38px rgba(8,22,44,0.06); }
    .story-card { padding: 22px; }
    .story-card img, .feature-card img { width:100%; border-radius:18px; object-fit:cover; display:block; }
    .feature-card { padding: 20px; }
    .feature-card h3 { margin: 18px 0 10px; font-size: 1.3rem; font-weight: 800; }
    .feature-card p { color: var(--housing-muted); margin:0; }
    .section-head { margin: 0 0 18px; font-size: clamp(1.8rem, 2.5vw, 2.6rem); font-weight: 800; letter-spacing:-0.03em; }
    .features { display:grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap:22px; margin-top: 28px; }
    .icon-box { width:54px; height:54px; display:inline-flex; align-items:center; justify-content:center; border-radius:16px; background: linear-gradient(135deg, rgba(255,106,61,0.12), rgba(255,201,71,0.18)); color: var(--housing-orange); font-size:1.3rem; }
    .quote-card { margin-top: 28px; padding: 30px 28px; background: linear-gradient(135deg, #0d2444, #123b72); color:white; }
    .quote-card p { margin:0; font-size:1.06rem; }
    footer { background:#091b30; color: rgba(255,255,255,0.8); padding: 36px 0 18px; }
    .footer-grid { display:grid; grid-template-columns: 1.6fr 1fr 1fr; gap:24px; }
    .footer-brand { display:inline-flex; align-items:center; gap:10px; color:#fff; font-weight:800; }
    footer a, footer li { color: rgba(255,255,255,0.72); }
    ul { list-style:none; margin:0; padding:0; display:flex; flex-direction:column; gap:10px; }
    .footer-bottom { border-top:1px solid rgba(255,255,255,0.12); margin-top:22px; padding-top:16px; display:flex; justify-content:space-between; flex-wrap:wrap; gap:10px; }
    @media (max-width: 900px) {
      .story-grid, .features, .footer-grid { grid-template-columns: 1fr; }
    }
    @media (max-width: 640px) {
      .topbar-inner { flex-wrap:wrap; justify-content:center; padding: 12px 0; }
      .nav-links { justify-content:center; }
    }
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
        <a href="<c:url value='/contact'/>">Contact</a>
      </div>
      <c:choose><c:when test="${not empty sessionScope['estatefinder.userId']}"><a class="cta-btn" href="<c:url value='/profile'/>">My account</a><form action="<c:url value='/customer/logout'/>" method="post" style="display:inline;"><button class="cta-btn" type="submit">Log out</button></form></c:when><c:otherwise><a class="cta-btn" href="<c:url value='/login'/>">Login</a></c:otherwise></c:choose>
    </div>
  </nav>

  <header class="hero">
    <div class="hero-inner">
      <h1>About EstateFinders</h1>
      <p>Helping families and investors discover spaces that match their lifestyle and goals.</p>
    </div>
  </header>

  <main class="container-custom">
    <section class="story-grid">
      <div class="story-card">
        <img src="<c:url value='/resources/images/ab copy.jpg'/>" alt="About EstateFinders" />
      </div>
      <div class="story-card">
        <h2 class="section-head" style="margin-bottom: 12px;">Who we are</h2>
        <p style="margin:0; color: var(--housing-muted); font-size: 1.02rem; line-height:1.8;">
          EstateFinders is a modern real-estate platform focused on making property discovery simple, transparent, and trustworthy. Based in the heart of growing Indian cities, we combine local market knowledge with digital convenience to help people buy, rent, or invest with confidence.
        </p>
      </div>
    </section>

    <section style="margin-top: 36px;">
      <h2 class="section-head" style="margin-bottom: 18px;">What we stand for</h2>
      <div class="features">
        <div class="feature-card">
          <div class="icon-box"><i class="fa-solid fa-handshake-angle"></i></div>
          <h3>Trust-led guidance</h3>
          <p>We focus on honest advice, transparent pricing, and property experiences that feel straightforward.</p>
        </div>
        <div class="feature-card">
          <div class="icon-box"><i class="fa-solid fa-map-location-dot"></i></div>
          <h3>Local market expertise</h3>
          <p>Our team understands neighborhood trends, infrastructure growth, and what genuinely matters to buyers and tenants.</p>
        </div>
        <div class="feature-card">
          <div class="icon-box"><i class="fa-solid fa-chart-line"></i></div>
          <h3>Smarter decisions</h3>
          <p>We help clients compare options, understand value, and make confident choices based on real insight.</p>
        </div>
      </div>
    </section>

    <section style="margin-top: 36px;">
      <div class="story-grid">
        <div class="story-card">
          <h2 class="section-head" style="margin-bottom: 12px;">Our mission</h2>
          <p style="margin:0; color: var(--housing-muted); line-height:1.8;">
            To empower individuals and families by helping them find the right property to live, grow, and invest in. We believe that every property decision should be backed by clarity, confidence, and a great experience from start to finish.
          </p>
        </div>
        <div class="story-card">
          <img src="<c:url value='/resources/images/rrr.jpeg'/>" alt="EstateFinders mission" />
        </div>
      </div>
    </section>

    <div class="quote-card">
      <p>“We make the process of discovering homes feel simpler, faster, and more personal—whether you're buying your first flat, renting with family, or investing in a growing market.”</p>
    </div>
  </main>

  <footer>
    <div class="container-custom">
      <div class="footer-grid">
        <div>
          <div class="footer-brand"><span class="brand-mark"><i class="fa-solid fa-house"></i></span> <span>EstateFinders</span></div>
          <p style="margin-top:14px; max-width: 420px;">Smart search, verified listings and guidance for your next move.</p>
        </div>
        <div>
          <h4 style="color:white; margin:0 0 12px;">Explore</h4>
          <ul>
            <li><a href="<c:url value='/buy'/>">Buy</a></li>
            <li><a href="<c:url value='/rent'/>">Rent</a></li>
            <li><a href="<c:url value='/search'/>">Search</a></li>
          </ul>
        </div>
        <div>
          <h4 style="color:white; margin:0 0 12px;">Company</h4>
          <ul>
            <li><a href="<c:url value='/about'/>">About</a></li>
            <li><a href="<c:url value='/contact'/>">Contact</a></li>
            <li><a href="<c:url value='/login'/>">Login</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        <span>© 2026 EstateFinders</span>
        <span>Modern homes, better decisions</span>
      </div>
    </div>
  </footer>
</body>
</html>
