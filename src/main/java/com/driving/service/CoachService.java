package com.driving.service;

import com.driving.entity.Coach;

import java.util.List;

public interface CoachService {
    List<Coach> list();
    Coach findById(Integer id);
    boolean add(Coach coach);
    boolean update(Coach coach);
    boolean delete(Integer id);
    boolean updatePassword(Integer id, String oldPwd, String newPwd);
}
