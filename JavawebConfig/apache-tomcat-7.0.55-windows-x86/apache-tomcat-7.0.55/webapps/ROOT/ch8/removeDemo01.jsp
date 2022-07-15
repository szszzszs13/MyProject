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
    
    <title>remove标签的案例</title>
    
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
    <c:set var="name" scope="session">zhangsan</c:set>
    <c:set var="age" scope="session">20</c:set>
    <c:set var="sex" scope="session">男</c:set>
    <!-- 在remove之前取出存放的信息，并在页面上进行显示 -->
    <li><c:out value="${name}"></c:out></li>
    <li><c:out value="${age}"></c:out></li>
    <li><c:out value="${sex}"></c:out></li>
    <!-- remove来删除信息 -->
    <c:remove var="name" scope="session"/>
    <c:remove var="age"/>
    <!-- remove之后的信息，并在页面上进行显示 -->
    <li><c:out value="${name}"></c:out></li>
    <li><c:out value="${age}"></c:out></li>
    <li><c:out value="${sex}"></c:out></li>
  </body>
</html>
