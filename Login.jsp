<!doctype html>
<head>
<title> Login Page
      </title>
    <link rel="stylesheet" href="static/css/login.css" />
   
     <%@include file="LinkTags.jsp" %>
         

   </head>
<body>   
    <%@include file="header.jsp" %>
        <main style="background-image: url(static/imgs/bgimg.jpg); font-family: georgia">
		 <form action="login.do" method="post" class="was-validated">
            <div class="login-box">
                <img src="static/imgs/usericon.png" class="usericon" />
                    <h1> Login </h1>
					<% String msg = (String)request.getAttribute("message"); %>
											<% if(msg!=null&&!msg.equals("")){ %>
                                                <div class="alert alert-danger">
												<h3><%= msg %></h3>
											<% }else{ %>
                                                <h3></h3>
                                              <% } %>
            
                <div class="form-group">
                <label for="uname">Email</label>
            <input type="email" class="form-control" placeholder="Enter Email" name="email" autofocus required>
                <div class="valid-feedback">valid</div>
                <div class="invalid-feedback">Please Enter valid username</div>
                </div>
           
            
                <div class="form-group">
                    <label for="password">Password</label>
            <input type="password" class="form-control" placeholder="Enter Password" name="password"  maxlength="14" id="password"  title="password must be 8 or more than 8 characters" required />		<!--pattern="(?=.*[A-Za-z]).{8,}" -->

                       <div class="custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input"  id="Enteredpass" onclick="showPassword()">
                        <label class="custom-control-label" for="Enteredpass">Show password</label>
                        </div>
                    <div class="valid-feedback">valid</div>
                    <div class="invalid-feedback">Please Enter valid password</div>
                        
                </div>
                 
                <div class="btn">    
                    <input type="submit" class="btn btn-outline-success lbtn" name="" value="Sign in">
                    </div>
                
           
           
            <div id="aclinks">
            <a href="#"> Forget Password</a><br>
            <a href="showsignup.do">Create a new Account </a>
            </div>
    </div>
            </form>
        </main> 
       
            <%@include file="footer.jsp" %>
            <script>
             
               const showPassword = ()=>{
                      var x = document.querySelector("#password");
                      
                      if (x.type === "password") {
                        x.type = "text";
                      }else{
                        x.type = "password";
                      }
                    };
                
            </script>
               
    </body>
</head>