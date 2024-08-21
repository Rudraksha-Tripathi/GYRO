package controllers;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class GoToHome extends HttpServlet
{
			public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
					
						request.getRequestDispatcher("index.jsp").forward(request,response);
			}
}