<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | EstateFinders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root { --housing-blue:#0a2342; --housing-orange:#ff6a3d; --housing-soft:#f5f7fb; --housing-muted:#64748b; --housing-line:#e9eef5; }
        * { box-sizing:border-box; }
        body { margin:0; font-family:"Segoe UI", Arial, sans-serif; background: linear-gradient(180deg,#f9fbff,#edf4ff); color:var(--housing-blue); }
        a { text-decoration:none; }
        .topbar { background: rgba(10,35,66,0.97); position: sticky; top:0; z-index:20; }
        .topbar-inner { width:min(1180px, calc(100% - 28px)); margin:0 auto; min-height:72px; display:flex; align-items:center; justify-content:space-between; gap:18px; }
        .brand { display:inline-flex; align-items:center; gap:10px; color:#fff; font-weight:800; }
        .brand-mark { width:36px; height:36px; border-radius:12px; display:inline-flex; align-items:center; justify-content:center; background: linear-gradient(135deg,#ff6a3d,#ff9d2f); }
        .nav-links { display:flex; flex-wrap:wrap; gap:16px; }
        .nav-links a { color: rgba(255,255,255,0.8); font-weight:600; }
        .nav-links a:hover { color:#fff; }
        .container-custom { width:min(1180px, calc(100% - 28px)); margin:0 auto; padding:42px 0 60px; }
        .auth-card { max-width: 520px; margin: 40px auto; background:#fff; border:1px solid var(--housing-line); border-radius:24px; box-shadow:0 18px 32px rgba(10,35,66,0.08); padding:28px; }
        .auth-card h1 { margin:0 0 8px; font-size: clamp(2rem, 3vw, 2.6rem); font-weight:800; letter-spacing:-0.03em; }
        .subtitle { color: var(--housing-muted); margin-bottom: 22px; }
        .alert-success { border-radius:12px; }
        .form-group { margin-bottom:18px; }
        .form-group label { display:block; margin-bottom:8px; font-weight:700; color:var(--housing-blue); }
        .form-group input { width:100%; min-height:52px; border:1px solid var(--housing-line); border-radius:12px; background:#fff; padding:0 14px; }
        .submit-btn { width:100%; min-height:52px; border:none; border-radius:12px; background: linear-gradient(135deg,#ff6a3d,#ff8f59); color:white; font-weight:800; }
        .register-btn { display:block; width:100%; margin-top:12px; padding:14px; border:1px solid var(--housing-blue); border-radius:12px; color:var(--housing-blue); font-weight:800; text-align:center; }
        .register-btn:hover { background:var(--housing-soft); color:var(--housing-blue); }
        .helper-row { margin-top:18px; color: var(--housing-muted); font-size:0.95rem; }
        @media (max-width:640px) { .topbar-inner { flex-wrap:wrap; justify-content:center; padding:12px 0; } .nav-links { justify-content:center; } }
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
                <a href="${pageContext.request.contextPath}/project">Home</a>
                <a href="${pageContext.request.contextPath}/about">About</a>
                <a href="${pageContext.request.contextPath}/contact">Contact</a>
            </div>
            <a href="${pageContext.request.contextPath}/login" style="color:#fff; font-weight:700;">User login</a>
        </div>
    </nav>

    <main class="container-custom">
        <div class="auth-card">
            <h1>Admin login</h1>
            <div class="subtitle">Secure access for property moderation and dashboard tools.</div>

            <c:if test="${param.registered ne null}">
                <div class="alert alert-success" role="status">Admin account created. You can now sign in.</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/adminlogin" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit" class="submit-btn">Sign in</button>
            </form>
            <a class="register-btn" href="${pageContext.request.contextPath}/adregister">Create admin account</a>

            <div class="helper-row">Need to return to the public site? <a href="${pageContext.request.contextPath}/project" style="color: var(--housing-orange); font-weight:700;">Go home</a></div>
        </div>
    </main>
</body>
</html>
