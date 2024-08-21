package utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.HttpURLConnection;
import java.net.URLEncoder;
 
public class TextLocalSMS {
	public static String sendSms(String mobile,String otp) {
		try {
			// Construct data			Ruddy-	"Y7jaqPV39W8-zS6Tb5rhnMWmKoUuLLegaPpUO3hsk5"
			//9eIOhmc5G1A-F3ngP7Uuvf5tS2PWbjxzsbftvIwWfV
			String apiKey = "apikey=" + "9eIOhmc5G1A-F3ngP7Uuvf5tS2PWbjxzsbftvIwWfV";
			String message = "&message=" + "Do not share with anyone. Call us at 9098213689 immediatly if you did not request for it. Your OTP is:"+otp;
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + mobile;
			
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			System.out.println(otp);
			return stringBuffer.toString();
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			return "Error "+e;
		}
	}
}