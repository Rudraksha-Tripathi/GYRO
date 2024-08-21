<!doctype html>
<html lang="en">
 <head>
  <title>Gyro</title>
    <%@include file="LinkTags.jsp" %>
        <link href="static/css/viewimages.css" rel="stylesheet">
        
 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg);">
            <div class="container">
               <%@include file="Navbar.jsp" %>
         
                   <div class="jumbotron imgpage">
                        
                         <h2 class="text-secondary-50 font-weight-bold mt-3">Images</h2>
						 
						 <% StringBuffer sb = (StringBuffer)request.getAttribute("image"); 
								String st = sb.toString();
								String[] v = st.split(" ");
						 %>
						
                      <div class="imgsgall">
                        
                            <div class="row">
                                <% if(st.length()!=0){
										for(int i=0;i<v.length;i++){ %>
										<div class="col">
											<img src="roompics.do?path=<%=v[i]%>" class="rimgs rounded" width="190px" height="190px"><button type="button" class="close" data-toggle="modal" data-target="#deleteimg" id="delbtn_<%=v[i]%>">&times;</button>
										</div>
							
							 <% } 
							}else{ %>
								<div class="btn btn-danger ml-3 mt-3 addimgs">No images Uploaded</div>
							<% } %>
							
                    
                            </div>
                          
                          <div class="modal fade" id="deleteimg">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                <!--             Modal header                       -->
                                    <div class="modal-header">
                                        <h3 class="text-dark text-center font-weight-bold">Delete Image</h3>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        
                                    </div>
                                    <!--             Modal body                      -->
                                    
                                    <div class="modal-body">
                                        <form action="deleteroompic.do">
                                            <h4>Do you really want to delete this Image ?</h4>
                                            <button class="btn btn-secondary ml-5" data-dismiss="modal">Close</button>
											<input type="hidden" value="1"/>
                                            <input type="submit" class="btn btn-danger ml-5" value="Delete" />
                                        </form>
                                    
                                    </div>
                                    
                                </div>
                          </div>
                            
                      </div>
			



                       <div class="imgupload">
                          
                          <table class="table table-stripped">
                           <tr>
                              <th class="imp">Images</th>
                              <td>
                                
								<form method="post" action="room_pic_upload.do" enctype="multipart/form-data"> 
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="roomimgs" id="pics" multiple accept="image/*" required>
                                        <label class="custom-file-label" for="pics">Choose file</label>
                                      </div>
                                      <input type="submit" class="btn btn-danger ml-3 mt-3 addimgs" value="Add"/>
								</form>
                              </td>
                          </tr>
                          </table>
                       </div>
                    </div><br>    
               
            </div>
     </main>
    <%@include file="footer.jsp" %>
        
    <script>
        document.getElementsByClassName();
	</script>
 </body>
</html>
