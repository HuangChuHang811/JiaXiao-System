<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增学员</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: "Microsoft YaHei", sans-serif; background: #f0f2f5; }
        .header { background: #2c3e50; color: #fff; padding: 0 30px; height: 60px; display: flex; align-items: center; justify-content: space-between; }
        .header a { color: #fff; text-decoration: none; margin-left: 15px; font-size: 14px; }
        .container { display: flex; min-height: calc(100vh - 60px); }
        .sidebar { width: 200px; background: #34495e; padding-top: 20px; }
        .sidebar a { display: block; padding: 12px 25px; color: #ecf0f1; text-decoration: none; font-size: 14px; border-left: 3px solid transparent; }
        .sidebar a:hover { background: #2c3e50; border-left-color: #3498db; }
        .main { flex: 1; padding: 30px; }
        .card { background: #fff; padding: 30px; border-radius: 8px; max-width: 500px; }
        h2 { margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #555; font-size: 14px; }
        .form-group input, .form-group select { width: 100%; padding: 8px 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; }
        button { padding: 10px 25px; background: #3498db; color: #fff; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        button:hover { background: #2980b9; }
        a.back { color: #7f8c8d; text-decoration: none; margin-left: 15px; font-size: 14px; }
        .msg { padding: 10px 15px; background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; border-radius: 4px; margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="header">
    <h1>驾校管理系统 - 新增学员</h1>
    <div><a href="${pageContext.request.contextPath}/logout">退出登录</a></div>
</div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/admin/home">首页</a>
        <a href="${pageContext.request.contextPath}/admin/student/list">学员管理</a>
        <a href="${pageContext.request.contextPath}/admin/coach/list">教练管理</a>
        <a href="${pageContext.request.contextPath}/admin/appoint/list">预约管理</a>
        <a href="${pageContext.request.contextPath}/admin/score/list">成绩管理</a>
    </div>
    <div class="main">
        <div class="card">
            <h2>新增学员</h2>
            <p class="msg">${msg}</p>
            <form action="${pageContext.request.contextPath}/admin/student/add" method="post">
                <div class="form-group"><label>账号</label><input type="text" name="username" required></div>
                <div class="form-group"><label>密码</label><input type="password" name="password" required value="123456"></div>
                <div class="form-group"><label>姓名</label><input type="text" name="name" required></div>
                <div class="form-group"><label>手机号</label><input type="text" name="phone"></div>
                <div class="form-group"><label>年龄</label><input type="number" name="age"></div>
                <div class="form-group"><label>报考科目</label>
                    <select name="subject">
                        <option value="C1">C1（小型汽车）</option>
                        <option value="C2">C2（自动挡）</option>
                        <option value="B2">B2（大型货车）</option>
                        <option value="A1">A1（大型客车）</option>
                    </select>
                </div>
                <button type="submit">保存</button>
                <a class="back" href="${pageContext.request.contextPath}/admin/student/list">返回</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
