<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
	<title>el表达式的逻辑运算符</title>
  </head>
  <body>
	 ${(11>2)&&(34>25) } true<br>
	 ${(11>2) and (34>25)  } true<br>
	 ${(11>2) || (34<25) }  true<br>
	 ${(11>2) or (34<25) } true<br>
	 ${!(11>2) } false<br>
	 ${not(11>2)} false<br>
  </body>
</html>
