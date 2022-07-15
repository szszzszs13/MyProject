package com.inspur.ch9;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 登陆校验
 * @author dell
 *
 */
public class LoginControl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1.接受从登陆界面发送过来的用户名信息和密码信息。
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		//2.校验用户名和密码是否满足条件，假设当用户名和密码分别是张三和123时，认为校验通过，否则校验不合法。
		if("zhangsan".equals(userName)&&"123".equals(password)){//合法
			//getRequestDispatcher参数可以相对路径和绝对路径，“/”代表web项目的根路径。
			//即：http://localhost:8080/jspdemopro
			req.getRequestDispatcher("/welcome").forward(req, resp);
		}else{//不合法
			req.getRequestDispatcher("/login").forward(req, resp);
		}
		
	}
   
}
 