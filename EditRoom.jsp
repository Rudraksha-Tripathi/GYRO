<!doctype html>
<html lang="en">
 <head>
  <title>Gyro</title>
    <%@include file="LinkTags.jsp" %>
        <link href="static/css/editroom.css" rel="stylesheet">
          <%@page import="model.*" %>
        
 </head>
 <body>
    <%@include file="header.jsp" %>
	            <%	
                Rooms room = (Rooms)request.getAttribute("room");
                Services srv = room.getServices_id();
				PaymentModes pym = room.getPayment_mode_id();
			%>
     <main style="background-image: url(bgimg.jpg); height: auto">
            <div class="container">
                <%@include file="Navbar.jsp"%>
                     <form action="roomupdate.do" >
                  <div class="jumbotron" id="rpage">
                       
                          <div class="tinfos">
                              <h2 class="text-secondary-50 font-weight-bold mt-3">Basic Informations</h2>
                          <table class="table table-striped table-hover">
                              <tr>
                                  <th>Hostel name: </th><td>
                                  <div class="form-group">
                                     <input type="text" name="hname" class="form-control" value="${room.hname}"/>
                                      <div class="valid-feedback"></div>
                                      <div class="invalid-feedback"></div>
                                  </div>
                                  </td>
                              </tr>
                              <tr><th>Hostel type: </th><td>
							
                                  
                                    <select  name="htype"  >
												<%if(room.getHostelForId().gethostelFor_id()==1){%>
									 <option selected value="1" >Boys</option>
											 <option value="2" > Girls </option>
								  <%}else{%>
								   <option value="1" >Boys</option>
								  <option selected value="2"> Girls </option>

								  <%}%>
								  </select>
                                  </td></tr>
                            <tr><th>Location</th><td>
                                <div class="form-group">
                                     <input type="text" name="location" class="form-control"
                                            value="${room.location}" />
                                      <div class="valid-feedback"></div>
                                      <div class="invalid-feedback"></div>
                                </div>
                                </td></tr>
                            <tr>
                                <th>Availables</th><td>
                                     <div class="form-group">
                                        <input type="number" class="form-control" name="available" value="${room.availble_rooms}" />
                                  </div>  
                                </td>
                              </tr>
                              <tr><th>Room Type</th><td>
                                    <select name="Roomtype" class="custom-select">
                                   
                                    <option value="1">Single</option>
                                    <option value="2">Double</option>
                                </select>
                                <div class="invalid-feedback">Please Select One</div>
                                  </td></tr>
                            <tr><th>Price</th><td>
                                     <div class="form-group">
                                <input type="text" name="rates" value="${room.rates}" class="form-control" maxlength="10" pattern="\d*" title="only numbers" />
                                      <div class="valid-feedback"></div>
                                  <div class="invalid-feedback"></div>
                                  </div>
                                </td></tr>
                            <tr><th>Size</th><td>
                                     <div class="form-group">
                                      <input type="number" name="size" class="form-control" value="${room.size_of_rooms}" pattern="\d*" title="Only numbers"/>
                                      <div class="valid-feedback"></div>
                                  <div class="invalid-feedback"></div>
                                  </div>
                                </td></tr>
                              
                              <tr><th>Description</th><td>
                                     <div class="form-group">
                                      <textarea name="descp" rows="4" cols="50" style="border: 1px solid white; border-radius: 5px;">
                                         ${room.description}
                                         </textarea>
                                  </div>
                                </td></tr>
                            
                          </table>
                          </div>
                        <br>
                     
                      <div class="services">
                         <h2 class="text-secondary-50 font-weight-bold mt-3">Services</h2>
                          <ul class="list-group services-av">
                            
                              
                          </ul>
                          <input type="button" class="btn btn-info mt-3 ml-3 change-sbtn" value="Change">
                          <table  class="table table-striped table-hover change-services">
                             <tr>
                                 <th class="imp">Services</th>
                                 <td>
                                   <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="tiffin" name="services" value="tiffin">
                                        <label class="custom-control-label" for="tiffin">Tiffin</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="AC" name="services" value="AC">
                                        <label class="custom-control-label" for="AC">AC</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="clean" name="services" value="clean">
                                        <label class="custom-control-label" for="clean">Hygine and cleanliness</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="security" name="services" value="security">
                                        <label class="custom-control-label" for="security">Security</label>
                                  </div>
                                   <div class="valid-feedback"></div>
                                  <div class="invalid-feedback"></div>
                              </td>
                          </tr>
                          
                          </table>
                      </div><br>
                      <div class="paymodes">
                         <h2 class="text-secondary-50 font-weight-bold mt-3">Payment modes</h2>
                          <ul class="list-group pymodes">
                             
                          </ul>
                          <input type="button" class="btn btn-warning mt-3 ml-3 change-pbtn" value="Change" onclick="changePayModeList();">
                           <table  class="table table-striped table-hover change-paymodes">
                               <tr>
                                   <th class="imp">Payment modes</th>
                                   <td>
                                   <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="cash" name="payment" value="cash">
                                        <label class="custom-control-label" for="cash">Cash</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="Paytm" name="payment" value="paytm">
                                        <label class="custom-control-label" for="Paytm">PayTM</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="gpay" name="payment" value="gpay">
                                        <label class="custom-control-label" for="gpay">Google Pay or UPI</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="Account" name="payment" value="account">
                                        <label class="custom-control-label" for="Account">Account Transfer</label>
                                  </div>
                              </td>
                          </tr>
                          
                          </table>
                      </div>
                        <input type="submit" class="btn btn-success mt-5 ml-5 rounded" value="Update"/>
                    </div>
                </form>

			<input type="hidden" id="pym" value=<%= pym.getPaymentMode_id() %>>
			<input type="hidden" id="srv" value=<%= srv.getServices_id() %>>
             </div>  
            
     </main>
    <%@include file="footer.jsp" %>
       <script src="static/JS/editroom.js"></script>
 </body>
</html>
