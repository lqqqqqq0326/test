<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/30
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date" %>
<%@ page import="com.igeet.day1124.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>测试 - JSTL标签 c:if</title>
</head>
<body>
<%
    //    User user = new User("张三","123","女",new Date(),"123@qq.com");
    User user = null;
    pageContext.setAttribute("user",user);
%>
<%--
    c:if标签  判断
    1.test属性：   EL表达式，判定表达式是否成立
    2.scope属性： 作用域，将判断结果的结果存储在指定的作用域中 (可以省略)
    3.var属性：   声明的临时变量，存储判断结果  (可以省略)
--%>
<c:if test="${pageScope.user!=null}" scope="request" var="flag">
    <h1 style="color: #5eb22d">用户名:${pageScope.user.name}</h1>
</c:if>
判断的结果：${requestScope.flag}
</body>
</html>
