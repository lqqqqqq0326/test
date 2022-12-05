<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户注册界面</title>
</head>
<body>
<%--<%
    Object o = request.getAttribute("error");
    if(o!=null){
%>
<h1 style="color: red"><%=o.toString()%></h1>
<%
    }
%>--%>



<%-- enctype="multipart/form-data" 表示以二进制的数据格式来传输 --%>
<form action="/user?code=register" method="post" enctype="multipart/form-data">
    <table border="1px" cellpadding="10px" cellspacing="0" align="center">
        <tr>
            <th colspan="2">用户注册界面</th>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="name" placeholder="请输入姓名" required /></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="pwd" placeholder="请输入密码" required /></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <input type="radio" name="gender" value="男" />男
                <input type="radio" name="gender" value="女" />女
            </td>
        </tr>
        <tr>
            <td>生日</td>
            <td><input type="date" name="birthday" /></td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td>
                <input type="email" name="email" placeholder="请输入邮箱" required />
            </td>
        </tr>
        <tr>
            <td>头像</td>
            <td>
                <input type="file" name="photo"  />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="注册"/>
                <input type="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
