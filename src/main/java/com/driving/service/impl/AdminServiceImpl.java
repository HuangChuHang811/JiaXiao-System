package com.driving.service.impl;

import com.driving.entity.Admin;
import com.driving.mapper.AdminMapper;
import com.driving.service.AdminService;
import com.driving.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public boolean updatePassword(Integer id, String oldPwd, String newPwd) {
        Admin a = adminMapper.findByUsername("admin");
        if (a == null || !a.getPassword().equals(MD5Util.encrypt(oldPwd))) return false;
        return adminMapper.updatePassword(id, MD5Util.encrypt(newPwd)) > 0;
    }
}
