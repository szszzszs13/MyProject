<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>简单的计算器界面</title>
    
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
	计算的结果是:${calculator.num1 }${calculator.operator}${calculator.num2}=${calculator.result}
	<hr>
	<form action="<%=basePath%>calculatorServlet">
		<h1>简单的计算器</h1>
		第一个参数:<input type="text" name="num1"><br> 
		运算符:   <select name="operator">
					<option value="+">+</option>
					<option value="-">-</option>
					<option value="*">*</option>
					<option value="/">/</option>
			    </select><br>
		 第二个参数:<input type="text" name="num2"><br> 
		 	    <input type="submit" value="计算" />
	</form>
</body>
</html>
