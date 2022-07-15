<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>My JSP 'login.jsp' starting page</title>
  </head>
  <body>
  <%
    //获取param动作传递的登陆错误信息，显示到页面上
  	String errMsg=request.getParameter("errMsg");
    if(errMsg!=null)
    {
    	out.print("<font color=red>"+errMsg+"</font>");
    }
  %>
    <form action="checkLogin.jsp" method="post">
          <table>
            <tr>
              <td>用户名:</td>
              <td> <input type="text" name="userName" > </td>
           </tr>
           <tr>
              <td>密&nbsp;&nbsp;码:</td>
              <td> <input type="password" name="password"> </td>
           </tr>
           <tr align="center">
              <td colspan="2">
                  <input type="submit" value="登 录 "> <input type="reset" value="取  消 ">
              </td>
           </tr>
       </table>
    </form>
  </body>
</html>
