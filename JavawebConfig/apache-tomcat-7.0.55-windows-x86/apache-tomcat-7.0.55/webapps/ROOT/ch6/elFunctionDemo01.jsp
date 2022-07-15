<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 使用的是自定义的el函数库 -->
<%@ taglib uri="/myElFn" prefix="myFn" %>
<!-- 使用sun提供的el函数库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>el函数的案例演示</title>
    
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
    <%
      Date now = new Date();
      pageContext.setAttribute("now", now);
     %>
    ${myFn:dataToString(now)}
    <hr>
    ${fn:length("dddddddd") }
  </body>
</html>
