package com.inspur.ch9;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * servlet���������� ��servlet����--servlet���� �ڼ�׶Ρ�
 * 1��servlet���ʵ������
 *    who��servlet�������д���������web.xml��������Ϣ���д�����
 *    when��Ĭ���ǿͻ������servlet���������ʱ��servlet�������д�����
 * 2��������servlet����󣬻���øö���ĳ�ʼ��������   Ȼ����װservlet�ĳ�ʼ��������servletConfig�����С�
 * 3���������󣬵���servlet��service��request��response������
 *    ����request����Ҳ����tomcat���д�������װ��������Ϣ��
 *       response����tomcat���д�����ͨ��response�ѷ���˵���Ϣ��Ӧ���ͻ��ˡ�
 *    
 *       
 * 4�������1����servlet�������󣬻��ǰ������ϵ�˳�����ִ�У�ֻ���������tomcat���Ѿ�����servlet�����򲻻���ʵ�����ͳ�ʼ������
 * 
 * 5��ʲôʱ��servlet���١�
 *    ���ر�tomcat����ʱ��������servlet����
 *       
 *    
 * @author dell
 *
 */
public class ServletLifeDemo01  extends HttpServlet{
	//��������������ִ�ж�Σ��������������ͬ��ִ�С�
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("service����.......");
	}
	//��������������ִ��1��
	@Override
	public void destroy() {
		System.out.println("destory����.......");
	}
     
	//��������������ִ��1��
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init����.......");
		System.out.println(config.getInitParameter("username"));
	}
  
}
