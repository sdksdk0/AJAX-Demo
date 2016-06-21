package cn.tf.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username=request.getParameter("username");
		byte[] buf = username.getBytes("ISO-8859-1");
		username = new String(buf,"UTF-8");
		//System.out.println(username);
		String tip="<font color='green'>可注册</font>";
		if("朱培".equals(username)){
			tip="<font color='red'>该用户已存在</font>";	
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		pw.write(tip);
		pw.flush();
		pw.close();
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		
		String tip="images/b.jpg";
		if("朱培".equals(username)){
			tip="images/a.jpg";	
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		pw.write(tip);
		pw.flush();
		pw.close();
	}

}
