<!doctype html>
<html lang="en">
 <head>
  <title>Dashboard</title>
     
      <%@include file="LinkTags.jsp" %>

  
  <link href="static/css/dashboard.css" type="text/css" rel="stylesheet"/>

 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg); height: 150vh;">
            <div class="container">
           <%@include file="Navbar.jsp" %>
<!--   <div class="alert alert-warning">For Renters  </div>-->
               
               <h1 class="text-warning">Dashboard</h1>
            <c:if test="${user == null}">    
                <div class="alert alert-danger session-expired">
                    <h4 class="font-weight-bold text-center">Session Expired</h4>
               </div>
               </c:if>
      
               <div class="jumbotron" id="roomdata">
                        <h5>Total Rooms: <span class="badge badge-warning">0</span></h5>
                        <h5>Visited Users: <span class="badge badge-success">0</span></h5>
                   <button class="btn btn-primary rbtn">
                       <!---->
                       <a href="fillroominfo.show">Add Room</a>
                          <a href="roomdescription.show">View Room</a>
                       
                   </button>
                  
                   <button class="btn btn-success rbtn">
							<a href="AddRoomPics.jsp">Add Room Images</a>
                           <a href="getpicpath.do">View Room Images</a>
                       
                   </button>
                   <button class="btn btn-danger rbtn"><a href="roomedit.show">Edit Room</a></button>
               </div>
              
            </div>
     </main>
    <%@include file="footer.jsp" %>
        <script>
            var expbox = document.querySelector('.session-expired');
             const isSessionExpired = ()=>{
                expbox.style.display = 'block';    
               setTimeout(()=>{
                    expbox.style.display = 'none';
                },5000);
                };
               

            window.onload = isSessionExpired;
            
            
           
            
        </script>
 </body>
</html>
