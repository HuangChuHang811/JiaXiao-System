package com.driving.service.impl;

import com.driving.entity.Appointment;
import com.driving.mapper.AppointmentMapper;
import com.driving.service.AppointmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppointmentServiceImpl implements AppointmentService {

    @Autowired
    private AppointmentMapper appointmentMapper;

    @Override
    public List<Appointment> list(Integer status) {
        return appointmentMapper.findAll(status);
    }

    @Override
    public List<Appointment> listByStudent(Integer studentId, Integer status) {
        return appointmentMapper.findByStudentId(studentId, status);
    }

    @Override
    public List<Appointment> listByCoach(Integer coachId, Integer status) {
        return appointmentMapper.findByCoachId(coachId, status);
    }

    @Override
    public Appointment findById(Integer id) {
        return appointmentMapper.findById(id);
    }

    @Override
    public String add(Appointment appointment) {
        Appointment conflict = appointmentMapper.checkConflict(
                appointment.getCoachId(), appointment.getAppointDate(), appointment.getTimeSlot());
        if (conflict != null) {
            return "该时段已被预约，请选择其他时段";
        }
        appointment.setStatus(0);
        appointment.setRemark("");
        appointmentMapper.insert(appointment);
        return null;
    }

    @Override
    public boolean approve(Integer id) {
        Appointment a = new Appointment();
        a.setId(id);
        a.setStatus(1);
        a.setRemark("");
        return appointmentMapper.update(a) > 0;
    }

    @Override
    public boolean reject(Integer id, String remark) {
        Appointment a = new Appointment();
        a.setId(id);
        a.setStatus(2);
        a.setRemark(remark);
        return appointmentMapper.update(a) > 0;
    }

    @Override
    public boolean cancel(Integer id) {
        Appointment a = new Appointment();
        a.setId(id);
        a.setStatus(3);
        a.setRemark("学员已取消");
        return appointmentMapper.update(a) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return appointmentMapper.deleteById(id) > 0;
    }
}
