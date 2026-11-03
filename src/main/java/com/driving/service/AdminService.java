package com.driving.service;

public interface AdminService {
    boolean updatePassword(Integer id, String oldPwd, String newPwd);
}
