package com.inspur.ch9;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * ��½У��
 * @author dell
 *
 */
public class LoginControl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1.���ܴӵ�½���淢�͹������û�����Ϣ��������Ϣ��
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		//2.У���û����������Ƿ��������������赱�û���������ֱ���������123ʱ����ΪУ��ͨ��������У�鲻�Ϸ���
		if("zhangsan".equals(userName)&&"123".equals(password)){//�Ϸ�
			//getRequestDispatcher�����������·���;���·������/������web��Ŀ�ĸ�·����
			//����http://localhost:8080/jspdemopro
			req.getRequestDispatcher("/welcome").forward(req, resp);
		}else{//���Ϸ�
			req.getRequestDispatcher("/login").forward(req, resp);
		}
		
	}
   
}
 