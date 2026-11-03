<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>修改密码</title>
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
        .card { background: #fff; padding: 30px; border-radius: 8px; max-width: 450px; }
        h2 { margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #555; font-size: 14px; }
        .form-group input { width: 100%; padding: 8px 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; }
        button { padding: 10px 25px; background: #3498db; color: #fff; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        .msg { padding: 10px 15px; background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; border-radius: 4px; margin-bottom: 15px; }
        .msg-success { padding: 10px 15px; background: #d4edda; border: 1px solid #c3e6cb; color: #155724; border-radius: 4px; margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="header"><h1>驾校管理系统</h1><div><span>欢迎，${sessionScope.loginUser.username}</span><a href="${pageContext.request.contextPath}/logout">退出</a></div></div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/admin/home">首页</a>
        <a href="${pageContext.request.contextPath}/admin/student/list">学员管理</a>
        <a href="${pageContext.request.contextPath}/admin/coach/list">教练管理</a>
        <a href="${pageContext.request.contextPath}/admin/appoint/list">预约管理</a>
        <a href="${pageContext.request.contextPath}/admin/score/list">成绩管理</a>
        <a href="${pageContext.request.contextPath}/admin/password" class="active">修改密码</a>
    </div>
    <div class="main">
        <div class="card">
            <h2>修改密码</h2>
            <p class="msg">${msg}</p>
            <form action="${pageContext.request.contextPath}/admin/password" method="post">
                <div class="form-group"><label>原密码</label><input type="password" name="oldPwd" required></div>
                <div class="form-group"><label>新密码</label><input type="password" name="newPwd" required></div>
                <div class="form-group"><label>确认新密码</label><input type="password" name="confirmPwd" required></div>
                <button type="submit">保存修改</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
