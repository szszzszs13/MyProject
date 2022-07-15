<%@ page language="java" import="java.util.*,com.inspur.ch12.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>控制登陆的jsp</title>
    
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
    <!-- 创建数据对象，保存用户登录信息；调用方法进行验证；验证通过，转发至welcome.jsp，否则请求重新登录 -->
      <!-- 创建bean对象 -->
     <jsp:useBean id="user" class="com.inspur.ch12.UserBean"></jsp:useBean>
     <!-- 利用请求参数给user对象属性进行赋值 -->
     <jsp:setProperty property="*" name="user"/>
     <jsp:useBean id="userCheckBean" class="com.inspur.ch12.UserCheckBean"></jsp:useBean>
     <%
       boolean flag = userCheckBean.checkUser(user);
       if(flag){//登陆校验通过
         request.getRequestDispatcher("welcome.jsp").forward(request,response);
       }else{//校验未通过
         request.getRequestDispatcher("error.jsp").forward(request,response);
       }
      %>
  </body>
</html>
