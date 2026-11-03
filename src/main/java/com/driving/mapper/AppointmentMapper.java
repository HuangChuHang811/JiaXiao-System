package com.driving.mapper;

import com.driving.entity.Appointment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppointmentMapper {
    Appointment findById(@Param("id") Integer id);
    List<Appointment> findAll(@Param("status") Integer status);
    List<Appointment> findByStudentId(@Param("studentId") Integer studentId, @Param("status") Integer status);
    List<Appointment> findByCoachId(@Param("coachId") Integer coachId, @Param("status") Integer status);
    int insert(Appointment appointment);
    int update(Appointment appointment);
    int deleteById(@Param("id") Integer id);
    Appointment checkConflict(@Param("coachId") Integer coachId, @Param("appointDate") String appointDate, @Param("timeSlot") String timeSlot);
}
