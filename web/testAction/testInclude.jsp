<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/29
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试 - 标准动作include</title>
</head>
<body>
<%--
    动态包含
    1.<jsp:include page="页面"></jsp:include>
    2.page属性，指定页面资源，允许携带请求参数  header.jsp?x=100&y=5
    3.访问路径：http://localhost:8899/testAction/testInclude.jsp
    4.运行期间：在运行期访问被包含的页面，并将响应结果同包含页面的响应结果合并，生成最终响应。
--%>
<jsp:include page = "header.jsp?x=100&y=5"></jsp:include>
<jsp:include page = "header.jsp">
    <jsp:param name ="x" value = "100"/>
    <jsp:param name = "y" value = "5"/>
</jsp:include>
这是测试标准动作include
</body>
</html>
