package controllers;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import org.jasypt.util.password.StrongPasswordEncryptor;
import utils.*;
import model.*;

public class SignupServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();

		String name = request.getParameter("uname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rePassword = request.getParameter("repass");
		String usertype = request.getParameter("utype");		//utype=User1
		System.out.println(usertype);
		int x = Integer.parseInt(usertype);
		String gender = request.getParameter("gender");
		String address = request.getParameter("addr");
		String mobile = request.getParameter("mobno");
		String whatsapp = request.getParameter("wappno");

		String recaptchaCode = request.getParameter("g-recaptcha-response");
		boolean flag = Recaptcha.verifyRecaptcha(recaptchaCode);

		String nextPage = "Signup.jsp";
		String msg = null;
		
		if(rePassword.equals(password)){
			String activationCode = ActivationCode.getActivationCode();
			String message = EmailMessages.getAccountActivationMail(name,email,activationCode);
			System.out.println(message);
			if(EmailSender.sendEmail(email,message)){
				StrongPasswordEncryptor spe = new StrongPasswordEncryptor();
				String pass = spe.encryptPassword(password);
				
				//System.out.println(spe.checkPassword(pass,password));

				User user = new User();

				user.setUserName(name);
				user.setEmail(email);
				user.setPassword(pass);
				user.setMobile(mobile);
				user.setActivationCode(activationCode);
				user.setWhatsapp(whatsapp);
				///////////////  utype=User1
				//user.setUser(new UserType(usertype));
				user.setUser(new UserType(x));
				user.setAddress(address);
				user.setGender(gender);
	
				if(user.signupUser()){
					System.out.println("\nsign up done\n");
					nextPage = "AfterSignup.jsp";
				}else{
					msg = "Email already registered";
				}
				
			}else{
				msg="please enter valid EMAIL";
			}
			
		}else{
			msg = "Password and Repassword does not match";
		}
		request.setAttribute("message",msg);
		request.getRequestDispatcher(nextPage).forward(request,response);
	}
}