<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的预约</title>
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
        .filter-bar { margin-bottom: 15px; display: flex; gap: 10px; }
        .filter-bar a { padding: 6px 12px; border-radius: 4px; text-decoration: none; font-size: 13px; border: 1px solid #ddd; color: #333; background: #fff; }
        .filter-bar a.active { background: #3498db; color: #fff; border-color: #3498db; }
        .status-0 { color: #e67e22; font-weight: bold; }
        .status-1 { color: #27ae60; font-weight: bold; }
        .status-2 { color: #e74c3c; font-weight: bold; }
        .status-3 { color: #95a5a6; font-weight: bold; }
        .btn-cancel { padding: 5px 12px; background: #e74c3c; color: #fff; text-decoration: none; border-radius: 4px; font-size: 13px; }
        .msg { padding: 10px 15px; background: #d4edda; border: 1px solid #c3e6cb; color: #155724; border-radius: 4px; margin-bottom: 15px; }
        .msg-error { padding: 10px 15px; background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24; border-radius: 4px; margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="header"><h1>学员中心 - 我的预约</h1><div><a href="${pageContext.request.contextPath}/logout">退出</a></div></div>
<div class="container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/student/home">首页</a>
        <a href="${pageContext.request.contextPath}/student/info">个人信息</a>
        <a href="${pageContext.request.contextPath}/student/appoint/add">预约训练</a>
        <a href="${pageContext.request.contextPath}/student/appoint/list" class="active">我的预约</a>
        <a href="${pageContext.request.contextPath}/student/score/list">我的成绩</a>
        <a href="${pageContext.request.contextPath}/student/password">修改密码</a>
    </div>
    <div class="main">
        <div class="filter-bar">
            <a href="${pageContext.request.contextPath}/student/appoint/list" class="${status==null?'active':''}">全部</a>
            <a href="${pageContext.request.contextPath}/student/appoint/list?status=0" class="${status==0?'active':''}">待审核</a>
            <a href="${pageContext.request.contextPath}/student/appoint/list?status=1" class="${status==1?'active':''}">已同意</a>
            <a href="${pageContext.request.contextPath}/student/appoint/list?status=2" class="${status==2?'active':''}">已驳回</a>
            <a href="${pageContext.request.contextPath}/student/appoint/list?status=3" class="${status==3?'active':''}">已取消</a>
        </div>
        <table>
            <thead><tr><th>ID</th><th>教练</th><th>预约日期</th><th>时段</th><th>状态</th><th>备注</th><th>创建时间</th><th>操作</th></tr></thead>
            <tbody>
                <c:forEach items="${list}" var="a">
                    <tr>
                        <td>${a.id}</td>
                        <td>${a.coachName}</td>
                        <td>${a.appointDate}</td>
                        <td>${a.timeSlot}</td>
                        <td class="status-${a.status}">
                            <c:if test="${a.status==0}">待审核</c:if>
                            <c:if test="${a.status==1}">已同意</c:if>
                            <c:if test="${a.status==2}">已驳回</c:if>
                            <c:if test="${a.status==3}">已取消</c:if>
                        </td>
                        <td>${a.remark}</td>
                        <td>${a.createTime}</td>
                        <td>
                            <c:if test="${a.status==0}">
                                <a class="btn-cancel" href="${pageContext.request.contextPath}/student/appoint/cancel/${a.id}" onclick="return confirm('确定取消此预约?')">取消</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr><td colspan="8" style="text-align:center;padding:30px;color:#999;">暂无预约记录</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
