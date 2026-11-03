package com.driving.service;

import com.driving.entity.Admin;
import com.driving.entity.Coach;
import com.driving.entity.Student;

public interface LoginService {
    Admin loginAdmin(String username, String password);
    Student loginStudent(String username, String password);
    Coach loginCoach(String username, String password);
}
