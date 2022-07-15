<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>    
    <title>包含动态文件</title>
  </head>
  
  <body>
         使用jsp：include动态元素包含动态文件<br>  
    <jsp:include page="includeDemo03_01.jsp">
    	<jsp:param value="zhangsan" name="name"/>
    </jsp:include>  
  </body>
</html>
