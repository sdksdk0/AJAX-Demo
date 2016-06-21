package cn.tf.time;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TimeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("GET");
		SimpleDateFormat   sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String nowStr=sdf.format(new Date());
	
		request.setAttribute("nowStr",nowStr);
		
		request.getRequestDispatcher("/06_time.jsp").forward(request, response);
	
	
	}


}
