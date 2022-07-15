package com.inspur.ch9;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * ???????
 * @author dell
 *
 */
public class Login extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=gbk");
		PrintWriter out = resp.getWriter();

		out.print("<html>");
		out.print("<head><title>??????????</title></head>");
		out.println("<body><form action='/loginControl'>???????<input type='text' name='userName'" +
				"/><br>????<input type='password' name='password'/>" +
				"<input type='submit' value='???'/></form></body>");
		out.print("</html>");
	}

}
