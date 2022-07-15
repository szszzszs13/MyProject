<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>setProperty应用实例</title>
</head>
<body>
	<!--查找或创建book1对象-->
	<jsp:useBean id="book1" class="com.inspur.ch5.Book">
	</jsp:useBean>
	<!--查找或创建book2对象-->
	<jsp:useBean id="book2" class="com.inspur.ch5.Book" scope="session">
	</jsp:useBean>
	<%--使用<jsp:setProperty>动作给属性赋值 --%>
	<jsp:setProperty property="isbn" name="book1" value="9787111888994"/>
	<jsp:setProperty property="bookName" name="book1" value="Java语言"/>
	<jsp:setProperty property="isbn" name="book2" value="9787111888995"/>
	<jsp:setProperty property="bookName" name="book2" value="J2EE框架技术"/>
	<%-- 获取并显示书籍属性信息 --%>
	book1 ISBN:<jsp:getProperty property="isbn" name="book1"/>
	      书名：<jsp:getProperty property="bookName" name="book1"/><br>
	book2 ISBN:<jsp:getProperty property="isbn" name="book2"/>
	      书名：<jsp:getProperty property="bookName" name="book2"/>
</body>
</html>
