package HMS;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

public class LicenseManager {

	private static LicenseManager _instance = null;
	private License license = null;
	private Encryption encryption = null;

	private LicenseManager() throws Exception {		
		encryption = new Encryption();
	}
	
	public static LicenseManager getInstance() throws Exception {
		if(_instance == null) {
			_instance = new LicenseManager();
		}
		return _instance;
	}
		
	private static class Encryption {
		private SecretKeySpec secretKey;
		private Cipher cipher;
		
		private static final String ALGORITHM = "AES";
		private static final String ENCRYPTION_KEY = "#t@chw@dg@!2345#";
		
		protected Encryption() throws UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException {
			byte[] key = ENCRYPTION_KEY.getBytes("UTF-8");
			this.secretKey = new SecretKeySpec(key, ALGORITHM);
			this.cipher = Cipher.getInstance(ALGORITHM);
			
		}
		
		protected byte[] encrypt(String string) throws UnsupportedEncodingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
			byte[] input = string.getBytes("UTF-8");
			this.cipher.init(Cipher.ENCRYPT_MODE, this.secretKey);
			return this.cipher.doFinal(input);
		}

		protected String decrypt(byte[] encryptedString) throws UnsupportedEncodingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
			//byte[] input = encryptedString.getBytes("UTF-8");
			this.cipher.init(Cipher.DECRYPT_MODE, this.secretKey);
			return new String(this.cipher.doFinal(encryptedString)); //.toString();
		}		
	}
	
	public static License getLicense() {
		if(_instance.license == null) {
			_instance.license = new License();
		}
		return _instance.license;
	}
	
	public static License getNewLicense() {
		return new License();
	}
	
	private static byte[]  readSystemMacAddress() throws UnknownHostException, SocketException  { 
		InetAddress ip = InetAddress.getLocalHost();
		NetworkInterface network = NetworkInterface.getByInetAddress(ip);
		byte[] mac = network.getHardwareAddress();
		return mac;
	}
	
	public static void captureHardwareAddress(License license) throws Exception  {
		byte[] macAddress = readSystemMacAddress();
		if(license == null) {
			license = getInstance().license;
		}
		license.setMacAddress(macAddress);
		
	}	
	public static String encryptLicense(License license) throws Exception  {
		GsonBuilder builder = new GsonBuilder();
	    Gson gson = builder.create();
		String licenseJson = gson.toJson(license);
		byte[] encryptedBytes = getInstance().encryption.encrypt(licenseJson);
		return byteArrayToHex(encryptedBytes);		
	}
	
	public static License decryptLicense(String encryptedLicense) throws Exception  {
		GsonBuilder builder = new GsonBuilder();
	    Gson gson = builder.create();		
	    byte[] encryptedBytes = hexStringToByteArray(encryptedLicense);
		String licenseJson = getInstance().encryption.decrypt(encryptedBytes);
		
		License license = gson.fromJson(licenseJson, License.class);
		return license;		
	}
	
	public static String byteArrayToHex(byte[] a) {
		   StringBuilder sb = new StringBuilder(a.length * 2);
		   for(byte b: a)
		      sb.append(String.format("%02x", b));
		   return sb.toString();
	}
	
	public static byte[] hexStringToByteArray(String hex) {
	    int l = hex.length();
	    byte[] data = new byte[l/2];
	    for (int i = 0; i < l; i += 2) {
	        data[i/2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
	                             + Character.digit(hex.charAt(i+1), 16));
	    }
	    return data;
	}
	
//verify 
	public static String licence() throws Exception {
		String result = "";
		License license = LicenseManager.getNewLicense();
  		license.setLicenseType(License.LICENSE_TYPE_REQUEST);
  		LicenseManager.captureHardwareAddress(license);
  		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("data-source-cfg.xml");
  		controllerDao manager = (controllerDao) context.getBean("dao");
        List<License> list4 = manager.getLusers();
     
		 License license1 = LicenseManager.decryptLicense(list4.get(0).getLckey());
		    Date expirationDate = null;
		    Date date = new Date();
		    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			 
		 
		if(byteArrayToHex(license.getMacAddress()).equals(byteArrayToHex(license1.getMacAddress()))){
			if(System.currentTimeMillis() <= license1.getExpirationDate()){
	
				result ="true";
			}
			else{
				
				result="false";
			}
			}
		else{
			result = "diffmac";
		}
		// TODO Auto-generated method stub
		return result;
	}
	
	

}
