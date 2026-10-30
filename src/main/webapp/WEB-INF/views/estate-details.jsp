<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><c:out value="${estate.name}"/> - Details</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
		:root {
					     --primary-color: #2c3e50;
					     --secondary-color: #e74c3c;
					     --accent-color: #3498db;
					     --light-color: #ecf0f1;
					     --dark-color: #2c3e50;
					   }
					   
					   * {
					     margin: 0;
					     padding: 0;
					     box-sizing: border-box;
					     font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
					   }
					   
					   body {
					     background-color: #f9f9f9;
					     color: #333;
					     line-height: 1.6;
					   }
					   
					   /* Header Section */
					   .header-container {
					     position: relative;
					     width: 100%;
					     height: auto;
					     min-height: 300px;
					     max-height: 500px;
					     overflow: hidden;
					   }

					   .header-container img {
					     width: 100%;
					     height: 100%;
					     object-fit: cover;
					     transition: opacity 0.3s ease-in-out;
					   }

					   /* Quick Links */
					   .quick-links-container {
					     position: relative;
					     width: 100%;
					   }

					   .quick-links {
					     display: flex;
					     flex-wrap: wrap;
					     justify-content: center;
					     gap: 10px;
					     padding: 10px;
					     margin: 0 auto;
					     border-radius: 10px;
					     background-color:transparenblack;
					     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
					     max-width: 90%;
					     position: absolute;
					     bottom: 20px;
					     left: 50%;
					     transform: translateX(-50%);
					   }

					   .quick-links a {
					     color: black;
					     padding: 6px 12px;
					     text-decoration: none;
					     border-radius: 5px;
					     transition: background 0.3s;
					     font-size: 14px;
					     white-space: nowrap;
					   }

					   .quick-links a:hover {
					     background-color:black;
					   }

					   /* Navbar */
					   .navbar {
					     background-color: var(--primary-color) !important;
					     padding: 10px 0;
						 width:100%;
					   }
					   
					   .navbar-brand {
					     display: flex;
					     align-items: center;
					     margin-left: 10px;
					   }
					   
					   .navbar-brand span {
					     font-size: 1.2rem;
					     font-weight: 700;
					     color: white;
					     letter-spacing: 0.5px;
					     margin-left: 8px;
					   }
					   
					   .navbar-nav {
					     margin-right: 0;
					   }
					   
					   .nav-link {
					     color: white !important;
					     font-family: Verdana, sans-serif;
					     font-size: 0.9rem;
					     padding: 8px 12px;
					     transition: color 0.3s;
					   }
					   
					   .nav-link:hover {
					     color: var(--secondary-color) !important;
					   }
					   
					   .dropdown-menu {
					     border: none;
					     box-shadow: 0 5px 15px rgba(0,0,0,0.1);
					   }
					   
					   .dropdown-item {
					     padding: 8px 15px;
					   }
        h1, h3 {
            color: #2c3e50;
        }
        .estate-container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .estate-container img {
            border-radius: 6px;
            margin: 10px 0;
        }
        iframe {
            border: none;
            border-radius: 6px;
            margin-top: 10px;
        }
        .btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 18px;
            background: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            transition: background 0.3s ease;
        }
        .btn:hover {
            background: #0056b3;
        }
        .section {
            margin-bottom: 25px;
        }
    </style>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
	
	<nav class="navbar navbar-expand-lg navbar-dark">
		   <div class="container-fluid">
		     <a class="navbar-brand" href="${pageContext.request.contextPath}/about">
		       <img src="<c:url value='/resources/images/estate1.jpg'/>" alt="Logo" width="60" class="d-inline-block align-top">
		       <span>ESTATEFINDERS</span>
		     </a>
		     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown">
		       <span class="navbar-toggler-icon"></span>
		     </button>
		     <div class="collapse navbar-collapse" id="navbarNavDropdown">
		       <ul class="navbar-nav ms-auto">
		         <li class="nav-item">
		           <a class="nav-link active" href="${pageContext.request.contextPath}/project" style="margin-right:30px;">Home</a>
		         </li>
		         <li class="nav-item">
		           <a class="nav-link" href="${pageContext.request.contextPath}/about" style="margin-right:30px;">About Us</a>
		         </li>
		         <li class="nav-item">
		           <a class="nav-link" href="${pageContext.request.contextPath}/register" style="margin-right:30px;">Login/Register</a>
		         </li>
		         <li class="nav-item dropdown">
		           <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" style="margin-right:30px;">Menu</a>
		           <ul class="dropdown-menu dropdown-menu-dark">
		             <li><h6 class="dropdown-header">Services</h6></li>
		             <li><a class="dropdown-item" href="${pageContext.request.contextPath}/buy">Buy</a></li>
		             <li><a class="dropdown-item" href="${pageContext.request.contextPath}/rent">Rent</a></li>
		             <li><a class="dropdown-item" href="${pageContext.request.contextPath}/commercial">Commercial</a></li>
		             <li><a class="dropdown-item" href="${pageContext.request.contextPath}/pg">PG/Hostel</a></li>
		             <li><hr class="dropdown-divider"></li>
		             <li><a class="dropdown-item" href="${pageContext.request.contextPath}/contact">Contact</a></li>
		             <c:if test="${empty sessionScope['estatefinder.userId']}"><li><a class="dropdown-item" href="${pageContext.request.contextPath}/adminlogin">Admin Login</a></li></c:if>
		           </ul>
		         </li>
		       </ul>
		     </div>
		   </div>
		 </nav>
    <div class="estate-container">
        <h1><c:out value="${estate.name}"/></h1>

        <c:if test="${not empty estate.mainImagePath}">
            <img src="<c:out value='${estate.mainImagePath}'/>" alt="<c:out value='${estate.name}'/>" width="400">
        </c:if>

        <div class="section">
            <p><strong>Builder:</strong> <c:out value="${estate.builderName}"/></p>
            <p><strong>Price:</strong> <c:out value="${estate.price}"/></p>
            <p><strong>Location:</strong> <c:out value="${estate.location}"/></p>
            <p><strong>Description:</strong> <c:out value="${estate.description}"/></p>
            <p><strong>Sq. Ft:</strong> <c:out value="${estate.sqft}"/></p>
        </div>

        <div class="section">
            <h3>Floor Plan</h3>
            <c:if test="${not empty estate.floorPlanImagePath}">
                <img src="<c:out value='${estate.floorPlanImagePath}'/>" alt="Floor Plan" width="400">
            </c:if>
        </div>

        <div class="section">
            <h3>Map</h3>
            <c:url var="mapUrl" value="https://www.google.com/maps">
                <c:param name="q" value="${estate.location}"/>
                <c:param name="output" value="embed"/>
            </c:url>
            <iframe src="<c:out value='${mapUrl}'/>"
                    width="600" height="400"></iframe>
        </div>

        <div class="section">
            <h3>Neighbourhood Explorer</h3>
            <p>(Add schools, hospitals, malls, etc. info here)</p>
        </div>

        <div class="section">
            <h3>FAQ</h3>
            <p><c:out value="${estate.faq}"/></p>
        </div>
		
		<div class="section">
		  <h3>For Contacts</h3>
		  <p style="  font-family: Arial, sans-serif;">Estatefindersh<br>
		  Nashik,Maharastra</p>
		  	<a href="/contact" class="btn">Contacts</a>
		</div>			  
		 <div class="section">
		 <h3>For Booking</h3>
        <a href="/elogin" class="btn">Book Now</a>
		</div>
    </div>
</body>
</html>
