package HMS;

import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.util.Date;

import com.google.gson.annotations.JsonAdapter;

@JsonAdapter(LicenseJsonAdapter.class)

public class License  {
	
	public static final int LICENSE_TYPE_REQUEST = 0;
	public static final int LICENSE_TYPE_REQUEST_RENEW = 1;
	public static final int LICENSE_TYPE_NEW = 2;
	public static final int LICENSE_TYPE_REISSUE = 3;
	
	private int licenseType = LICENSE_TYPE_REQUEST;
	
	private String companyName = null;
	private String emailId = null;
	private long expirationDate = 0;
	private byte[] macAddress = null;
	private String lckey;
	private String expiry;
	private String nodays;
	public String getExpiry() {
		return expiry;
	}
	public void setExpiry(String expiry) {
		this.expiry = expiry;
	}
	public String getNodays() {
		return nodays;
	}
	public void setNodays(String nodays) {
		this.nodays = nodays;
	}
	private int lid; 
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getLckey() {
		return lckey;
	}
	public void setLckey(String lckey) {
		this.lckey = lckey;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public long getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(long expirationDate) {
		this.expirationDate = expirationDate;
	}
	protected byte[] getMacAddress() {
		return macAddress;
	}
	protected void setMacAddress(byte[] macAddress) {
		this.macAddress = macAddress;
	}
	
	private String macAddressAsString(byte[] mac) {
		StringBuilder sb = new StringBuilder();
		if(mac != null && mac.length > 0) {
			for (int i = 0; i < mac.length; i++) {
				sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
			}
		}
		return sb.toString();
		
	}
	
	private String getLicenseTypeAsString() {
		switch(this.licenseType) {
			case LICENSE_TYPE_REQUEST : return "New License Request";
			case LICENSE_TYPE_REQUEST_RENEW : return "License Renewal Request";
			case LICENSE_TYPE_NEW : return "New License";
			case LICENSE_TYPE_REISSUE : return "Renewed License"; 
		}
		return "INVALID LICENSE TYPE";
	}
	
	@Override
	public String toString() {
		StringBuilder str = new StringBuilder();
		str.append("License Type : ").append(getLicenseTypeAsString()).append("\n");
		str.append("Company Name : ").append(this.companyName).append("\n")
		    .append("Email ID : ").append(this.emailId).append("\n");							
		
		Date expiry = new Date(this.expirationDate);
		str.append("Expiration Date : ");
		if(this.expirationDate > 0 ) {
			str.append(expiry.toString());
		}
		str.append("\n");
		str.append("Mac Address : " ).append(macAddressAsString(macAddress)).append("\n");					
			
		
		return str.toString();
	}
	public int getLicenseType() {
		return licenseType;
	}
	protected void setLicenseType(int licenseType) {
		this.licenseType = licenseType;
	}
}
