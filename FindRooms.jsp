<!doctype html>
<html lang="en">
 <head>
  <title>Gyro</title>
    <%@include file="LinkTags.jsp" %>
        <link href="static/css/findroom.css" rel="stylesheet">
        
 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg);">
            <div class="container">
               <%@include file="Navbar.jsp" %>
                   <div class="jumbotron findpage">
                       <ul class="breadcrumb">
                            <li><a href="showhome.do">Home</a></li>
                            <li>Find</li>
                       </ul>
                       <h1 class="text-primary text-center font-weight-bold">Hostel rooms</h1>
                       
                         <div class="srch">
                            <input class="form-control srch-bar" id="srch" type="text" placeholder="Search by location">
                        <button class="btn btn-success" type="submit" style="cursor: pointer;" onclick="searchRecord()" id="srchbtn"><img src="static/imgs/srch2.png" height="20px" width="25px" style="filter: grayscale(10)">Search</button>
                        </div>
                       
                    <div class="jumbotron All-rooms">
                    <div class="row">
                        <div class="col">
                            
                            <img src="static/imgs/bgimg.jpg"><br><span class="bg-dark text-warning font-weight-bold">ABC hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">Wright town</span><br>
                          
                        </div>
                          <div class="col">
<!--                              <span class="fa fa-star"></span>-->
                              <img src="static/imgs/bgimg.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                            <br><span class="bg-dark text-warning font-weight-bold loc">123A ,near SBI,SBI chock, deendayal</span><br>
                        </div>
                          <div class="col">
<!--                              <span class="fa fa-star"></span>-->
                              <img src="static/imgs/bgimg.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">Napier town</span><br>
                        </div>
                          <div class="col"><img src="static/imgs/bgimg.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">Sanjeevani nagar , garha</span><br>
                        </div>
                   </div><br>
                   <div class="row">
                          <div class="col"><img src="static/imgs/hdbg.jpeg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                       <br><span class="bg-dark text-warning font-weight-bold loc">Karmeta</span><br>
                       </div>
                          <div class="col"><img src="static/imgs/hdbg.jpeg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                       <br><span class="bg-dark text-warning font-weight-bold loc">Tripuri chock</span><br>
                       </div>
                          <div class="col"><img src="static/imgs/hdbg.jpeg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                       <br><span class="bg-dark text-warning font-weight-bold loc">Napier town</span><br>
                       </div>
                          <div class="col"><img src="static/imgs/hdbg.jpeg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                       <br><span class="bg-dark text-warning font-weight-bold loc">Wright town</span><br>
                       </div>
                   </div><br>
                    <div class="row">
                          <div class="col"><img src="static/imgs/wp1810523.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">Vijay nagar</span><br>
                        </div>
                          <div class="col"><img src="static/imgs/wp1810523.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">Karmeta</span><br>
                        </div>
                          <div class="col"><img src="static/imgs/wp1810523.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">Wright town</span><br>
                        </div>
                          <div class="col"><img src="static/imgs/wp1810523.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">deendayal</span><br>
                        </div>
                   </div>
                </div>
            </div>           
         </div>
     </main>
    <%@include file="footer.jsp" %>
        
 </body>
</html>
