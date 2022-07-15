package com.inspur.ch9;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 主界面（欢迎界面）
 * @author dell
 *
 */
public class Welcome extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=gbk");
		PrintWriter out = resp.getWriter();
		out.print("欢迎进入我们主界面....");
	}

	

}
