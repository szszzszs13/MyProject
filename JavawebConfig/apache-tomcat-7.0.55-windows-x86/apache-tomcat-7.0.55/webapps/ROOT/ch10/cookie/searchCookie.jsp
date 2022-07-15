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
		<title>展示保存在cookie 中的登录信息</title>
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
			<h3>
				cookie 中的登录ID:<%=loginID%>,cookie 中的登录密码:<%=loginPass%>
			</h3>
		</center>
		<br>
	</body>
</html>