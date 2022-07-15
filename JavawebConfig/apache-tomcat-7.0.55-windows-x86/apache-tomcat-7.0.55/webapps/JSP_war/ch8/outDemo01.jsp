<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'outDemo01.jsp' starting page</title>
    
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
    <c:out value="Hello JSP 2.0 !! " /> <br/>
    <!-- 和下面的代码等价 -->
    <%
      out.print("hello jsp2.0!!!");
     %>
     <!-- 用jstl标签可以尽可能少的在jsp中暴露java逻辑代码。 -->
    <c:out value="${ 3 + 5 }" /> <br/>
    <!-- 和下面的代码等价 -->
    ${3+5 }
    <!-- out标签可以完成一定结果处理，当value值为空的时候，可以重新设定一个值default。而el表达式没有这个功能。 -->
    <c:out value="${ param.data }" default="No Data" /> <br/>
    <c:out value="<B>有特殊字符</B>" /> <br/>
    <c:out value="<B>有特殊字符</B>" escapeXml="false" /> 

  </body>
</html>
