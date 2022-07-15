package com.inspur.ch9;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * servlet实现方法：利用serlvet来开发动态页面
 * @author dell
 *
 */
public class ServletDemoPage extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//设定响应类型
		resp.setContentType("text/html; charset=gbk");
		//通过打印流来向客户端相应html信息。
		PrintWriter out = resp.getWriter();
		out.print("<html>");
		out.print("<head><title>servlet开发动态页面的案例演示</title><meta http-equiv=\"charset\" content=\"gbk\"></head>");
		out.print("<body><h1>servlet开发动态页面案例</h1>");
		Date now = new Date();
		String nowDateString = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(now);
		out.print(nowDateString);
		out.print("</body>");
		out.print("</html>");
	}
   
}
