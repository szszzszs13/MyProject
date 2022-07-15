<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'sessionDemo01.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
   <%//向session中存放信息
     session.setAttribute("username", "zhangsan");
     //设定session的存在时间
     session.setMaxInactiveInterval(5);
     //注销session
     //session.invalidate();
     //向request中存放信息
     request.setAttribute("username", "requestzhangsan");
    %>
    <%=session.getAttribute("username") %>
    <%=request.getAttribute("username") %>
  </body>
</html>
