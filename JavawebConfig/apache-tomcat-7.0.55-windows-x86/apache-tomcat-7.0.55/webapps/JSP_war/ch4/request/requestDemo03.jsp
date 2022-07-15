<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>request对象其他方法案例</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <%
      request.setCharacterEncoding("utf-8");//设置字符编码，解决中文乱码问题，无法解决URL传递中文出现的乱码问题。
      request.setAttribute("username", "张三");
      request.setAttribute("password", "123456");
     %>
      用户名:<%=request.getAttribute("username") %><br>
      密码：<%=request.getAttribute("password") %>
  </body>
</html>
