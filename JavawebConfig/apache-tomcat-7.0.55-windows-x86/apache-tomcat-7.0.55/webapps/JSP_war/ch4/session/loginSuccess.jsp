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
		<title>登录跳转页面</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>

	<body bgcolor="pink">
		<%
			String username = (String) session.getAttribute("username");
			String password = (String) session.getAttribute("password");
			session.setMaxInactiveInterval(5);//设置会话有效期5秒
			//session.invalidate();
		%>
		用户登录成功!
		<br>
		您的用户名是:<%=username%>
		您的密码是:<%=password%>
	</body>
</html>
