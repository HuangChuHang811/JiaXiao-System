<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>学员首页</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: "Microsoft YaHei", sans-serif; background: #f0f2f5; }
        .header { background: #2c3e50; color: #fff; padding: 0 30px; height: 60px; display: flex; align-items: center; justify-content: space-between; }
        .header h1 { font-size: 18px; font-weight: normal; }
        .header a { color: #fff; text-decoration: none; margin-left: 15px; font-size: 14px; }
        .container { display: flex; min-height: calc(100vh - 60px); }
        .sidebar { width: 200px; background: #34495e; padding-top: 20px; }
        .sidebar a { display: block; padding: 12px 25px; color: #ecf0f1; text-decoration: none; font-size: 14px; border-left: 3px solid transparent; }
        .sidebar a:hover, .sidebar a.active { background: #2c3e50; border-left-color: #3498db; }
        .main { flex: 1; padding: 30px; }
        .welcome { background: #fff; padding: 30px; border-radius: 8px; margin-bottom: 20px; }
        .welcome h2 { color: #2c3e50; margin-bottom: 10px; }
        .welcome p { color: #7f8c8d; }
        .stats { display: flex; gap: 20px; margin-bottom: 20px; }
        .stat-card { flex: 1; background: #fff; padding: 25px; border-radius: 8px; text-align: center; }
        .stat-card .num { font-size: 36px; font-weight: bold; color: #3498db; }
        .stat-card .label { color: #7f8c8d; margin-top: 8px; }
        .quick-links { background: #fff; padding: 25px; border-radius: 8px; }
        .quick-links h3 { margin-bottom: 15px; color: #2c3e50; }
        .quick-links a { display: inline-block; padding: 10px 20px; margin: 5px; background: #ecf0f1; color: #2c3e50; text-decoration: none; border-radius: 6px; font-size: 14px; }
        .quick-links a:hover { background: #3498db; color: #fff; }
    </style>
</head>
<body>
<div class="header">
    <h1>驾校学员预约与成绩管理系统 - 学员中心</h1>
    <div><span>你好，${student.name}</span><a href="${pageContext.request.contextPath}/student/info">个人信息</a><a href="${pageContext.request.contextPath}/logout">退出</a></div>
</div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/student/home" class="active">首页</a>
        <a href="${pageContext.request.contextPath}/student/info">个人信息</a>
        <a href="${pageContext.request.contextPath}/student/appoint/add">预约训练</a>
        <a href="${pageContext.request.contextPath}/student/appoint/list">我的预约</a>
        <a href="${pageContext.request.contextPath}/student/score/list">我的成绩</a>
        <a href="${pageContext.request.contextPath}/student/password">修改密码</a>
    </div>
    <div class="main">
        <div class="welcome">
            <h2>你好，${student.name} 👋</h2>
            <p>欢迎来到驾校学员中心。你可以预约训练课程、查看预约状态和考试成绩。</p>
        </div>
        <div class="stats">
            <div class="stat-card">
                <div class="num">${pendingCount}</div>
                <div class="label">待审核预约</div>
            </div>
            <div class="stat-card">
                <div class="num">${passCount}</div>
                <div class="label">已通过预约</div>
            </div>
        </div>
        <div class="quick-links">
            <h3>快捷操作</h3>
            <a href="${pageContext.request.contextPath}/student/appoint/add">+ 立即预约训练</a>
            <a href="${pageContext.request.contextPath}/student/appoint/list">查看我的预约</a>
            <a href="${pageContext.request.contextPath}/student/score/list">查看考试成绩</a>
        </div>
    </div>
</div>
</body>
</html>
