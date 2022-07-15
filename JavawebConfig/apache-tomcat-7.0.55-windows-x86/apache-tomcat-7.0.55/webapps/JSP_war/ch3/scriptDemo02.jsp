<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'scriptDemo02.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <%!
      int numTimes = 3;
      public String sayHello(String name){
 	    return "Hello, " + name + "!";
      }
     %>
  </head>
  
  <body>
    <!-- 是jsp scriptlet 脚本程序段的案例演示 -->
    <%
     /* Date now = new Date();
     out.print(now.toLocaleString()); */
     /* String name = "tony";
     out.print(name);
     System.out.println(name); */
    for(int i=1;i<10;i++) {
        for(int j=1;j<=i;j++) {
           out.println(j);
        }
     out.println("<br/>");
    }
     %>
  </body>
</html>
