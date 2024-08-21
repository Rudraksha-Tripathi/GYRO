package controllers;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import java.util.*;
import model.*;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileItem;

public class RoomPicUploadServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
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
					
					String picUploadPath = getServletContext().getRealPath("/WEB-INF/uploads/"+user.getEmail());
					
					String dbPicPath = user.getEmail()+"/";
					ArrayList<String> dbPicPaths = new ArrayList<String>();	

					for(FileItem fileItem : fileItems){
						String fileName = fileItem.getName();
						if(fileName != null)
						{
							dbPicPaths.add(dbPicPath+fileName);
							System.out.println("***************HEllo");	
						}
						try{							
							File file = new File(picUploadPath,fileName);
							if(!file.exists()){
								fileItem.write(file);
							}
							nextPage = "roomdescription.show";
						}catch(Exception e){
							e.printStackTrace();
						}
					}
					
					Rooms.saveRoomPics(user.getUserId(),dbPicPaths);
				}catch(FileUploadException e){
					e.printStackTrace();
				}
			}
		}
		request.getRequestDispatcher(nextPage).forward(request,response);
	}
}