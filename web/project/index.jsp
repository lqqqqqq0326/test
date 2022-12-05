<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-22
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>index页面</title>
</head>
<body>
Hello  JavaWeb
<%=request.getRemoteAddr() %>
<a href="test">访问/test请求</a>
<input type="button" value="点击我" onclick="show()">
</body>
<script>
  function show() {
    window.location.href="test";
  }
</script>
</html>
