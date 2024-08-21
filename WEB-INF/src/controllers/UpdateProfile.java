package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import model.User;
import javax.servlet.annotation.WebServlet;
@WebServlet("/updateprof.do")
public class UpdateProfile extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		HttpSession session = request.getSession();

		String nextPage = "showsignin.do";
		User user = (User)session.getAttribute("user");
		if(user!=null){
			String name = (String)request.getParameter("uname");
			String mobile = (String)request.getParameter("mobno");
			String whatsapp = (String)request.getParameter("wno");
			String address = (String)request.getParameter("address");
			Integer userId = Integer.parseInt(request.getParameter("userid"));
			User userobj = new User();
			if(userobj.updateUser(userId,name,mobile,whatsapp,address)){
				nextPage = "profile.do";
			}else{
				System.out.println("---Can not update---");
			}
		}
		
		request.getRequestDispatcher(nextPage).forward(request,response);
	}
}