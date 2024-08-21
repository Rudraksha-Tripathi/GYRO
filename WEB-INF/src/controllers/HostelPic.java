package controllers;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import model.*;
import javax.servlet.annotation.WebServlet;


import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import java.util.List;

@WebServlet("/hostelpic.do")
public class HostelPic extends HttpServlet{
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
				String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/"+userEmail+"/Hostelpic");

				String fileName = fileItem.getName();
				File file = new File(uploadPath,fileName);
				if(!file.exists()){
					try{
							fileItem.write(file);
							Rooms room = new Rooms();
							room.saveHostelpic(user.getUserId(),userEmail+"/Hostelpic/"+fileName);
					}catch(Exception e){
						e.printStackTrace();		
					}
				}
			}

			response.sendRedirect("ViewRoomImages.do");
		}else{
			response.sendRedirect("showsignin.do");
		}
	}
}