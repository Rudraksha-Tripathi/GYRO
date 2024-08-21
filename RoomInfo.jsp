<!doctype html>
<html lang="en">
 <head>
  <title>Room Info</title>
     
   <%@include file="LinkTags.jsp" %>
       <link href="static/css/roominfo.css" rel="stylesheet" />
 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg); height: 260vh;">
            <div class="container">
           <%@include file="Navbar.jsp" %>
                     <form action="roominfo.do" class="was-validated" id="roomform">
                      <table class="table table-hover table-striped">
                          <thead><h3 class="text-warning text-center bg-secondary">Fill Room Informations</h3></thead>
                         
                      <tr>
                          <th class="imp">Hostal name:</th>
                          <td>
                              <div class="form-group">
                          <input type="text" name="hname" class="form-control" placeholder="Enter Hostal Name" autofocus required />
                                  <div class="valid-feedback"></div>
                                  <div class="invalid-feedback"></div>
                              </div>
                          </td>
                      </tr>
                           <tr>
                            <th class="imp">Hostal for</th>  
                            <td>
                             
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="customRadio" name="htype" value="1" required>
                                    <label class="custom-control-label" for="customRadio">Boys</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="customRadio2" name="htype" value="2" required>
                                    <label class="custom-control-label" for="customRadio2"> Girls </label>
                                  </div>
                            </td>
                        </tr>    
                      <tr>
                          <th class="imp">Location:</th>
                          <td>
                              <div class="form-group">
                          <input type="text" name="location" class="form-control" placeholder="Enter location" required />
                                  <div class="valid-feedback"></div>
                                  <div class="invalid-feedback"></div>
                                  
                              </div>
                          </td>
                      </tr>
                    
                         
                          <tr>
                              <th class="imp">Available Rooms:</th>
                              <td>
                                  <div class="form-group">
                                <input type="number" class="form-control" name="available" placeholder="Enter No. of Rooms available" value="0" required/>
                                  </div>
                              </td>
                          </tr>
                            
                             <tr>
                            <th class="imp">Room Types</th>  
                            <td>
                             
                                 <select name="Roomtype" class="custom-select">
                                    <option selected> Select Menu</option>
                                    <option value="1">Single</option>
                                    <option value="2">Double</option>
                                </select>
                                <div class="invalid-feedback">Please Select One</div>
                            </td>
                        </tr>    
                          
                          <tr>
                              <th class="imp">Rates per room</th>
                              <td>
                                  <div class="form-group">
                                <input type="text" name="rates" class="form-control" placeholder="Enter Rates" maxlength="10" pattern="\d*" title="only numbers" required />
                                      <div class="valid-feedback"></div>
                                  <div class="invalid-feedback"></div>
                                  </div>
                              </td>
                          </tr>
                            <tr>
                              <th class="imp">Size of room</th>
                              <td>
                                  <div class="form-group">
                                <input type="number" name="size" class="form-control" placeholder="Enter Size in sq. ft." pattern="\d*" title="Only numbers" required/>
                                      <div class="valid-feedback"></div>
                                  <div class="invalid-feedback"></div>
                                  </div>
                              </td>
                          </tr>
                            
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
                            <tr>
                              <th>Description</th>
                              <td>
                                   <textarea name="descp" id="desc"></textarea>
                              </td>
                          </tr>
                       
                          <tr>
                              <td colspan="2">
                         <div><input type="submit" class="btn btn-success" value="Update" id="ubtn"></div>
                              </td>
                          </tr>
                      </table>
                </form>
         </div>
     </main>
    <%@include file="footer.jsp" %>
        <script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>

 </body>
</html>
