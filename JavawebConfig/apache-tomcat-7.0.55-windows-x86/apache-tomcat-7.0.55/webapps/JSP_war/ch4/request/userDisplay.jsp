<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>注册成功页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body bgcolor="CCCCFF" >
    <h2>注册成功啦，恭喜！！！</h2>
	<%
      request.setCharacterEncoding("utf-8");
      //获取请求参数信息
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String sex = request.getParameter("sex");
      String remark = request.getParameter("remark");
      String education = request.getParameter("education");
      String[] hobbies = request.getParameterValues("hobbies");
     %>
     用户名：<%=username %><br>
     密码：<%=password%><br>
     性别： <%=sex%><br>
  <% out.println("爱好：");
      for(int i=0;i<hobbies.length;i++){
        out.println(hobbies[i]+"&nbsp;");
      } 
      
  %><br>
    学历：<%=education%><br>
    备注说明: <%=remark%><br>
</body>
</html>
