
package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import model.*;

import javax.servlet.annotation.WebServlet;

@WebServlet("/deleteroompic.do")
public class DeleteRoomPicServlet extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
	   HttpSession session = request.getSession();
       User user = (User)session.getAttribute("user");
       
       
       String nextPage = "showsignin.do";
		if(user!=null){
        String img = request.getParameter("image");
		System.out.println(img);
        Rooms rooms = new Rooms();
        if(rooms.deleteRoomPic(img)){
            nextPage = "roomdescription.show";
        }
       
       }
       request.getRequestDispatcher(nextPage).forward(request,response);
	}
}

