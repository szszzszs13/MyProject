<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>request对象获取HTTP协议信息方法案例</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <%
      out.println("协议类型及版本号："+request.getProtocol()+"<br>");
      out.println("当前链接使用的协议："+request.getScheme()+"<br>");
      out.println("服务器:"+request.getServerName()+"<br>");
      out.println("端口号："+request.getServerPort() +"<br>");
      out.println("请求方式："+request.getMethod()+"<br>");
      out.println("客户端IP地址:"+request.getRemoteAddr()+"<br>");
      out.println("客户端主机:"+request.getRemoteHost() +"<br>");
      out.println("URL的部分值:"+request.getRequestURI()+"<br>");
      out.println("URL:"+request.getRequestURL()+"<br>");
      out.println("Web服务目录部分值："+request.getServletPath()+"<br>");
      out.println("实际目录："+request.getRealPath("/ch4/reqest/requestDemo01.jsp")+"<br>");
      out.println("<hr>");
     %>
  </body>
</html>
