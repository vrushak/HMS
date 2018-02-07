package HMS;

import java.net.HttpURLConnection;
import java.net.URL;
import java.io.*;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;

public class send_sms {
	
		static String api_key ;
	    static String sender_id;
		String mob_no;
		String message;

			public  void setparams(String apikey,String senderid)
			{ 
			    api_key	=	apikey;
			    sender_id	= 	senderid;
			}

			public String process_sms(String mob_no,String message) throws IOException, KeyManagementException, NoSuchAlgorithmException
			{    	
				String message1=URLEncoder.encode(message, "UTF-8");				
		        URL url = new URL("https://instantalerts.co/api/web/send/?apikey=64200da0029b2it409pl98r58wotqy6v&sender=SEDEMO&to="+mob_no+"&message="+message1+"&format=json");
		     //   System.out.println("url look like " + url );
			    HttpURLConnection con = (HttpURLConnection) url.openConnection();
			    con.setRequestMethod("GET");
			    con.setDoOutput(true);
			    con.getOutputStream();
			    con.getInputStream();
			    BufferedReader rd;
			    String line;
	            String result = "";
	            rd = new BufferedReader(new InputStreamReader(con.getInputStream()));
	           while ((line = rd.readLine()) != null)
	            {
	               result += line;
	            }
		        rd.close(); 
		        System.out.println("Result is" + result);
				return result;				
			}
	
	     
	    public  void send_sms(String mob_no,String message) throws IOException, KeyManagementException, NoSuchAlgorithmException
		{    
	    	 process_sms(mob_no, message);  										
		}
	     
}

