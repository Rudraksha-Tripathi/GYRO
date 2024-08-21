<!doctype html>
<html lang="en">
 <head>
  <title>Gyro</title>
    <%@include file="LinkTags.jsp" %>
        <link href="static/css/roomdesc.css" rel="stylesheet">
        <%@page import="model.*" %>
 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg); height: auto">
            <div class="container">
                <%@include file="Navbar.jsp"%>
                  <div class="jumbotron" id="rpage">
                      <h1 class="text-primary bg-dark text-center font-weight-bold">${room.hname}</h1>
                      <div class="info-desc">
                        <h2 class="text-secondary-50 font-weight-bold mt-5">Info & Description</h2>
                          <div class="imgdesc">
                          <img src="static/imgs/wp1810523.jpg" class="float-left ml-2" height="160px" width="170px">
    <!--                <div class="descp float-right">-->
                              <c:if test="${room.description}">
                                 <div class="descp">
                                <h4 class="bg-secondary text-warning">description</h4>
                                  <p>${room.description}</p>
                               </div>
                              </c:if>
                             
                          </div>
                          <div class="tinfos">
                          <table class="table table-striped table-hover">
                            <tr><th>Location</th><td>${room.location}</td></tr>
                            <tr><th>Availables</th><td>${room.availble_rooms}</td></tr>
                            <tr><th>Room Type</th><td>
                                ${room.rooms_type_id.rooms_type}
							</td></tr>
                            <tr><th>Price</th><td>${room.rates}</td></tr>
                            <tr><th>Size</th><td>${room.size_of_rooms}</td></tr>
                            
                          </table>
                          </div>
                      </div><br>
                      <div class="imgsgall">
                          <h2 class="text-secondary-50 font-weight-bold mt-3">Images</h2>
                           <div class="roomcontainer">

  <!-- Full-width images with number text -->
   <% StringBuffer sb = (StringBuffer)request.getAttribute("image"); 
		String st = sb.toString();
		String[] v = st.split(" ");
		String[] alt = {"The Woods","Cinque Terre","Mountains and fjords","Northern Lights"};
	 %>
 <% if(st.length()!=0){
		for(int i=0;i<v.length;i++){ %>
  <div class="mySlides">
      <img src="roompics.do?path=<%=v[i]%>" style="width:100%">
  </div>
   <% } 
							}else{ %>
								<div class="btn btn-danger ml-3 mt-3 addimgs">No images Uploaded</div>
							<% } %>
<!--
  <div class="mySlides">
      <img src="static/imgs/Y3pTFi.jpg" style="width:100%">
  </div>

  <div class="mySlides">
      <img src="static/imgs/wp1810523.jpg" style="width:100%">
  </div>
  <div class="mySlides">
   
      <img src="static/imgs/photo-1418489098061-ce87b5dc3aee.jpg" style="width:100%">
  </div>
-->


  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>

 

  <!-- Thumbnail images -->
  <div class="row">
	
		<% if(st.length()!=0){
			for(int i=0;i<v.length;i++){ %>
			<div class="column">
		  <img src="roompics.do?path=<%=v[i]%>" class="demo cursor" style="width:100%" onclick="currentSlide(<%=i+1%>)" alt="<%=alt[i]%>">
		  </div>
	   <% } 
		}else{ %>
			<div class="btn btn-danger ml-3 mt-3 addimgs">No images Uploaded</div>
		<% } %>
	
	<!--
    <div class="column">
      <img class="demo cursor" src="static/imgs/bgimg.jpg" style="width:100%" onclick="currentSlide(1)" alt="The Woods">
    </div>
	
    <div class="column">
      <img class="demo cursor" src="static/imgs/Y3pTFi.jpg" style="width:100%" onclick="currentSlide(2)" alt="Cinque Terre">
    </div>
    <div class="column">
      <img class="demo cursor" src="static/imgs/wp1810523.jpg" style="width:100%" onclick="currentSlide(3)" alt="Mountains and fjords">
    </div>
    <div class="column">
      <img class="demo cursor" src="static/imgs/photo-1418489098061-ce87b5dc3aee.jpg" style="width:100%" onclick="currentSlide(4)" alt="Northern Lights">
    </div>
	-->
 
  </div>
</div>
                      </div><br>
                      <div class="services">
                         <h2 class="text-secondary-50 font-weight-bold mt-3">Services</h2>
                          <ul class="list-group services-av">
                              
                          </ul>
                      </div><br>
                      <div class="paymodes">
                         <h2 class="text-secondary-50 font-weight-bold mt-3">Payment modes</h2>
                          <ul class="list-group pymodes">
                             
                          </ul>
                      </div>
					  <%	
                Rooms room = (Rooms)request.getAttribute("room");
                Services srv = room.getServices_id();
				PaymentModes pym = room.getPayment_mode_id();
			%>
			<input type="hidden" id="pym" value=<%= pym.getPaymentMode_id() %>>
			<input type="hidden" id="srv" value=<%= srv.getServices_id() %>>
                 </div>
            </div>
     </main>
    <%@include file="footer.jsp" %>
        <script src="static/JS/roomdesc.js">
       
</script>
        
 </body>
</html>
