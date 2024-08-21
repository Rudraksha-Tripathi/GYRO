package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import model.*;

 public class ShowRoomInfo extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");

		String nextPage = "showsignin.do";
		if(user!=null){
			nextPage = "RoomInfo.jsp";
		}
		request.getRequestDispatcher(nextPage).forward(request,response);		
	}
}