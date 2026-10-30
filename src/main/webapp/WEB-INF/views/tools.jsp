<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Property Calculators | EstateFinders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root { --housing-blue:#0a2342; --housing-orange:#ff6a3d; --housing-soft:#f5f7fb; --housing-muted:#64748b; --housing-line:#e9edf5; }
        * { box-sizing:border-box; }
        body { margin:0; background: linear-gradient(180deg,#f8fbff,#edf4ff); color:var(--housing-blue); font-family:"Segoe UI", Arial, sans-serif; }
        a { text-decoration:none; }
        .topbar { background: rgba(10,35,66,0.97); position: sticky; top:0; z-index:20; }
        .topbar-inner { width:min(1180px, calc(100% - 28px)); margin:0 auto; min-height:72px; display:flex; align-items:center; justify-content:space-between; gap:18px; }
        .brand { display:inline-flex; align-items:center; gap:10px; color:#fff; font-weight:800; }
        .brand-mark { width:36px; height:36px; border-radius:12px; display:inline-flex; align-items:center; justify-content:center; background: linear-gradient(135deg,#ff6a3d,#ff9d2f); }
        .nav-links { display:flex; flex-wrap:wrap; gap:16px; }
        .nav-links a { color: rgba(255,255,255,0.8); font-weight:600; }
        .nav-links a:hover { color:#fff; }
        .hero { background: linear-gradient(135deg, rgba(10,35,66,0.82), rgba(18,63,112,0.68)), url('https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=1800&q=80') center/cover no-repeat; min-height: 260px; display:flex; align-items:center; }
        .hero-inner { width:min(1180px, calc(100% - 28px)); margin:0 auto; color:#fff; }
        .hero h1 { margin:0 0 10px; font-size: clamp(2.2rem, 4vw, 3.6rem); font-weight:800; letter-spacing:-0.04em; }
        .hero p { margin:0; color: rgba(255,255,255,0.8); }
        .container-custom { width:min(1180px, calc(100% - 28px)); margin:0 auto; padding: 42px 0 60px; }
        .card { border:1px solid var(--housing-line); border-radius:22px; box-shadow: 0 18px 38px rgba(10,35,66,0.06); background:#fff; }
        .result-box { background:linear-gradient(180deg, #f8faff, #eef5ff); border-radius:16px; padding:18px; color:var(--housing-blue); font-weight:700; border:1px solid #e9efff; }
        .form-control, .form-select { min-height:48px; border:1px solid var(--housing-line); border-radius:12px; }
        .btn-primary { border:none; border-radius:12px; background: linear-gradient(135deg,#ff6a3d,#ff8f59); color:#fff; font-weight:700; }
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
        <c:choose>
            <c:when test="${not empty sessionScope['estatefinder.userId']}">
                <a href="<c:url value='/profile'/>" style="color:#fff; font-weight:700;">My account</a>
                <form action="<c:url value='/customer/logout'/>" method="post" style="display:inline;">
                    <button type="submit" style="color:#fff; font-weight:700; background:none; border:0;">Log out</button>
                </form>
            </c:when>
            <c:otherwise>
                <a href="<c:url value='/login'/>" style="color:#fff; font-weight:700;">Login</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<header class="hero">
    <div class="hero-inner">
        <p style="text-transform: uppercase; letter-spacing:0.1em; font-size:0.75rem; font-weight:700; opacity:0.8; margin-bottom: 10px;">Real estate calculators</p>
        <h1>Plan your next move.</h1>
        <p>Quick home buying and rental tools to compare affordability and investment value.</p>
    </div>
</header>

<main class="container-custom">
    <div class="row g-4">
        <div class="col-lg-6">
            <div class="card p-4">
                <h2 class="h4 mb-3" style="font-weight:800;">EMI Calculator</h2>
                <form id="emiForm" class="row g-3">
                    <div class="col-md-6"><label class="form-label" for="loanAmount">Loan amount (₹)</label><input id="loanAmount" class="form-control" type="number" min="0" value="2500000" required /></div>
                    <div class="col-md-6"><label class="form-label" for="interestRate">Rate of interest (%)</label><input id="interestRate" class="form-control" type="number" min="0" step="0.1" value="7.5" required /></div>
                    <div class="col-md-6"><label class="form-label" for="loanTenure">Tenure (years)</label><input id="loanTenure" class="form-control" type="number" min="1" value="20" required /></div>
                    <div class="col-md-6 d-flex align-items-end"><button class="btn btn-primary w-100" type="submit">Calculate</button></div>
                </form>
                <div class="result-box mt-3" id="emiResult">Monthly EMI: ₹0</div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card p-4">
                <h2 class="h4 mb-3" style="font-weight:800;">Affordability Calculator</h2>
                <form id="affordabilityForm" class="row g-3">
                    <div class="col-md-6"><label class="form-label" for="monthlyIncome">Monthly income (₹)</label><input id="monthlyIncome" class="form-control" type="number" min="0" value="120000" required /></div>
                    <div class="col-md-6"><label class="form-label" for="existingLoan">Existing EMIs (₹)</label><input id="existingLoan" class="form-control" type="number" min="0" value="15000" required /></div>
                    <div class="col-md-6"><label class="form-label" for="interestCover">Suggested EMI ratio (%)</label><input id="interestCover" class="form-control" type="number" min="0" max="100" value="35" required /></div>
                    <div class="col-md-6 d-flex align-items-end"><button class="btn btn-primary w-100" type="submit">Estimate</button></div>
                </form>
                <div class="result-box mt-3" id="affordabilityResult">Suggested home EMI budget: ₹0</div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card p-4">
                <h2 class="h4 mb-3" style="font-weight:800;">Property Value Estimate</h2>
                <form id="valuationForm" class="row g-3">
                    <div class="col-md-6"><label class="form-label" for="marketPrice">Current ask price (₹)</label><input id="marketPrice" class="form-control" type="number" min="0" value="6500000" required /></div>
                    <div class="col-md-6"><label class="form-label" for="marketGrowth">Annual growth (%)</label><input id="marketGrowth" class="form-control" type="number" min="0" step="0.1" value="6.5" required /></div>
                    <div class="col-12"><label class="form-label" for="yearsAhead">Years ahead</label><input id="yearsAhead" class="form-control" type="number" min="1" value="5" required /></div>
                    <div class="col-12"><button class="btn btn-primary w-100" type="submit">Project value</button></div>
                </form>
                <div class="result-box mt-3" id="valuationResult">Estimated value after 5 years: ₹0</div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card p-4">
                <h2 class="h4 mb-3" style="font-weight:800;">Area Unit Converter</h2>
                <form id="areaForm" class="row g-3">
                    <div class="col-md-6"><label class="form-label" for="areaValue">Area value</label><input id="areaValue" class="form-control" type="number" min="0" step="0.01" value="1200" required /></div>
                    <div class="col-md-6"><label class="form-label" for="areaUnit">From unit</label><select id="areaUnit" class="form-select"><option value="sqft">sq ft</option><option value="sqm">sq m</option><option value="marla">marla</option></select></div>
                    <div class="col-12"><button class="btn btn-primary w-100" type="submit">Convert</button></div>
                </form>
                <div class="result-box mt-3" id="areaResult">1200 sq ft = 111.48 sq m</div>
            </div>
        </div>
    </div>
</main>

<script>
    function formatCurrency(value) {
        return new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'INR', maximumFractionDigits: 0 }).format(value);
    }

    document.getElementById('emiForm').addEventListener('submit', function (event) {
        event.preventDefault();
        const principal = Number(document.getElementById('loanAmount').value || 0);
        const annualRate = Number(document.getElementById('interestRate').value || 0);
        const years = Number(document.getElementById('loanTenure').value || 0);
        const months = years * 12;
        const monthlyRate = annualRate / 12 / 100;
        let emi = 0;
        if (principal > 0 && months > 0) {
            if (monthlyRate === 0) {
                emi = principal / months;
            } else {
                emi = (principal * monthlyRate * Math.pow(1 + monthlyRate, months)) / (Math.pow(1 + monthlyRate, months) - 1);
            }
        }
        document.getElementById('emiResult').textContent = 'Monthly EMI: ' + formatCurrency(emi);
    });

    document.getElementById('affordabilityForm').addEventListener('submit', function (event) {
        event.preventDefault();
        const income = Number(document.getElementById('monthlyIncome').value || 0);
        const existing = Number(document.getElementById('existingLoan').value || 0);
        const ratio = Number(document.getElementById('interestCover').value || 0) / 100;
        const budget = Math.max(0, (income * ratio) - existing);
        document.getElementById('affordabilityResult').textContent = 'Suggested home EMI budget: ' + formatCurrency(budget);
    });

    document.getElementById('valuationForm').addEventListener('submit', function (event) {
        event.preventDefault();
        const price = Number(document.getElementById('marketPrice').value || 0);
        const growth = Number(document.getElementById('marketGrowth').value || 0) / 100;
        const years = Number(document.getElementById('yearsAhead').value || 0);
        const projected = price * Math.pow(1 + growth, years);
        document.getElementById('valuationResult').textContent = 'Estimated value after ' + years + ' years: ' + formatCurrency(projected);
    });

    document.getElementById('areaForm').addEventListener('submit', function (event) {
        event.preventDefault();
        const value = Number(document.getElementById('areaValue').value || 0);
        const unit = document.getElementById('areaUnit').value;
        let converted = 0;
        if (unit === 'sqft') converted = value * 0.092903;
        if (unit === 'sqm') converted = value * 10.7639;
        if (unit === 'marla') converted = value * 272.25;
        document.getElementById('areaResult').textContent = value + ' ' + unit + ' = ' + converted.toFixed(2) + ' ' + (unit === 'sqft' ? 'sq m' : unit === 'sqm' ? 'sq ft' : 'sq ft');
    });
</script>
</body>
</html>
