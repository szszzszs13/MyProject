package com.inspur.ch9;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * servlet������
 * 1��serlvet�ĸ��
 *   �����java�ࡣ
 *   �����Ϊ��
 *    i����ɶ�̬��ҳ�Ĺ��ܺʹ���ͻ�������Ĺ��ܣ�service������ʵ�֣�
 *    ii:��Ҫ����servlet��صĹ淶����Ҫ�̳л���ʵ��servlet�淶��صĽӿڻ����ࡣ
 *       HttpServlet�ࡣ
 *    iii:��Ҫ������servlet�����С�����˵tomcat������   
 * @author dell
 *
 */
public class ServletDemo01 extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1������ͻ��˵�����
		String userName = req.getParameter("userName");
		System.out.println(userName);
		
	}
  
}
