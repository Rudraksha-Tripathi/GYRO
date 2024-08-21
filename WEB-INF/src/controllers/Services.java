package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import model.*;

public class Services extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		int serviceId = Integer.parseInt(request.getParameter("serviceid"));
		
		Rooms room = new Rooms();
		StringBuffer responseText = room.getServices(serviceId);
		String resp = responseText.toString();
		response.getWriter().write(resp);
	}
}