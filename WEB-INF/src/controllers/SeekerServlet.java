package controllers;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import model.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/seeker.do")
public class SeekerServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		Integer userId = Integer.parseInt(request.getParameter("userid"));
		RoomPic roompic = new RoomPic();
		//roompic.getRoomPicPath(user.getUserId());
		String nextPage = "Dashboard2.jsp";
		request.getRequestDispatcher(nextPage).forward(request,response);				
	}
}