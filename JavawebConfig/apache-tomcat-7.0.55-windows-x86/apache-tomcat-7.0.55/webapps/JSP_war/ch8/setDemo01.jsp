<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>set标签用法案例</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <ul>
     <!-- <li>向session范围中存放一个变量name1，变量的值为hello:<c:set value="hello" var="name1" scope="session"></c:set></li> -->
     <!-- 和下面的写法等价 -->
     <li>向session范围中存放一个变量name1，变量的值为hello:<c:set var="name1" scope="session">hello</c:set></li>
     <li>从sesion中获取name1信息：${sessionScope.name1}</li>
     <!-- 给target指定的javabean属性赋值 -->
     <jsp:useBean id="person" class="com.inspur.ch6.Person"></jsp:useBean>
     <c:set target="${person}" property="name">zhangsan</c:set>
     <c:set target="${person}" property="age">20</c:set>
     <c:set target="${person}" property="sex">男</c:set>
     <%
       //上面的代码和下面的代码等价。
       person.setName("zhangsan");
       person.setAge(20);
       person.setSex("男");
      %>
      <li>人的姓名:<c:out value="${person.name }">姓名为空</c:out></li>
      <li>人的姓名:<c:out value="${person.age }">年龄为空</c:out></li>
      <li>人的姓名:<c:out value="${person.sex }">性别为空</c:out></li>
    </ul>
  </body>
</html>
