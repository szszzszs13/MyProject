<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>applicaton对象实现访问统计</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body bgcolor="#9999CC">
     <h2>测试application对象方法，统计页面访问次数</h2>
      <%
        if(application.getAttribute("counter") == null){
            application.setAttribute("counter", "1");
         }else{
            String strnum = "";
            strnum = application.getAttribute("counter").toString();
            int icount = 0;
            icount = Integer.valueOf(strnum).intValue();
            icount++;
            application.setAttribute("counter", Integer.toString(icount)); 
        }
            
    %>
        您是第<%=application.getAttribute("counter") %>位访问者！
  </body>
</html>
