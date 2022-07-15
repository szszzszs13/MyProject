<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>getProperty应用实例</title>
</head>
<body>
	<!--查找或创建book1对象-->
	<jsp:useBean id="book1" class="com.inspur.ch5.Book">
	</jsp:useBean>
	<!--查找或创建book2对象-->
	<jsp:useBean id="book2" class="com.inspur.ch5.Book" scope="session">
	</jsp:useBean>
	<%
	   //使用get/set方法为JavaBean对象属性赋值
		book1.setIsbn("9787111888994");
		book1.setBookName("Java语言");
		book2.setIsbn("9787111888995");
		book2.setBookName("J2EE框架技术");
	%>
	<%-- 获取并显示书籍属性信息 --%>
	book1 ISBN:<jsp:getProperty property="isbn" name="book1"/>
	      书名：<jsp:getProperty property="bookName" name="book1"/><br>
	book2 ISBN:<jsp:getProperty property="isbn" name="book2"/>
	      书名：<jsp:getProperty property="bookName" name="book2"/>
</body>
</html>
