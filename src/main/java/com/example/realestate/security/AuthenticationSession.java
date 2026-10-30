package com.example.realestate.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public final class AuthenticationSession {

    private AuthenticationSession() {
    }

    public static HttpSession startFresh(HttpServletRequest request) {
        HttpSession existingSession = request.getSession(false);
        if (existingSession != null) {
            existingSession.invalidate();
        }
        HttpSession session = request.getSession(true);
        request.changeSessionId();
        return session;
    }
}
