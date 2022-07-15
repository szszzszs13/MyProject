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
		<%
			String flag[] = request.getParameterValues("flag");
			String loginID = request.getParameter("loginID");
			String loginPass = request.getParameter("loginPass");
			//选中记忆十天
			if (flag != null && flag.length > 0) {
				//建立保存登录ID 或者密码的cookie
				Cookie cookie1 = new Cookie("loginID", loginID);
				Cookie cookie2 = new Cookie("loginPass", loginPass);
				cookie1.setMaxAge(10 * 24 * 60 * 60);
				cookie2.setMaxAge(10 * 24 * 60 * 60);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				//取消记忆十天
			} else {
				Cookie cookies[] = request.getCookies();
				if (cookies != null && cookies.length > 0) {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("loginID")) {
							cookie.setMaxAge(0);//cookie 失效
						}
						if (cookie.getName().equals("loginPass")) {
							cookie.setMaxAge(0);//cookie 失效
						}
						response.addCookie(cookie);
					}
				}
			}
		%>
		<br>
		<h3>
			<a href="ch10\cookie\searchCookie.jsp">查看cookie 中登录ID 和登录密码</a>
		</h3>
	</body>
</html>