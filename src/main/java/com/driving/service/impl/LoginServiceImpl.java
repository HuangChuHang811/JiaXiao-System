package com.driving.service.impl;

import com.driving.entity.Admin;
import com.driving.entity.Coach;
import com.driving.entity.Student;
import com.driving.mapper.AdminMapper;
import com.driving.mapper.CoachMapper;
import com.driving.mapper.StudentMapper;
import com.driving.service.LoginService;
import com.driving.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private CoachMapper coachMapper;

    @Override
    public Admin loginAdmin(String username, String password) {
        Admin admin = adminMapper.findByUsername(username);
        if (admin != null && admin.getPassword().equals(MD5Util.encrypt(password))) {
            return admin;
        }
        return null;
    }

    @Override
    public Student loginStudent(String username, String password) {
        Student student = studentMapper.findByUsername(username);
        if (student != null && student.getPassword().equals(MD5Util.encrypt(password))) {
            return student;
        }
        return null;
    }

    @Override
    public Coach loginCoach(String username, String password) {
        Coach coach = coachMapper.findByUsername(username);
        if (coach != null && coach.getPassword().equals(MD5Util.encrypt(password))) {
            return coach;
        }
        return null;
    }
}
