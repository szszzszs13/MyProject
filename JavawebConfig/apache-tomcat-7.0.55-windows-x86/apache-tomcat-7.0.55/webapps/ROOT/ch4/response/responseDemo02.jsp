<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>response方法实现重定向</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <%
      /*
                      页面的跳转（forward）和页面的重定向（sendRedirect）二者的区别？
       1、forward方式：
         1.1在服务器内部进行调整
         1.2浏览器地址栏中地址不做改变
         1.3forward后面的代码不会执行。两个页面是一个request请求。
       2、rendRedirect方式：
         2.1 在浏览器端进行重定向。
         2.2 跳转时机，当页面代码执行完毕，把响应发送给客户端之后，然后客户端再根据重新指向的url地址
             进行发送请求。两个request请求对象。
         2.3浏览器地址栏中的地址是改变的。
      */
      response.sendRedirect("responseDemo02_01.jsp");
     %>
  </body>
</html>
