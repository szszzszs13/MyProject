<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>el表达式算术运算符的实例</title>
  </head>
  <body>
	<!-- 下面这两行代码是在客户端显示el表达式，而不是计算el表达式 -->
  \${10+10 }= \${10+10 }<br>
  "$"{10+10 }= "$"{10+10 }<br>
   <%
	 pageContext.setAttribute("a","10");
     pageContext.setAttribute("b","20");// 运算 自动类型转换
     //pageContext.setAttribute("b","20a");// 运算 自动类型转换 时报错
   %>
   <!-- 在EL算术运算中没有字符串运算，运算时将内容转换数字 -->
   \${a+b }=${a+b }<br>
 
  \${10+10 }= ${10+10 }<br>
  \${10-10 }= ${10-10 }<br>
  \${10*10 }= ${10*10 }<br>
  \${10/10 }= ${10/10 }<br>
  \${10 div 10 }= ${10 div 10 }<br>
  \${10%3 }= ${10%3 }<br>
  \${10 mod 3 }= ${10 mod 3 }<br>
  
  \${10/0 }= ${10/0 }<br>
  \${10 div 10 }= ${10 div 0 }<br>
  </body>
</html>
