<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'computerControl.jsp' starting page</title>
    
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
    <!-- 计算的处理
     1、获取从computerDemo.jsp中客户端输入的信息
     2、根据不同的操作，进行页面的包含，如果选择的是除法，则包含除法页面（div.jsp），否则包含乘法页面(mul.jsp)
     -->
     <%
       out.println("conputerContrl.jsp=="+request+"<br>");
      //1、获取从客户端传递过来的信息
       String oper = request.getParameter("oper");
       //2.根据不同的操作，进行页面的包含，
       if("/".equals(oper)){//除法
       %>
        <jsp:include page="div.jsp">
          <jsp:param value="zhangsan" name="name"/>
        </jsp:include>
       <%
       }else{//乘法
       %>
        <%@ include file="mul.jsp" %>
       <%
       }
      %>
  </body>
</html>
