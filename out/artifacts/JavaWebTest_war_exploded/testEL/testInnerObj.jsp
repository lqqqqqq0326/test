<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/30
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试 - EL的11个内置对象</title>
</head>
<body>
<%--  1.作用域的内置对象：pageScope < requestScope < sessionScope < applicationScope  --%>
<%
    //当前页作用域  只在当前页面
    pageContext.setAttribute("a","111");
    //请求作用域  一次请求中，可以请求转发
    request.setAttribute("b","222");
    //会话作用域  会话超时之前都存在，只要浏览器不关闭
    session.setAttribute("c","333");
    //上下文作用域  服务器重启或关闭前都存在，只要服务器不关闭
    application.setAttribute("d","444");
%>
${pageScope.a}
${requestScope.b}
${sessionScope.c}
${applicationScope.d}
类似于
<%=request.getAttribute("b")%>

<br/>
<br/>
<%--
    2.获得请求参数 param/paramValues
    测试url：http://localhost:8899/testEL/testInnerObj.jsp?name=lisi&pwd=123&hobby=code&hobby=music
--%>
${param.name}
${param.pwd}
${param.gender}
${paramValues.hobby[0]}
${paramValues.hobby[1]}
类似于
<%=request.getParameter("name")%> <%--null--%>
<br/>
<br/>
<%--
    4.cookie内置对象
--%>
${cookie.JSESSIONID.name}
${cookie.JSESSIONID.value}
${cookie.nameCookie.name}
${cookie.nameCookie.value}

<br/>
<br/>
<%-- 5.pageContext内置对象 --%>
<%-- requestScope请求作用域，用来操作请求中的属性 --%>
${requestScope.b}
<%-- 获取请求对象 --%>
${pageContext.request.contextPath}  <%-- 获取项目的根路径 --%>
<%-- 获取会话对象 --%>
${pageContext.session.invalidate()}

<br/>
<br/>

<%-- 6.initParam内置对象 --%>
${initParam}
<br/>
${initParam.abc}
类似于
<%=application.getInitParameter("abc")%>

</body>
</html>
