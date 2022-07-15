<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'displayBook.jsp' starting page</title>
  </head>
  
  <body>
    <!-- 利用useBean动作实例化对象book -->
    <jsp:useBean id="book" class="com.inspur.ch5.Book" scope="session"></jsp:useBean>
    
    <%--表单元素的值自动给同名的book 属性赋值 --%>
    <jsp:setProperty property="*" name="book"/>

    isbn: <jsp:getProperty property="isbn" name="book"/><br>
    书名：<jsp:getProperty property="bookName" name="book"/><br>
    作者：<jsp:getProperty property="bookAuthor" name="book"/><br>
    是否售出：<jsp:getProperty property="saleStatus" name="book"/><br>
  </body>
</html>
