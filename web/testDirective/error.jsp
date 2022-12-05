<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/29
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%-- isErrorPage属性：指定当前是个错误页，会产生内置对象exception --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>错误页</title>
</head>
<body>
<%--
    JSP内置对象
    1.request  请求
    2.response 响应
    3.pageContext JSP上下文
    4.session  会话
    5.exception 异常，必须JSP页面使用page指令，指定isErrorPage属性为true，才会产生exception异常对象
    6.application 应用上下文
    7.config  配置
    8.page    JSP对象 this
    9.out     输出对象
--%>
<h1 style="color:red">
    <%=exception.getMessage()%>
</h1>
</body>
</html>
