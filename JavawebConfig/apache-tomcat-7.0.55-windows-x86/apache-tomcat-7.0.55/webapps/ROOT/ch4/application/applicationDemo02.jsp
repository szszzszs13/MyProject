<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>application对象方法获取Web配置信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body bgcolor="#999ff">
    <%  
    //从配置参数中获取驱动  
    String driver = application.getInitParameter("driver");  
    //从配置参数中获取数据库URL  
    String url = application.getInitParameter("url");  
    //从配置参数中获取用户名  
    String user = application.getInitParameter("user");  
    //从配置参数中获取密码  
    String pass = application.getInitParameter("pass");  
    //注册驱动  
    Class.forName(driver);  
    //获取数据库连接  
    Connection conn = DriverManager.getConnection(url,user,pass);  
    //创建Statement对象  
    Statement stmt = conn.createStatement();  
    //执行查询  
    ResultSet rs = stmt.executeQuery("Select * from student");  
%>  
<h2>查询学生信息</h2>
<table bgcolor="#99CCFF" border="1" >  
     <tr>  
        <th>姓名</th>  
        <th>年龄</th>  
        <th>家庭住址</th>  
    </tr> 
    <%  
        //遍历结果集  
        while (rs.next()) {  
    %>  
    <tr>  
        <td><%=rs.getString(1)%></td>  
        <td><%=rs.getInt(2)%></td>  
        <td><%=rs.getString(3)%></td>  
    </tr>  
    <%  
        }  
    %>  
</table>  
</body>
</html>
