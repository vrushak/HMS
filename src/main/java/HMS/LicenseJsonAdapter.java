package HMS;

import java.io.IOException;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

public class LicenseJsonAdapter  extends TypeAdapter<License> {

	@Override
	public void write(JsonWriter out, License value) throws IOException {
		// TODO Auto-generated method stub
		out.beginObject();
		out.name("requestType").value(value.getLicenseType());
		out.name("companyName").value(value.getCompanyName());
		out.name("emailId").value(value.getEmailId());
		out.name("expirationDate").value(value.getExpirationDate());
		out.name("macAddress").value(LicenseManager.byteArrayToHex(value.getMacAddress()));
		out.endObject();
	}

	@Override
	public License read(JsonReader in) throws IOException {
		// TODO Auto-generated method stub
		final License license = new License();
		in.beginObject();
		while(in.hasNext()) {
			String name = in.nextName();
			if(name.equals("requestType")) {
				int licenseType = in.nextInt();
				license.setLicenseType(licenseType);
			} else if(name.equals("companyName")) {
				String companyName = in.nextString();
				license.setCompanyName(companyName);
			} else if(name.equals("emailId")) {
				String emailId = in.nextString();
				license.setEmailId(emailId);
			} else if(name.equals("expirationDate")) {
				long expirationDate = in.nextLong();
				license.setExpirationDate(expirationDate);
			} else if(name.equals("macAddress")) {
				String macAddress = in.nextString();
				license.setMacAddress(LicenseManager.hexStringToByteArray(macAddress));
			} 
		}		
		in.endObject();
		return license;
	}
	
}