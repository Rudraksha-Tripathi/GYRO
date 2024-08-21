window.onload = initAll;

function initAll(){
    getAllElements();
    setAllElements();
}

var psw,repswd,submit,otp,otpbtn,otpbox,mob,vfybtn,loader1,loader2,done;
function getAllElements(){
     psw = document.querySelector("input[name='password']");
     repswd = document.querySelector("input[name='repass']");
     otp = document.querySelector("input[name='otp']");
     mob = document.querySelector("input[name='mobno']");
     submit = document.querySelector("#sbtn")
     vfybtn = document.querySelector("#verify_btn")
     otpbtn = document.querySelector("#otp_btn")
     otpbox = document.querySelector("#otp_box")
    loader1 = document.querySelector("span[class='loader1']")            
     loader2 = document.querySelector("span[class='loader2']")
     done = document.querySelector("span[class='otp-verified']")
}
function setAllElements(){
    
   // checkPass()
    otpbtn.addEventListener('click',sendOTP);
    vfybtn.addEventListener('click',checkotp);
}

var respflag;
// var req1;
function checkotp(){
        vfybtn.style.display = 'none';
        loader2.style.display = 'block';
//		alert(otp.value)
		req = new XMLHttpRequest();
		req.open('GET','getotpno.do?inpotp='+otp.value,false);
		req.onreadystatechange = otpsent;
		req.send();
	
		
		
        if(respflag=='True'){		
            alert('OTP matched')
            otpbox.style.display = 'none';
            done.style.display = 'block';
        }else{
			alert('OTP not matched')
            otp.value='';
            vfybtn.style.display = 'block';
            loader2.style.display = 'none';
            
        }
   
}

function otpsent(){
			
			if(req.status == 200 && req.readyState == 4){
				respflag = req.responseText;
				
			}
		}

let req;
		function sendOTP(){
            if(mob.value!=''){
              
			req = new XMLHttpRequest();
			req.open('GET','sendotp.do',true);
            otpbtn.style.display = 'none';    
            loader1.style.display = 'block';
			req.onreadystatechange = sendsms;
			req.send();
		  }else{
                alert('Enter mobile no.')
            }
        }

		function sendsms(){
			if(req.status == 200 && req.readyState == 4){
				otpbox.style.display = 'block';
				alert(req.responseText);
                loader1.style.display = 'none'
			}
		}

      const showPassword = ()=>{
                      var x = document.getElementById("pswd");
                      if (x.type === "password") {
                        x.type = "text";
                      } else {
                        x.type = "password";
                      }
                    }
      const showPassword2 = ()=>{
                      var x = document.getElementById("repass");
                      if (x.type === "password") {
                        x.type = "text";
                      } else {
                        x.type = "password";
                      }
                    }