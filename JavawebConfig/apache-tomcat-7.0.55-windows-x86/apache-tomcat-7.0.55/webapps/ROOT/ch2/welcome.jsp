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
		<title>欢迎页面</title>
		<meta http-equiv="pragma" content="no-cache">
	</head>
	<body>
		<%!String getHello(String name) {
		     return "Hello " + name + "!";
	      }%>
		<h1>
			你好，这就是一个JSP页面！<br/>
			<%=getHello("Jack")%>
		</h1>

	</body>
</html>
