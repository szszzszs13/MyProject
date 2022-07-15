<%@ page language="java" import="java.util.*,com.inspur.ch10.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<base href="<%=basePath%>">

		<title>登陆验证</title>
	</head>

	<body>
		<%
		    //取得登录用户名和密码
			String username = new String(request.getParameter("username")
					.getBytes("ISO-8859-1"), "UTF-8");
			String password = new String(request.getParameter("password")
					.getBytes("ISO-8859-1"), "UTF-8");
			if ("123".equals(username) && "123".equals(password)) {
				response.sendRedirect("welcome.jsp");
			} else {//校验未通过
				//保存错误信息
				request.setAttribute("loginError", "用戶名或密码错误");
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			}
		%>
	</body>
</html>
