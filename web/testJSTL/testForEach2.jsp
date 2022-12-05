<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/30
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试 - JSTL标签  c:forEach</title>
</head>
<body>
<%--
     c:forEach控制迭代
     begin起始值  end终止值  step步长，控制循环
     var用来设置当前迭代到的元素，保存在page容器中的数据的名称
     varStatus保存了循环过程中状态信息
--%>
<c:forEach begin="0" end="10" step="2" varStatus="sta" var="m">
    起始值begin：${sta.begin}
    终止值end：${sta.end}
    步长step：${sta.step}
    是否是第一项first：${sta.first}
    是否是最后一项last：${sta.last}
    循环的次数count：${sta.count}
    当前迭代的项current：${sta.current}
    当前迭代的项m：${m}
    当前迭代的索引号index：${sta.index}
    <br/>
</c:forEach>
<br/>
<br/>
<%
    //数组
    int[] arr = {10,20,30,40,50};
    pageContext.setAttribute("arr",arr);
%>
<c:forEach items="${arr}" var="a">
    ${a}
</c:forEach>
<br/>
<br/>
<%
    //list
    List<String> list = new ArrayList<>();
    list.add("abc");
    list.add("aaa");
    list.add("sdb");
    pageContext.setAttribute("list",list);
%>
<c:forEach items="${list}" var="str">
    ${str}
</c:forEach>
<br/>
<br/>
<%
    //map
    Map<String,Integer> map = new HashMap<>();
    map.put("abc",111);
    map.put("aaa",222);
    map.put("adc",333);
    pageContext.setAttribute("map",map);
%>
<c:forEach items="${map}" var="entity">
    键:${entry.key} & 值:${entry.value}<br/>
</c:forEach>
</body>
</html>
