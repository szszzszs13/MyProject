<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'computerDemo.jsp' starting page</title>
    
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
   <form action="ch2/computerControl.jsp">
    <h1>计算器</h1>
    选择运算符:除法：<input type="radio" name="oper" value="/"/>
    乘法:<input type="radio" name="oper" value="*">
    <hr>
    第一个操作数:<input type="text" name="num1"/><br>
    第二个操作数：<input type="text" name="num2"/>
    <hr>
    <input type="submit" value="计算"/>
    </form>
  </body>
</html>
