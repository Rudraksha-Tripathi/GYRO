<!doctype html>
<html lang="en">
 <head>
  <title>Gyro</title>
   <%@include file="LinkTags.jsp" %>
  <link href="static/css/regform.css" type="text/css" rel="stylesheet" /> 
 </head>
 <body>
    <%@include file="header.jsp"%>
     <main style="background-image: url(static/imgs/bgimg.jpg); height: 270vh">
            <div class="container" id="regform" align="center">
                  <form action="signup.do" class="was-validated">
                      <table class="table table-hover table-striped">
                          <thead><h3 class="text-danger text-center bg-info">Registration</h3></thead>
                            <% String msg = (String)request.getAttribute("message"); %>
											<% if(msg!=null&&!msg.equals("")){ %>
                                                <div class="alert alert-danger">
												<h3><%= msg %></h3>
											<% }else{ %>
                                                <h3></h3>
                                              <% } %>
							                     </div>
                      <tr>
                          <th class="imp">UserName:</th>
                          <td>
                              <div class="form-group">
                          <input type="text" name="uname" class="form-control" placeholder="Enter Username" autofocus required />
                                  <div class="valid-feedback">valid</div>
                                  <div class="invalid-feedback">Please Enter Valid Username</div>
                              </div>
                          </td>
                      </tr>
                           <tr>
                            <th class="imp">User type</th>  
                            <td>
                             
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="customRadio" name="utype" value="1" required>
                                    <label class="custom-control-label" for="customRadio">Renter</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="customRadio2" name="utype" value="2" required>
                                    <label class="custom-control-label" for="customRadio2"> Room Seeker</label>
                                  </div>
                                <div class="invalid-feedback"></div>
                            </td>
                        </tr> 
                            <tr>
                            <th class="imp">Gender</th>  
                            <td>
                             
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="male" name="gender" value="M" required>
                                    <label class="custom-control-label" for="male">Male</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="female" name="gender" value="F" required>
                                    <label class="custom-control-label" for="female">Female</label>
                                  </div>
                                <div class="invalid-feedback"></div>
                            </td>
                        </tr> 
                      <tr>
                          <th class="imp">Email:</th>
                          <td>
                              <div class="form-group">
                          <input type="email" name="email" class="form-control" placeholder="Enter Email" pattern="[a-z0-9._]+@[a-z]+\.[a-z]{3}$" required />
                                  <div class="valid-feedback">valid</div>
                                  <div class="invalid-feedback">Please Enter Valid Email</div>
                                  
                              </div>
                          </td>
                      </tr>
                      <tr>
                        <th class="imp">Password:</th>
                          <td>
                              <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="Enter password" id="pswd" pattern="(?=.*[A-Za-z0-9]).{8,}" title="Atleast one character must be Uppercase" maxlength="14" required/>
                                    <div class="custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="Enteredpass" onclick="showPassword()">
                                    <label class="custom-control-label" for="Enteredpass">Show password</label>
                                    </div>
                                  <div class="valid-feedback">valid</div>
                                  <div class="invalid-feedback">Password must be of 8 or more characters</div>
                              </div>
                          </td>
                      </tr>
                      <tr>
                            <th class="imp">Confirm Password</th>
                          <td>
                              <div class="form-group">
                            <input type="password" name="repass" class="form-control" placeholder="Enter password again" maxlength="14" id="repass" pattern="(?=.*[A-Za-z0-9]).{8,}" required title="password must me 8 or more than 8 characters" />
                                  <div class="custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="Enteredrepass" onclick="showPassword2()">
                                    <label class="custom-control-label" for="Enteredrepass">Show password</label>
                                    </div>
                                  <div class="valid-feedback">valid</div>
                                  <div class="invalid-feedback">Please Enter valid password</div>
                              </div>
                          </td>
                      </tr>
                         
                          <tr>
                              <th class="imp">Address:</th>
                              <td>
                                  <div class="form-group">
                                <input type="text" class="form-control" name="addr" placeholder="Enter full address" required/>
                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <th class="imp">Mobile no.</th>
                              <td>
                                  <div class="form-group mob-box">
                                <input type="text" name="mobno" class="form-control mobile" placeholder="Enter Mobile no." maxlength="10" pattern="\d*" title="only numbers" required />
                                      <div class="valid-feedback">valid</div>
                                  <div class="invalid-feedback">Please Enter Valid no.</div>
                                      <button class="btn btn-primary otp-btn" id="otp_btn">Send OTP</button> 
                                      <span class="loader1"><img src="static/imgs/tiktik.gif" height="40px" width="60px"></span>
                                      <span class="otp-verified">
                                         <img src="https://media.giphy.com/media/h6a7dFl4WSVoF7FLdS/giphy.gif" height="30px" width="30px" />
                                      </span>
                                  </div><br>
                                  <div class="form-group otp-box" id="otp_box">
                                <input type="text" name="otp" class="form-control" placeholder="Enter OTP" maxlength="6" pattern="\d*" title="only numbers" required />
                                        
                                      <div class="valid-feedback">valid</div>
                                  <div class="invalid-feedback">Please Enter 6 digits Valid OTP</div>
                                          <input type="button" class="btn btn-outline-primary verify-btn" id="verify_btn" value="Verify" /> 
                                      <span class="loader2"><img src="static/imgs/tiktik.gif" height="40px" width="60px"></span>
                                      

                                  </div>
                              </td>
                          </tr>
                            <tr>
                              <th>Whatsapp no.</th>
                              <td>
                                  <div class="form-group">
                                <input type="text" name="wappno" class="form-control" placeholder="Enter Whatsapp no." pattern="\d*" title="Only numbers" maxlength="10" required/>
                                      <div class="valid-feedback">valid</div>
                                  <div class="invalid-feedback">Please Enter Valid No.</div>
                                  </div>
                              </td>
                          </tr>
                          <tr>
						<td colspan="2" align="center">
							<div class="g-recaptcha" data-sitekey="6LdVNNoZAAAAAFCdako1Kq7y28Kj5VH89No6RcJM"></div>
						</td>
					</tr>
                          <tr>
                              <td colspan="2">
                         <div><input type="submit" class="btn btn-success" value="Submit" id="sbtn"></div>
                              </td>
                          </tr>
                      </table>
                </form>
            </div>
     </main>
        
        <%@include file="footer.jsp" %>
              <script src="https://www.google.com/recaptcha/api.js" async defer></script>
                <script src="static/JS/signup.js"></script>
 </body>
</html>
