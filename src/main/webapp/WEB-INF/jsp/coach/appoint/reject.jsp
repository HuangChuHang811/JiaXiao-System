<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>驳回预约</title>
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
        .info { padding: 15px; background: #f8f9fa; border-radius: 4px; margin-bottom: 20px; font-size: 14px; line-height: 2; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #555; font-size: 14px; }
        textarea { width: 100%; padding: 8px 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; height: 100px; resize: vertical; }
        button { padding: 10px 25px; background: #e74c3c; color: #fff; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        a.back { color: #7f8c8d; text-decoration: none; margin-left: 15px; font-size: 14px; }
    </style>
</head>
<body>
<div class="header"><h1>教练中心 - 驳回预约</h1><div><a href="${pageContext.request.contextPath}/logout">退出</a></div></div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/coach/home">首页</a>
        <a href="${pageContext.request.contextPath}/coach/info">个人信息</a>
        <a href="${pageContext.request.contextPath}/coach/appoint/list">学员预约</a>
        <a href="${pageContext.request.contextPath}/coach/score/add">录入成绩</a>
        <a href="${pageContext.request.contextPath}/coach/score/list">我的成绩记录</a>
        <a href="${pageContext.request.contextPath}/coach/password">修改密码</a>
    </div>
    <div class="main">
        <div class="card">
            <h2>驳回预约</h2>
            <div class="info">
                学员：<b>${appoint.studentName}</b><br>
                预约日期：<b>${appoint.appointDate}</b><br>
                时段：<b>${appoint.timeSlot}</b>
            </div>
            <form action="${pageContext.request.contextPath}/coach/appoint/reject" method="post">
                <input type="hidden" name="id" value="${appoint.id}">
                <div class="form-group">
                    <label>驳回理由</label>
                    <textarea name="remark" required placeholder="请填写驳回原因"></textarea>
                </div>
                <button type="submit">确认驳回</button>
                <a class="back" href="${pageContext.request.contextPath}/coach/appoint/list">返回</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
