<!doctype html>
<html lang="en">
 <head>
  <title>Contact us</title>
     
 <%@include file="LinkTags.jsp" %>
     <link href="static/css/contact.css" rel="stylesheet" />
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
     
     <!-- Start of Async Callbell Code -->
<script>
  window.callbellSettings = {
    token: "tQvmrymC7dMSBFwWvxSGaJhA"
  };
</script>
<script>
  (function(){var w=window;var ic=w.callbell;if(typeof ic==="function"){ic('reattach_activator');ic('update',callbellSettings);}else{var d=document;var i=function(){i.c(arguments)};i.q=[];i.c=function(args){i.q.push(args)};w.Callbell=i;var l=function(){var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://dash.callbell.eu/include/'+window.callbellSettings.token+'.js';var x=d.getElementsByTagName('script')[0];x.parentNode.insertBefore(s,x);};if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})()
</script>
<!-- End of Async Callbell Code -->

     
 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg);">
         <div class="container">
            <%@include file="Navbar.jsp" %>
         <form action="#sendform" class="formcontainer">
    <h2> Get In Touch </h2> <h3>Contact Us For Best Hostels and Updates :-)</h3>
        
      <div class="row100">
        <div class="col">
        <div class="inputbox">
            <input type="text" name="" required="required">
            <span class="text"> First Name</span>
            <span class="line"> </span>
            </div>  
          </div>
          
          <div class="col">
        <div class="inputbox">
            <input type="text" name="" required="required">
            <span class="text"> Last Name</span>
            <span class="line"> </span>
            </div>  
          </div> 
        </div>
        
        <div class="row100">   
        <div class="col">
        <div class="inputbox">
            <input type="email" name="email" required="required">
            <span class="text"> Email</span>
            <span class="line"> </span>
            </div>  
          </div>
          
          <div class="col">
        <div class="inputbox">
            <input type="tel" name="mobile" required="required" maxlength="10"> 
            <span class="text"> Mobile No.</span>
            <span class="line"> </span>
            </div>  
          </div>    
        </div>
         
        <div class="row100">   
        <div class="col">
        <div class="inputbox textarea">
            <textarea required="required"> </textarea>
            <span class="text">Type Your Message Here...</span>
            <span class="line"> </span>
            </div>
            </div>
        </div>
        <div class="row100">   
            <div class="col">
            <input type="submit" value="Send"> 
             </div>  
        </div>    
                
            <div class="contact-sidebar">
            <div class="box">
                <div class="icon">
               <i class="fa fa-map-marker"></i>
                       <h4> ADDRESS</h4>
                       <h3>Jabalpur, 482001, India</h3>
                        </div>
                        </div> <br><br><br>
                       
                <div class="box">
                    <div class="icon">
                        <i class="fa fa-phone"></i>
                        <h4> MOBILE</h4>
                   <h3> +91 782 824 4431</h3>
                    </div>
                </div><br><br><br>
                <div class="box">
                    <div class="icon">
                        <i class="fa fa-envelope"></i>
                        <h4> EMAIL</h4>
                   <h3> gyro.69@gmail.com </h3>
                    </div>
                      </div>
                </div>        
               
        </form> 
                </div> 
     </main>
    <%@include file="footer.jsp" %>
        
 </body>
</html>
