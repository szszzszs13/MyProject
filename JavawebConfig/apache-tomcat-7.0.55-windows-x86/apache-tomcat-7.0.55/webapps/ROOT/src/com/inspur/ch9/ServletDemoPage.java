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
 * servletʵ�ַ���������serlvet��������̬ҳ��
 * @author dell
 *
 */
public class ServletDemoPage extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//�趨��Ӧ����
		resp.setContentType("text/html; charset=gbk");
		//ͨ����ӡ������ͻ�����Ӧhtml��Ϣ��
		PrintWriter out = resp.getWriter();
		out.print("<html>");
		out.print("<head><title>servlet������̬ҳ��İ�����ʾ</title><meta http-equiv=\"charset\" content=\"gbk\"></head>");
		out.print("<body><h1>servlet������̬ҳ�永��</h1>");
		Date now = new Date();
		String nowDateString = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(now);
		out.print(nowDateString);
		out.print("</body>");
		out.print("</html>");
	}
   
}
