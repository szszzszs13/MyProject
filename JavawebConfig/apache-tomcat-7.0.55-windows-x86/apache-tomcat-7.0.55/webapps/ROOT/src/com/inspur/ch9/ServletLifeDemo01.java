package com.inspur.ch9;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * servlet的生命周期 ：servlet出生--servlet销毁 期间阶段。
 * 1、servlet类的实例化。
 *    who？servlet容器进行创建，根据web.xml中配置信息进行创建。
 *    when？默认是客户端向该servlet发送请求的时候，servlet容器进行创建。
 * 2、创建完servlet对象后，会调用该对象的初始化方法。   然后会封装servlet的初始化参数到servletConfig对象中。
 * 3、处理请求，调用servlet的service（request，response参数）
 *    其中request参数也是有tomcat进行创建并封装了请求信息。
 *       response参数tomcat进行创建。通过response把服务端的信息响应给客户端。
 *    
 *       
 * 4、如果再1次向servlet发送请求，还是按照以上的顺序进行执行（只不过，如果tomcat中已经存在servlet对象，则不会再实例化和初始化。）
 * 
 * 5、什么时候servlet销毁。
 *    当关闭tomcat容器时，会销毁servlet对象。
 *       
 *    
 * @author dell
 *
 */
public class ServletLifeDemo01  extends HttpServlet{
	//整个生命周期中执行多次，根据请求次数不同来执行。
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("service方法.......");
	}
	//整个生命周期中执行1次
	@Override
	public void destroy() {
		System.out.println("destory方法.......");
	}
     
	//整个生命周期中执行1次
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init方法.......");
		System.out.println(config.getInitParameter("username"));
	}
  
}
