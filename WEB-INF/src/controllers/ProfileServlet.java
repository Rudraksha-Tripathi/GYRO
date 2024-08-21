package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import model.User;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import java.util.List;

public class ProfileServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		HttpSession session = request.getSession();

		String nextPage = "Login.jsp";
		User user = (User)session.getAttribute("user");
		if(user!=null){
			String email = user.getEmail();
			nextPage = "Profile.jsp";
		}
		
		request.getRequestDispatcher(nextPage).forward(request,response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		String nextPage = "Login.jsp";
		if(user!=null){
			if(ServletFileUpload.isMultipartContent(request)){
				DiskFileItemFactory dfif = new DiskFileItemFactory();
				ServletFileUpload sfu = new ServletFileUpload(dfif);

				List<FileItem> fileItems = null;

				try{
					fileItems = sfu.parseRequest(request);
				}catch(FileUploadException e){
					e.printStackTrace();
				}

				FileItem fileItem = fileItems.get(0);
				
				String userEmail = user.getEmail();
				String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/"+userEmail+"/profPic");

				String fileName = fileItem.getName();
				File file = new File(uploadPath,fileName);
				if(!file.exists()){
					try{
							fileItem.write(file);
							user.saveProfpic(userEmail+"/profPic/"+fileName);
					}catch(Exception e){
						e.printStackTrace();		
					}
				}
			}

			response.sendRedirect("profile.do");
		}else{
			response.sendRedirect("showsignin.do");
		}
	}
}