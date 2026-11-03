package com.driving.service.impl;

import com.driving.entity.Coach;
import com.driving.mapper.CoachMapper;
import com.driving.service.CoachService;
import com.driving.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoachServiceImpl implements CoachService {

    @Autowired
    private CoachMapper coachMapper;

    @Override
    public List<Coach> list() {
        return coachMapper.findAll();
    }

    @Override
    public Coach findById(Integer id) {
        return coachMapper.findById(id);
    }

    @Override
    public boolean add(Coach coach) {
        Coach exist = coachMapper.findByUsername(coach.getUsername());
        if (exist != null) return false;
        coach.setPassword(MD5Util.encrypt(coach.getPassword()));
        return coachMapper.insert(coach) > 0;
    }

    @Override
    public boolean update(Coach coach) {
        return coachMapper.update(coach) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return coachMapper.deleteById(id) > 0;
    }

    @Override
    public boolean updatePassword(Integer id, String oldPwd, String newPwd) {
        Coach c = coachMapper.findById(id);
        if (c == null || !c.getPassword().equals(MD5Util.encrypt(oldPwd))) return false;
        return coachMapper.updatePassword(id, MD5Util.encrypt(newPwd)) > 0;
    }
}
