package utils;
import java.net.URL;
import java.net.HttpURLConnection;
import javax.json.Json;
import javax.json.JsonReader;
import javax.json.JsonObject;
import java.io.*;

public class Recaptcha
{
		public static boolean verifyRecaptcha(String recaptchaCode)  throws IOException{
		
					String recaptchaUrl = "https://www.google.com/recaptcha/api/siteverify";
					String params = "secret=6LdVNNoZAAAAAE__vYV-9r-3nnBWzZCCTArYiuMv&response="+recaptchaCode;
						
					URL url = new URL(recaptchaUrl+"?"+params);
					HttpURLConnection con = (HttpURLConnection)url.openConnection();
					con.setRequestMethod("POST");
					con.setDoOutput(true);
					
					DataOutputStream dos = new DataOutputStream(con.getOutputStream());
					dos.flush();
					dos.close();
						
					JsonReader jr = Json.createReader(con.getInputStream());
					JsonObject jo = jr.readObject();

					boolean verify = jo.getBoolean("success");
					return verify;
		}
}