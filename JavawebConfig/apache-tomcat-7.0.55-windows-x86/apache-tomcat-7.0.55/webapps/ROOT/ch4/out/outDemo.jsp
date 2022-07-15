<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>out对象方法案例</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
     <%
      out.print("我是学习小能手，");
      out.println("爱好学习编程技术！");
      out.print("<br>");
      out.flush();  
      //out.clear();//这里会抛出异常，因为上面有flush  
      out.clearBuffer();//这里不会抛出异常  
      out.write("我是write()方法输出内容");
      out.print("<br>");
     %>
      缓冲区大小：<%=out.getBufferSize() %>byte<br>  
     缓冲区剩余大小：<%=out.getRemaining() %>byte<br>  
     是否自动清空缓冲区：<%=out.isAutoFlush() %><br>  
  </body>
</html>
