<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<html>
  <head>    
    <title>My JSP 'forwardDemo01.jsp' starting page</title>
    
	
  </head>
  
  <body>
  <%
  	System.out.println("这段代码会执行");
  %>
    <jsp:forward page="forwardDemo02.jsp"></jsp:forward>
    <%
    System.out.println("这段代码不会执行");
    %>
  </body>
</html>
