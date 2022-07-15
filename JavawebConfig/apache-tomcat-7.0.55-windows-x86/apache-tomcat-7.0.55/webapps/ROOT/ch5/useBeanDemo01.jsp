<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>useBean使用示例</title>
</head>
<body>
	<!--创建一个Book类型的对象book1，默认放到page范围中-->
	<jsp:useBean id="book1" class="com.inspur.ch5.Book">
	</jsp:useBean>
	<!--创建一个Book类型的对象book2，放到session范围中-->
	<jsp:useBean id="book2" class="com.inspur.ch5.Book" scope="session">
	</jsp:useBean>
	<%
	   //使用get/set方法为JavaBean对象属性赋值
		book1.setIsbn("9787111888994");
		book1.setBookName("Java语言");
		book2.setIsbn("9787111888995");
		book2.setBookName("J2EE框架技术");
		//打印书籍信息
	    out.print("book1 ISBN:"+book1.getIsbn()+" 书名："+book1.getBookName());
		out.print("<br>");
	    out.print("book2 ISBN:"+book2.getIsbn()+" 书名："+book2.getBookName());
	%>
</body>
</html>
