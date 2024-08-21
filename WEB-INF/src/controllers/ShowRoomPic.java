package controllers;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import model.*;
import javax.servlet.annotation.WebServlet;
import utils.Util;

@WebServlet("/roompics.do")
public class ShowRoomPic extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();

		String path = (String)request.getParameter("path");		
		String roompicPath = "/WEB-INF/uploads/"+path;
		
		Util.streamPic(getServletContext(),response.getOutputStream(),roompicPath);
	}
}