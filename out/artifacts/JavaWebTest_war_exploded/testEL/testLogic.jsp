<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/30
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date" %>
<%@ page import="com.igeet.day1124.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试 - El执行运算</title>
</head>
<body>
<%
    int x = 3;
    int y = 4;
//    String y = "4g";
    pageContext.setAttribute("x", x);
    pageContext.setAttribute("y", y);
%>

<%-- 使用EL表达式获取数据，最终都是讲数据转换成字符串，根据字符串，格式化数字，在进行计算 --%>
<%--  7  -1  12  0.75  3 --%>
${x+y }
${x-y }
${x*y }
${x/y }
${x%y }

<hr>
<%
    boolean flag = true;
    boolean info = false;
    pageContext.setAttribute("flag",flag);
    pageContext.setAttribute("flag",flag);
%>
<%-- false true true --%>
${flag&&info}
${!info}
${flag||info}
<hr>
<%
    //自定义对象 User
    User user1 = new User("zs","123","男",new Date(),"123@qq.com");
    User user2 = null;
    pageContext.setAttribute("user1",user1);
    pageContext.setAttribute("user2",user2);
%>
${empty user1}  <%-- false --%>
${empty user2}  <%-- true --%>
${user1!=null?user1.name:""}  <%--  zs --%>
${user2!=null?user2.name:""}  <%--  "" --%>

</body>
</html>
