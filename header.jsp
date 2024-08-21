   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <header style="background-image: linear-gradient(black,teal)">
           
           <span><img src="static/imgs/GYRO.png" height="60px" width="80px" style="margin-top: 20px;"/></span>
           <div id="title">
               <a href="showhome.do"> <h1 style="font-family: Georgia, 'Times New Roman', Times, serif;" class="text-white"><b>GYRO</b> - Get Your Room Own</h1></a>
<!--            <P class="font-italic text-white"><B>A way that you can find hostel or room easily</B></P> -->
              
         </div>
            <c:choose>
                    <c:when test="${user == null}">
                       
                        <div id="header_btns" class="btn btn-group">

                           
                            <button class="btn btn-success"><a href="showsignup.do">SignUp</a></button>
                            <button class="btn btn-success"><a href="showsignin.do">Login</a></button>&nbsp;&nbsp;
                             </div>
                    </c:when>
                    <c:otherwise>
                        <div id="session_btns" class="btn btn-group">
                            
                            <button class="btn btn-success logout-btn"><a href="loggingout.do">Logout</a></button>
                            <a href="profile.do" id="profbtn"><img src="static/imgs/profpic.png" width="40px" height="40px"><br><span class="text-info font-weight-bold uname">${user.userName}</span></a>
                        </div>
                    </c:otherwise>
            </c:choose>
           
         <div id="social_btns" class="btn btn-group-sm">
             <span class="text-info font-weight-bold">Share</span>
             <button class="btn"><a href="#fb" class="fa fa-facebook"></a></button>
             <button class="btn"><a href="#ig" class="fa fa-instagram"><i></i></a></button>
             <button class="btn"><a href="whatsapp://send?text=http://127.0.0.1:8080/_Minor" data-action="share/whatsapp/share" target="_blank"><i class="fa fa-whatsapp"></i></a></button>
            </div>
     </header>
