package com.example.realestate.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApplicationErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, HttpServletResponse response, Model model) {
        Object statusAttribute = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        int statusCode = statusAttribute instanceof Number ? ((Number) statusAttribute).intValue() : 500;
        if (statusCode < 400 || statusCode > 599) {
            statusCode = 500;
        }

        response.setStatus(statusCode);
        model.addAttribute("statusCode", statusCode);
        model.addAttribute("errorMessage", messageFor(statusCode));
        return "error";
    }

    private String messageFor(int statusCode) {
        if (statusCode == 400) {
            return "We could not process that request. Check the information and try again.";
        }
        if (statusCode == 403) {
            return "This request could not be verified. Please refresh the page and try again.";
        }
        if (statusCode == 404) {
            return "The page or property you requested could not be found.";
        }
        return "Something went wrong. Please try again later.";
    }
}
