<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us | EstateFinders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root { --housing-blue:#0a2342; --housing-orange:#ff6a3d; --housing-soft:#f5f7fb; --housing-muted:#64748b; --housing-line:#e9eef5; }
        * { box-sizing: border-box; }
        body { margin:0; font-family:"Segoe UI", Arial, sans-serif; background: linear-gradient(180deg, #f9fbff, #eef4ff); color: var(--housing-blue); }
        a { text-decoration:none; }
        .topbar { background: rgba(10,35,66,0.97); position: sticky; top:0; z-index:20; }
        .topbar-inner { width:min(1180px, calc(100% - 28px)); margin:0 auto; min-height:72px; display:flex; align-items:center; justify-content:space-between; gap:18px; }
        .brand { display:inline-flex; align-items:center; gap:10px; color:#fff; font-weight:800; }
        .brand-mark { width:36px; height:36px; border-radius:12px; background: linear-gradient(135deg,#ff6a3d,#ff9d2f); display:inline-flex; align-items:center; justify-content:center; }
        .nav-links { display:flex; flex-wrap:wrap; gap:16px; }
        .nav-links a { color: rgba(255,255,255,0.8); font-weight:600; }
        .nav-links a:hover { color:#fff; }
        .cta-btn { display:inline-flex; align-items:center; justify-content:center; padding:10px 18px; border-radius:999px; background:linear-gradient(135deg,#ff6a3d,#ff8f59); color:#fff; font-weight:700; }
        .hero { background: linear-gradient(135deg, rgba(10,35,66,0.82), rgba(17,51,93,0.62)), url('https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1800&q=80') center/cover no-repeat; min-height: 260px; display:flex; align-items:center; }
        .hero-inner { width:min(1180px, calc(100% - 28px)); margin:0 auto; color:#fff; }
        .hero h1 { font-size: clamp(2.2rem, 4vw, 3.4rem); font-weight:800; letter-spacing:-0.04em; margin:0 0 10px; }
        .hero p { margin:0; color: rgba(255,255,255,0.8); }
        .container-custom { width:min(1180px, calc(100% - 28px)); margin:0 auto; padding: 42px 0 60px; }
        .contact-grid { display:grid; grid-template-columns: 1fr 1.2fr; gap:22px; }
        .panel { background:white; border:1px solid var(--housing-line); border-radius:22px; box-shadow: 0 18px 38px rgba(10,35,66,0.06); padding: 26px; }
        .contact-item { display:flex; gap:14px; align-items:flex-start; margin-bottom:18px; }
        .contact-item .icon { width:48px; height:48px; display:inline-flex; align-items:center; justify-content:center; border-radius:14px; background:linear-gradient(135deg, rgba(255,106,61,0.12), rgba(255,201,71,0.18)); color: var(--housing-orange); }
        .contact-item h3 { margin:0 0 6px; font-size:1.08rem; font-weight:800; }
        .contact-item p { margin:0; color: var(--housing-muted); }
        .form-group { margin-bottom: 16px; }
        .form-group label { display:block; margin-bottom: 8px; font-weight:700; color: var(--housing-blue); }
        .form-group input, .form-group select, .form-group textarea { width:100%; padding: 12px 14px; border:1px solid var(--housing-line); border-radius:12px; background:#fff; }
        .form-group textarea { min-height: 140px; resize: vertical; }
        .submit-btn { width:100%; border:none; border-radius:14px; padding: 13px 18px; background: linear-gradient(135deg,#ff6a3d,#ff8f59); color:#fff; font-weight:800; }
        footer { background:#091b30; color: rgba(255,255,255,0.8); padding: 36px 0 18px; }
        .footer-grid { display:grid; grid-template-columns: 1.5fr 1fr 1fr; gap:24px; }
        .footer-brand { display:inline-flex; align-items:center; gap:10px; color:#fff; font-weight:800; }
        footer a, footer li { color: rgba(255,255,255,0.72); }
        ul { list-style:none; padding:0; margin:0; display:flex; flex-direction:column; gap:10px; }
        .footer-bottom { border-top:1px solid rgba(255,255,255,0.12); margin-top:22px; padding-top:16px; display:flex; justify-content:space-between; gap:10px; flex-wrap:wrap; }
        @media (max-width: 860px) { .contact-grid, .footer-grid { grid-template-columns: 1fr; } }
        @media (max-width: 640px) { .topbar-inner { flex-wrap:wrap; justify-content:center; padding:12px 0; } .nav-links { justify-content:center; } }
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
                <a href="<c:url value='/about'/>">About</a>
            </div>
            <c:choose><c:when test="${not empty sessionScope['estatefinder.userId']}"><a class="cta-btn" href="<c:url value='/profile'/>">My account</a><form action="<c:url value='/customer/logout'/>" method="post" style="display:inline;"><button class="cta-btn" type="submit">Log out</button></form></c:when><c:otherwise><a class="cta-btn" href="<c:url value='/login'/>">Login</a></c:otherwise></c:choose>
        </div>
    </nav>

    <header class="hero">
        <div class="hero-inner">
            <h1>Contact us</h1>
            <p>We’d love to help with your next property plan.</p>
        </div>
    </header>

    <main class="container-custom">
        <div class="contact-grid">
            <div class="panel">
                <h2 style="margin:0 0 18px; font-weight:800; font-size: 2rem;">Get in touch</h2>

                <div class="contact-item">
                    <div class="icon"><i class="fa-solid fa-location-dot"></i></div>
                    <div>
                        <h3>Office</h3>
                        <p>EstateFinders, Nashik, Maharashtra</p>
                    </div>
                </div>

                <div class="contact-item">
                    <div class="icon"><i class="fa-solid fa-phone"></i></div>
                    <div>
                        <h3>Call us</h3>
                        <p>+91 98765 43210</p>
                    </div>
                </div>

                <div class="contact-item">
                    <div class="icon"><i class="fa-solid fa-envelope"></i></div>
                    <div>
                        <h3>Email</h3>
                        <p>hello@estatefinders.in</p>
                    </div>
                </div>
            </div>

            <div class="panel">
                <h2 style="margin:0 0 18px; font-weight:800; font-size: 2rem;">Send a message</h2>
                <form action="${pageContext.request.contextPath}/contact" method="post">
                    <div class="form-group">
                        <label for="name">Full name</label>
                        <input id="name" name="name" type="text" placeholder="Your name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input id="email" name="email" type="email" placeholder="you@example.com" required>
                    </div>
                    <div class="form-group">
                        <label for="subject">Interest</label>
                        <select id="subject" name="subject">
                            <option value="Buy">I want to buy</option>
                            <option value="Rent">I want to rent</option>
                            <option value="Sell">I want to sell</option>
                            <option value="Commercial">Commercial property</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" placeholder="Tell us what you're looking for..." required></textarea>
                    </div>
                    <button type="submit" class="submit-btn">Send enquiry</button>
                </form>
            </div>
        </div>
    </main>

    <footer>
        <div class="container-custom">
            <div class="footer-grid">
                <div>
                    <div class="footer-brand"><span class="brand-mark"><i class="fa-solid fa-house"></i></span> <span>EstateFinders</span></div>
                    <p style="margin-top: 14px; max-width: 360px;">A modern real-estate experience built for smarter buying and renting decisions.</p>
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
                <span>Ready to help you move</span>
            </div>
        </div>
    </footer>
</body>
</html>
