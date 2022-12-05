<%@ page import="com.igeet.day1124.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成功页面</title>
</head>
<body>
    <h1 style="color:#27f044;">登陆成功</h1>
    <%-- 获取请求参数 --%>
<%--    <h1 style="color: lightseagreen">欢迎 <%= request.getParameter("username")%> 登陆成功</h1>--%>

    <%-- 获取请求属性 Object类型 --%>
<%--    <h1><%=request.getAttribute("msg")%></h1>--%>

    <%-- 获取请求域中，登陆成功者信息 --%>
<%--    <h1 style="color: lightseagreen">请求域中:欢迎<%=((User)request.getAttribute("user")).getName()%> 登陆成功</h1>--%>

    <h1 style="color: lightsalmon">会话域中:欢迎<%=((User)session.getAttribute("u")).getName()%> 登陆成功</h1>


    <a href="blank.jsp">请求转发访问blank.jsp</a>

    <%-- 强制把JSESSIONID传递给相关资源即可 --%>
<%--    <a href=<%=response.encodeURL("blank.jsp")%>>会话访问访问blank.jsp</a>--%>
    <a href="/user?code=logout">安全登出</a>
    <a href="blank.jsp">访问blank.jsp</a>
    <%-- 获取上下文的初始化参数 --%>
    <%=application.getInitParameter("abc")%>


<%--        测试session监听事件--%>
    <a href="../testJSP/testSessionAttribute.jsp">访问testSessionAttribute.jsp</a>



<%--显示图片--%>
    <img src="${sessionScope.u.photo}" />
<hr>


</body>
</html>
