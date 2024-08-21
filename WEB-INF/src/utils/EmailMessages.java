package utils;

public class EmailMessages{
	public static String getAccountActivationMail(String userName,String email, String activationCode){
		String url = "http://localhost:8080/_Minor/act.do?email="+email+"&activationCode="+activationCode;
		String accountActivationMessage = 
					  "<!doctype html>"+
						"<html lang='en'>"+
						 "<head>"+
						  "<meta charset='UTF-8'>"+
						 "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>"+
					  "<style>"+
						"#container{"+
							"background-color: #eee;"+
							"height: 500px;"+
							"padding-top: 50px;"+
						"}"+
						"#msg{"+
							"font-family: arial;"+
							"padding: 20px 50px;"+
						"}"+
						"h2{"+
								"background-color: grey;"+
								"color: dark-orange"+
								"}"+
								".btn{"+
								"background-color: DarkBlue;"+
								"border-radius: 5%;"+
								"color: white"+
								"}"+
							".btn:hover{"+
								"background-color: DeepSkyBlue;"+
								"}"+
								".btn a{"+
								"color: white;"+
								"text-decoration: none;"+
								"}"+		
					  "</style>"+
					"<title>Document</title>"+
					 "</head>"+
					 "<body>"+ 	
					  
					  "<div id='container'>"+
						"<h2>GYRO - Get Your Room Own</h2>"+
						"<div id='msg'>"+
							"<h3><p>Welcome "+userName+"</p></h3>"+

							"<h3><p>Your Registration is successful...</p></h3>"+
							
							"<p>Click on Activate to  Activate your account:</p>"+
							"<form method='post' action="+url+">"+
							"<input type='submit' value='Activate' class='btn'>"+
								"</form>"+
						"</div>"+
					  "</div>"+
					"</body>"+
				"</html>";

		return accountActivationMessage;
	}	
}