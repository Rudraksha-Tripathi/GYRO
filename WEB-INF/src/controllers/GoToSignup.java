package controllers;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class GoToSignup extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		
		request.getRequestDispatcher("Signup.jsp").forward(request,response);		
	}
}