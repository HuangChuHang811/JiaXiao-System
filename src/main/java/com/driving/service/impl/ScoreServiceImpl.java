package com.driving.service.impl;

import com.driving.entity.Score;
import com.driving.mapper.ScoreMapper;
import com.driving.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoreServiceImpl implements ScoreService {

    @Autowired
    private ScoreMapper scoreMapper;

    @Override
    public List<Score> list() {
        return scoreMapper.findAll();
    }

    @Override
    public List<Score> listByStudent(Integer studentId) {
        return scoreMapper.findByStudentId(studentId);
    }

    @Override
    public List<Score> listByCoach(Integer coachId) {
        return scoreMapper.findByCoachId(coachId);
    }

    @Override
    public boolean add(Score score) {
        if (score.getScore() >= 90) {
            score.setPass(1);
        } else {
            score.setPass(0);
        }
        return scoreMapper.insert(score) > 0;
    }

    @Override
    public boolean update(Score score) {
        return scoreMapper.update(score) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return scoreMapper.deleteById(id) > 0;
    }
}
