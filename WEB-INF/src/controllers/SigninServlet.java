package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import model.*;
import java.util.*;

public class SigninServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		HttpSession session = request.getSession();

		String nextPage = "Login.jsp";
		String email = (String)request.getParameter("email");
		String password = (String)request.getParameter("password");

		User user = new User();
		String msg = user.loginUser(email,password);

		if((msg).equals("Succesful")){
			session.setAttribute("user",user);
			Rooms room = new Rooms();
			Integer userId = user.getUserId();
			if((user.getUser()).getUserTypeId()==1){
				if(room.getRoomDescription(userId)){
					session.setAttribute("room",room);
				}
				nextPage = "Dashboard.jsp";
			}else{
				ArrayList<Rooms> rooms = room.getAllRoomDescription();
				session.setAttribute("rooms",rooms);
				nextPage = "Dashboard2.jsp";
			}
		}else{
			request.setAttribute("message",msg);
		}
		request.getRequestDispatcher(nextPage).forward(request,response);
	}
}