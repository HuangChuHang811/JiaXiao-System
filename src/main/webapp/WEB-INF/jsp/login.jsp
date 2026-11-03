<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>驾校管理系统 - 登录</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: "Microsoft YaHei", sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .login-box { background: #fff; padding: 40px; border-radius: 12px; box-shadow: 0 10px 40px rgba(0,0,0,0.2); width: 380px; }
        .login-box h2 { text-align: center; color: #333; margin-bottom: 30px; font-size: 22px; }
        .login-box h2 small { display: block; font-size: 14px; color: #888; margin-top: 5px; }
        .form-group { margin-bottom: 18px; }
        .form-group label { display: block; color: #555; margin-bottom: 6px; font-size: 14px; }
        .form-group input, .form-group select { width: 100%; padding: 10px 12px; border: 1px solid #ddd; border-radius: 6px; font-size: 14px; outline: none; transition: border-color 0.2s; }
        .form-group input:focus, .form-group select:focus { border-color: #667eea; }
        .btn { width: 100%; padding: 12px; background: #667eea; color: #fff; border: none; border-radius: 6px; font-size: 16px; cursor: pointer; transition: background 0.2s; }
        .btn:hover { background: #5a6fd6; }
        .msg { color: #e74c3c; font-size: 13px; text-align: center; margin-top: 10px; }
        .tips { margin-top: 20px; padding: 12px; background: #f8f9fa; border-radius: 6px; font-size: 12px; color: #666; line-height: 1.8; }
        .tips b { color: #333; }
    </style>
</head>
<body>
<div class="login-box">
    <h2>驾校学员预约与成绩管理系统<small>Driving School Management</small></h2>
    <form action="${pageContext.request.contextPath}/doLogin" method="post">
        <div class="form-group">
            <label>登录角色</label>
            <select name="role">
                <option value="admin">管理员</option>
                <option value="student">学员</option>
                <option value="coach">教练</option>
            </select>
        </div>
        <div class="form-group">
            <label>账号</label>
            <input type="text" name="username" required placeholder="请输入账号">
        </div>
        <div class="form-group">
            <label>密码</label>
            <input type="password" name="password" required placeholder="请输入密码">
        </div>
        <button class="btn" type="submit">登 录</button>
        <p class="msg">${msg}</p>
    </form>
    <div class="tips">
        <b>测试账号（密码均为 123456）：</b><br>
        管理员：admin / 123456<br>
        学员：student01 / 123456<br>
        教练：coach01 / 123456
    </div>
</div>
</body>
</html>
