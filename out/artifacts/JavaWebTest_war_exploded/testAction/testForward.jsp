<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/29
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试 - 标准动作forward</title>
</head>
<body>
<%-- 请求转发至指定页面 --%>
<jsp:forward page="header.jsp">
    <jsp:param name="x" value="100"/>
    <jsp:param name="y" value="10"/>
</jsp:forward>
</body>
</html>
