package controllers;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import model.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/roomupdate.do")
public class RoomUpdate extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");		

		String nextPage = "showsignin.do";
		if(user!=null){		
			String hname = request.getParameter("hname");
			int htype = Integer.parseInt(request.getParameter("htype"));
			String location = request.getParameter("location");
			int available = Integer.parseInt(request.getParameter("available"));
			int roomtype = Integer.parseInt(request.getParameter("Roomtype"));
			String rates = request.getParameter("rates");
			int size = Integer.parseInt(request.getParameter("size"));
			String discription = request.getParameter("descp");
			String services[] = request.getParameterValues("services");
			String payment[] = request.getParameterValues("payment");

			Rooms rooms = new Rooms();
			int userId = user.getUserId();
			if(rooms.updateRoom(userId,hname,htype,location,available,roomtype,rates,size,discription,services,payment)){
				nextPage="roomedit.show";
			}
		}	
		
	request.getRequestDispatcher(nextPage).forward(request,response);
	}
}