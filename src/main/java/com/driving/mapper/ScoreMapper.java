package com.driving.mapper;

import com.driving.entity.Score;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScoreMapper {
    Score findById(@Param("id") Integer id);
    List<Score> findAll();
    List<Score> findByStudentId(@Param("studentId") Integer studentId);
    List<Score> findByCoachId(@Param("coachId") Integer coachId);
    int insert(Score score);
    int update(Score score);
    int deleteById(@Param("id") Integer id);
}
