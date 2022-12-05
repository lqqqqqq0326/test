<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/29
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%--
    page指令
    1.contentType属性   响应的文本类型及编码集
    2.language属性      支持的语言
    3.import属性        导入包（可以使用多次）
    4.pageEncoding属性  用来设置JSP文件的页面编码格式
    5.session属性       默认为true，开启会话；若设置为false，则禁用会话
    6.isELIgnored属性   默认为true；当页面中EL表达式失效时，则isELIgnored="false"
    7.isErrorPage属性   设置为true，指定当前是个错误页，会产生内置对象exception
    8.errorPage属性     指定当前页面出现错误后，跳转的页面资源
--%>
<%@ page import="java.util.*" %>
<%@ page import="com.igeet.day1124.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" session="false" isELIgnored="false" %>
<html>
<head>
    <title>指令-page指令</title>
</head>
<body>
<%
    Date date = new Date();
    User user = new User();
//    Object u = session.getAttribute("u");
%>
</body>
</html>
