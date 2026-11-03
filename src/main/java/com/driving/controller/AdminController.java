package com.driving.controller;

import com.driving.entity.Admin;
import com.driving.entity.Appointment;
import com.driving.entity.Coach;
import com.driving.entity.Score;
import com.driving.entity.Student;
import com.driving.service.AdminService;
import com.driving.service.AppointmentService;
import com.driving.service.CoachService;
import com.driving.service.ScoreService;
import com.driving.service.StudentService;
import com.driving.util.SessionUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private CoachService coachService;
    @Autowired
    private AppointmentService appointmentService;
    @Autowired
    private ScoreService scoreService;
    @Autowired
    private AdminService adminService;

    @GetMapping("/home")
    public String home(HttpServletRequest request, Model model) {
        Admin admin = SessionUtil.getAdmin(request);
        model.addAttribute("admin", admin);
        model.addAttribute("studentCount", studentService.list().size());
        model.addAttribute("coachCount", coachService.list().size());
        return "admin/home";
    }

    @GetMapping("/student/list")
    public String studentList(@RequestParam(defaultValue = "1") int page,
                              @RequestParam(defaultValue = "5") int size,
                              Model model) {
        PageHelper.startPage(page, size);
        List<Student> list = studentService.list();
        PageInfo<Student> pageInfo = new PageInfo<>(list);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/student/list";
    }

    @GetMapping("/student/add")
    public String studentAddForm() {
        return "admin/student/add";
    }

    @PostMapping("/student/add")
    public String studentAdd(Student student, Model model) {
        boolean ok = studentService.add(student);
        if (!ok) {
            model.addAttribute("msg", "新增失败，账号可能已存在");
            return "admin/student/add";
        }
        return "redirect:/admin/student/list";
    }

    @GetMapping("/student/edit/{id}")
    public String studentEditForm(@PathVariable Integer id, Model model) {
        model.addAttribute("student", studentService.findById(id));
        return "admin/student/edit";
    }

    @PostMapping("/student/edit")
    public String studentEdit(Student student) {
        studentService.update(student);
        return "redirect:/admin/student/list";
    }

    @GetMapping("/student/delete/{id}")
    public String studentDelete(@PathVariable Integer id) {
        studentService.delete(id);
        return "redirect:/admin/student/list";
    }

    @GetMapping("/coach/list")
    public String coachList(@RequestParam(defaultValue = "1") int page,
                            @RequestParam(defaultValue = "5") int size,
                            Model model) {
        PageHelper.startPage(page, size);
        List<Coach> list = coachService.list();
        PageInfo<Coach> pageInfo = new PageInfo<>(list);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/coach/list";
    }

    @GetMapping("/coach/add")
    public String coachAddForm() {
        return "admin/coach/add";
    }

    @PostMapping("/coach/add")
    public String coachAdd(Coach coach, Model model) {
        boolean ok = coachService.add(coach);
        if (!ok) {
            model.addAttribute("msg", "新增失败，账号可能已存在");
            return "admin/coach/add";
        }
        return "redirect:/admin/coach/list";
    }

    @GetMapping("/coach/edit/{id}")
    public String coachEditForm(@PathVariable Integer id, Model model) {
        model.addAttribute("coach", coachService.findById(id));
        return "admin/coach/edit";
    }

    @PostMapping("/coach/edit")
    public String coachEdit(Coach coach) {
        coachService.update(coach);
        return "redirect:/admin/coach/list";
    }

    @GetMapping("/coach/delete/{id}")
    public String coachDelete(@PathVariable Integer id) {
        coachService.delete(id);
        return "redirect:/admin/coach/list";
    }

    @GetMapping("/appoint/list")
    public String appointList(@RequestParam(required = false) Integer status,
                              @RequestParam(defaultValue = "1") int page,
                              @RequestParam(defaultValue = "5") int size,
                              Model model) {
        PageHelper.startPage(page, size);
        List<Appointment> list = appointmentService.list(status);
        PageInfo<Appointment> pageInfo = new PageInfo<>(list);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("status", status);
        return "admin/appoint/list";
    }

    @GetMapping("/appoint/delete/{id}")
    public String appointDelete(@PathVariable Integer id) {
        appointmentService.delete(id);
        return "redirect:/admin/appoint/list";
    }

    @GetMapping("/score/list")
    public String scoreList(@RequestParam(defaultValue = "1") int page,
                            @RequestParam(defaultValue = "5") int size,
                            Model model) {
        PageHelper.startPage(page, size);
        List<Score> list = scoreService.list();
        PageInfo<Score> pageInfo = new PageInfo<>(list);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/score/list";
    }

    @GetMapping("/score/export")
    public String scoreExport(Model model) {
        List<Score> list = scoreService.list();
        model.addAttribute("scores", list);
        return "admin/score/export";
    }

    @GetMapping("/password")
    public String passwordForm() {
        return "admin/password";
    }

    @PostMapping("/password")
    public String passwordUpdate(HttpServletRequest request,
                                 @RequestParam String oldPwd,
                                 @RequestParam String newPwd,
                                 @RequestParam String confirmPwd,
                                 Model model) {
        if (!newPwd.equals(confirmPwd)) {
            model.addAttribute("msg", "两次新密码不一致");
            return "admin/password";
        }
        Admin admin = SessionUtil.getAdmin(request);
        boolean ok = adminService.updatePassword(admin.getId(), oldPwd, newPwd);
        if (!ok) {
            model.addAttribute("msg", "原密码错误");
            return "admin/password";
        }
        model.addAttribute("msg", "修改成功，请重新登录");
        SessionUtil.clear(request);
        return "login";
    }
}
