package com.driving.util;

import com.driving.entity.Admin;
import com.driving.entity.Coach;
import com.driving.entity.Student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtil {
    public static final String ROLE_ADMIN = "admin";
    public static final String ROLE_STUDENT = "student";
    public static final String ROLE_COACH = "coach";

    public static void setUser(HttpServletRequest request, Object user, String role) {
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", user);
        session.setAttribute("loginRole", role);
    }

    public static Object getUser(HttpServletRequest request) {
        return request.getSession().getAttribute("loginUser");
    }

    public static String getRole(HttpServletRequest request) {
        return (String) request.getSession().getAttribute("loginRole");
    }

    public static Admin getAdmin(HttpServletRequest request) {
        Object obj = getUser(request);
        return obj instanceof Admin ? (Admin) obj : null;
    }

    public static Student getStudent(HttpServletRequest request) {
        Object obj = getUser(request);
        return obj instanceof Student ? (Student) obj : null;
    }

    public static Coach getCoach(HttpServletRequest request) {
        Object obj = getUser(request);
        return obj instanceof Coach ? (Coach) obj : null;
    }

    public static void clear(HttpServletRequest request) {
        request.getSession().invalidate();
    }
}
