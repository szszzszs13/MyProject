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
    
    <title>if标签案例</title>
    
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
    <c:if test="false" var="resultInfor" scope="page">
      显示或者执行本体信息（本体信息既可以是文本，也可以jsp脚本元素、也可以html代码等）
    </c:if>
    ddddd${pageScope.resultInfor}
    <hr>
    <!-- 从请求中获取成绩信息，成绩如果为90以上，则在页面上显示优秀，
           成绩在80-90之间显示良好，60-80之间显示及格，其他是显示不及格 -->
     <c:if test="${param.score>=90}">
                  优秀
     </c:if>
     <c:if test="${param.score>=80&&param.score<90}">
                  良好
     </c:if>
      <c:if test="${param.score>=60&&param.score<80}">
                  及格
     </c:if>   
      <c:if test="${param.score<60}">
                  不及格
     </c:if>
  </body>
</html>
