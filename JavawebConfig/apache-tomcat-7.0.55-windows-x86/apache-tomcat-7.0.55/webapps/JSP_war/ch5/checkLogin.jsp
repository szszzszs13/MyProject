<%@ page language="java" import="java.util.*,com.inspur.ch5.User" pageEncoding="UTF-8"%>

<html>
  <head>
    <title>My JSP 'loginCheck.jsp' starting page</title>
  </head>
  
  <body>
   <%
   /*获取界面提交的用户名和密码，封装到user对象。
               此处的User类使用本章5.1.2中创建的JavaBean类User。
    */
     String userName=request.getParameter("userName");
     String pass=request.getParameter("password");
     User user=new User(userName,pass);
     //进行用户名和密码的校验 
     boolean flag=user.checkUser();
     if(flag){
    	 %>
    	 <%--正确登陆，跳转到欢迎页面，将用户名传递过去 --%>
    	 <jsp:forward page="welcome.jsp">
    	 	<jsp:param value="<%=user.getUsername() %>" name="userName"/>
    	 </jsp:forward>
    	 <%
     }else{
    	 %>
    	 <jsp:forward page="login.jsp">
    	    <jsp:param value="login error!!!" name="errMsg"/>
    	 </jsp:forward>
    	 <%
     } 
    %>
   
  </body>
</html>
