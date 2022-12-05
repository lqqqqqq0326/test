
<%@ page import="java.util.Date" %>
<%@ page import="com.igeet.day1124.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试会话属性</title>
</head>
<body>
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
            //request.getContextPath()：获取路劲
            request.getRequestDispatcher(request.getContextPath()+"/userLogin.jsp").forward(request,response);
        }*/
    %>
</h1>
<%
    //替换会话中的属性
    session.setAttribute("u",new User("aaa","123","男",new Date(),"123@qq.com"));

    //移除会话中的属性
    session.removeAttribute("u");
%>
</body>
</html>
