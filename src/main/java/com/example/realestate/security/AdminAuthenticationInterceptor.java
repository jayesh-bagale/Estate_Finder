package com.example.realestate.security;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.lang.NonNull;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AdminAuthenticationInterceptor implements HandlerInterceptor {

    public static final String ADMIN_SESSION_ATTRIBUTE = "estatefinder.adminId";
    private static final String CSRF_SESSION_ATTRIBUTE = "estatefinder.adminCsrfToken";

    @Override
    public boolean preHandle(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response,
                             @NonNull Object handler)
            throws Exception {
        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String path = requestUri == null ? "/" : requestUri.substring(contextPath.length());
        if ("/adregister".equals(path)) {
            return validatePublicRegistrationCsrf(request, response);
        }
        if (!requiresAdministrator(path)) {
            return true;
        }

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute(ADMIN_SESSION_ATTRIBUTE) == null) {
            response.sendRedirect(request.getContextPath() + "/adminlogin");
            return false;
        }

        String method = request.getMethod();
        if ("GET".equals(method) || "HEAD".equals(method) || "OPTIONS".equals(method)) {
            String token = (String) session.getAttribute(CSRF_SESSION_ATTRIBUTE);
            if (token == null) {
                token = UUID.randomUUID().toString();
                session.setAttribute(CSRF_SESSION_ATTRIBUTE, token);
            }
            request.setAttribute("_csrf", token);
            return true;
        }

        String expectedToken = (String) session.getAttribute(CSRF_SESSION_ATTRIBUTE);
        String suppliedToken = request.getParameter("_csrf");
        if (expectedToken == null || suppliedToken == null
                || !MessageDigest.isEqual(expectedToken.getBytes(StandardCharsets.UTF_8),
                        suppliedToken.getBytes(StandardCharsets.UTF_8))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return false;
        }
        return true;
    }

    private boolean validatePublicRegistrationCsrf(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String method = request.getMethod();
        if ("GET".equals(method) || "HEAD".equals(method) || "OPTIONS".equals(method)) {
            HttpSession session = request.getSession(true);
            String token = (String) session.getAttribute(CSRF_SESSION_ATTRIBUTE);
            if (token == null) {
                token = UUID.randomUUID().toString();
                session.setAttribute(CSRF_SESSION_ATTRIBUTE, token);
            }
            request.setAttribute("_csrf", token);
            return true;
        }

        if (!"POST".equals(method)) {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return false;
        }

        HttpSession session = request.getSession(false);
        String expectedToken = session == null ? null : (String) session.getAttribute(CSRF_SESSION_ATTRIBUTE);
        String suppliedToken = request.getParameter("_csrf");
        if (expectedToken == null || suppliedToken == null
                || !MessageDigest.isEqual(expectedToken.getBytes(StandardCharsets.UTF_8),
                        suppliedToken.getBytes(StandardCharsets.UTF_8))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return false;
        }
        return true;
    }

    private boolean requiresAdministrator(String path) {
        return "/adminmain".equals(path)
                || "/admindashboard".equals(path)
                || path.startsWith("/admin/")
                || "/estate/add".equals(path)
                || "/estate/save".equals(path)
                || "/estate/manage".equals(path)
                || path.startsWith("/estate/delete/")
                || "/property/sellproperty".equals(path)
                || path.startsWith("/property/accept/")
                || path.startsWith("/property/decline/");
    }
}
