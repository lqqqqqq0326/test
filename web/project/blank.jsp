<%@ page import="com.igeet.day1124.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%-- 获取请求域中，登陆成功者信息 ， 结果：获取不到，因为点击超链接，会产生新的请求 --%>
<%-- request在JSP页面中是内置对象，直接使用 --%>
<h1 style="color: lightseagreen">请求作用域：
    <%
        Object o = request.getAttribute("user");
        if(o!=null){
    %>
    欢迎<%=((User)o).getName()%>登陆成功
    <%
        }
    %>
</h1>

<%-- 获取会话作用域中，登陆成功者信息 ， 结果：可以获取，因为是同一个会话，在同一个会话中维护多个连续的请求调用 --%>
<%-- session在JSP页面中是内置对象，直接使用 --%>
<h1 style="color: lightsalmon">会话作用域：
    <%
        Object oo = session.getAttribute("u");
        if(oo!=null){
    %>
    欢迎<%=((User)oo).getName()%>登陆成功
    <%
        }/*else{
            //资源访问控制
            request.setAttribute("msg","当前资源必须访问后登陆");
            request.getRequestDispatcher("userLogin.jsp").forward(request,response);
        }*/
    %>
</h1>

</body>
</html>