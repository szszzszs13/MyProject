<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 在jsp中禁用el表达式 isELIgnored="true"-->
<%@ page isELIgnored="false" %>
<html>
  <head>
	<title>检查是否是空值的运算符</title>
  </head>
  <h1>Empty 运算符</h1>
<%-- 
  1若key为null时，返回true
  2若key为空String时，返回true
  3若key为空Array时，返回true
  4若key为空Map时，返回true
  5若key为空Collection时，返回true
  6否则，返回false
  
  另外：对象不存在时，返回true
--%>
	<% 
	 String key1=null; 
	 String key2="";
	 String key3=" ";
	 int[] key4= new int[5];
	 int[] key5= null;
	 Map key6=new HashMap();
	 Map key7=null;
	 ArrayList key8=new ArrayList();
	 ArrayList key9=null;
	 pageContext.setAttribute("key1",key1);
	 pageContext.setAttribute("key2",key2);
	 pageContext.setAttribute("key3",key3);
	 pageContext.setAttribute("key4",key4);
	 pageContext.setAttribute("key5",key5);
	 pageContext.setAttribute("key6",key6);
	 pageContext.setAttribute("key7",key7);
	 pageContext.setAttribute("key8",key8);
	 pageContext.setAttribute("key9",key9);
	%>
  <body>
	 ${empty key1} true<br>
	 ${empty key2} true<br>
	 ${empty key3} false<br>
	 ${empty key4} false<br>
	 ${empty key5} true<br>
	 ${empty key6} true <br>
	 ${empty key7} true<br>
	 ${empty key8} true <br>
	 ${empty key9} true<br>
	 
	 ${empty s } 对象不存在返回true <br/>

	 <h1>三元表达式</h1>
	 ${(empty list)?"list集合中没有元素":"list集合不为空" }<br>
	 ${(empty key4)?"key4中没有元素":"key4不为空" }<br>
  </body>
</html>
