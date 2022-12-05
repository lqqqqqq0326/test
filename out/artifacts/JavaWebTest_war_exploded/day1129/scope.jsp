<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/29
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    pageContext.setAttribute("name", "赵六");
%>
当前页作用域：${pageScope.name} <br>
请求作用域：${requestScope.name} <br>
会话作用域：${sessionScope.name} <br>
上下文作用域：${applicationScope.name} <br>
<br>
${name}
${aaa}
</body>
</html>
