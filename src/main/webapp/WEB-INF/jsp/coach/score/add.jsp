<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>录入考试成绩</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: "Microsoft YaHei", sans-serif; background: #f0f2f5; }
        .header { background: #2c3e50; color: #fff; padding: 0 30px; height: 60px; display: flex; align-items: center; justify-content: space-between; }
        .header a { color: #fff; text-decoration: none; margin-left: 15px; font-size: 14px; }
        .container { display: flex; min-height: calc(100vh - 60px); }
        .sidebar { width: 200px; background: #34495e; padding-top: 20px; }
        .sidebar a { display: block; padding: 12px 25px; color: #ecf0f1; text-decoration: none; font-size: 14px; border-left: 3px solid transparent; }
        .sidebar a:hover, .sidebar a.active { background: #2c3e50; border-left-color: #3498db; }
        .main { flex: 1; padding: 30px; }
        .card { background: #fff; padding: 30px; border-radius: 8px; max-width: 500px; }
        h2 { margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #555; font-size: 14px; }
        .form-group input, .form-group select { width: 100%; padding: 8px 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; }
        .hint { color: #999; font-size: 12px; margin-top: 4px; }
        button { padding: 10px 25px; background: #27ae60; color: #fff; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        button:hover { background: #229954; }
    </style>
</head>
<body>
<div class="header"><h1>教练中心 - 录入成绩</h1><div><a href="${pageContext.request.contextPath}/logout">退出</a></div></div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/coach/home">首页</a>
        <a href="${pageContext.request.contextPath}/coach/info">个人信息</a>
        <a href="${pageContext.request.contextPath}/coach/appoint/list">学员预约</a>
        <a href="${pageContext.request.contextPath}/coach/score/add" class="active">录入成绩</a>
        <a href="${pageContext.request.contextPath}/coach/score/list">我的成绩记录</a>
        <a href="${pageContext.request.contextPath}/coach/password">修改密码</a>
    </div>
    <div class="main">
        <div class="card">
            <h2>录入考试成绩</h2>
            <form action="${pageContext.request.contextPath}/coach/score/add" method="post">
                <div class="form-group">
                    <label>选择学员</label>
                    <select name="studentId" required>
                        <option value="">请选择学员</option>
                        <c:forEach items="${students}" var="s">
                            <option value="${s.id}">${s.name} (${s.username})</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>考试科目</label>
                    <select name="subject" required>
                        <option value="">请选择科目</option>
                        <option value="科目一">科目一</option>
                        <option value="科目二">科目二</option>
                        <option value="科目三">科目三</option>
                        <option value="科目四">科目四</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>分数（满分100，≥90合格）</label>
                    <input type="number" name="score" min="0" max="100" required>
                    <div class="hint">系统将根据分数自动判断是否合格（≥90分为合格）</div>
                </div>
                <button type="submit">提交成绩</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
