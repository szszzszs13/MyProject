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
    
    <title>choose when otherwise标签案例</title>
    
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
    <!-- <c:choose>
      <c:when test="false">
        当第一个when标签中test属性值为true，则执行本体内容。否则，判断下一个when的条件
      </c:when>
      <c:when test="false">
      当第二 个when标签中test属性值为true，则执行本体内容。否则，判断下一个when的条件
      </c:when>
      <c:otherwise>
       当所有的when均不满足条件时，执行。
      </c:otherwise>
    </c:choose> -->
     <!-- 从请求中获取成绩信息，成绩如果为90以上，则在页面上显示优秀，
           成绩在80-90之间显示良好，60-80之间显示及格，其他是显示不及格 -->
    <c:choose>
      <c:when test="${param.score>=90}">
                   优秀
      </c:when>
      <c:when test="${param.score>=80&&param.score<90}">
                良好
      </c:when>
      <c:when test="${param.score>=60&&param.score<80}">
                及格
      </c:when>
      <c:otherwise>
       不及格
      </c:otherwise>
    </c:choose>
  </body>
</html>
