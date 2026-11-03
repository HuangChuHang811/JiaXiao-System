package com.driving.service;

import com.driving.entity.Appointment;

import java.util.List;

public interface AppointmentService {
    List<Appointment> list(Integer status);
    List<Appointment> listByStudent(Integer studentId, Integer status);
    List<Appointment> listByCoach(Integer coachId, Integer status);
    Appointment findById(Integer id);
    String add(Appointment appointment);
    boolean approve(Integer id);
    boolean reject(Integer id, String remark);
    boolean cancel(Integer id);
    boolean delete(Integer id);
}
