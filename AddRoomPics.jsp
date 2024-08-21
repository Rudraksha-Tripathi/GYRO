<!doctype html>
<html lang="en">
 <head>
  <title>Room Imgs</title>
     
      <%@include file="LinkTags.jsp" %>

  
  <link href="static/css/roompics.css" type="text/css" rel="stylesheet"/>

 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg); height: 150vh;">
            <div class="container">
           <%@include file="Navbar.jsp" %>
               <h1 class="text-warning mt-4 ml-4">Add Images</h1>
               <div class="jumbotron" id="picsdata">
                       <form method="post" action="room_pic_upload.do" enctype="multipart/form-data"> 
                             <div class="custom-file">
                
                            <input type="file" class="custom-file-input" id="roomimgs" name="roomimgs" id="pics" multiple accept="image/*" required>
                            <label class="custom-file-label" for="pics">Choose file</label>
                                <div id="pic_container">
                                 <output class="output_imgs" />
                                 </div>
                            <input type="submit" value="Upload" class="btn btn-success">
                             </div>
				      </form>
               </div>
              
            </div>
     </main>
    <%@include file="footer.jsp" %>
        <script src="static/JS/roompics.js"></script>
        
 </body>
</html>
