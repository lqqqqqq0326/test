<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/30
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试 - JSTL标签 c:forEach</title>
</head>
<body>
<table border="1px" cellpadding="10px" cellspacing ="0">
    <tr>
        <th>用户编号</th>
        <th>用户姓名</th>
        <th>用户性别</th>
        <th>用户生日</th>
        <th>用户年龄</th>
        <th>用户邮箱</th>
        <th>用户头像</th>
        <th>用户状态</th>
    </tr>
    <%--
        c:forEach 标签  迭代的标签
        1.items属性： EL表达式， 迭代的项（集合）
        2.var属性：临时变量名
    --%>
    <c:forEach items="${requestScope.users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.gender}</td>
            <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
            <td>${user.age}</td>
            <td>${user.email}</td>
            <td>
                <c:if test="${user.photo!=null}">
                    <img src="${user.photo}" width="50px" height="50px" />
                </c:if>
            </td>
            <td>
                <c:if test="${user.state eq 0}">
                    <c:set var="sta" value="未审核"></c:set>
                </c:if>
                <c:if test="${user.state eq 1}">
                    <c:set var="sta" value="审核通过"></c:set>
                </c:if>
                <c:if test="${user.state eq 2}">
                    <c:set var="sta" value="审核失败"></c:set>
                </c:if>
                    ${sta}
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
