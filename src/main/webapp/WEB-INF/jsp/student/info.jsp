<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人信息</title>
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
        button { padding: 10px 25px; background: #3498db; color: #fff; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
    </style>
</head>
<body>
<div class="header"><h1>学员中心 - 个人信息</h1><div><a href="${pageContext.request.contextPath}/logout">退出</a></div></div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/student/home">首页</a>
        <a href="${pageContext.request.contextPath}/student/info" class="active">个人信息</a>
        <a href="${pageContext.request.contextPath}/student/appoint/add">预约训练</a>
        <a href="${pageContext.request.contextPath}/student/appoint/list">我的预约</a>
        <a href="${pageContext.request.contextPath}/student/score/list">我的成绩</a>
        <a href="${pageContext.request.contextPath}/student/password">修改密码</a>
    </div>
    <div class="main">
        <div class="card">
            <h2>个人信息</h2>
            <form action="${pageContext.request.contextPath}/student/info" method="post">
                <input type="hidden" name="id" value="${student.id}">
                <div class="form-group"><label>账号</label><input type="text" value="${student.username}" disabled></div>
                <div class="form-group"><label>姓名</label><input type="text" name="name" value="${student.name}" required></div>
                <div class="form-group"><label>手机号</label><input type="text" name="phone" value="${student.phone}"></div>
                <div class="form-group"><label>年龄</label><input type="number" name="age" value="${student.age}"></div>
                <div class="form-group"><label>报考科目</label>
                    <select name="subject">
                        <option value="C1" ${student.subject=='C1'?'selected':''}>C1（小型汽车）</option>
                        <option value="C2" ${student.subject=='C2'?'selected':''}>C2（自动挡）</option>
                        <option value="B2" ${student.subject=='B2'?'selected':''}>B2（大型货车）</option>
                        <option value="A1" ${student.subject=='A1'?'selected':''}>A1（大型客车）</option>
                    </select>
                </div>
                <button type="submit">保存修改</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
