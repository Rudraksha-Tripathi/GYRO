package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import model.*;

public class GetPicPathServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String nextPage = "showsignin.do";

		if(user!=null){
			int userId = user.getUserId();
			Rooms room = new Rooms();
			StringBuffer responseText = room.getPicPath(userId);
			request.setAttribute("image",responseText);
			nextPage = "ViewRoomImages.jsp";
		}
		request.getRequestDispatcher(nextPage).forward(request,response);
	}
}