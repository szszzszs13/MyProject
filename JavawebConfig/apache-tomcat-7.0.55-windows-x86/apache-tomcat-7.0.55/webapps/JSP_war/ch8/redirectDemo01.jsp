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
    
    <title>redirect标签用法案例</title>
    
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
    <!-- 在此位置进行页面的重定向,重定向到tomcat的首页面 -->
    <c:redirect url="http://localhost:8080/"></c:redirect> 
    <%--<c:import url="http://localhost:8080/"></c:import>--%>
    <!-- 重定向和页面资源包含的区别：
     页面资源包含时是在本页面中插入其他页面，而重定向是请求的转发，等于在页面中重新输入了一次url，当重定向到
      某一个页面时浏览器中的地址会发生变化。
     -->
     <!-- 等价于response.sendRedirect方法，区别是 response中方法只能重定向到当前web项目中的资源，而
      redirect可以重定向到其他web项目中的资源
     -->
  </body>
</html>
