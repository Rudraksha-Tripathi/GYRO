package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import model.User;
import model.Rooms;

public class RoomDescription extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		HttpSession session = request.getSession();

		String nextPage = "showsignin.do";

		User user = (User)session.getAttribute("user");
		if(user!=null){
			int userId = user.getUserId();
			if((user.getUser()).getUserTypeId()==2){
				userId = Integer.parseInt(request.getParameter("userId"));
			}
			
			Rooms room = new Rooms();
			if(room.getRoomDescription(userId)){
				request.setAttribute("room",room);
				StringBuffer responseText = room.getPicPath(userId);
				request.setAttribute("image",responseText);
				nextPage = "RoomDescription.jsp";
			}
		}
		
		request.getRequestDispatcher(nextPage).forward(request,response);
	}
}