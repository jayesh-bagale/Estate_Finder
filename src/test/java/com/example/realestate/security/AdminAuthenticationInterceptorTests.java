package com.example.realestate.security;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Objects;

import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;

class AdminAuthenticationInterceptorTests {

    private final AdminAuthenticationInterceptor interceptor = new AdminAuthenticationInterceptor();

    @Test
    void redirectsUnauthenticatedAdminRequestsToLogin() throws Exception {
        MockHttpServletRequest request = request("/admin/users", "GET");
        MockHttpServletResponse response = new MockHttpServletResponse();

        assertFalse(interceptor.preHandle(Objects.requireNonNull(request), Objects.requireNonNull(response), new Object()));
        assertEquals("/adminlogin", response.getRedirectedUrl());
    }

    @Test
    void generatesCsrfTokenForAuthenticatedAdminPage() throws Exception {
        MockHttpServletRequest request = authenticatedRequest("/admin/users", "GET");
        MockHttpServletResponse response = new MockHttpServletResponse();

        assertTrue(interceptor.preHandle(Objects.requireNonNull(request), Objects.requireNonNull(response), new Object()));
        assertNotNull(request.getAttribute("_csrf"));
    }

    @Test
    void rejectsAdminMutationWithoutCsrfToken() throws Exception {
        MockHttpServletRequest request = authenticatedRequest("/estate/save", "POST");
        MockHttpServletResponse response = new MockHttpServletResponse();

        assertFalse(interceptor.preHandle(Objects.requireNonNull(request), Objects.requireNonNull(response), new Object()));
        assertEquals(403, response.getStatus());
    }

    @Test
    void acceptsAdminMutationWithSessionCsrfToken() throws Exception {
        String token = "valid-token";
        MockHttpServletRequest request = authenticatedRequest("/estate/save", "POST");
        MockHttpSession session = new MockHttpSession();
        session.setAttribute(AdminAuthenticationInterceptor.ADMIN_SESSION_ATTRIBUTE, 1L);
        session.setAttribute("estatefinder.adminCsrfToken", token);
        request.setSession(session);
        request.setParameter("_csrf", token);
        MockHttpServletResponse response = new MockHttpServletResponse();

        assertTrue(interceptor.preHandle(Objects.requireNonNull(request), Objects.requireNonNull(response), new Object()));
        assertEquals(200, response.getStatus());
    }

    @Test
    void protectsPropertyDeletionWithAdministratorSessionAndCsrf() throws Exception {
        MockHttpServletRequest unauthenticatedRequest = request("/admin/properties/12/delete", "POST");
        MockHttpServletResponse unauthenticatedResponse = new MockHttpServletResponse();

        assertFalse(interceptor.preHandle(
                Objects.requireNonNull(unauthenticatedRequest),
                Objects.requireNonNull(unauthenticatedResponse), new Object()));
        assertEquals("/adminlogin", unauthenticatedResponse.getRedirectedUrl());

        String token = "property-delete-token";
        MockHttpServletRequest authenticatedRequest = authenticatedRequest("/admin/properties/12/delete", "POST");
        authenticatedRequest.getSession().setAttribute("estatefinder.adminCsrfToken", token);
        authenticatedRequest.setParameter("_csrf", token);
        MockHttpServletResponse authenticatedResponse = new MockHttpServletResponse();

        assertTrue(interceptor.preHandle(
                Objects.requireNonNull(authenticatedRequest),
                Objects.requireNonNull(authenticatedResponse), new Object()));
    }

    @Test
    void leavesPublicPagesAccessible() throws Exception {
        MockHttpServletRequest request = request("/properties/nashik", "GET");
        MockHttpServletResponse response = new MockHttpServletResponse();

        assertTrue(interceptor.preHandle(Objects.requireNonNull(request), Objects.requireNonNull(response), new Object()));
    }

    @Test
    void allowsPublicAdminRegistrationPageAndCreatesCsrfToken() throws Exception {
        MockHttpServletRequest request = request("/adregister", "GET");
        MockHttpServletResponse response = new MockHttpServletResponse();

        assertTrue(interceptor.preHandle(Objects.requireNonNull(request), Objects.requireNonNull(response), new Object()));
        assertNotNull(request.getAttribute("_csrf"));
    }

    @Test
    void acceptsPublicAdminRegistrationWithSessionCsrfToken() throws Exception {
        String token = "valid-registration-token";
        MockHttpServletRequest request = request("/adregister", "POST");
        MockHttpSession session = new MockHttpSession();
        session.setAttribute("estatefinder.adminCsrfToken", token);
        request.setSession(session);
        request.setParameter("_csrf", token);
        MockHttpServletResponse response = new MockHttpServletResponse();

        assertTrue(interceptor.preHandle(Objects.requireNonNull(request), Objects.requireNonNull(response), new Object()));
    }

    @Test
    void rejectsPublicAdminRegistrationWithoutCsrfToken() throws Exception {
        MockHttpServletRequest request = request("/adregister", "POST");
        MockHttpServletResponse response = new MockHttpServletResponse();

        assertFalse(interceptor.preHandle(Objects.requireNonNull(request), Objects.requireNonNull(response), new Object()));
        assertEquals(403, response.getStatus());
    }

    private MockHttpServletRequest request(String path, String method) {
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.setRequestURI(path);
        request.setMethod(method);
        return request;
    }

    private MockHttpServletRequest authenticatedRequest(String path, String method) {
        MockHttpServletRequest request = request(path, method);
        MockHttpSession session = new MockHttpSession();
        session.setAttribute(AdminAuthenticationInterceptor.ADMIN_SESSION_ATTRIBUTE, 1L);
        request.setSession(session);
        return request;
    }
}
