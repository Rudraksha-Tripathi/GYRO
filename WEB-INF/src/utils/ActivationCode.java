package utils;

import java.util.Random;
import java.util.Date;

public class ActivationCode{
	public static String getActivationCode(){
		String code;
		Random rand = new Random();
		long x = rand.nextLong();
		if (x<1){
			x=x*(-1);
		}
		code = x+"_"+new Date().getTime();
		System.out.println("########  Activation code = "+code);
		return code;
	}
}