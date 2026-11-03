package com.driving.mapper;

import com.driving.entity.Coach;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CoachMapper {
    Coach findByUsername(@Param("username") String username);
    Coach findById(@Param("id") Integer id);
    List<Coach> findAll();
    int insert(Coach coach);
    int update(Coach coach);
    int deleteById(@Param("id") Integer id);
    int updatePassword(@Param("id") Integer id, @Param("password") String password);
}
