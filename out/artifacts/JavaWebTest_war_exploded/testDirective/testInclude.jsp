<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/29
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试-include指令</title>
</head>
<body>
<%--
    静态包含
    1.<%@ include file="页面"%>  include指令
    2.file属性，指定页面文件资源，不可以携带参数 ?x=10&y=2
    3.访问的路径：http://localhost:8899/testDirective/testInclude.jsp?x=10&y=5
    4.发生在翻译期间，把包含的页面也翻译到当前页面的Java文件中
--%>
<%@ include file="header.jsp"%>
这是一个include静态包含的页面
</body>
</html>
