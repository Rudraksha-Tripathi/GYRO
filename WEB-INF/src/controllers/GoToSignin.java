package controllers;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

 public class GoToSignin extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		
		request.getRequestDispatcher("Login.jsp").forward(request,response);		
	}
}