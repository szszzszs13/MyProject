<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'includeDemo03_01.jsp' starting page</title>
  </head>
  
  <body>
            动态包含传参数的案例<br>
    <%
      String name =  request.getParameter("name");
      out.println(name);
     %>
  </body>
</html>
