-- ============================================
-- 驾校学员预约与成绩管理系统 - 数据库脚本
-- ============================================

CREATE DATABASE IF NOT EXISTS jiaxiao DEFAULT CHARSET utf8mb4;
USE jiaxiao;

-- 管理员表
DROP TABLE IF EXISTS admin;
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

-- 学员表
DROP TABLE IF EXISTS student;
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    age INT,
    subject VARCHAR(20),
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 教练表
DROP TABLE IF EXISTS coach;
CREATE TABLE coach (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    subject VARCHAR(50)
);

-- 预约表
DROP TABLE IF EXISTS appoint;
CREATE TABLE appoint (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    coach_id INT NOT NULL,
    appoint_date VARCHAR(20) NOT NULL,
    time_slot VARCHAR(20) NOT NULL,
    status TINYINT DEFAULT 0 COMMENT '0待审核 1同意 2驳回 3取消',
    remark VARCHAR(255),
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 成绩表
DROP TABLE IF EXISTS score;
CREATE TABLE score (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    coach_id INT NOT NULL,
    subject VARCHAR(20) NOT NULL,
    score INT NOT NULL,
    pass TINYINT COMMENT '1合格 0不合格',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- 测试数据（密码均为 123456 的MD5：e10adc3949ba59abbe56e057f20f883e）
-- ============================================

INSERT INTO admin(username, password) VALUES('admin', 'e10adc3949ba59abbe56e057f20f883e');

INSERT INTO student(username, password, name, phone, age, subject) VALUES
('student01', 'e10adc3949ba59abbe56e057f20f883e', '张三', '13800138001', 25, 'C1'),
('student02', 'e10adc3949ba59abbe56e057f20f883e', '李四', '13800138002', 28, 'C2'),
('student03', 'e10adc3949ba59abbe56e057f20f883e', '王五', '13800138003', 30, 'C1'),
('student04', 'e10adc3949ba59abbe56e057f20f883e', '赵六', '13800138004', 22, 'C1');

INSERT INTO coach(username, password, name, phone, subject) VALUES
('coach01', 'e10adc3949ba59abbe56e057f20f883e', '刘教练', '13900139001', '科目二,科目三'),
('coach02', 'e10adc3949ba59abbe56e057f20f883e', '王教练', '13900139002', '科目一,科目四'),
('coach03', 'e10adc3949ba59abbe56e057f20f883e', '陈教练', '13900139003', '科目二,科目三');

INSERT INTO appoint(student_id, coach_id, appoint_date, time_slot, status, remark) VALUES
(1, 1, '2026-11-10', '上午9-11点', 1, ''),
(1, 2, '2026-11-11', '下午2-4点', 0, ''),
(2, 1, '2026-11-12', '上午9-11点', 2, '该时段教练有事'),
(3, 3, '2026-11-13', '下午2-4点', 1, '');

INSERT INTO score(student_id, coach_id, subject, score, pass) VALUES
(1, 2, '科目一', 95, 1),
(1, 1, '科目二', 85, 0),
(2, 2, '科目一', 92, 1),
(2, 1, '科目二', 93, 1),
(3, 3, '科目三', 90, 1);
