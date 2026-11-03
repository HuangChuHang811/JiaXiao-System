<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的成绩记录</title>
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
        table { width: 100%; border-collapse: collapse; background: #fff; border-radius: 8px; overflow: hidden; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ecf0f1; }
        th { background: #f8f9fa; color: #2c3e50; font-weight: bold; }
        .pass { color: #27ae60; font-weight: bold; }
        .fail { color: #e74c3c; font-weight: bold; }
        .btn-del { padding: 5px 12px; background: #e74c3c; color: #fff; text-decoration: none; border-radius: 4px; font-size: 13px; }
    </style>
</head>
<body>
<div class="header"><h1>教练中心 - 我的成绩记录</h1><div><a href="${pageContext.request.contextPath}/logout">退出</a></div></div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/coach/home">首页</a>
        <a href="${pageContext.request.contextPath}/coach/info">个人信息</a>
        <a href="${pageContext.request.contextPath}/coach/appoint/list">学员预约</a>
        <a href="${pageContext.request.contextPath}/coach/score/add">录入成绩</a>
        <a href="${pageContext.request.contextPath}/coach/score/list" class="active">我的成绩记录</a>
        <a href="${pageContext.request.contextPath}/coach/password">修改密码</a>
    </div>
    <div class="main">
        <h2 style="margin-bottom:15px;">我录入的成绩记录</h2>
        <table>
            <thead><tr><th>ID</th><th>学员</th><th>科目</th><th>分数</th><th>是否合格</th><th>录入时间</th><th>操作</th></tr></thead>
            <tbody>
                <c:forEach items="${list}" var="s">
                    <tr>
                        <td>${s.id}</td>
                        <td>${s.studentName}</td>
                        <td>${s.subject}</td>
                        <td>${s.score}</td>
                        <td class="${s.pass==1?'pass':'fail'}">${s.pass==1?'合格':'不合格'}</td>
                        <td>${s.createTime}</td>
                        <td><a class="btn-del" href="${pageContext.request.contextPath}/coach/score/delete/${s.id}" onclick="return confirm('确定删除?')">删除</a></td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}"><tr><td colspan="7" style="text-align:center;padding:30px;color:#999;">暂无成绩记录</td></tr></c:if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
