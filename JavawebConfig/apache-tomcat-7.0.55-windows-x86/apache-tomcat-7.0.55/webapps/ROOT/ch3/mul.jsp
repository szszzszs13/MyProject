<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="">
    
    <title>My JSP 'mul.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <!-- 获取两个操作数，然后做乘法 -->
    <%
      out.println("mul.jsp=="+request+"<br>");
      String num1 = request.getParameter("num1");
      String num2 = request.getParameter("num2");
      
      int numInt1 = Integer.parseInt(num1);
      int numInt2 = Integer.parseInt(num2);
      
      out.print("乘法结果："+(numInt1*numInt2));
     %>
  </body>
</html>
