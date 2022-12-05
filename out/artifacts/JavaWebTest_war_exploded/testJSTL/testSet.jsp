<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/30
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date" %>
<%@ page import="com.igeet.day1124.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试 - JSTL标签 c:set</title>
</head>
<body>
<%--
    c:set 标签  设置值的标签
    1.var属性：临时变量，将value的值存储在变量中
    2.scope属性：指定变量的值在哪一个作用域可以获取到
    3.value属性：值  EL表达式
--%>
<c:set var="path" scope="session" value="${pageContext.request.contentPath}"></c:set>
<%--<img src="${pageContext.request.contextPath}/t1.jpeg" />--%>
<img src="${sessionScope.path}/t1.jpeg"/>
<img src="${path}/t1.jpge"/>
<br/>
<br/>
<%
    User user = new User("张三","123","女",new Date(),"123@qq.com");
    pageContext.setAttribute("user",user);
%>
<%--
    c:set 标签  替换对象中的属性
    1.target属性    支持EL表达式，替换哪一个对象
    2.property属性  支持EL表达式，替换对象的哪一个属性
    3.value属性     支持EL表达式，替换的值

    注意：
    1.var属性和scope属性必须一起使用。
    2.target属性和property属性是要一起使用的
--%>
<c:set target="${pageScope.user}" property="gender" value="男"></c:set>
${pageScope.user}
</body>
</html>
