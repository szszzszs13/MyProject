<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>config对象方法运用</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>
	<body bgcolor="#FFFF99">
		<%=config.getServletName()%><br />
		<!-- 输出该JSP中名为name的参数配置信息 -->
		name配置参数的值：<%=config.getInitParameter("name")%><br />
		<!-- 输出该JSP中名为age的参数配置信息 -->
		age配置参数的值：<%=config.getInitParameter("age")%>
	</body>
</html>
