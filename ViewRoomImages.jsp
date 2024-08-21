<!doctype html>
<html lang="en">
 <head>
  <title>Gyro</title>
    <%@include file="LinkTags.jsp" %>
        <link href="static/css/viewimages.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.0.1/min/dropzone.min.css" rel="stylesheet">  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.2.0/min/dropzone.min.js"></script>  
        
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
						
                      
                        <% if(st.length()!=0){ %>
                            <div class="imgsgall border border-primary">
                            <div class="row">
                                <%
										for(int i=0;i<v.length;i++){ %>
										<div class="col roomimg">
											<img src="roompics.do?path=<%=v[i]%>" class="rimgs rounded" width="190px" height="190px"><button type="button" class="close" data-toggle="modal" data-target="#deleteimg" id="delbtn_<%=v[i]%>">&times;</button>
										</div>
                                
                                    <!--               Delete model                     -->
                                
                                         
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
                                        
                                            <h4>Do you really want to delete this Image ?</h4>
                                            <button class="btn btn-secondary ml-5" data-dismiss="modal">Close</button>
											<input type="hidden" value="1"/>
                                            <a href="deleteroompic.do?image=<%=v[i]%>" class="btn btn-danger ml-5" >Delete</a>
                                       
                                    
                                    </div>
                                    
                                </div>
                          </div>
                            
                      </div>
                            <!--       * Delete model                         -->
                                
                            
							 <% } %>
                                </div>
                                 </div>
				        <%   }else{ %>
								<div class="alert alert-danger m-auto mt-5">No images Uploaded</div>
							
							<% } %>
                    
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
                          
                        
			

<!--
                             <div class="jumbotron border border-danger" id="picsdata">
                       <form method="post" action="room_pic_upload.do" class="dropzone bg-secondary" id="image-upload" enctype="multipart/form-data"> 

                          
                           <input type="submit" class="btn btn-success uploadbtn" value="Upload">
				      </form>
               </div>
                          
    -->                      
                    <br>    
                          
                     
               
            </div>
     </main>
    <%@include file="footer.jsp" %>
        
    
         <script type="text/javascript">  
                Dropzone.options.imageUpload = {  
                maxFilesize:4,  
                acceptedFiles: ".jpeg,.jpg,.png" ,
                uploadMultiple: true,
                addRemoveLinks: true,
        };  
             
             Dropzone.autoDiscover = false;

            var myDropzone = new Dropzone(".dropzone", { 
               autoProcessQueue: false,
               parallelUploads: 10 // Number of files process at a time (default 2)
            });

            $('.uploadbtn').click(function(){
               myDropzone.processQueue();
                alert('uploaded')
            });
             
             
            </script>  
         
 </body>
</html>
