package cn.tf.province;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Province extends HttpServlet {


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String province=request.getParameter("province");
		//xml格式的数据
		response.setContentType("text/xml;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.write("<?xml version='1.0'  encoding='UTF-8' ?>");
		pw.write("<root>");
		
		if("广东省".equals(province)){
			pw.write("<city>广州</city>");
			pw.write("<city>深圳</city>");
			pw.write("<city>佛山</city>");
		}else if("湖南省".equals(province)){
			pw.write("<city>长沙</city>");
			pw.write("<city>衡阳</city>");
			pw.write("<city>永州</city>");
			pw.write("<city>株洲</city>");
		}
		pw.write("</root>");
		pw.flush();
		pw.close();
		
		
		
	}

}
