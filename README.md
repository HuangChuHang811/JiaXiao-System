# 🚗 驾校学员预约与成绩管理系统

> 基于 SSM（Spring + SpringMVC + MyBatis）+ JSP + MySQL 的传统 JavaEE 课程作业项目

---

## 📖 目录

- [项目简介](#项目简介)
- [技术栈](#技术栈)
- [功能清单](#功能清单)
- [数据库表结构](#数据库表结构)
- [快速开始](#快速开始)
- [详细部署指南](#详细部署指南)
- [测试账号](#测试账号)
- [项目结构](#项目结构)
- [常见问题 FAQ](#常见问题-faq)

---

## 项目简介

一个面向驾校场景的学员预约训练与考试成绩管理系统，包含三种角色：**学员**、**教练**、**管理员**。传统 JavaEE 项目，无前后端分离，适合课程作业学习。

## 技术栈

| 分类 | 技术 | 版本 |
|------|------|------|
| 语言 | JDK | 1.8 |
| 框架 | Spring | 5.3.20 |
| 框架 | SpringMVC | 5.3.20 |
| 框架 | MyBatis | 3.5.9 |
| 数据库 | MySQL | 5.7+ / 8.0+ |
| 连接池 | Druid | 1.2.16 |
| 分页 | PageHelper | 5.3.0 |
| 视图 | JSP + JSTL | - |
| 构建 | Maven | 3.6+ |
| 服务器 | Tomcat | 8.5+ |
| IDE | IntelliJ IDEA | 2021+ |

---

## 功能清单

### 🔑 登录模块（公共）
- 三种角色登录：学员 / 教练 / 管理员
- MD5 密码加密
- 登录拦截器（未登录自动跳转）
- 退出登录

### 👨‍💼 管理员
- 学员管理：新增 / 修改 / 删除 / 分页查询
- 教练管理：新增 / 修改 / 删除 / 分页查询
- 预约管理：查看全部 / 按状态筛选 / 删除
- 成绩管理：查看全部 / 分页 / 导出（纯文本 + 表格）
- 修改自己密码

### 👤 学员
- 查看 / 修改个人信息
- 修改密码
- 预约训练（选教练 + 日期 + 时段，自动冲突检测）
- 我的预约（按状态筛选：待审核 / 已通过 / 已驳回 / 已取消）
- 取消未审核预约
- 查看考试成绩（科目一~四）

### 🏋️ 教练
- 查看 / 修改个人信息
- 修改密码
- 查看学员预约（按状态筛选）
- 审核预约：同意 / 驳回（填驳回理由）
- 录入学员成绩（自动判断合格：≥90分合格）
- 查看自己录入的成绩记录 / 删除

---

## 数据库表结构

系统共 5 张核心表：

| 表名 | 说明 | 关键字段 |
|------|------|----------|
| `admin` | 管理员表 | id, username, password |
| `student` | 学员表 | id, username, password, name, phone, age, subject, create_time |
| `coach` | 教练表 | id, username, password, name, phone, subject |
| `appoint` | 预约表 | id, student_id, coach_id, appoint_date, time_slot, status(0待审核/1同意/2驳回/3取消), remark, create_time |
| `score` | 成绩表 | id, student_id, coach_id, subject, score, pass(1合格/0不合格), create_time |

完整建表 SQL 见 [`sql/jiaxiao.sql`](sql/jiaxiao.sql)（含测试数据）。

---

## 快速开始

> 最快 5 步跑起来，详见下方「详细部署指南」

```bash
# 1. 克隆项目
git clone https://github.com/你的用户名/JiaXiao.git
cd JiaXiao

# 2. 导入数据库（MySQL 5.7+ / 8.0+）
mysql -u root -p < sql/jiaxiao.sql

# 3. 修改数据库连接（如需要）
# 编辑 src/main/resources/jdbc.properties

# 4. Maven 构建
mvn clean package -DskipTests

# 5. 部署到 Tomcat，或 IDEA 中配置 Tomcat 直接运行
# 浏览器访问 http://localhost:8080/
```

---

## 详细部署指南

### 一、环境准备

确保你的机器（或虚拟机）已安装以下软件：

| 软件 | 下载地址 | 最低版本 |
|------|----------|----------|
| JDK | https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html | 1.8 |
| Maven | https://maven.apache.org/download.cgi | 3.6 |
| MySQL | https://dev.mysql.com/downloads/mysql/ | 5.7 |
| Tomcat | https://tomcat.apache.org/download-80.cgi | 8.5 |
| IDEA（可选） | https://www.jetbrains.com/idea/download/ | 2021 |

#### 1.1 验证环境

```bash
# Windows / Linux 通用
java -version        # 应输出 1.8.x
mvn -version         # 应输出 Maven 版本
mysql --version      # 应输出 MySQL 版本
```

---

### 二、获取代码

```bash
# 方式一：Git 克隆（推荐）
git clone https://github.com/你的用户名/JiaXiao.git
cd JiaXiao

# 方式二：下载 ZIP
# GitHub → Code → Download ZIP → 解压到本地
```

---

### 三、数据库初始化

#### 3.1 登录 MySQL

```bash
mysql -u root -p
# 输入密码后进入 MySQL 命令行
```

#### 3.2 执行建表脚本

```sql
-- 方式一：source 命令
source /你的路径/JiaXiao/sql/jiaxiao.sql;

-- 方式二：直接执行文件（Shell 中）
-- mysql -u root -p < sql/jiaxiao.sql
```

脚本会自动创建：
- 数据库 `jiaxiao`
- 5 张数据表（`admin`、`student`、`coach`、`appoint`、`score`）
- 测试数据（4 个学员、3 个教练、若干预约和成绩记录）

#### 3.3 验证

```sql
USE jiaxiao;
SHOW TABLES;
SELECT COUNT(*) FROM student;  -- 应返回 4
```

---

### 四、修改数据库连接配置

如果你的 MySQL 账号密码不是默认的 `root/root`，需要修改：

**文件位置：** `src/main/resources/jdbc.properties`

```properties
jdbc.driver=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/jiaxiao?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
jdbc.username=root          # ← 改成你的账号
jdbc.password=root          # ← 改成你的密码
```

如果 MySQL 在另一台机器上（虚拟机场景），把 `localhost` 改成实际 IP：

```properties
jdbc.url=jdbc:mysql://192.168.1.100:3306/jiaxiao?...
```

---

### 五、编译打包

```bash
# 进入项目根目录（有 pom.xml 的那一层）
cd JiaXiao

# 清理 + 编译 + 打包（跳过测试）
mvn clean package -DskipTests

# 看到 BUILD SUCCESS 且 target/ 下有 JiaXiao.war 就成功了
```

---

### 六、部署运行

#### 方式 A：IDEA 中运行（开发推荐）

1. 打开 IDEA → **File → Open** → 选择 `JiaXiao` 项目根目录
2. 等待 Maven 自动下载依赖（右下角进度条走完）
3. **Run → Edit Configurations → + → Tomcat Server → Local**
4. **Application server**：选择已安装的 Tomcat
5. **Deployment** 选项卡 → **+** → **Artifact** → 选择 `JiaXiao:war exploded`
6. **Application context** 保持 `/`
7. **OK → Run**，浏览器自动打开 `http://localhost:8080/`

#### 方式 B：独立 Tomcat 部署（生产/虚拟机推荐）

```bash
# 1. 停止 Tomcat
# Linux: $CATALINA_HOME/bin/shutdown.sh
# Windows: %CATALINA_HOME%\bin\shutdown.bat

# 2. 复制 WAR 包到 Tomcat 的 webapps 目录
cp target/JiaXiao.war $CATALINA_HOME/webapps/

# 3. 启动 Tomcat
# Linux: $CATALINA_HOME/bin/startup.sh
# Windows: %CATALINA_HOME%\bin\startup.bat

# 4. 查看日志确认启动成功
tail -f $CATALINA_HOME/logs/catalina.out

# 5. 浏览器访问
# http://服务器IP:8080/JiaXiao/
```

> 💡 如果希望直接访问根路径 `http://服务器IP:8080/`，将 WAR 重命名为 `ROOT.war` 再放入 webapps。

#### 方式 C：Maven 内置 Tomcat（最快预览）

```bash
cd JiaXiao
mvn tomcat7:run
# 访问 http://localhost:8080/
```

---

### 七、虚拟机部署完整流程（Linux 版）

适合拿到 GitHub 仓库后在云服务器/虚拟机上从零部署：

```bash
# === 1. 安装 JDK 8 ===
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
java -version

# === 2. 安装 MySQL ===
sudo apt-get install -y mysql-server
sudo systemctl start mysql
sudo mysql_secure_installation   # 设置 root 密码

# === 3. 安装 Maven ===
sudo apt-get install -y maven
mvn -version

# === 4. 安装 Tomcat 8.5 ===
cd /opt
sudo wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.98/bin/apache-tomcat-8.5.98.tar.gz
sudo tar -xzf apache-tomcat-8.5.98.tar.gz
sudo ln -s apache-tomcat-8.5.98 tomcat

# === 5. 克隆项目 ===
cd /home
git clone https://github.com/你的用户名/JiaXiao.git

# === 6. 导入数据库 ===
cd JiaXiao
mysql -u root -p你的密码 < sql/jiaxiao.sql

# === 7. 修改数据库配置 ===
# 如果密码不是 root，编辑 jdbc.properties
vi src/main/resources/jdbc.properties

# === 8. 编译打包 ===
mvn clean package -DskipTests

# === 9. 部署到 Tomcat ===
sudo cp target/JiaXiao.war /opt/tomcat/webapps/
sudo /opt/tomcat/bin/startup.sh

# === 10. 查看日志 ===
tail -f /opt/tomcat/logs/catalina.out

# === 11. 访问 ===
curl http://localhost:8080/JiaXiao/
```

---

## 测试账号

所有测试账号的**密码均为 `123456`**（数据库中已用 MD5 加密存储）

| 角色 | 账号 | 说明 |
|------|------|------|
| 🔑 管理员 | `admin` | 后台管理全部功能 |
| 👤 学员 | `student01` | 张三，C1 学员 |
| 👤 学员 | `student02` | 李四，C2 学员 |
| 👤 学员 | `student03` | 王五，C1 学员 |
| 🏋️ 教练 | `coach01` | 刘教练，带科目二/三 |
| 🏋️ 教练 | `coach02` | 王教练，带科目一/四 |
| 🏋️ 教练 | `coach03` | 陈教练，带科目二/三 |

### 业务流程测试建议

```
1. 登录 student01 → 预约训练（选 coach01 + 明天 + 上午）
2. 登录 coach01 → 学员预约 → 同意 or 驳回（填理由）
3. 登录 student01 → 我的预约 → 看到状态已变更
4. 登录 coach01 → 录入成绩 → 选 student01 + 科目二 + 93
5. 登录 student01 → 我的成绩 → 看到分数 + 合格标记
6. 登录 admin → 导出成绩 → 复制纯文本提交作业
```

---

## 项目结构

```
JiaXiao/
├── sql/
│   └── jiaxiao.sql                 # 数据库脚本（建表 + 测试数据）
├── pom.xml                          # Maven 依赖管理
├── README.md                        # 本部署文档
└── src/main/
    ├── java/com/driving/
    │   ├── entity/                  # 实体类（5 个）
    │   │   ├── Admin.java
    │   │   ├── Student.java
    │   │   ├── Coach.java
    │   │   ├── Appointment.java
    │   │   └── Score.java
    │   ├── mapper/                  # MyBatis Mapper 接口（5 个）
    │   ├── service/                 # Service 接口（6 个）
    │   │   └── impl/                # Service 实现类（6 个）
    │   ├── controller/              # SpringMVC Controller（4 个）
    │   │   ├── LoginController.java
    │   │   ├── AdminController.java
    │   │   ├── StudentController.java
    │   │   └── CoachController.java
    │   └── util/                    # 工具类
    │       ├── MD5Util.java          # MD5 密码加密
    │       ├── SessionUtil.java      # 会话管理
    │       └── LoginInterceptor.java # 登录拦截器
    ├── resources/
    │   ├── applicationContext.xml    # Spring 根容器配置
    │   ├── springmvc.xml             # SpringMVC 配置
    │   ├── mybatis-config.xml        # MyBatis 配置 + PageHelper
    │   ├── jdbc.properties           # 数据库连接 ⚠️ 按需修改
    │   └── mapper/                   # MyBatis XML 映射（5 个）
    └── webapp/
        ├── index.jsp                 # 根路径 → 重定向到登录
        └── WEB-INF/
            ├── web.xml               # Web 应用配置
            └── jsp/
                ├── login.jsp          # 登录页
                ├── admin/            # 管理员视图
                │   ├── home.jsp
                │   ├── student/{list,add,edit}.jsp
                │   ├── coach/{list,add,edit}.jsp
                │   ├── appoint/list.jsp
                │   ├── score/{list,export}.jsp
                │   └── password.jsp
                ├── student/          # 学员视图
                │   ├── home.jsp
                │   ├── info.jsp
                │   ├── password.jsp
                │   ├── appoint/{add,list}.jsp
                │   └── score/list.jsp
                └── coach/            # 教练视图
                    ├── home.jsp
                    ├── info.jsp
                    ├── password.jsp
                    ├── appoint/{list,reject}.jsp
                    └── score/{add,list}.jsp
```

---

## 常见问题 FAQ

### Q1：启动报错 `Communications link failure`
**原因**：MySQL 未启动或连接配置不对
**解决**：
```bash
# 确认 MySQL 正在运行
# Linux
sudo systemctl status mysql
# Windows
net start mysql

# 确认账号密码
mysql -u root -p -e "SHOW DATABASES;"
```

### Q2：启动报错 `Unknown column 'xxx' in 'field list'`
**原因**：数据库表结构不是最新版本
**解决**：删除旧库重建
```sql
DROP DATABASE jiaxiao;
SOURCE /path/to/sql/jiaxiao.sql;
```

### Q3：访问 404
**原因**：Tomcat 部署路径不对
**解决**：
- IDEA 中 Deployment 的 Application context 设为 `/`
- 独立 Tomcat 访问 `http://localhost:8080/JiaXiao/`（WAR 名为 JiaXiao）

### Q4：页面中文乱码
**原因**：字符编码问题
**解决**：
- `jdbc.properties` 中 URL 包含 `characterEncoding=utf8`
- JSP 顶部有 `<%@ page contentType="text/html;charset=UTF-8" %>`
- `web.xml` 已配置 `CharacterEncodingFilter`

### Q5：登录一直失败
**原因**：密码是 MD5 加密的，测试数据密码均为 `123456`
**解决**：确认使用正确的账号密码（见「测试账号」章节）

### Q6：Maven 下载依赖慢
**解决**：配置国内镜像（阿里云）
```xml
<!-- ~/.m2/settings.xml -->
<mirror>
  <id>aliyun</id>
  <mirrorOf>central</mirrorOf>
  <url>https://maven.aliyun.com/repository/public</url>
</mirror>
```

### Q7：端口 8080 被占用
**解决**：
```bash
# Windows
netstat -ano | findstr :8080
taskkill /PID 进程号 /F

# Linux
lsof -i :8080
kill -9 进程号
```
或修改 Tomcat 端口（`server.xml` 中 `Connector port="8080"` 改成其他端口）

---

## 📝 License

课程作业项目，仅供学习交流使用。
