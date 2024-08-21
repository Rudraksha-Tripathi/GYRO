<!doctype html>
<html lang="en">
 <head>
  <title>Connects</title>
     
   <%@include file="LinkTags.jsp" %>

       <link rel="stylesheet" href="static/css/connects.css">
 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg); height: 250vh;">
            <div class="container">
           <%@include file="Navbar.jsp" %>
                <div class="jumbotron" class="mt-5" id="connect_page">
                    
                    <div class="sidebar">
                      <a href="" id="con_user"><i class="fa fa-users"></i>Connected Users</a>
                      <a href="" id="new_rq"><i class="fa fa-user-plus"></i> New Request</a>
                      <a href="" id="chats"><i class="fa fa-comments"></i> Chats</a>
<!--                      <a href="#contact"><i class="fa fa-fw fa-envelope"></i> Contact</a>-->
                    </div>
                    
                    <div class="jumbotron" id="connect_box">
                        <h3 class="text-warning text-center font-weight-bold bg-secondary connect-title">All Connected Users</h3>
                        <div class="jumbotron connect-show connected">
                             <div class="srch">
                                <input class="form-control srch-bar" id="srch" type="text" placeholder="Search Users">
                                 <button class="btn btn-sm btn-info" type="submit" style="cursor: pointer;" onclick="searchRecord()" id="srchbtn"><img src="static/imgs/srch2.png" height="20px" width="25px" style="filter: grayscale(10)">Search</button>
                            </div>
                            <%@include file="User-Records.jsp" %>
                            
                        </div>
                        
                        <div class="jumbotron connect-show newreq">
                            <%@include file="User-Requests.jsp" %>
                        </div>
                        <div class="jumbotron connect-show chat">
                            <%@include file="User-Chats.jsp" %>
                        </div>
                         <div class="jumbotron connect-show chat-window">
                              <nav class="chatnav bg-secondary">
                                      
                                            <img src="static/imgs/pkglnbs8_shraddha-kapoor_625x300_15_January_19.jpg" class="rounded-circle" width="60px" height="50px">
                                  <div class="chat-heads">
                                            <h6 class="font-weight-bold">Shraddha</h6>
                                            <span class="online">&#x25CF;</span>online
                                  </div>
                                       
                                    </nav>
                             <div class="chatting">
                                    <!--         Shraddha                  -->
                                    <div class="chat-container">
                                        <img src="static/imgs/pkglnbs8_shraddha-kapoor_625x300_15_January_19.jpg" width="50px" height="50px">
                                        <span class="msg">Hii</span>
                                        <span class="time-right">09:03 pm</span>
                                    
                                    </div>
                                    <!--            Me                        -->
                                 <div class="chat-container darker">
                                        <img src="static/imgs/dp.png" class="right" width="50px" height="50px">
                                        <span class="msg">Hello</span>
                                        <span class="time-left">09:08 pm</span>
                                    
                                    </div>
                                 <!--           Shraddha                      -->
                                 <div class="chat-container">
                                        <img src="static/imgs/pkglnbs8_shraddha-kapoor_625x300_15_January_19.jpg" width="50px" height="50px">
                                        <span class="msg">How are you dear ?</span>
                                        <span class="time-right">09:08 pm</span>
                                    
                                    </div>
                                    <!--           Me                      -->
                                  <div class="chat-container darker">
                                        <img src="static/imgs/dp.png" class="right" width="50px" height="50px">
                                        <span class="msg">Fine ! Thanks for asking</span>
                                        <span class="time-left">09:09 pm</span>
                                    
                                    </div>
                                 <div class="chat-container darker">
                                        <img src="static/imgs/dp.png" class="right" width="50px" height="50px">
                                        <span class="msg">And you ?</span>
                                        <span class="time-left">09:09 pm</span>
                                    
                                    </div>
                                    <!--           Shraddha                      -->
                                 <div class="chat-container">
                                        <img src="static/imgs/pkglnbs8_shraddha-kapoor_625x300_15_January_19.jpg" width="50px" height="50px">
                                        <span class="msg">Fine</span>
                                        <span class="time-right">09:10 pm</span>
                                    
                                    </div>

									    <div class="chat-container">
                                        <img src="static/imgs/pkglnbs8_shraddha-kapoor_625x300_15_January_19.jpg" width="50px" height="50px">
                                        <span class="msg">Your friend Rudraksha Tripathi is so cute,handsome and charming.Uska no. de ..</span>
                                        <span class="time-right">09:10 pm</span>
                                    
                                    </div>
                             </div>
                             <div class="type-msg">
<!--                                <input type="text" class="type" name="msg" placeholder="Type here" >-->
                                 <textarea class="type" rows="3" cols="100"></textarea>
                                 <button class="send-msg btn btn-info rounded-circle">
                                     <img src="static/imgs/dm%20btn.png" class="dmbtn" width="40px" height="40px">
                                 </button><!--<span class="fa fa-paper-plane"></span>-->
                             </div>
                        </div>
                    </div>
                    
                </div>
         </div>
                <script src="static/JS/connects.js"></script>
     </main>
    <%@include file="footer.jsp" %>
        
 </body>
</html>
