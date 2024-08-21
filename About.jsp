<!doctype html>
<html lang="en">
 <head>
  <title>About</title>
     
  <%@include file="LinkTags.jsp" %>
  <link href="static/css/about.css" type="text/css" rel="stylesheet"/>
 
     
 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg); height: 250vh;">
            <div class="container">
           <%@include file="Navbar.jsp" %>
               <div class="jumbotron" id="jumbo" >
                    <h1>About us</h1>
                   <p>___<br><br><br></p>
               </div>
               <div class="jumbotron" id="jumbo2" style="background-image: url(static/imgs/profback2.jpg)">
                   <h2 class="text-primary text-center font-weight-bold">Our Team - The Implementers</h2>
                     <div class="card" id="pro1">
                        <img src="static/imgs/DP/SRAJAN_SONI.jpg" class="card-img-top">
                        <div class="card-body">
                            <h4 class="card-title">Srajan Soni</h4>
                            <p class="card-text"><span>Frontend Developer</span><br>
                                <span>Visit: <a href="https://www.linkedin.com/in/srajan-soni-4b49601a4?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BKL0Q4cYfSzeCTeuTOWFzIw%3D%3D" target="_blank">LinkedIn</a></span>
                            </p>
                        </div>
                    </div>
                    <div class="card" id="pro2">
                        <img src="static/imgs/DP/RUDRU.jpg" class="card-img-top" >
                        <div class="card-body">
                            <h5 class="card-title">Rudraksha Tripathi</h5>
                            <p class="card-text"><span>Backend Developer</span><br>
                                <span>Visit:<a>LinkedIn</a></span>
                            </p>

                        </div>
                   </div>
                   
                    <div class="card" id="pro3">
                        <img src="static/imgs/DP/MENDHAK.jpg" class="card-img-top " >
                        <div class="card-body">
                            <h4 class="card-title">Princy Goyal</h4>
                            <p class="card-text"><span>Webpage Designer</span><br>
                            <span>Visit:<a href="https://www.linkedin.com/in/princy-goyal-7175811a1" target="_blank">LinkedIn</a></span>
                            </p>

                        </div>
                   </div>
                   
                    <div class="card" id="pro4">
                        <img src="static/imgs/DP/VAIBHAV.jpg" class="card-img-top" >
                        <div class="card-body">
                            <h4 class="card-title">Vaibhav Sen</h4>
                            <p class="card-text">Database Manager<br>
                                <span>Visit:<a href="https://www.linkedin.com/in/vaibhav-sen-5b13511a1" target="_blank">LinkedIn</a></span>
                            </p>
                        </div>
                    </div>
                   <div id="note"><h4 class="text-center font-weight-bold">Students of <a href="http://ggct.co.in/" target="_blank">Gyan Ganga College of Technology</a></h4>
                   <h5 class="text-center">Jabalpur, Madhya Pradesh, India </h5>
                   </div>
                   
               </div>
         </div>
     </main>
    <%@include file="footer.jsp" %>
        
 </body>
</html>
