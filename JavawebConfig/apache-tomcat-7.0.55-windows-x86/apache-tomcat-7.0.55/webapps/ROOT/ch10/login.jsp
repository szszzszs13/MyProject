<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>登陆界面</title>
	</head>

	<body>
		<!-- 显示错误信息 -->
		<%
			Object error = request.getAttribute("loginError");
			if (error != null) {
		%>
		<font color="red"><%=error.toString()%></font>
		<%
			}
		%>
		<form action="<%=basePath%>ch10/loginchk.jsp" method="post">
			用户名：
			<input type="text" name="username" >
			<br>
			密&nbsp;&nbsp;&nbsp;&nbsp;码：
			<input type="password" name="password" > 
			<br>
			<input type="submit" value="登陆">
			<input type="reset" value="取消">
		</form>
	</body>
</html>
