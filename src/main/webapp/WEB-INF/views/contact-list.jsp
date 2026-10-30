<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Messages | EstateFinders Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
</head>
<body>
<%@ include file="admin-navigation.jspf" %>
<main class="admin-page">
    <h1 class="admin-page-title">Contact messages</h1>
    <p class="admin-page-subtitle">Enquiries sent by visitors through the public contact form.</p>
    <div class="admin-panel table-responsive">
    <table class="table table-hover align-middle">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Subject</th>
            <th>Message</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="contact" items="${contacts}">
            <tr>
                <td><c:out value="${contact.id}"/></td>
                <td><c:out value="${contact.name}"/></td>
                <td><c:out value="${contact.email}"/></td>
                <td><c:out value="${contact.phone}"/></td>
                <td><c:out value="${contact.subject}"/></td>
                <td><c:out value="${contact.message}"/></td>
                <td>
                    <form action="<c:url value='/admin/contact/${contact.id}/delete'/>"
                          method="post" class="d-inline"
                          onsubmit="return confirm('Delete this message permanently? This cannot be undone.');">
                        <input type="hidden" name="_csrf" value="<c:out value='${_csrf}'/>">
                        <button type="submit" class="btn btn-outline-danger btn-sm">
                            <i class="fa-solid fa-trash-can me-1"></i>Delete
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty contacts}">
            <tr><td colspan="7" class="admin-empty">No messages have been received yet.</td></tr>
        </c:if>
        </tbody>
    </table>
    </div>
</main>
</body>
</html>
