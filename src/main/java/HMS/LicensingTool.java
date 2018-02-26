package HMS;

import java.io.Reader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class LicensingTool {
	
	private static int printMainMenu() {
		int choice = 0; 
		while(choice <=0  || choice > 4) {
			if(choice != 0) {
				System.out.println("\n"+choice+" is not valid option. Please enter a valid number.\n");
			}
			System.out.println("\nMAIN MENU");
			System.out.println("=================================");
			System.out.println("1. License Request");
			System.out.println("2. Generate License");
			System.out.println("3. Preview License");
			System.out.println("4. Exit");
			System.out.print("Please enter your choice (1-4) : ");	
			Scanner in = new Scanner(System.in);
			choice = in.nextInt();
		}
		return choice;
	}
	
	private static boolean processMainMenuChoice(int choice) throws Exception  {
		if(choice != 4) {
			switch(choice) {
				case 1: handleLicenseRequest(); break;
				case 2:  handleGenerateLicense(); break;
				case 3:  handlePreviewLicense(); break;
			}
			return false;
		} else {
			return true;
		}
	}
	
	private static void promptLicenseRequestData(License license) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("\nPlease fill the following details to generate License request");
		System.out.println("==============================================================");
		System.out.print("1. Company Name : ");
		String companyName = scanner.nextLine();
		license.setCompanyName(companyName);
		System.out.print("2. Email ID : ");
		String emailId = scanner.nextLine();
		license.setEmailId(emailId);
	}
		
	 
	private static void handleLicenseRequest() throws Exception {
		License license = LicenseManager.getNewLicense();
		license.setLicenseType(License.LICENSE_TYPE_REQUEST);
		LicenseManager.captureHardwareAddress(license);
		promptLicenseRequestData(license);
		String encryptedLicense = LicenseManager.encryptLicense(license);
		System.out.println("\nGenerated License Request is below");
		System.out.println("==================================================\n");
		System.out.println(encryptedLicense);
		System.out.println("\n==================================================");
		
	}
	
	private static void handleGenerateLicense() throws Exception {
		Scanner scanner = new Scanner(System.in);
		System.out.println("\nPlease paste the generated request license key below and hit ENTER");
		System.out.println("======================================================================");
		String encryptedLicenseKey = scanner.nextLine();
		License license = LicenseManager.decryptLicense(encryptedLicenseKey);
		System.out.println("\nRequested License Details");
		System.out.println("============================================================================\n");
		System.out.println(license);
		System.out.println("\n============================================================================\n");
		boolean validDate = false;
		String expirationDateString = null;
		Date expirationDate = null;
		while(!validDate) {
			try {
				System.out.print("\n\n Enter Expiration Date (yyyy-MM-dd hh:mm:ss) : ");
				expirationDateString = scanner.nextLine();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				expirationDate = format.parse(expirationDateString);
				validDate = true;
			} catch(ParseException pe) {
				System.out.println("\n\n"+expirationDate+" is not a valid format.");
			}
		}
		if(expirationDate != null) {
			license.setExpirationDate(expirationDate.getTime());
		}
		license.setLicenseType(License.LICENSE_TYPE_NEW);
		
		String encryptedLicense = LicenseManager.encryptLicense(license);
		System.out.println("\nGenerated License Request is below");
		System.out.println("============================================================================\n");
		System.out.println(encryptedLicense);
		System.out.println("\n============================================================================\n");	
		
	}
	private static void handlePreviewLicense() throws Exception {
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("\nPlease paste the generated license key below and hit ENTER");
		System.out.println("==============================================================");
		String encryptedLicenseKey = scanner.nextLine();
		License license = LicenseManager.decryptLicense(encryptedLicenseKey);
		System.out.println("\nLicense Details");
		System.out.println("============================================================================\n");
		System.out.println(license);
		System.out.println("\n============================================================================\n");
	}
	
	

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		boolean done = false; 
		while(!done ) {
			int choice = printMainMenu();
			done = processMainMenuChoice(choice);
		}
		System.out.println("\n\nThank you for using the Licensing Tool.");		

	}

}
