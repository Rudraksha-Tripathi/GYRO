<!doctype html>
<html lang="en">
 <head>
  <title>Gyro</title>
    <%@include file="LinkTags.jsp" %>
        
 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg);">
            <div class="container">
               <%@include file="Navbar.jsp" %>
                  <div class="jumbotron" style="margin-top: 50px;" id="jumbo"> 
                        <h2 class="text-white-50 text-warning bg-secondary">Welcome <c:if test="${user ne null}">${user.userName}</c:if></h2>    
                      <marquee> <c:choose>
                          <c:when test="${user == null}"><h6 class="text-center text-danger font-weight-bolder">If you are new in our portal , please sign up</h6>
                          </c:when>
                          <c:otherwise><h6 class="text-center text-danger font-weight-bolder">Contact us if you have any query</h6></c:otherwise>
                          </c:choose>
                              </marquee>
                       
                      <h5 class="text-white text-center bg-info w-60 h-60">Find Room or post room easily.</h5>
                      <div id="fpbtns">
                      <button class="btn btn-danger w-30"><a href="find.do">Find</a></button>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                      <button class="btn btn-danger w-30"><a href="${empty user ? 'showsignin.do' : 'post.do'}">Post</a></button>
                   </div>
                </div>

         </div>
     </main>
    <%@include file="footer.jsp" %>
        
 </body>
</html>
