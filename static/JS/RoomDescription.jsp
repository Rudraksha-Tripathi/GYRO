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
                      <h1 class="text-primary bg-dark text-center font-weight-bold"><input type="text" disabled value="${room.hname}"/> </h1>
                      <div class="info-desc">
                        <h2 class="text-secondary-50 font-weight-bold mt-5">Info & Description</h2>
                          <div class="imgdesc">
                          <img src="static/imgs/wp1810523.jpg" class="float-left ml-2" height="160px" width="170px">
    <!--                <div class="descp float-right">-->
                                 <div class="descp">
                                <h4 class="bg-secondary text-warning">description</h4>
                                  <p><input  disabled type="text" value="${room.description}" /></p>
					             </div>
                             
                          </div>
                          <div class="tinfos">
                          <table class="table table-striped table-hover">
                            <tr><th>Location</th><td><input disabled type="text" value="${room.location}" /></td></tr>
                            <tr><th>Availables</th><td><input  disabled type="text" value="${room.availble_rooms}" /></td></tr>
                            <tr><th>Room Type</th><td>
								<input type="text"  disabled value="${room.rooms_type_id.rooms_type}" />
								<!--<select name="Roomtype" class="custom-select">
                                    <option selected value="1">Single</option>
                                    <option value="2">Double</option>
								</select>-->
								
							</td></tr>
                            <tr><th>Price</th><td><input  disabled type="text" value="${room.rates}" /></td></tr>
                            <tr><th>Size</th><td><input  disabled type="text" value="${room.size_of_rooms}" /></td></tr>
                            
                          </table>
                          </div>
                      </div><br>
                      <div class="imgsgall">
                          <h2 class="text-secondary-50 font-weight-bold mt-3">Images</h2>
                           <div class="roomcontainer">

  <!-- Full-width images with number text -->
  <div class="mySlides">
      <img src="static/imgs/bgimg.jpg" style="width:100%">
  </div>

  <div class="mySlides">
      <img src="static/imgs/Y3pTFi.jpg" style="width:100%">
  </div>

  <div class="mySlides">
      <img src="static/imgs/wp1810523.jpg" style="width:100%">
  </div>
  <div class="mySlides">
   
      <img src="static/imgs/photo-1418489098061-ce87b5dc3aee.jpg" style="width:100%">
  </div>



  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>

 

  <!-- Thumbnail images -->
  <div class="row">
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
 
  </div>
</div>
                      </div><br>
                      <div class="services">
                         <h2 class="text-secondary-50 font-weight-bold mt-3">Services</h2>
                          <ul class="list-group">
                              <li class="list-group-item list-group-item-danger">Tiffin Service</li>
                              <li class="list-group-item list-group-item-warning">Security</li>
                              <li class="list-group-item list-group-item-success">Hygine</li>
                              <li class="list-group-item list-group-item-info">AC</li>
                          </ul>
                      </div><br>
                      <div class="paymodes">
                         <h2 class="text-secondary-50 font-weight-bold mt-3">Payment modes</h2>
                          <ul class="list-group">
                              <li class="list-group-item list-group-item-action">Paytm</li>
                              <li class="list-group-item list-group-item-action">UPI</li>
                              <li class="list-group-item list-group-item-action">Cash</li>
                              <li class="list-group-item list-group-item-action">Account Transfer</li>
                          </ul>
                      </div>
					  <%	Rooms room = (Rooms)request.getAttribute("room");
				Services srv = room.getServices_id();
				PaymentModes pym = room.getPayment_mode_id();
			%>
			<input type="hidden" id="pym" value=<%= pym.getPaymentMode_id() %>>
			<input type="hidden" id="srv" value=<%= srv.getServices_id() %>>
                 </div>  
            </div>
     </main>
    <%@include file="footer.jsp" %>
        <script>
        document.onload = load();
		function load(){
			loadPayMode();
			loadServices();
			}
		
		function loadServices(){
			var req = new XMLHttpRequest();
			var i = document.getElementById("srv");
			var url = "service.do?serviceid="+i.value;
			req.open("GET",url,true);
			req.onreadystatechange = function(){
				if(req.readyState==4&&req.status==200){
					alert(req.responseText);
				}
			};
			req.send();
		}
		function loadPayMode(){
			var req = new XMLHttpRequest();
			var i = document.getElementById("pym");
			var url = "pymode.do?pymodeid="+i.value;
			req.open("GET",url,true);
			req.onreadystatechange = function(){
				if(req.readyState==4&&req.status==200){
					alert(req.responseText);
				}
			};
			req.send();
		}

	var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  
}
</script>
        
 </body>
</html>
