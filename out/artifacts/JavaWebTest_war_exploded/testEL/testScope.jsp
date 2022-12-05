<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/30
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试 - EL作用域</title>
</head>
<body>
<%--
    当前页作用域page
    范围：
    JSP语法 pageContext < request < session < application
    EL语法  pageScope < requestScope < sessionScope < applicationScope

    例如：
    ${requestScope.a} 类似于  <%=request.getAttribute("a")%>
--%>
<%
    //    pageContext.setAttribute("a","当前页");
%>

<h1 style="color: lightsalmon">当前页作用域：${pageScope.a}</h1>
<h1 style="color: lightcoral">请求作用域：${requestScope.a}</h1>
<h1 style="color: lightseagreen">会话作用域：${sessionScope.a}</h1>
<h1 style="color: lightblue">上下文作用域：${applicationScope.a}</h1>

<%--
    可以不指定作用域，根据就近原则使用
    pageScope < requestScope < sessionScope < applicationScope  从小到大，依次寻找
--%>
${a}
<%-- 若四大作用域都未发现数据，则不显示，也不会显示null --%>
${str}
</body>
</html>
