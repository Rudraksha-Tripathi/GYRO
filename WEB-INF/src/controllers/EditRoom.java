package controllers;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import model.*;

public class EditRoom extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();
		String nextPage = "showsignin.do";
		User user = (User)session.getAttribute("user");
		if(user!=null){
			Rooms room = new Rooms();
			int userId = user.getUserId();
			if(room.getRoomDescription(userId)){
				request.setAttribute("room",room);
			}
			nextPage = "EditRoom.jsp";
		}
		
		request.getRequestDispatcher(nextPage).forward(request,response);
	}
}