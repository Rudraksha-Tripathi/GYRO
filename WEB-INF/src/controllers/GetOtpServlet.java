package controllers;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

import com.google.gson.Gson;
import utils.*;

public class GetOtpServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		HttpSession session = request.getSession();
		String flag = "False";
		String inpotp = request.getParameter("inpotp");
		String sentotp = (String)session.getAttribute("sentotp");

		if(inpotp.equals(sentotp)){
			flag = "True";
		}
		//sentotp = new Gson().toJson(sentotp);
		response.getWriter().write(flag);
	}
}
