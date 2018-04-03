package HMS;


import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
@Controller
public class Logincontroller {
	
	@Autowired  
	controllerDao dao;
	@Autowired 
	doctControllerDao ddao;
	@Autowired 
	nurseControllerDao ndao;
	@Autowired 
	staffControllerDao sdao;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView adminPage() {
		    List<Appointment> list = dao.getAppointment1();
			List<Diagnose> list1 = ddao.getOpd();
			List<Prescription2> list2 = ddao.getIpd();
			List<Billgen> list3 = dao.getBm();
			List<Billgen> list4 = dao.getBd();
	  Map<String, Object> model = new HashMap<String, Object>();
	            model.put("list",list);
	            model.put("list1",list1);
	            model.put("list2",list2);
	            model.put("list3",list3);
	            model.put("list4",list4);
	            return new ModelAndView("Home","model",model); 
	  			
    }
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView homePage() {
	    List<Appointment> list = dao.getAppointment1();
				List<Diagnose> list1 = ddao.getOpd();
				List<Prescription2> list2 = ddao.getIpd();
				List<Billgen> list3 = dao.getBm();
				List<Billgen> list4 = dao.getBd();
		  Map<String, Object> model = new HashMap<String, Object>();
		            model.put("list",list);
		            model.put("list1",list1);
		            model.put("list2",list2);
		            model.put("list3",list3);
		            model.put("list4",list4);
		            return new ModelAndView("Home","model",model); 
    }
 
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage(HttpServletRequest request,Principal principal,Authentication authentication ) throws Exception {
    	List<License> list = dao.getLusers();
     	try{
    	License license = LicenseManager.decryptLicense(list.get(0).getLckey());
    	list.get(0).setCompanyName(license.getCompanyName());
    	list.get(0).setEmailId(license.getEmailId());
     	
    	 License license1 = LicenseManager.decryptLicense(list.get(0).getLckey());
		    Date expirationDate = null;
		    Date date = new Date(license1.getExpirationDate());
		    SimpleDateFormat format1 = new SimpleDateFormat("dd-MM-yyyy");
     	    list.get(0).setExpiry(format1.format(date));
     	}
     	catch(IndexOutOfBoundsException exception) {
     	    System.out.println(exception);
     	}
        return new ModelAndView("loginpage","list",list);
    }
   

    @RequestMapping(value = "/doctor1", method = RequestMethod.GET)
    public ModelAndView doctor(@ModelAttribute("p") Doctor p ,HttpServletRequest request,Principal principal,Authentication authentication) {
       	List<Doctor> list1 = ddao.getuserrole(principal.getName());
    	System.out.println(principal.getName());
    return new ModelAndView("dochome","list1",list1);
    	
    	
   }
    
    @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
    public String userInfo(Model model, Principal principal) {
 
        // After user login successfully.
        String userName = principal.getName();
 
       
        return "userinfo";
    }
    
    @RequestMapping(value = "/saveuser", method = RequestMethod.POST)
    public String saveuser(@ModelAttribute("p") Register p,HttpServletRequest request) {
 
       
       String message = "Registered Successfully !";
       request.setAttribute("message",message);
       String var ="login";
        return var;
    }
    
    
    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
	    public ModelAndView welcome(@ModelAttribute("p") Doctor p ,HttpServletRequest request,Principal principal,Authentication authentication,Model model) {
	    	
	    	authentication.getAuthorities();
	    	
	    	System.out.println("Authentication" +authentication.getAuthorities());
	    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	    	String b = var.toString();
	         
	   //System.out.println(b);
	    	if(b.contains("[ROLE_DOCTOR]")){
	    		 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/HMS/doctor1.html");
		        return new ModelAndView(redirectView); 
	    		
	    	}
	    	else if(b.contains("[ROLE_NURSE]")){
	    		 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/HMS/nursedesk.html");
		        return new ModelAndView(redirectView); 
	    		
	    	}
	        else if(b.contains("[ROLE_FDESK]")){
	        	
	        	 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/HMS/frontdesk.html");
		        return new ModelAndView(redirectView); 
	    		
	    	}
	        else if(b.contains("[ROLE_ASSISTANT]")){
	        	 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/HMS/frontdesk.html");
		        return new ModelAndView(redirectView); 
	    		
	        }
	        else if(b.contains("[ROLE_Accounts Admin]")){
	        	 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/HMS/frontdesk.html");
		        return new ModelAndView(redirectView); 
	    		
	        }
	        else if(b.contains("[ROLE_CHIEFNURSE]")){
	    		 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/HMS/nursedesk.html");
		        return new ModelAndView(redirectView); 
	    		
	    	}
	        else if(b.contains("[ROLE_PHARMACIST]") || b.contains("[ROLE_DISPPHARMACIST]")){
	        	RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/HMS/hmspharma.html");
		        return new ModelAndView(redirectView); 
	        }
	        else if(b.contains("[ROLE_SALESMANAGER]") || b.contains("[ROLE_DISPSALESMANAGER]")){
	        	RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/HMS/hmspharma1.html");
		        return new ModelAndView(redirectView); 
	        }
	    	else{
	    		 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/HMS/admin");
		        return new ModelAndView(redirectView); 
	    	}
	       
	    }

	@RequestMapping(value = "/frontdesk", method = RequestMethod.GET)
    public String fdesk(Model model, Principal principal) {
    	
		return "frontdesk"; 
    }
    
    @RequestMapping(value = "/nursedesk", method = RequestMethod.GET)
    public ModelAndView ndesk(Principal principal) {
    	List<Appointment> list4 = ndao.getAppsforNrs();
        List<Appointment> list = dao.getAppointment1();
		List<Diagnose> list1 = ddao.getOpd();
		List<Prescription2> list2 = ddao.getIpd();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list4",list4);
		model.put("list",list);
		model.put("list1",list1);
		model.put("list2",list2);
		return new ModelAndView("nursedesk","model",model); 
    }
    
    @RequestMapping(value = "/staff", method = RequestMethod.GET)
    public String staff(Model model, Principal principal) {
     
    	return "staffreg";
    }
    
    @RequestMapping(value = "/lab", method = RequestMethod.GET)
    public String lab(Model model, Principal principal) {
     
    	return "labhome";
    }
    @RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
    public ModelAndView logoutSuccessfulPage(Model model) {
        model.addAttribute("title", "Logged out Successfully!");
        return new ModelAndView("logoutSuccessfulPage"); 
    }
    
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {
        
        if (principal != null) {
            model.addAttribute("message", "Hi " + principal.getName()
                    + "<br> You do not have permission to access this page!");
        } else {
            model.addAttribute("msg",
                    "You do not have permission to access this page!");
        }
        return "403Page";
    }
    
    @RequestMapping(value = "/licence", method = RequestMethod.GET)
   public ModelAndView licence(@ModelAttribute("p") License p ,HttpServletRequest request,Principal principal,Authentication authentication ) throws Exception {
     	List<License> list = dao.getLusers();
     	String result = null;
     	String failed = request.getParameter("res");
     	if(failed == null){
     		failed = "tre";
     	}
     	
     	try{
    	License license = LicenseManager.decryptLicense(list.get(0).getLckey());
    	list.get(0).setCompanyName(license.getCompanyName());
    	list.get(0).setEmailId(license.getEmailId());
    	if(failed.equalsIgnoreCase("licensefailed")){
     		result = "failed";
     		if(System.currentTimeMillis() > license.getExpirationDate()){
        		
    			result ="false";
    		}
        	
     	}
    	else if(failed.equalsIgnoreCase("diffmac")){
    		result = "diffmac";
    	}
    	else if(System.currentTimeMillis() <= license.getExpirationDate()){
    		
			result ="true";
		}
    	
    	else {
    		
    	}
     	}
     	catch(IndexOutOfBoundsException exception) {
     	    System.out.println(exception);
     	   
     	}
     
    	Map<String, Object> model = new HashMap<String, Object>();
         model.put("list",list);
         model.put("result",result);
        return new ModelAndView("licence","model",model);
    }
   
}
