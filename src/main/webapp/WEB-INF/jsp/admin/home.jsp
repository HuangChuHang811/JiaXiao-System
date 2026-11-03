<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>管理员首页</title>
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
        table { width: 100%; border-collapse: collapse; background: #fff; border-radius: 8px; overflow: hidden; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ecf0f1; }
        th { background: #f8f9fa; color: #2c3e50; font-weight: bold; }
        a.btn { padding: 6px 12px; border-radius: 4px; text-decoration: none; font-size: 13px; margin-right: 5px; display: inline-block; }
        .btn-primary { background: #3498db; color: #fff; }
        .btn-success { background: #27ae60; color: #fff; }
        .btn-warning { background: #f39c12; color: #fff; }
        .btn-danger { background: #e74c3c; color: #fff; }
        .btn-info { background: #95a5a6; color: #fff; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #555; font-size: 14px; }
        .form-group input, .form-group select { width: 100%; padding: 8px 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; }
        .card { background: #fff; padding: 25px; border-radius: 8px; }
        .pagination { margin-top: 20px; text-align: center; }
        .pagination a, .pagination span { display: inline-block; padding: 6px 12px; margin: 0 3px; border: 1px solid #ddd; border-radius: 4px; text-decoration: none; color: #333; }
        .pagination .current { background: #3498db; color: #fff; border-color: #3498db; }
        .pagination .disabled { color: #ccc; }
        .msg { padding: 10px 15px; background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; border-radius: 4px; margin-bottom: 15px; }
        .filter-bar { margin-bottom: 15px; display: flex; gap: 10px; align-items: center; }
        .filter-bar a { padding: 6px 12px; border-radius: 4px; text-decoration: none; font-size: 13px; border: 1px solid #ddd; color: #333; }
        .filter-bar a.active { background: #3498db; color: #fff; border-color: #3498db; }
    </style>
</head>
<body>
<div class="header">
    <h1>驾校学员预约与成绩管理系统 - 管理后台</h1>
    <div>
        <span>欢迎，${admin.username}</span>
        <a href="${pageContext.request.contextPath}/admin/password">修改密码</a>
        <a href="${pageContext.request.contextPath}/logout">退出登录</a>
    </div>
</div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/admin/home" class="active">首页</a>
        <a href="${pageContext.request.contextPath}/admin/student/list">学员管理</a>
        <a href="${pageContext.request.contextPath}/admin/coach/list">教练管理</a>
        <a href="${pageContext.request.contextPath}/admin/appoint/list">预约管理</a>
        <a href="${pageContext.request.contextPath}/admin/score/list">成绩管理</a>
        <a href="${pageContext.request.contextPath}/admin/score/export">导出成绩</a>
    </div>
    <div class="main">
        <div class="welcome">
            <h2>你好，管理员 👋</h2>
            <p>欢迎使用驾校学员预约与成绩管理系统后台。你可以在此管理学员、教练、预约和考试成绩。</p>
        </div>
        <div class="stats">
            <div class="stat-card">
                <div class="num">${studentCount}</div>
                <div class="label">学员总数</div>
            </div>
            <div class="stat-card">
                <div class="num">${coachCount}</div>
                <div class="label">教练总数</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
