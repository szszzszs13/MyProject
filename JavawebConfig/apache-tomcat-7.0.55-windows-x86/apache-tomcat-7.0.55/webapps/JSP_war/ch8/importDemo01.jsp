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
    
    <title>import标签案例演示 url和context属性</title>
    
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
    <!-- url属性可以是相对路径和绝对路径 -->
    <h1>当前页面包含百度首页资源信息(绝对路径案例)</h1>
    <%-- <c:import url="http://www.baidu.com"/> --%>
    <h1>相对路径案例</h1>
    <c:import url="aa.txt" charEncoding="gbk"></c:import>
    <!-- "/"开头表示应用的根目录， webroot根目录 。-->
    <c:import url="/bb.txt" charEncoding="gbk"></c:import>
    <!-- context属性 用于在访问其他web应用的文件时，指定根目录
      注意：1、context的值，需要在前面加上符号“/”
      2、需要配置web项目的crossContext属性值为true，注意是区分大小写的。（tomcat server.xml中配置）
    -->
    <c:import url="/index.jsp" context="/jspdemo"></c:import>
  </body>
</html>
