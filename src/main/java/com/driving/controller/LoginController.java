package com.driving.controller;

import com.driving.entity.Admin;
import com.driving.entity.Coach;
import com.driving.entity.Student;
import com.driving.service.LoginService;
import com.driving.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping({"/", "/login"})
    public String login(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object msg = session.getAttribute("loginMsg");
        if (msg != null) {
            request.setAttribute("msg", msg);
            session.removeAttribute("loginMsg");
        }
        return "login";
    }

    @PostMapping("/doLogin")
    public String doLogin(@RequestParam String username,
                          @RequestParam String password,
                          @RequestParam String role,
                          HttpServletRequest request) {
        switch (role) {
            case "admin":
                Admin admin = loginService.loginAdmin(username, password);
                if (admin != null) {
                    SessionUtil.setUser(request, admin, SessionUtil.ROLE_ADMIN);
                    return "redirect:/admin/home";
                }
                break;
            case "student":
                Student student = loginService.loginStudent(username, password);
                if (student != null) {
                    SessionUtil.setUser(request, student, SessionUtil.ROLE_STUDENT);
                    return "redirect:/student/home";
                }
                break;
            case "coach":
                Coach coach = loginService.loginCoach(username, password);
                if (coach != null) {
                    SessionUtil.setUser(request, coach, SessionUtil.ROLE_COACH);
                    return "redirect:/coach/home";
                }
                break;
        }
        request.getSession().setAttribute("loginMsg", "账号或密码错误，请重试（请先确认已导入 sql/jiaxiao.sql）");
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        SessionUtil.clear(request);
        return "redirect:/login";
    }
}
