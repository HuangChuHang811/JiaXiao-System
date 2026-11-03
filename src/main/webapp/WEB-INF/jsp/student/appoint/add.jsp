<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>预约训练</title>
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
        button { padding: 10px 25px; background: #27ae60; color: #fff; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        button:hover { background: #229954; }
        .msg { padding: 10px 15px; background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; border-radius: 4px; margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="header"><h1>学员中心 - 预约训练</h1><div><a href="${pageContext.request.contextPath}/logout">退出</a></div></div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/student/home">首页</a>
        <a href="${pageContext.request.contextPath}/student/info">个人信息</a>
        <a href="${pageContext.request.contextPath}/student/appoint/add" class="active">预约训练</a>
        <a href="${pageContext.request.contextPath}/student/appoint/list">我的预约</a>
        <a href="${pageContext.request.contextPath}/student/score/list">我的成绩</a>
        <a href="${pageContext.request.contextPath}/student/password">修改密码</a>
    </div>
    <div class="main">
        <div class="card">
            <h2>预约训练</h2>
            <p class="msg">${msg}</p>
            <form action="${pageContext.request.contextPath}/student/appoint/add" method="post">
                <div class="form-group">
                    <label>选择教练</label>
                    <select name="coachId" required>
                        <option value="">请选择教练</option>
                        <c:forEach items="${coaches}" var="c">
                            <option value="${c.id}">${c.name} - 可带科目: ${c.subject}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group"><label>预约日期</label><input type="date" name="appointDate" required></div>
                <div class="form-group">
                    <label>选择时段</label>
                    <select name="timeSlot" required>
                        <option value="">请选择时段</option>
                        <option value="上午8-10点">上午8:00 - 10:00</option>
                        <option value="上午10-12点">上午10:00 - 12:00</option>
                        <option value="下午2-4点">下午14:00 - 16:00</option>
                        <option value="下午4-6点">下午16:00 - 18:00</option>
                    </select>
                </div>
                <button type="submit">提交预约</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
