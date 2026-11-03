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
@RequestMapping("/coach")
public class CoachController {

    @Autowired
    private CoachService coachService;
    @Autowired
    private AppointmentService appointmentService;
    @Autowired
    private ScoreService scoreService;
    @Autowired
    private StudentService studentService;

    @GetMapping("/home")
    public String home(HttpServletRequest request, Model model) {
        Coach coach = SessionUtil.getCoach(request);
        model.addAttribute("coach", coach);
        model.addAttribute("pendingCount", appointmentService.listByCoach(coach.getId(), 0).size());
        model.addAttribute("approveCount", appointmentService.listByCoach(coach.getId(), 1).size());
        return "coach/home";
    }

    @GetMapping("/info")
    public String info(HttpServletRequest request, Model model) {
        Coach coach = SessionUtil.getCoach(request);
        model.addAttribute("coach", coachService.findById(coach.getId()));
        return "coach/info";
    }

    @PostMapping("/info")
    public String updateInfo(HttpServletRequest request, Coach coach) {
        coachService.update(coach);
        Coach c = coachService.findById(coach.getId());
        SessionUtil.setUser(request, c, SessionUtil.ROLE_COACH);
        return "redirect:/coach/info";
    }

    @GetMapping("/password")
    public String passwordForm() {
        return "coach/password";
    }

    @PostMapping("/password")
    public String passwordUpdate(HttpServletRequest request,
                                 @RequestParam String oldPwd,
                                 @RequestParam String newPwd,
                                 @RequestParam String confirmPwd,
                                 Model model) {
        if (!newPwd.equals(confirmPwd)) {
            model.addAttribute("msg", "两次新密码不一致");
            return "coach/password";
        }
        Coach coach = SessionUtil.getCoach(request);
        boolean ok = coachService.updatePassword(coach.getId(), oldPwd, newPwd);
        if (!ok) {
            model.addAttribute("msg", "原密码错误");
            return "coach/password";
        }
        model.addAttribute("msg", "修改成功");
        return "coach/password";
    }

    @GetMapping("/appoint/list")
    public String appointList(HttpServletRequest request,
                              @RequestParam(required = false) Integer status,
                              Model model) {
        Coach coach = SessionUtil.getCoach(request);
        List<Appointment> list = appointmentService.listByCoach(coach.getId(), status);
        model.addAttribute("list", list);
        model.addAttribute("status", status);
        return "coach/appoint/list";
    }

    @GetMapping("/appoint/approve/{id}")
    public String appointApprove(@PathVariable Integer id) {
        appointmentService.approve(id);
        return "redirect:/coach/appoint/list";
    }

    @GetMapping("/appoint/reject/{id}")
    public String appointRejectForm(@PathVariable Integer id, Model model) {
        model.addAttribute("appoint", appointmentService.findById(id));
        return "coach/appoint/reject";
    }

    @PostMapping("/appoint/reject")
    public String appointReject(@RequestParam Integer id, @RequestParam String remark) {
        appointmentService.reject(id, remark);
        return "redirect:/coach/appoint/list";
    }

    @GetMapping("/score/add")
    public String scoreAddForm(Model model) {
        List<Student> students = studentService.list();
        model.addAttribute("students", students);
        return "coach/score/add";
    }

    @PostMapping("/score/add")
    public String scoreAdd(HttpServletRequest request, Score score, Model model) {
        Coach coach = SessionUtil.getCoach(request);
        score.setCoachId(coach.getId());
        scoreService.add(score);
        return "redirect:/coach/score/list";
    }

    @GetMapping("/score/list")
    public String scoreList(HttpServletRequest request, Model model) {
        Coach coach = SessionUtil.getCoach(request);
        List<Score> list = scoreService.listByCoach(coach.getId());
        model.addAttribute("list", list);
        return "coach/score/list";
    }

    @GetMapping("/score/delete/{id}")
    public String scoreDelete(@PathVariable Integer id) {
        scoreService.delete(id);
        return "redirect:/coach/score/list";
    }
}
