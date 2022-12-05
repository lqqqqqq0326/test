<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2022/11/30
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" %>
<%@ page import="com.igeet.day1124.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试 - EL复杂数据类型</title>
</head>
<body>
<%
    //数组
    String[] arr = {"aaa","abc","add","acd"};
    pageContext.setAttribute("arr",arr);
%>
数组元素：${pageScope.arr[1]}
<br/>
<br/>
<%
    //集合 List
    List<String> list = new ArrayList<>();
    list.add("abc");
    list.add("aac");
    list.add("adc");
    pageContext.setAttribute("list",list);
%>
${pageScope.list}
${pageScope.list[0]}
<br/>
<br/>
<%
    //集合 Map
    Map<String,Object> map = new HashMap<>();
    map.put("k1","abc");
    map.put("k2","aac");
    map.put("k3","adc");
    pageContext.setAttribute("map",map);
%>
${pageScope.map.k1}
${pageScope.map["k1"]}

<br/>
<br/>

<%
    //自定义对象  User
    User user1 = new User("zs","123","男",new Date(),"123@qq.com");
    User user2 = null;
    pageContext.setAttribute("user1",user1);
    pageContext.setAttribute("user2",user2);
%>
<%-- 级联属性操作 --%>
${pageScope.user1.name}
${pageScope.user1["pwd"]}
${pageScope.user2.name}
</body>
</html>
