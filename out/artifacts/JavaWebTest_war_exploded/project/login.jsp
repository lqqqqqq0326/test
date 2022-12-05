<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登陆界面</title>
</head>
<body>
<form action="login" method="get">
    <table border="1px" cellpadding="10px" cellspacing="0" align="center">
        <tr>
            <th colspan="2">登陆界面</th>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="username" placeholder="请输入姓名"/></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password" placeholder="请输入密码"/></td>
        </tr>
		<tr>
			<td>常用地址</td>
			<td>
				<input type="checkbox" name="address" value="安徽"/>安徽
				<input type="checkbox" name="address" value="江苏"/>江苏
				<input type="checkbox" name="address" value="湖北"/>湖北
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
