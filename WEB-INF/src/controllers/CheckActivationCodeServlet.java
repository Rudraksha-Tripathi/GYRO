package controllers;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import model.User;

public class CheckActivationCodeServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		String email = (String)request.getParameter("email");	
		String activationCode = (String)request.getParameter("activationCode");	

		if(User.checkActivationCode(email,activationCode)){
			if(User.activateUser(email)){
				request.getRequestDispatcher("index.jsp").forward(request,response);
			}else{
				System.out.println("--------------User not Activated------------------");
			}
		}else{
			response.sendRedirect("ActivationFailed.jsp");
		}
	}
}