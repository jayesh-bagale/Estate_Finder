<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${statusCode} | EstateFinders</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
  <style>
    main { width: min(560px, calc(100% - 28px)); margin: 12vh auto; padding: 40px 28px; text-align: center; background: #fff; border: 1px solid #e6edf5; border-radius: 22px; box-shadow: 0 12px 36px rgba(10, 35, 66, .1); }
    h1 { margin: 0; color: #0a2342; font-size: 3rem; }
    p { line-height: 1.6; }
    a { display: inline-block; margin-top: 12px; padding: 11px 20px; color: #fff; text-decoration: none; background: linear-gradient(135deg,#ff6a3d,#ff8f59); border-radius: 11px; font-weight: 750; }
    a:focus-visible { outline: 3px solid #ff9d2f; outline-offset: 3px; }
  </style>
</head>
<body>
  <main>
    <h1>${statusCode}</h1>
    <p>${errorMessage}</p>
    <a href="${pageContext.request.contextPath}/project">Return to EstateFinders</a>
  </main>
</body>
</html>
