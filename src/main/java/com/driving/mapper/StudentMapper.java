package com.driving.mapper;

import com.driving.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    Student findByUsername(@Param("username") String username);
    Student findById(@Param("id") Integer id);
    List<Student> findAll();
    int insert(Student student);
    int update(Student student);
    int deleteById(@Param("id") Integer id);
    int updatePassword(@Param("id") Integer id, @Param("password") String password);
}
