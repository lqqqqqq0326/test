<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登陆界面</title>
</head>
<body>
<%--刷新页面，获取Cookie--%>
<%
    String name = null;
    String pwd = null;

    //从请求中获取Cookie，是否可以直接登陆
    Cookie[] cookies = request.getCookies();
    if(cookies!=null){
        for (Cookie cookie : cookies) {
            if(cookie!=null){
                if(cookie.getName().equals("nameCookie")){
                    //URLDecoder 解码
                    name = URLDecoder.decode(cookie.getValue(),"utf8");
                }
                if(cookie.getName().equals("pwdCookie")){
                    pwd = cookie.getValue();
                }
            }
        }
    }

    if(name!=null && pwd!=null){
        request.getRequestDispatcher("/user?code=login&name="+name+"&pwd="+pwd).forward(request,response);
    }
%>


<%--拿到返回信息--%>
<%
    Object o = request.getAttribute("msg");
    if(o!=null){
%>
<h1 style="color: red"><%=o%></h1>
<%
    }
%>

<form action="/user?code=login" method="post">
    <table border="1px" cellpadding="10px" cellspacing="0" align="center">
        <tr>
            <th colspan="2">登陆界面</th>
        </tr>
        <tr>
            <td>姓名</td>
           <%--  EL表达式 ${name} 取代<%=request.getAttribute("name")%> --%>
            <td><input type="text" name="name" value="${name}" placeholder="请输入姓名"/></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="pwd" placeholder="请输入密码"/></td>
        </tr>
        <tr>
<%--            使用cookie实现简化登录--%>
            <td>免登陆</td>
            <td>
                <select name="timeLength">
                    <option value="0">不设置免登陆</option>
                    <option value="7">7天内免登陆</option>
                    <option value="15">15天内免登陆</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="登陆"/>
                <input type="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
