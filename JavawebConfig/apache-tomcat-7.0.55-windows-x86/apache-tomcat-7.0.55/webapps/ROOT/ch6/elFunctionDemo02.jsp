<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <!-- 使用 sun 提供的 EL 函数库 --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>   
  <head>     
   <title>EL 函数的案例演示</title>   
  </head>   
  <body>     
   ${fn:length("dddddddd") }   
  </body> 
</html> 
 
