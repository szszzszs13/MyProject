<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>pageContext对象方法运用</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
   <%
     //可以访问其他的隐式对象
     pageContext.getRequest();//获取request
     pageContext.getResponse();//获取response
     pageContext.getSession();//获取session
     pageContext.getServletContext();//获取application
     pageContext.getOut();//获取out
     //可以在当前jsp页面范围中存放信息
     pageContext.setAttribute("username", "Merry");
     //和request进行对比
     request.setAttribute("username","Jack");
    %>
    <%=pageContext.getAttribute("username") %>
    <%
    //演示把请求跳转到另一个页面，再另一个页面是否还能获取page范围中的信息。
      request.getRequestDispatcher("pageContextDemo01_01.jsp").forward(request, response);
     %>
  </body>
</html>
