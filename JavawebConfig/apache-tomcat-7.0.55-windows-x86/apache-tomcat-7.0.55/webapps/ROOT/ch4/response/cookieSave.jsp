<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>查看是否保存了用户名</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>

  <body>
  	<%request.setCharacterEncoding("UTF-8"); %>
    <%
    	String username=request.getParameter("username");
    	String password=request.getParameter("password");
    	String[] flag=request.getParameterValues("flag");
    	if(flag!=null&&flag.length>0){//选中了记住用户名
    		//1.新建cookie
    		Cookie cookie1=new Cookie("username",username);
    		Cookie cookie2=new Cookie("password",password);
    		//2.设置实效(1天)
    		cookie1.setMaxAge(1*24*60*60);
    		cookie2.setMaxAge(1*24*60*60);
    		//3.把cookie对象存放在response中
    		response.addCookie(cookie1);
    		response.addCookie(cookie2);
    	}else{//没有选择记住用户名
    		Cookie[] cookies=request.getCookies();
    		if(cookies!=null&&cookies.length>0){
    			for(Cookie cookie:cookies){
    				if(cookie.getName().equals("username")){
    					cookie.setMaxAge(0);
    				}
    				if(cookie.getName().equals("password")){
    					cookie.setMaxAge(0);
    				}
    			response.addCookie(cookie);
    			}
    		}
    	}

     %>
     <a href="ch4/response/cookieQuery.jsp">查看是否保存了用户名信息</a>
  </body>
</html>
