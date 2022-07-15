<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>useBean使用示例</title>
</head>
<body>
	<!--查找或创建book1对象-->
	<jsp:useBean id="book1" class="com.inspur.ch5.Book">
	</jsp:useBean>
	<!--查找或创建book2对象-->
	<jsp:useBean id="book2" class="com.inspur.ch5.Book" scope="session">
	</jsp:useBean>
	<%
		//打印书籍信息
	    out.print("book1 ISBN:"+book1.getIsbn()+" 书名："+book1.getBookName());
		out.print("<br>");
	    out.print("book2 ISBN:"+book2.getIsbn()+" 书名："+book2.getBookName());
	%>
</body>
</html>
