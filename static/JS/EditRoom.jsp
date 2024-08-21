<!doctype html>
<html lang="en">
 <head>
  <title>Gyro</title>
    <%@include file="LinkTags.jsp" %>
        <link href="static/css/editroom.css" rel="stylesheet">
        
 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg); height: auto">
            <div class="container">
                <%@include file="Navbar.jsp"%>
                     <form action="roomupdate.do" method="post" class="was-validated">
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
                                    <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="customRadio" name="htype" value="1" />
                                    <label class="custom-control-label" for="customRadio">Boys</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="customRadio2" name="htype" value="2" >
                                    <label class="custom-control-label" for="customRadio2"> Girls </label>
                                  </div>
                                  </td></tr>
                            <tr><th>Location</th><td>
                                <div class="form-group">
                                     <input type="text" name="location" class="form-control"
                                            value="wright town" />
                                      <div class="valid-feedback"></div>
                                      <div class="invalid-feedback"></div>
                                </div>
                                </td></tr>
                            <tr>
                                <th>Availables</th><td>
                                     <div class="form-group">
                                        <input type="number" class="form-control" name="available"  value="0"/>
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
                                <input type="text" name="rates" value="9999" class="form-control" maxlength="10" pattern="\d*" title="only numbers" />
                                      <div class="valid-feedback"></div>
                                  <div class="invalid-feedback"></div>
                                  </div>
                                </td></tr>
                            <tr><th>Size</th><td>
                                     <div class="form-group">
                                      <input type="number" name="size" class="form-control" value="0.0sqft" pattern="\d*" title="Only numbers"/>
                                      <div class="valid-feedback"></div>
                                  <div class="invalid-feedback"></div>
                                  </div>
                                </td></tr>
                            <tr><th>Description</th><td>
                                     <div class="form-group">
                                      <input type="text" name="description" class="form-control" value="something"/>
                                      <div class="valid-feedback"></div>
                                  <div class="invalid-feedback"></div>
                                  </div>
                                </td></tr>
                            
                          </table>
                          </div>
                        <br>
                     
                      <div class="services">
                         <h2 class="text-secondary-50 font-weight-bold mt-3">Services</h2>
                          <ul class="list-group">
                              <li class="list-group-item list-group-item-danger">Tiffin Service</li>
                              <li class="list-group-item list-group-item-warning">Security</li>
                              <li class="list-group-item list-group-item-success">Hygine</li>
                              <li class="list-group-item list-group-item-info">AC</li>
                              
                          </ul>
                          <input type="button" class="btn btn-info mt-3 ml-3" onclick="changeListItems()" value="Change">
                          <table  class="table table-striped table-hover change-services">
                             <tr>
                                 <th class="imp">Services</th>
                                 <td>
                                   <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="tiffin" name="services">
                                        <label class="custom-control-label" for="tiffin">Tiffin</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="AC" name="services">
                                        <label class="custom-control-label" for="AC">AC</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="clean" name="services">
                                        <label class="custom-control-label" for="clean">Hygine and cleanliness</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="security" name="services">
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
                          <ul class="list-group">
                              <li class="list-group-item list-group-item-action">Paytm</li>
                              <li class="list-group-item list-group-item-action">UPI</li>
                              <li class="list-group-item list-group-item-action">Cash</li>
                              <li class="list-group-item list-group-item-action">Account Transfer</li>
                          </ul>
                          <input type="button" class="btn btn-warning mt-3 ml-3" onclick="changeListItems()" value="Change">
                           <table  class="table table-striped table-hover change-paymodes">
                               <tr>
                                   <th class="imp">Payment modes</th>
                                   <td>
                                   <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="cash" name="payment">
                                        <label class="custom-control-label" for="cash">Cash</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="Paytm" name="payment">
                                        <label class="custom-control-label" for="Paytm">PayTM</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="gpay" name="payment">
                                        <label class="custom-control-label" for="gpay">Google Pay or UPI</label>
                                  </div>
                                  <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="Account" name="payment">
                                        <label class="custom-control-label" for="Account">Account Transfer</label>
                                  </div>
                              </td>
                          </tr>
                          
                          </table>
                      </div>
                        <input type="submit" class="btn btn-success mt-5 ml-5 rounded" value="Update"/>
                    </div>
                </form>
             </div>  
            
     </main>
    <%@include file="footer.jsp" %>
    <script src="static/JS/editroom.js">
	</script>
 </body>
</html>
