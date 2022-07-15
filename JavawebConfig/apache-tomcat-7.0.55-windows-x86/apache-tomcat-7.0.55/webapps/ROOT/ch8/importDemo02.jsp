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
    
    <title>import标签案例 var和scope</title>
    
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
     <!-- 如果有var属性，则包含进来的信息不会在页面上显示，而是存储到var指定 的变量中。存储的范围通过scope进行指定 -->
    <c:import url="a1.txt" var="helloInfor" scope="session" charEncoding="gbk"></c:import>
    <!-- 存储之后，我们用的时候随时取出 -->
    <h1>${sessionScope.helloInfor}</h1>
    
    <c:import url="http://www.inspur.com"  charEncoding="utf-8">
      <c:param name="username" value="zhangsan"></c:param>
      <c:param name="password" value="123"></c:param>
    </c:import>
    
  </body>
</html>
