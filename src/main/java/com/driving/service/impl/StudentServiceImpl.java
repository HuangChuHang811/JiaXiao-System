package com.driving.service.impl;

import com.driving.entity.Student;
import com.driving.mapper.StudentMapper;
import com.driving.service.StudentService;
import com.driving.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Student> list() {
        return studentMapper.findAll();
    }

    @Override
    public Student findById(Integer id) {
        return studentMapper.findById(id);
    }

    @Override
    public boolean add(Student student) {
        Student exist = studentMapper.findByUsername(student.getUsername());
        if (exist != null) return false;
        student.setPassword(MD5Util.encrypt(student.getPassword()));
        return studentMapper.insert(student) > 0;
    }

    @Override
    public boolean update(Student student) {
        return studentMapper.update(student) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return studentMapper.deleteById(id) > 0;
    }

    @Override
    public boolean updatePassword(Integer id, String oldPwd, String newPwd) {
        Student s = studentMapper.findById(id);
        if (s == null || !s.getPassword().equals(MD5Util.encrypt(oldPwd))) return false;
        return studentMapper.updatePassword(id, MD5Util.encrypt(newPwd)) > 0;
    }
}
