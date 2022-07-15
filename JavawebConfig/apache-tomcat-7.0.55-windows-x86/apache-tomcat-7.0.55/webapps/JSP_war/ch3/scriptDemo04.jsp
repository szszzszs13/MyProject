<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'scriptDemo04.jsp' starting page</title>
    
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
 <%!
   //声明一个常量
   final String SEPARATOR =".";
   //声明一个方法
   public String covertAmountWithSeparator(String money){
     int index = money.indexOf(SEPARATOR);
     String str =money;
     if(index==-1)
      str = money+".00";
     return str;
    }
%>
<%
  String m1 = covertAmountWithSeparator("12");
  String m2 = covertAmountWithSeparator("34.00");
 %>
 
 <%=m1%><br>
 <%=m2 %>
 <%=SEPARATOR%>

  </body>
</html>
