package com.driving.entity;

import java.util.Date;

public class Score {
    private Integer id;
    private Integer studentId;
    private Integer coachId;
    private String subject;
    private Integer score;
    private Integer pass;
    private Date createTime;

    private String studentName;
    private String coachName;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public Integer getStudentId() { return studentId; }
    public void setStudentId(Integer studentId) { this.studentId = studentId; }
    public Integer getCoachId() { return coachId; }
    public void setCoachId(Integer coachId) { this.coachId = coachId; }
    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }
    public Integer getScore() { return score; }
    public void setScore(Integer score) { this.score = score; }
    public Integer getPass() { return pass; }
    public void setPass(Integer pass) { this.pass = pass; }
    public Date getCreateTime() { return createTime; }
    public void setCreateTime(Date createTime) { this.createTime = createTime; }
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    public String getCoachName() { return coachName; }
    public void setCoachName(String coachName) { this.coachName = coachName; }
}
