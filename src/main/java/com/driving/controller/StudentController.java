package com.driving.controller;

import com.driving.entity.Appointment;
import com.driving.entity.Coach;
import com.driving.entity.Score;
import com.driving.entity.Student;
import com.driving.service.AppointmentService;
import com.driving.service.CoachService;
import com.driving.service.ScoreService;
import com.driving.service.StudentService;
import com.driving.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private CoachService coachService;
    @Autowired
    private AppointmentService appointmentService;
    @Autowired
    private ScoreService scoreService;

    @GetMapping("/home")
    public String home(HttpServletRequest request, Model model) {
        Student student = SessionUtil.getStudent(request);
        model.addAttribute("student", student);
        model.addAttribute("pendingCount", appointmentService.listByStudent(student.getId(), 0).size());
        model.addAttribute("passCount", appointmentService.listByStudent(student.getId(), 1).size());
        return "student/home";
    }

    @GetMapping("/info")
    public String info(HttpServletRequest request, Model model) {
        Student student = SessionUtil.getStudent(request);
        model.addAttribute("student", studentService.findById(student.getId()));
        return "student/info";
    }

    @PostMapping("/info")
    public String updateInfo(HttpServletRequest request, Student student) {
        studentService.update(student);
        Student s = studentService.findById(student.getId());
        SessionUtil.setUser(request, s, SessionUtil.ROLE_STUDENT);
        return "redirect:/student/info";
    }

    @GetMapping("/password")
    public String passwordForm() {
        return "student/password";
    }

    @PostMapping("/password")
    public String passwordUpdate(HttpServletRequest request,
                                 @RequestParam String oldPwd,
                                 @RequestParam String newPwd,
                                 @RequestParam String confirmPwd,
                                 Model model) {
        if (!newPwd.equals(confirmPwd)) {
            model.addAttribute("msg", "两次新密码不一致");
            return "student/password";
        }
        Student student = SessionUtil.getStudent(request);
        boolean ok = studentService.updatePassword(student.getId(), oldPwd, newPwd);
        if (!ok) {
            model.addAttribute("msg", "原密码错误");
            return "student/password";
        }
        model.addAttribute("msg", "修改成功");
        return "student/password";
    }

    @GetMapping("/appoint/add")
    public String appointAddForm(Model model) {
        List<Coach> coaches = coachService.list();
        model.addAttribute("coaches", coaches);
        return "student/appoint/add";
    }

    @PostMapping("/appoint/add")
    public String appointAdd(HttpServletRequest request, Appointment appointment, Model model) {
        Student student = SessionUtil.getStudent(request);
        appointment.setStudentId(student.getId());
        String error = appointmentService.add(appointment);
        if (error != null) {
            model.addAttribute("msg", error);
            model.addAttribute("coaches", coachService.list());
            return "student/appoint/add";
        }
        return "redirect:/student/appoint/list";
    }

    @GetMapping("/appoint/list")
    public String appointList(HttpServletRequest request,
                              @RequestParam(required = false) Integer status,
                              Model model) {
        Student student = SessionUtil.getStudent(request);
        List<Appointment> list = appointmentService.listByStudent(student.getId(), status);
        model.addAttribute("list", list);
        model.addAttribute("status", status);
        return "student/appoint/list";
    }

    @GetMapping("/appoint/cancel/{id}")
    public String appointCancel(@PathVariable Integer id, Model model) {
        Appointment a = appointmentService.findById(id);
        if (a != null && a.getStatus() == 0) {
            appointmentService.cancel(id);
            model.addAttribute("msg", "取消成功");
        } else {
            model.addAttribute("msg", "只能取消待审核的预约");
        }
        return "redirect:/student/appoint/list";
    }

    @GetMapping("/score/list")
    public String scoreList(HttpServletRequest request, Model model) {
        Student student = SessionUtil.getStudent(request);
        List<Score> list = scoreService.listByStudent(student.getId());
        model.addAttribute("list", list);
        return "student/score/list";
    }
}
