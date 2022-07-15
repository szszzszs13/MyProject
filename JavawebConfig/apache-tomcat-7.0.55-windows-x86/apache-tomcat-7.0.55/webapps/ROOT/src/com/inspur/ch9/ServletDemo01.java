package com.inspur.ch9;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * servlet案例：
 * 1、serlvet的概念：
 *   特殊的java类。
 *   特殊点为：
 *    i：完成动态网页的功能和处理客户端请求的功能（service方法中实现）
 *    ii:需要满足servlet相关的规范。需要继承或者实现servlet规范相关的接口或者类。
 *       HttpServlet类。
 *    iii:需要运行在servlet容器中。比如说tomcat容器。   
 * @author dell
 *
 */
public class ServletDemo01 extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1、处理客户端的请求
		String userName = req.getParameter("userName");
		System.out.println(userName);
		
	}
  
}
