<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Estate | EstateFinders Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
    <style>
        .container {
            width: min(760px, calc(100% - 32px));
            margin: 0 auto;
        }

        h1 {
            margin-bottom: 22px;
            color: var(--admin-navy);
            font-size: clamp(1.7rem, 3vw, 2.3rem);
            font-weight: 800;
        }

        button {
            min-height: 46px;
        }

		.property-image-container {
		    width: 100%;
		    height: 200px;
		    overflow: hidden;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}

		.property-image-container img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		    border-radius: 8px;
		}
    </style>
</head>
<body>
<%@ include file="admin-navigation.jspf" %>
    <main class="admin-page">
    <p class="admin-page-subtitle">Add a property showcase card to the site.</p>
    <div class="admin-card admin-form-card">
        <h1>Add new property</h1>
        <form action="${pageContext.request.contextPath}/estate/save" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf}">
            
            <div class="mb-3">
                <label class="form-label" for="estateName">Property name</label>
                <input class="form-control" id="estateName" type="text" name="name" required/>
            </div>

            <div class="mb-3">
                <label class="form-label" for="builderName">Builder name</label>
                <input class="form-control" id="builderName" type="text" name="builderName" required/>
            </div>

            <div class="mb-3">
                <label class="form-label" for="price">Price</label>
                <input class="form-control" id="price" type="number" name="price" step="0.01" required/>
            </div>

            <div class="mb-3">
                <label class="form-label" for="location">Location</label>
                <input class="form-control" id="location" type="text" name="location" required/>
            </div>

            <div class="mb-3">
                <label class="form-label" for="description">Description</label>
                <textarea class="form-control" id="description" name="description"></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label" for="sqft">Area (sq ft)</label>
                <input class="form-control" id="sqft" type="text" name="sqft"/>
            </div>

            <div class="mb-3">
                <label class="form-label" for="floorPlanImage">Floor plan image</label>
                <input class="form-control" id="floorPlanImage" type="file" name="floorPlanImage" accept="image/*" required/>
            </div>

            <div class="mb-3">
                <label class="form-label" for="faq">Frequently asked questions</label>
                <textarea class="form-control" id="faq" name="faq"></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label" for="mainImage">Main property image</label>
                <input class="form-control" id="mainImage" type="file" name="mainImage" accept="image/*" required/>
            </div>

            <button class="btn admin-btn-primary w-100" type="submit">Save property</button>
        </form>
    </div>
    </main>
</body>
</html>
