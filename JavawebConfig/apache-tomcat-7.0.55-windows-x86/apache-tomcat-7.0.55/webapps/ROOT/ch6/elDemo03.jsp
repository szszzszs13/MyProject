<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>el表达式的关系运算符的实例</title>
  </head>
  <body>
	 ${100>200 }  false<br>
	 ${100 gt 200 }  false<br>
	 ${100>=200 }  false<br>
	 ${100 ge 200 } false<br>
	 ${100<200 } true<br>
	 ${100 lt 200 } true<br>
	 ${100<=200 } true<br>
	 ${100 le 200 } true<br>
	 ${100==200 } false<br>
	 ${100 eq 200 } false<br>
	 ${100!=200 } true<br>
	 ${100 ne 200 } true<br>
	 
	 ${eee > asss} false <br>
	 ${eee < asss} false<br>
	 ${'eee' > 'asss'} true<br>
	 ${eee==asss} true<br>
  </body>
</html>
