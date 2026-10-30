<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sell Property</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

	<style>
	    :root {
	      --primary-color: #2c3e50;
	      --secondary-color: #e74c3c;
	      --accent-color: #3498db;
	      --light-color: #ecf0f1;
	      --dark-color: #2c3e50;
	    }

	    body {
	      background-size: cover;
	      background-repeat: no-repeat;
	      background-attachment: fixed;
	      font-family: Arial, sans-serif;
	      margin: 0;
	      padding: 0;
	    }

	    .navbar {
	      background-color: var(--primary-color) !important;
	      padding: 15px 0;
	    }

	    .navbar-brand {
	      display: flex;
	      align-items: center;
	      margin-left: 20px;
	    }

	    .navbar-brand span {
	      font-size: 1.4rem;
	      font-weight: 700;
	      color: white;
	      letter-spacing: 0.5px;
	      margin-left: 10px;
	    }

	    .nav-link {
	      color: white !important;
	      font-family: Verdana, sans-serif;
	      font-size: 1rem;
	      padding: 8px 15px;
	      transition: color 0.3s;
	    }

	    .nav-link:hover {
	      color: var(--secondary-color) !important;
	    }

	    .dropdown-menu {
	      border: none;
	      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
	    }

	    h3 {
	      text-align: center;
	      color: #333;
	      margin-top: 20px;
	    }

	    .container {
	      max-width: 800px;
	      height: auto;
	      margin: 30px auto;
	      padding: 20px;
	      background-color: rgba(255, 255, 255, 0.8);
	      border-radius: 10px;
	      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    }

	    .form-label {
	      font-weight: bold;
	    }

	    .sell-intro { color:#64748b; margin-bottom:22px; }
	    .sell-section { padding:20px; margin-bottom:18px; border:1px solid #e6edf5; border-radius:14px; background:#fff; }
	    .sell-section h3 { margin:0 0 16px; text-align:left; color:#2c3e50; font-size:1.05rem; font-weight:700; }
	    .sell-section .form-text { color:#64748b; }
	    .location-preview { width:100%; height:280px; border:0; border-radius:12px; background:#f1f5f9; }

	    .form-control {
	      width: 100%;
	      padding: 10px;
	      margin-bottom: 15px;
	      border: 1px solid #ccc;
	      border-radius: 5px;
	    }

	    .btn-primary {
	      background-color: #007bff;
	      color: white;
	      border: none;
	      padding: 10px 15px;
	      border-radius: 5px;
	      cursor: pointer;
	      width:100%;
	      margin-top: 10px;
	      font-size:20px;
	    }

	    .btn-primary:hover {
	      background-color: #0056b3;
	    }

	    .row1, .row2, .row3 {
	      margin-top: 30px;
	      display: flex;
	      flex-wrap: wrap;
	      justify-content: space-between;
	      margin-bottom: 20px;
	    }

	    .form-field {
	      flex: 1;
	      min-width: 200px;
	    }

	    label {
	      font-weight: bold;
	      color: #333;
	      margin-bottom: 5px;
	    }

	    @media (max-width: 768px) {
	      .row1, .row2, .row3 {
	        flex-direction: column;
	      }
	    }
	  </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site-polish.css">
</head>
<body>
	
	<!-- Navbar -->
	 <nav class="navbar navbar-expand-lg navbar-dark">
	   <div class="container-fluid">
	     <a class="navbar-brand" href="${pageContext.request.contextPath}/">
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

<div class="container mt-5">
    <h2>List Your Property</h2>
    <p class="sell-intro">Complete all property and location details. Your listing will be reviewed by an administrator before it appears publicly.</p>
    
	<form action="${pageContext.request.contextPath}/property/submit-property" method="post" enctype="multipart/form-data">
	    <section class="sell-section" aria-labelledby="basicDetailsHeading">
	        <h3 id="basicDetailsHeading"><i class="fa-solid fa-house me-2"></i>Basic property details</h3>
	        <div class="mb-3">
	            <label class="form-label" for="title">Property title</label>
	            <input id="title" type="text" name="title" class="form-control" maxlength="255"
	                   placeholder="Example: Spacious 2 BHK apartment" required/>
	        </div>
	        <div class="mb-3">
	            <label class="form-label" for="description">About this property</label>
	            <textarea id="description" name="description" class="form-control" rows="4" maxlength="2000"
	                      placeholder="Describe the property, nearby facilities and any important details" required></textarea>
	        </div>
	        <div class="row g-3">
	            <div class="col-md-6">
	                <label class="form-label" for="ownerName">Owner name</label>
	                <input id="ownerName" type="text" name="ownerName" class="form-control" maxlength="255"
	                       placeholder="Name to display on the property details page" required/>
	            </div>
	            <div class="col-md-6">
	                <label class="form-label" for="price">Expected price (₹)</label>
	                <input id="price" type="number" name="price" class="form-control" min="1" step="0.01" required/>
	            </div>
	            <div class="col-md-6">
	                <label class="form-label" for="listingType">Listing purpose</label>
	                <select id="listingType" name="listingType" class="form-select" required>
	                    <option value="">Select sale, rent or commercial</option>
	                    <option value="BUY">For sale</option>
	                    <option value="RENT">For rent</option>
	                    <option value="COMMERCIAL">Commercial</option>
	                </select>
	            </div>
	            <div class="col-md-6">
	                <label class="form-label" for="propertyType">Property type</label>
	                <select id="propertyType" name="propertyType" class="form-select" required>
	                    <option value="">Select property type</option>
	                    <option>Apartment</option>
	                    <option>Independent house</option>
	                    <option>Villa</option>
	                    <option>Plot</option>
	                    <option>Commercial space</option>
	                    <option>Other</option>
	                </select>
	            </div>
	        </div>
	    </section>

	    <section class="sell-section" aria-labelledby="locationDetailsHeading">
	        <h3 id="locationDetailsHeading"><i class="fa-solid fa-location-dot me-2"></i>Complete property location</h3>
	        <p class="form-text mb-3">Enter the street address, locality, city and PIN code so buyers can find the correct area. The map preview is approximate.</p>
	        <div class="mb-3">
	            <label class="form-label" for="address">Building, street and full address</label>
	            <input id="address" type="text" name="address" class="form-control" maxlength="255"
	                   placeholder="Building name, flat/plot number, street and road" required/>
	        </div>
	        <div class="row g-3">
	            <div class="col-md-6">
	                <label class="form-label" for="locality">Locality / area</label>
	                <input id="locality" type="text" name="locality" class="form-control" maxlength="255"
	                       placeholder="Example: Gangapur Road" required/>
	            </div>
	            <div class="col-md-6">
	                <label class="form-label" for="city">City</label>
	                <select id="city" name="city" class="form-select" required>
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
	            <div class="col-md-6">
	                <label class="form-label" for="postalCode">PIN code</label>
	                <input id="postalCode" type="text" name="postalCode" class="form-control"
	                       inputmode="numeric" pattern="[0-9]{6}" maxlength="6" minlength="6"
	                       placeholder="6-digit PIN code" required/>
	                <div class="form-text">Enter a valid 6-digit Indian PIN code.</div>
	            </div>
	        </div>
	        <div class="mt-3">
	            <iframe id="locationPreview" class="location-preview" title="Approximate property location preview"
	                    loading="lazy" referrerpolicy="no-referrer-when-downgrade" hidden></iframe>
	            <p id="locationPreviewHint" class="form-text mt-2 mb-0" aria-live="polite">
	                Fill in the address, locality, city and PIN code to preview the location on Google Maps.
	            </p>
	        </div>
	    </section>

	    <section class="sell-section" aria-labelledby="propertyFeaturesHeading">
	        <h3 id="propertyFeaturesHeading"><i class="fa-solid fa-list-check me-2"></i>Property features</h3>
	        <div class="row g-3">
	            <div class="col-md-4">
	                <label class="form-label" for="bedrooms">Bedrooms</label>
	                <input id="bedrooms" type="number" name="bedrooms" class="form-control" min="0" max="50" required/>
	            </div>
	            <div class="col-md-4">
	                <label class="form-label" for="bathrooms">Bathrooms</label>
	                <input id="bathrooms" type="number" name="bathrooms" class="form-control" min="0" max="50" required/>
	            </div>
	            <div class="col-md-4">
	                <label class="form-label" for="areaSqFt">Area (sq ft)</label>
	                <input id="areaSqFt" type="number" name="areaSqFt" class="form-control" min="1" required/>
	            </div>
	            <div class="col-md-6">
	                <label class="form-label" for="furnishing">Furnishing</label>
	                <select id="furnishing" name="furnishing" class="form-select" required>
	                    <option value="">Select furnishing</option>
	                    <option>Unfurnished</option>
	                    <option>Semi-furnished</option>
	                    <option>Fully furnished</option>
	                    <option>Not applicable</option>
	                </select>
	            </div>
	            <div class="col-12">
	                <label class="form-label" for="amenities">Amenities / facilities</label>
	                <textarea id="amenities" name="amenities" class="form-control" rows="3" maxlength="1000"
	                          placeholder="Example: Parking, lift, security, garden" required></textarea>
	            </div>
	            <div class="col-12">
	                <label class="form-label" for="image">Property image</label>
	                <input id="image" type="file" name="image" class="form-control"
	                       accept="image/jpeg,image/png,image/webp" required/>
	                <div class="form-text">Upload a clear JPG, PNG or WebP image (maximum size 5 MB).</div>
	            </div>
	        </div>
	    </section>
	    <button type="submit" class="btn btn-primary btn-lg w-100">Submit property for review</button>
	</form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	    const locationFields = ["address", "locality", "city", "postalCode"];
	    const locationPreview = document.getElementById("locationPreview");
	    const locationPreviewHint = document.getElementById("locationPreviewHint");

	    function updateLocationPreview() {
	        const values = locationFields.map((id) => document.getElementById(id).value.trim());
	        if (values.some((value) => !value)) {
	            locationPreview.hidden = true;
	            locationPreviewHint.textContent = "Fill in the address, locality, city and PIN code to preview the location on Google Maps.";
	            return;
	        }

	        const city = document.getElementById("city");
	        const cityName = city.options[city.selectedIndex].text;
	        const mapUrl = new URL("https://www.google.com/maps");
	        mapUrl.searchParams.set("q", values[0] + ", " + values[1] + ", " + cityName + " " + values[3]);
	        mapUrl.searchParams.set("output", "embed");
	        locationPreview.src = mapUrl.toString();
	        locationPreview.hidden = false;
	        locationPreviewHint.textContent = "Approximate map preview. Confirm the full address and PIN code before submitting.";
	    }

	    locationFields.forEach((id) => {
	        document.getElementById(id).addEventListener("input", updateLocationPreview);
	        document.getElementById(id).addEventListener("change", updateLocationPreview);
	    });
	</script>
</div>
</body>
</html>
