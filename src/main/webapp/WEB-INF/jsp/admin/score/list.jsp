<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>成绩管理</title>
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
        .top-bar { display: flex; justify-content: space-between; margin-bottom: 15px; align-items: center; }
        a.btn { padding: 6px 12px; border-radius: 4px; text-decoration: none; font-size: 13px; display: inline-block; color:#fff; }
        .btn-info { background: #95a5a6; }
        .pass { color: #27ae60; font-weight: bold; }
        .fail { color: #e74c3c; font-weight: bold; }
        .pagination { margin-top: 20px; text-align: center; }
        .pagination a, .pagination span { display: inline-block; padding: 6px 12px; margin: 0 3px; border: 1px solid #ddd; border-radius: 4px; text-decoration: none; color: #333; }
        .pagination .current { background: #3498db; color: #fff; border-color: #3498db; }
    </style>
</head>
<body>
<div class="header"><h1>驾校管理系统 - 管理后台</h1><div><span>欢迎，${sessionScope.loginUser.username}</span><a href="${pageContext.request.contextPath}/logout">退出</a></div></div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/admin/home">首页</a>
        <a href="${pageContext.request.contextPath}/admin/student/list">学员管理</a>
        <a href="${pageContext.request.contextPath}/admin/coach/list">教练管理</a>
        <a href="${pageContext.request.contextPath}/admin/appoint/list">预约管理</a>
        <a href="${pageContext.request.contextPath}/admin/score/list" class="active">成绩管理</a>
    </div>
    <div class="main">
        <div class="top-bar">
            <h2>成绩列表</h2>
            <a class="btn btn-info" href="${pageContext.request.contextPath}/admin/score/export">导出成绩</a>
        </div>
        <table>
            <thead><tr><th>ID</th><th>学员</th><th>教练</th><th>科目</th><th>分数</th><th>是否合格</th><th>录入时间</th></tr></thead>
            <tbody>
                <c:forEach items="${pageInfo.list}" var="s">
                    <tr>
                        <td>${s.id}</td>
                        <td>${s.studentName}</td>
                        <td>${s.coachName}</td>
                        <td>${s.subject}</td>
                        <td>${s.score}</td>
                        <td class="${s.pass==1?'pass':'fail'}">${s.pass==1?'合格':'不合格'}</td>
                        <td>${s.createTime}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="pagination">
            <c:if test="${pageInfo.hasPreviousPage}"><a href="?page=${pageInfo.prePage}&size=${pageInfo.pageSize}">上一页</a></c:if>
            <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                <c:if test="${num == pageInfo.pageNum}"><span class="current">${num}</span></c:if>
                <c:if test="${num != pageInfo.pageNum}"><a href="?page=${num}&size=${pageInfo.pageSize}">${num}</a></c:if>
            </c:forEach>
            <c:if test="${pageInfo.hasNextPage}"><a href="?page=${pageInfo.nextPage}&size=${pageInfo.pageSize}">下一页</a></c:if>
            <span style="margin-left:10px;color:#999;">共 ${pageInfo.total} 条记录</span>
        </div>
    </div>
</div>
</body>
</html>
