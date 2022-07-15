<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>My JSP 'welcome.jsp' starting page</title>
  </head>
  <body>
     欢迎登陆本系统！！！ <br>
     当前用户:<%=request.getParameter("userName") %>
  </body>
</html>
