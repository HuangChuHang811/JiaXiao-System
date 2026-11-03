<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>成绩导出</title>
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
        .card { background: #fff; padding: 30px; border-radius: 8px; }
        h2 { margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; text-align: left; border: 1px solid #ddd; font-size: 13px; }
        th { background: #f8f9fa; font-weight: bold; }
        .pass { color: #27ae60; }
        .fail { color: #e74c3c; }
        .actions { margin-bottom: 15px; }
        .actions a { padding: 8px 15px; background: #3498db; color: #fff; text-decoration: none; border-radius: 4px; font-size: 14px; }
        pre { background: #f8f9fa; padding: 15px; border-radius: 4px; overflow-x: auto; margin-top: 20px; font-size: 12px; }
    </style>
</head>
<body>
<div class="header"><h1>驾校管理系统 - 导出成绩</h1><div><a href="${pageContext.request.contextPath}/logout">退出</a></div></div>
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
            <h2>成绩汇总（共 ${scores.size()} 条记录）</h2>
            <div class="actions">
                <a href="${pageContext.request.contextPath}/admin/score/list">返回列表</a>
            </div>
            <table>
                <thead><tr><th>ID</th><th>学员</th><th>教练</th><th>科目</th><th>分数</th><th>是否合格</th><th>录入时间</th></tr></thead>
                <tbody>
                    <c:forEach items="${scores}" var="s">
                        <tr>
                            <td>${s.id}</td><td>${s.studentName}</td><td>${s.coachName}</td>
                            <td>${s.subject}</td><td>${s.score}</td>
                            <td class="${s.pass==1?'pass':'fail'}">${s.pass==1?'合格':'不合格'}</td>
                            <td>${s.createTime}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h3 style="margin-top:30px;">纯文本格式（可复制）</h3>
<pre>============================================================
  驾校学员考试成绩汇总
============================================================
<c:forEach items="${scores}" var="s">
ID:${s.id} | 学员:${s.studentName} | 教练:${s.coachName} | ${s.subject} | ${s.score}分 | ${s.pass==1?'合格':'不合格'} | ${s.createTime}
</c:forEach>
============================================================
  共 ${scores.size()} 条记录
============================================================</pre>
        </div>
    </div>
</div>
</body>
</html>
