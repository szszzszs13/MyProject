<%@ page language="java" import="java.util.*,com.inspur.ch6.Person" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>foreach案例</title>
    
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
    <!-- 1、利用foreach来控制迭代次数 -->
    <!-- begin\end\step支持el表达式 -->
    <%
       int i=1;
       pageContext.setAttribute("i", i);
     %>
     <!-- 等价于下面的代码 -->
     <c:set var="i" value="1" scope="page"></c:set>
    <!-- <c:forEach begin="0" end="3" step="1">
      文本信息<br>
    </c:forEach> -->
    <c:forEach begin="${i }" end="3" step="1">
      文本信息<br>
    </c:forEach>
    <!-- 2、利用foreach来遍历输出集合信息 -->
    <%
     String names[] = new String[3];
     names[0]="zhangsan";
     names[1]="lisi";
     names[2]="wangwu";
     pageContext.setAttribute("names", names);
     %>
     <c:forEach var="name" items="${names}">
       <c:out value="${name}"></c:out>
     </c:forEach>
     <!-- 遍历输出人的信息 -->
     <%
      ArrayList<Person> personList = new ArrayList<Person>();
      Person p1 = new Person();
      p1.setName("zhangsan1");
      p1.setAge(20);
      p1.setSex("男");
      Person p2 = new Person();
      p2.setName("zhangsan2");
      p2.setAge(21);
      p2.setSex("男");
      Person p3 = new Person();
      p3.setName("zhangsan3");
      p3.setAge(22);
      p3.setSex("男");
      personList.add(p1);
      personList.add(p2);
      personList.add(p3);
      %>
      <c:set var="personList" value="<%=personList%>" scope="session"></c:set>
      <table border="1px" width="100%">
      <c:forEach var="p" items="${personList}" varStatus="s">
        <tr>
          <td><c:out value="${s.index}"></c:out></td>
            <td><c:out value="${s.count}"></c:out></td>
            <td><c:out value="${s.first}"> </c:out></td>
            <td><c:out value="${s.last}"></c:out></td>
          
          <td><c:out value="${p.name}"></c:out></td>
          <td><c:out value="${p.age}"></c:out></td>
          <td><c:out value="${p.sex}"></c:out></td>
        </tr>
      </c:forEach>
      </table> 
      <!-- 把上面的表格信息进行美化，完成隔行变色的效果 -->
      <table border="1px" width="100%">
      <c:forEach var="p" items="${personList}" varStatus="s">
        <%-- <tr bgcolor="${s.count%2==0?red:yellow}"> --%>
        <c:if test="${s.count%2==0 }">
         <tr bgcolor="red">
        </c:if>
        <c:if test="${s.count%2!=0}">
         <tr bgcolor="yellow">
        </c:if>
          <td><c:out value="${s.index}"></c:out></td>
          <td><c:out value="${p.name}"></c:out></td>
          <td><c:out value="${p.age}"></c:out></td>
          <td><c:out value="${p.sex}"></c:out></td>
        </tr>
      </c:forEach>
      </table>
  </body>
</html>
