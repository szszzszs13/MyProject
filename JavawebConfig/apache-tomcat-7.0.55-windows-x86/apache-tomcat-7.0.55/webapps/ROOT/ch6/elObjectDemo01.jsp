<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>el隐式对象的案例演示</title>
    
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
    <!-- 1、pageContext 代表的jsp 中pageContext对象 -->
    ${pageContext}<br>
    <%=pageContext %>
    <hr>
    <!-- 2、pageScope、requestScope、sessionScope、applicationScope -->
    <%
      pageContext.setAttribute("pageName", "zhangsanPage");
     %>
     ${pageScope}<br>
     ${pageScope.pageName}
     <hr>
     <%
       request.setAttribute("requestName", "zhangsanRequest");
      %>
      ${requestScope }<br>
      ${requestScope["requestName"]}
       <hr>
     <%
       session.setAttribute("sessionName", "zhangsanSession");
      %>
      ${sessionScope }<br>
      ${sessionScope["sessionName"]}
      <hr>
      <!-- 3、param  paramValues
        共同点：封装的是请求参数信息 map类型
        区别：paramValues 某一个请求参数信息，string[] 而param是String
      -->
      ${param }<br>
      ${param.username }&nbsp;${param.password }
      
      <br>
      ${paramValues}<br>
      ${paramValues.username[0]}&nbsp;${paramValues.password[0]}<br>
      ${paramValues.like[0] }&nbsp;${paramValues.like[1] }
      
      <!-- 4、header headerValues -->
      <hr>
      ${header }<br>
      ${header["accept-language"]}<br>
      ${headerValues }<br>
      ${headerValues["accept-language"][0] }
      <hr>
      <!-- 5、initParam web应用程序初始化参数的信息 -->
      ${initParam }<br>
      ${initParam.username }
      <hr>
      <!-- cookie -->
      ${cookie }
      <br>
      ${cookie.JSESSIONID }
      <hr>
      <!-- 获取request session对象等 -->
      ${pageContext.request }<br>
      <%=request %>
      ${pageContext.session }<br>
      <%=session %>
    <hr>
  </body>
</html>
