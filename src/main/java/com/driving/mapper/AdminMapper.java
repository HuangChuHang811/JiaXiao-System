package com.driving.mapper;

import com.driving.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    Admin findByUsername(@Param("username") String username);
    int updatePassword(@Param("id") Integer id, @Param("password") String password);
}
