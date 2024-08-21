package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class LogoutServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();
		System.out.println("BYE-----------------");
		session.invalidate();

		request.getRequestDispatcher("showsignin.do").forward(request,response);
	}
}

