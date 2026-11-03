<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>教练个人信息</title>
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
        .form-group input { width: 100%; padding: 8px 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; }
        button { padding: 10px 25px; background: #3498db; color: #fff; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
    </style>
</head>
<body>
<div class="header"><h1>教练中心 - 个人信息</h1><div><a href="${pageContext.request.contextPath}/logout">退出</a></div></div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/coach/home">首页</a>
        <a href="${pageContext.request.contextPath}/coach/info" class="active">个人信息</a>
        <a href="${pageContext.request.contextPath}/coach/appoint/list">学员预约</a>
        <a href="${pageContext.request.contextPath}/coach/score/add">录入成绩</a>
        <a href="${pageContext.request.contextPath}/coach/score/list">我的成绩记录</a>
        <a href="${pageContext.request.contextPath}/coach/password">修改密码</a>
    </div>
    <div class="main">
        <div class="card">
            <h2>个人信息</h2>
            <form action="${pageContext.request.contextPath}/coach/info" method="post">
                <input type="hidden" name="id" value="${coach.id}">
                <div class="form-group"><label>账号</label><input type="text" value="${coach.username}" disabled></div>
                <div class="form-group"><label>姓名</label><input type="text" name="name" value="${coach.name}" required></div>
                <div class="form-group"><label>手机号</label><input type="text" name="phone" value="${coach.phone}"></div>
                <div class="form-group"><label>可带科目</label><input type="text" name="subject" value="${coach.subject}"></div>
                <button type="submit">保存修改</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
