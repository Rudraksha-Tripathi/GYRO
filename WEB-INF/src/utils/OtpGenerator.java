package utils;
import java.util.*;

public class OtpGenerator{
	public static String generateOtp(){
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i=0;i<6;i++){
			sb.append(random.nextInt(9)+1);
		}
		String otp = sb.toString();
		return otp;
	}
}