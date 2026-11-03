package com.driving.service;

import com.driving.entity.Score;

import java.util.List;

public interface ScoreService {
    List<Score> list();
    List<Score> listByStudent(Integer studentId);
    List<Score> listByCoach(Integer coachId);
    boolean add(Score score);
    boolean update(Score score);
    boolean delete(Integer id);
}
