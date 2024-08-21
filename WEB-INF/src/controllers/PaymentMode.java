package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import model.*;

public class PaymentMode extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		int pymodeId = Integer.parseInt(request.getParameter("pymodeid"));
		
		Rooms room = new Rooms();
		StringBuffer responseText = room.getPaymentMode(pymodeId);
		String resp = responseText.toString();
		response.getWriter().write(resp);
	}
}