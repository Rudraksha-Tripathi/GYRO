package controllers;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import model.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ViewRoomImages.do")
public class ShowViewRoomImages extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();

		User user = (User)session.getAttribute("user");		

		String nextPage = "showsignin.do";
		if(user!=null){
			RoomPic roompic = new RoomPic();
			//roompic.getRoomPicPath(user.getUserId());
			nextPage = "ViewRoomImages.jsp";
		}
		request.getRequestDispatcher(nextPage).forward(request,response);				
	}
}