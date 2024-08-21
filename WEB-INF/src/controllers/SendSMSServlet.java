package controllers;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

import com.google.gson.Gson;
import utils.*;

public class SendSMSServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		HttpSession session = request.getSession();
		String msg = "OTP sent to your mobile no.";
		String mobile = (String)request.getParameter("mobile");
		String otp = OtpGenerator.generateOtp();
		System.out.println(otp);
		String resp = TextLocalSMS.sendSms(mobile,otp);

		session.setAttribute("sentotp",otp);
		
		resp = new Gson().toJson(resp);
		response.getWriter().write(resp);
	}
}
