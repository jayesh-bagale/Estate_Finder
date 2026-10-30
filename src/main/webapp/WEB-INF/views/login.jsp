<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Login | EstateFinders</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
  :root { --housing-blue:#0a2342; --housing-orange:#ff6a3d; --housing-soft:#f5f7fb; --housing-muted:#64748b; --housing-line:#e8edf5; }
  * { box-sizing: border-box; }
  body { margin:0; font-family:"Segoe UI", Arial, sans-serif; background: linear-gradient(180deg,#f9fbff,#edf4ff); color:var(--housing-blue); }
  a { text-decoration:none; }
  .topbar { background: rgba(10,35,66,0.97); position: sticky; top:0; z-index:20; }
  .topbar-inner { width:min(1180px, calc(100% - 28px)); margin:0 auto; min-height:72px; display:flex; align-items:center; justify-content:space-between; gap:18px; }
  .brand { display:inline-flex; align-items:center; gap:10px; color:#fff; font-weight:800; }
  .brand-mark { width:36px; height:36px; border-radius:12px; background: linear-gradient(135deg,#ff6a3d,#ff9d2f); display:inline-flex; align-items:center; justify-content:center; }
  .nav-links { display:flex; flex-wrap:wrap; gap:16px; }
  .nav-links a { color: rgba(255,255,255,0.8); font-weight:600; }
  .nav-links a:hover { color:#fff; }
  .container-custom { width:min(1180px, calc(100% - 28px)); margin:0 auto; padding: 48px 0 60px; }
  .auth-card { max-width: 540px; margin: 42px auto; background:#fff; border:1px solid var(--housing-line); border-radius:24px; box-shadow:0 18px 32px rgba(10,35,66,0.08); padding:28px; }
  .auth-card h1 { font-size: clamp(2rem, 3vw, 2.6rem); font-weight:800; letter-spacing:-0.03em; margin-bottom: 8px; }
  .subtitle { color: var(--housing-muted); margin-bottom: 26px; }
  .form-group { margin-bottom: 18px; }
  .form-group label { display:block; margin-bottom:8px; color: var(--housing-blue); font-weight:700; }
  .form-group input { width:100%; min-height:52px; border:1px solid var(--housing-line); border-radius:12px; padding:0 14px; background:#fff; }
  .submit-btn { width:100%; min-height:52px; border:none; border-radius:12px; background: linear-gradient(135deg,#ff6a3d,#ff8f59); color:white; font-weight:800; }
  .helper-row { display:flex; justify-content:space-between; align-items:center; gap:10px; margin-top:16px; color: var(--housing-muted); font-size:0.95rem; }
  .danger-box { padding: 12px 14px; background: #fff2f2; color:#b42318; border:1px solid #f7c7c7; border-radius:12px; margin-bottom: 18px; }
  @media (max-width:640px) { .topbar-inner { flex-wrap:wrap; justify-content:center; padding:12px 0; } .nav-links { justify-content:center; } }
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
      <c:choose>
        <c:when test="${not empty sessionScope['estatefinder.userId']}">
          <a href="<c:url value='/profile'/>" style="color:#fff; font-weight:700;">My account</a>
          <form action="<c:url value='/customer/logout'/>" method="post" style="display:inline;">
            <button type="submit" style="color:#fff; font-weight:700; background:none; border:0;">Log out</button>
          </form>
        </c:when>
        <c:otherwise>
          <a href="<c:url value='/property/sell-property'/>" style="color:#fff; font-weight:700;">Sell Property</a>
        </c:otherwise>
      </c:choose>
    </div>
  </nav>

  <main class="container-custom">
    <div class="auth-card">
      <h1>Welcome back</h1>
      <div class="subtitle">Sign in to manage your saved homes and enquiries.</div>

      <c:if test="${not empty error}">
        <div class="danger-box" role="alert"><c:out value="${error}" /></div>
      </c:if>

      <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
          <label for="email">Email or username</label>
          <input type="text" id="email" name="email" placeholder="Enter your email or username" autocomplete="username" required />
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" id="password" name="password" placeholder="Enter your password" autocomplete="current-password" required />
        </div>

        <button type="submit" class="submit-btn">Login</button>
      </form>

      <div class="helper-row">
        <span>Don’t have an account?</span>
        <a href="${pageContext.request.contextPath}/register" style="color: var(--housing-orange); font-weight:700;">Register here</a>
      </div>
    </div>
  </main>
</body>
</html>
