package com.driving.service;

import com.driving.entity.Student;

import java.util.List;

public interface StudentService {
    List<Student> list();
    Student findById(Integer id);
    boolean add(Student student);
    boolean update(Student student);
    boolean delete(Integer id);
    boolean updatePassword(Integer id, String oldPwd, String newPwd);
}
