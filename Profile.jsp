<!doctype html>
<html lang="en">
 <head>
  <title>Profile</title>
     
   <%@include file="LinkTags.jsp" %>
     <link href="static/css/profile.css" type="text/css" rel="stylesheet" />

     
 </head>
 <body>
    <%@include file="header.jsp" %>

     <main style="background-image: url(bgimg.jpg); height: 240vh;">
            <div class="container">
                <%@include file="Navbar.jsp" %>
                <div class="jumbotron" id="tbjumbo">
                    <form action="updateprof.do">
					<table class="table table-hover">
                        <tr>
                            <th>Name:</th>
                            <td><input type="text" name="uname" class="form-control" value="${user.userName}" disabled></td>
					    </tr>
                        <tr>
                            <th>Mobile no.</th>
                            <td><input type="text" name="mobno" class="form-control" value="${user.mobile}" disabled>
                        </tr>
                         <tr>
                            <th>Whatsapp no.</th>
                            <td><input type="text" name="wno" class="form-control" value="${user.whatsapp}" disabled>
                        </tr>
                         <tr>
                            <th>Address:</th>
                            <td><input type="text" name="address" class="form-control" value="${user.address}" disabled></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="Save" class="btn btn-success" id="saveinfo" disabled/>
                            </td>
                            <td>
                            <input type="button" value="Edit" class="btn btn-info" id="editinfo"/>
							<input type="hidden" value="${user.userId}" name="userid"/>
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
                   
                         <div class="card" id="Propic">
                            <img src="showprofpic.do" class="card-img-top rounded-circle" style="width: 100%;">
							<!--<img src="static/imgs/dp.png" class="card-img-top rounded-circle" style="width: 100%;">-->
                            <div class="card-body">
                                <h4 class="card-title text-center font-weight-bold">${user.userName}</h4>
                                <h5 class="card-title">${user.email}</h5>
                                <p class="card-text"></p>
<!--                                <input type="button" class="btn btn-primary dpbtn ml-5" value="Edit Dp"> -->
                                <button class="btn btn-primary dpbtn ml-5">Edit dp</button> 
                                <div id="updp" class="">
                                     <form action="profile.do" method="post" enctype="multipart/form-data" >
<!--                                         <lable for="updp" class="custom-file-lable">Select</lable>-->
                                         <button class="btn btn-secondary upbtn"><input type="file" name="updp" class="upbtn" accept="image/jpeg" >Select</button><br>
                                <input type="submit" class="btn btn-success ml-5" value="Upload">
                                     </form>
                                </div>
                            </div>
                        </div>
                  
              
                <div class="navbar" id="pronav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a href="#" class="nav-link">Change password</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">uploads</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">Delete account</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">Help</a>
                        </li>
                    </ul>
                </div>                    
            </div>
     </main>
    <%@include file="footer.jsp" %>
	<script src="static/JS/profile.js" ></script>
        
 </body>
</html>
