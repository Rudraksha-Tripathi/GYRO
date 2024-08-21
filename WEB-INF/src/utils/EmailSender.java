package utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;

import javax.mail.Transport;

public class EmailSender{
	public static boolean sendEmail(String email,String msg){
		boolean flag = false;
		Properties props = new Properties();
		props.put("mail.transport.protocol","smtp");
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.port","587");
		props.put("mail.smtp.starttls.enable","true");

		Session session = Session.getInstance(props,new EmailAuthenticator());
		MimeMessage message = new MimeMessage(session);
		
		try{
			message.setFrom(new InternetAddress("implementers2k20@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,email);

			//message.setText(msg);
			message.setContent(msg,"text/html");

			message.setSubject("GYRO verification");

			Transport.send(message);
			flag = true;
		}catch(MessagingException e){
			e.printStackTrace();
		}
		return flag;
	}
}
 class EmailAuthenticator extends Authenticator{
	public PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication("implementers2k20","4 idiots");
	}
}