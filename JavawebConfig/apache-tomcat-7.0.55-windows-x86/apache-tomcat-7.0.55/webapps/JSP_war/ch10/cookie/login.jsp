<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>cookie 测试</title>
	</head>
	<body>
		<center>
			<%
				String loginID = "";
				String loginPass = "";
				Cookie cookies[] = request.getCookies();
				if (cookies != null && cookies.length > 0) {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("loginID")) {
							loginID = cookie.getValue();
						}
						if (cookie.getName().equals("loginPass")) {
							loginPass = cookie.getValue();
						}
					}
				}
			%>
			<form action="ch10\cookie\cookieDemo01.jsp" method="post">
				<table>
					<tr>
						<td>
							用户登录 ID:
						</td>
						<td>
							<input type="text" name="loginID" value="<%=loginID%>">
						</td>
					</tr>
					<tr>
						<td>
							用户登录密码:
						</td>
						<td>
							<input type="password" name="loginPass" value="<%=loginPass%>">
						</td>
					</tr>
					<tr>
						<td>
							记忆十天
						</td>
						<td>
							<input type="checkbox" checked name="flag">
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" name="submit" value="登录">
						</td>
						<td>
							<input type="reset" name="reset" value="取消">
						</td>
					</tr>
				</table>
			</form>
		</center>
		<br>
	</body>
</html>