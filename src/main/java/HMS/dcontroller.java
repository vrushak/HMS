package HMS;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.ldap.Control;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.PathVariable;    
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;

import HMS.controllerDao;
import HMS.doctControllerDao;
import HMS.Patient;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class dcontroller {
	@Autowired  
	controllerDao dao;
	@Autowired 
	doctControllerDao ddao;
	@Autowired 
	nurseControllerDao ndao;
	@Autowired 
	staffControllerDao sdao;
	@Autowired 
	patientControllerDao pdao;
	
	@RequestMapping(value="/doctor", method = RequestMethod.GET)
	public ModelAndView doctor(@ModelAttribute("p") Doctor p) {
		List<Doctor> list=ddao.getDocID();  
		List<Doctor> list1= ddao.getDocID1();
		List<Deptspe> list2= ddao.getdepartment();
		List<Deptspe> list3= ddao.getspe();
		 Map<String, Object> model = new HashMap<String, Object>();
	        model.put("list",list);
	        model.put("list1",list1);
	        model.put("list2", list2);
	        model.put("list3", list3);
		return new ModelAndView("doctor","model",model); 
		}
	
	 //doctor save
		@RequestMapping(value="/saveDoc", method = RequestMethod.POST)
		public ModelAndView doctorsave(@ModelAttribute("p") Doctor p) {
		 int saved = 0;
		 int saveu = 0;
		 int saveur = 0;
		saved = ddao.saveD(p);
	    saveu = ddao.saveuser(p);
		saveur = ddao.saveuserrole(p);
		ModelAndView  mav = new ModelAndView();
		if(saved > 0 && saveu > 0 && saveur > 0){
		mav.addObject("message", "The record has been saved sucessfully");
		mav.setViewName("redirect:doctor");		    
						    
		}

		else{
		mav.addObject("message", "Record could not be saved successfully ");
		mav.setViewName("redirect:doctor");
		}
			 RedirectView redirectView = new RedirectView();
		     redirectView.setUrl("/HMS/doctor.html");
	        return mav; 
			}/*
		 @RequestMapping(value="/prescription")
		 public  ModelAndView prescription(@ModelAttribute("p") Prescription s,Principal principal,Authentication authentication) {
		 	 
			 Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
			 
		 	List<Prescription> list1= ddao.getDocID2(principal.getName(),b);
		 	if(list1.isEmpty()){
		 		s.setDocid(b);
		 	list1.add(s);
		 	}
		     List<Patient> list2= dao.getPatientId1();
		     
		     List<Prescription>list3 = ddao.getPrescription(principal.getName(),b);
		    
		     
		     List<Vitals> list15= ndao.getVitals(principal.getName());
				List<Appointment> list16 = ddao.getAppointment1();
				
		    	//List<Appointment> list3= dao.getAppointment();
		    	
		     List<Prescription>list4 = dao.search();
		 Map<String, Object> model = new HashMap<String, Object>();
		      
		       model.put("list1", list1);
		       model.put("list2", list2);
		       model.put("list3", list3);
		     model.put("list4", list4);
		       model.put("list16", list16);
		 	return new ModelAndView("prescriptiongen2","model",model); 
		 	}*/
		 /*
		 privsyr Prescription 
		 
		 private List<Prescription> convertStadToDynamic(Prescription p) {
			 List<Prescription> dynList = new ArrayList<Prescriptio>();
			 Prescription dynPC = new Prescription();
			 dynPC.setButtonl("Presenting Complaint");
			 dynPC.setDf(p.getPc());
			 dynList.add(dynPC);
			 
			 return synList;
		 }
		   */
		   @RequestMapping(value="/prescription1/{docid}/{pid}")
		   public  @ResponseBody String prescription1(@PathVariable String docid,@PathVariable String pid,@ModelAttribute("p") Prescription s,Principal principal,Authentication authentication) {
		   	 
		   	  String jsonFormatData = "";
		 
		      // List<Patient> list2= dao.getPatientId1();
		       List<Prescription>list6 = ddao.getPrescription2(docid);
		    //   List<Prescription> cpmverted = convertStadToDynamic(list6.get(0));
		       List<Prescription>list3 = ddao.getPrescription3(docid);
		     //  list3.addAll(converted)
		       List<Prescription>list4 = ddao.search();
		       List<Prescription>list5 = ddao.getPrescriptionTab(docid);
		   	  List<Vitals> list17= ndao.getVitalinfo(docid);
		   	List<Vitals> list18= ndao.getVitalinfo1(pid);
			List<Diagnose> list19= ddao.getHistvalue1(pid,docid,"diagnose");
		   Map<String, Object> model = new HashMap<String, Object>();
		        
		     //    model.put("list1", list1);
		       //  model.put("list2", list2);
		        model.put("list3", list3);
		        model.put("list4", list4);
		        model.put("list5", list5);
		        model.put("list6", list6);
		        model.put("list17", list17);
		        model.put("list18", list18);
		        model.put("list19", list19);
		        Gson gson = new Gson(); 

		   	    jsonFormatData = gson.toJson(model);

		   	return jsonFormatData; 
		   	}
		   
		   @RequestMapping(value="/prescription4")
		   public  @ResponseBody String prescription4(@ModelAttribute("p") Prescription s) {
		   	 
		   	  String jsonFormatData = "";
		   
		      // List<Patient> list2= dao.getPatientId1();
		   	 List<Prescription>list4 = ddao.getPrescriptionnew();
		   Map<String, Object> model = new HashMap<String, Object>();
		        
		     //    model.put("list1", list1);
		       //  model.put("list2", list2);
		      
		        model.put("list4", list4);
		       
		        Gson gson = new Gson(); 

		   	    jsonFormatData = gson.toJson(model);

		   	return jsonFormatData; 
		   	}
		   /*
		   @RequestMapping(value="/prescription")
		   public ModelAndView prescriptionad() {
		   	
		   	List<Prescription> list1= dao.getDocID2();
		       List<Patient> list2= dao.getPatientId1();
		       List<Prescription>list3 = dao.getPrescription();
		   Map<String, Object> model = new HashMap<String, Object>();
		        
		       model.put("list1", list1);
		         model.put("list2", list2);
		         model.put("list3", list3);
		   	return new ModelAndView("prescriptiongen","model",model); 
		   	}
		   */
		   @RequestMapping(value="/myapps")
		 public ModelAndView myapps(@ModelAttribute("s") Prescription s,Principal principal,Authentication authentication) {
		 	
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		    	
		    List<Doctor> list15= ddao.getDoc(principal.getName());	
		    List<Appointment> list= dao.getFileno1(); 
		    List<Patient> list2= dao.getPatientId1();
		 	List<Prescription> list1= ddao.getDocID2(principal.getName(),b);
		 	 List<Prescription>list4 = dao.search();
		 	List<Patient> list8=pdao.getPatientId();
		 	if(list1.isEmpty()){
		 		
		 		s.setDocid(b);
		 	
		 	list1.add(s);
		 	}
		 	
		 	

		  
		 	Map<String, Object> model = new HashMap<String, Object>();
		      
		       model.put("list1", list1);
		       model.put("list4", list4);
		       model.put("list", list);
		       model.put("list15", list15);
		       model.put("list2", list2);
		       model.put("list8", list8);
		 	return new ModelAndView("myapps","model",model); 
		 	}
		 /*  
		   @RequestMapping(value="/saveprs", method = RequestMethod.POST)
		 	public ModelAndView  savePrs(@ModelAttribute("s") Prescription s,HttpServletRequest request) {
		 	 
		 	  int savep1 = 0;
		 	  int savep2 = 0;
		 	  int savep3 = 0;
		      int savep4 = 0;
		 	  int savepa = 0;	
		 	 int savev = 0;	
		 		
		 		// dynamically storing data
			           
		 				String var4 = s.getButtonl();
		 				System.out.println("button contains"+s.getButtonl());
		 				
		 				if(var4 == null){
		 					var4 = "null";
		 					
		 				}
		 				String var4a[] = var4.split(",");
		 		
		 				String tab = s.getTabid();
		 				if(tab == null){
		 					tab = "null";
		 				
		 				}
		 			
		 				String var2[] = tab.split(",");
		 				
		 				String textarea = s.getDf();
		 				if(textarea == null || textarea == " "){
		 					textarea = "null";
		 					}
		 				
		 				String var3[] = textarea.split(",");
		 				System.out.println(var4a.length);
		 				System.out.println(var2.length);
		 				System.out.println(var3.length);
		 				for(int i =0;i<var4a.length;i++ ){
		 			                  
		 					  //	dao.savePrs1(s,var1[i],var1a[i],var1b[i],var1c[i],var1d[i],var1e[i],var1f[i],var1g[i],var1h[i],var1i[i],var1j[i]);
		 			             savep2 = ddao.savePrs2(s,var4a[i],var2[i],var3[i]);
		 			             savep4 = ddao.savePrs5(var4a[i],var2[i]);
		 					    }
		 							
		 			savepa= dao.saveact(s);
		 	
		 		
		 		String var = s.getTypeofdr();
		 		if(var == null){
 					var = "null";
 					
 				}
		 		String var1[] = var.split(",");
		 		String vara = s.getDrugname();
		 		if(vara == null){
 					vara = "null";
 					
 				}
		 		String var1a[] = vara.split(",");
		 		
		 		String varb = s.getStrdrug();
		 		if(varb == null){
 					varb = "null";
 					
 				}
		 		String var1b[] = varb.split(",");
		 		
		 		String dos = s.getDosage();
		 		if(dos == null){
		 			dos = "null";
		 		}
		 		
		 		String dosage[] = dos.split(",");
		 		
		 		String varc = s.getDm();
		 		if(varc == null){
 					varc = "off";
 				
 				}
		 		//System.out.println(varc);
		 		
		 		String var1c[] = varc.split(",");
		 		/*
		 		String vard = s.getDa();
		 		if(vard == null){
 					vard = "off";
 				
 				}
		 		String var1d[] =vard.split(",");
		 		
		 		String vare = s.getDe();
		 		if(vare == null){
 					vare = "off";
 					
 				}
		 		String var1e[] =vare.split(",");
		 		
		 	//	String varf = s.getDa();
		 	//	String var1f[] =varf.split(",");
		 		String varg = s.getDn();
		 		if(varg == null){
 					varg = "off";
 				
 				}
		 		String var1g[] =varg.split(",");
		 		
		 		String varh = s.getBaf();
		 		if(varh == null){
 					varh = "before";
 					
 				}
		 		String var1h[] =varh.split(",");
		 		
		 		String vari = s.getTotn();
		 		if(vari == null){
 					vari = "null";
 					
 				}
		 		String var1i[] =vari.split(",");
		 		String varj = s.getNofdays();
		 		if(varj == null){
 					varj = "null";
 					
 				}
		 		String var1j[] =varj.split(",");
		 		
		 		for(int i =0;i<var1.length;i++ ){
		             
		        savep1 = ddao.savePrs1(s,var1[i],var1a[i],var1b[i],var1c[i],/*var1d[i],var1e[i],var1g[i]//var1h[i],var1i[i],var1j[i],dosage[i]);
		              
		    }
		 		
		 		
		 		savep3 = dao.savePrs(s);
		 		
				savev= ndao.saveVital(s);
		 		 System.out.println(savep1);
		 		System.out.println(savep2);
		 		System.out.println(savep3);
		 		System.out.println(savep4);
		 		ModelAndView  mav = new ModelAndView();
		 		if(savep1 > 0 && savep2 > 0 && savep3 > 0 || savep4 > 0 || savev > 0){
		 			
		 			mav.addObject("message", "The record has been saved sucessfully");
		 			mav.setViewName("redirect:prescription");		    
		 							    
		 			}

		 			else{
		 			mav.addObject("message", "Record could not be saved successfully ");
		 			mav.setViewName("redirect:prescription");
		 			}
		 		 RedirectView redirectView = new RedirectView();
		 	     redirectView.setUrl("/HMS/doctor1.html");
		         return mav; 
		 		}
*/
		   @RequestMapping(value="/treatment", method = RequestMethod.GET)
		 public ModelAndView treatmentrecord(@ModelAttribute("p") Admitpat p,Principal principal,Authentication authentication) {
			   
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		    	
		 	//List<Admitpat> list1= dao.getAdmitpat();
		 	List<Admitpat> list1= dao.getAdmitpat(principal.getName(),b);
		 	if(list1.isEmpty()){
		 	
		 		p.setIdc(b);
		 	list1.add(p);
		 	}
		 	
		 	Map<String, Object> model = new HashMap<String, Object>();
		      
		       model.put("list1", list1);
		       
		 	return new ModelAndView("treatment","model",model); 
		 	}
		   
		   //loading from discharge
		   
		   @RequestMapping(value="/treatment1", method = RequestMethod.GET)
		 public ModelAndView treatmentrecord1(@ModelAttribute("p") Admitpat p,Principal principal,Authentication authentication,HttpServletRequest request,HttpServletResponse response) {
			   
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		    	
		 	//List<Admitpat> list1= dao.getAdmitpat();
		 	List<Admitpat> list1= dao.getAdmitpat(principal.getName(),b);
		 	if(list1.isEmpty()){
		 	
		 		p.setIdc(b);
		 	list1.add(p);
		 	}
		 	
		 	Map<String, Object> model = new HashMap<String, Object>();
		      
		       model.put("list1", list1);
		       model.put("pname", request.getParameter("location"));
		       model.put("flno",request.getParameter("location2"));
		 	return new ModelAndView("treatment","model",model); 
		 	}
		   
		   @RequestMapping(value="/vtreatment", method = RequestMethod.GET)
		 public ModelAndView vtreatmentrecord(@ModelAttribute("p") Treatment p,Principal principal,Authentication authentication) {
		 		
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		    	
		 	  List<Admitpat> list1= dao.getAdmitpat(principal.getName(),b);
		 	  
		     List<Treatment> list2 = ddao.getTreatment(p); 
		 Map<String, Object> model = new HashMap<String, Object>();
		  model.put("list1", list1);
		      if(list2.isEmpty() || list2.size() == 0){
		    	  model.put("warning", "Selected patient does not have records");
		      }
		      else{
		       model.put("list2", list2);
		      }
		 	return new ModelAndView("treatment","model",model); 
		 	}
		   
		   @RequestMapping(value="/saveTre", method = RequestMethod.POST)
		  	public ModelAndView  saveTransaction(@ModelAttribute("s") Treatment s,HttpServletRequest request,HttpServletResponse response) {
		  	 int savetr = 0;
		  	 /*
		  	 String date = s.getDatetime();
		  	 if(date == null){
		  		 date = "null";
		  	 }
		  	 String datea[]= date.split(",");
		  	 
		  
		  	String dname = s.getDname();
		  	 if(dname == null){
		  		 dname = "null";
		  	 }
		  	 String dnamea[]= dname.split(",");
		  
		 	String comments = s.getComments();
		  	 if(comments == null){
		  		 comments = "null";
		  	 }
		  	 String commentsa[]= comments.split(",");
		  	 */
		  	 
		  	 String datea[] = request.getParameterValues("datetime");
		  	String dnamea[] = request.getParameterValues("dname");
		  	String commentsa[] = request.getParameterValues("comments");
		  	 for(int i=0;i<datea.length;i++){
		  		savetr = ddao.saveTre(s,datea[i],dnamea[i],commentsa[i]);
		  	 }
		  		
		  		ModelAndView  mav = new ModelAndView();
		  		if(savetr > 0){
		  		mav.addObject("message", "The record has been saved sucessfully");
		  		mav.setViewName("redirect:treatment");		    
		  						    
		  		}

		  		else{
		  		mav.addObject("message", "Record could not be saved successfully ");
		  		mav.setViewName("redirect:treatment");
		  		}
		  		 RedirectView redirectView = new RedirectView();
		  	     redirectView.setUrl("/HMS/doctor1");
		        return mav; 
		  		}

		   @RequestMapping(value="/discharge", method = RequestMethod.GET)
		   public ModelAndView discharge(Principal principal,Authentication authentication) {
		 	 
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		 	    List<Admitpat> list1= ddao.getAdmitpat1(principal.getName(),b,"discharge");
		 	    List<Discharge> list2 = ddao.getDischarge("no"); 
		 	    Map<String,Object> model = new HashMap<String, Object>();
		 	
		 	    model.put("list1", list1);
		 	    model.put("list2", list2);
		 	    
		 	 	return new ModelAndView("discharge","model",model); 
		 }
		   
		   @RequestMapping(value="/dslip", method = RequestMethod.GET)
		   public ModelAndView dishargeslip(Principal principal,Authentication authentication) {
			   System.out.println("Authentication" +authentication.getAuthorities());
		    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		 	    List<Admitpat> list1= ddao.getAdmitpat1(principal.getName(),b,"dslip");
		 	   List<Dslip> list2 = ddao.getDslip(); 
		 	    Map<String,Object> model = new HashMap<String, Object>();
		 	
		 	    model.put("list1", list1);
		 	    model.put("list2", list2);
		 	    
		 	 	return new ModelAndView("dischargeslip","model",model); 
		 }
		   @RequestMapping(value="/saved", method = RequestMethod.POST)
		 	public ModelAndView  saved(@ModelAttribute("s") Discharge s) {
		 	 int saved = 0;
		 		saved = dao.saved(s);
		 		ModelAndView  mav = new ModelAndView();
		 		if(saved > 0 && s.getFreeze().contentEquals("no")){
		 		
		 		mav.addObject("message", "The record has been saved sucessfully");
		 		mav.setViewName("redirect:discharge");		    
		 						    
		 		}
		 		else if(saved > 0 && s.getFreeze().contentEquals("yes")){
			 		
			 		mav.addObject("message", "Record has been saved successfully. The record is available for printing in Print Documents - Print Discharge Summary");
			 		mav.setViewName("redirect:discharge");		    
			 						    
			 		}
		 		else{
		 		mav.addObject("message", "Record could not be saved successfully ");
		 		mav.setViewName("redirect:discharge");
		 		}
		 		 RedirectView redirectView = new RedirectView();
		 	     redirectView.setUrl("/HMS/doctor1.html");
		    return mav; 
		 		}
		   
		   //save discharge slip
		   
		   @RequestMapping(value="/saveds", method = RequestMethod.POST)
		 	public ModelAndView  saveds(@ModelAttribute("s") Dslip s) {
		 	 int saveds = 0;
		 	 
		 		saveds = ddao.saveds(s);
		 		ModelAndView  mav = new ModelAndView();
		 		if(saveds > 0){
		 		mav.addObject("message", "The record has been saved sucessfully");
		 		mav.setViewName("redirect:dslip");		    
		 						    
		 		}

		 		else{
		 		mav.addObject("message", "Record could not be saved successfully ");
		 		mav.setViewName("redirect:dslip");
		 		}
		 		 RedirectView redirectView = new RedirectView();
		 	     redirectView.setUrl("/HMS/doctor1.html");
		    return mav; 
		 		}
		   @RequestMapping(value="/discharge1/{id}", method = RequestMethod.GET)
		   public @ResponseBody String Discharge1(@PathVariable String id) {
		 	  	 
		   	  String jsonFormatData = "";
		   	  System.out.println("User" + id);
		   	
		      // List<Patient> list2= dao.getPatientId1();
		       
		       List<Doctor>list3 = ddao.getuserrole(id);
		     
		  
		        Gson gson = new Gson(); 

		   	    jsonFormatData = gson.toJson(list3);

		   	return jsonFormatData; 
		   	}
		   
		   @RequestMapping(value="/dischargefile", method = RequestMethod.GET)
		   public @ResponseBody String Dischargefile(HttpServletRequest req, HttpServletResponse response) {
		 	  	 
		   	  String jsonFormatData = "";
		   	
		       
		       List<Prescription>list3a = ddao.getFilenos(req.getParameter("location1"),req.getParameter("location2"));
		     
		  
		        Gson gson = new Gson(); 

		   	    jsonFormatData = gson.toJson(list3a);

		   	return jsonFormatData; 
		   	}
		   @RequestMapping(value="/prprs", method = RequestMethod.GET)
		   public ModelAndView dischargeew(Principal principal,Authentication authentication) {
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		    	List<Prescription> list1;
		    	List<Diagnose> list2;
		    	if(b == "[ROLE_DOCTOR]"){
		    	list1 = ddao.getDocID3(principal.getName());
		    	list2 = ddao.getDoccID3(principal.getName());
		    	
		    	}
		    	else{
		    		list1 = ddao.getDocID3();
		    		list2 = ddao.getDoccID3();
		    	}
				
		    	Map<String, Object> model = new HashMap<String, Object>();
		        model.put("list1",list1);
		        model.put("list2",list2);		
		 	    
		 	 	return new ModelAndView("prescriptiongen3","model",model); 
		 }	
		   
		   @RequestMapping(value="/prprs1", method = RequestMethod.GET)
		   public ModelAndView dischargeew1(Principal principal,Authentication authentication,HttpServletRequest req, HttpServletResponse response) {
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		    	List<Prescription> list1;
		    	List<Diagnose> list2;
		    	if(b == "[ROLE_DOCTOR]"){
		    	list1 = ddao.getDocID3(principal.getName());
		    	list2 = ddao.getDoccID3(principal.getName());
		    	}
		    	else{
		    		list1 = ddao.getDocID3();
		    		list2 = ddao.getDoccID3();
		    	}
		    	
		    	 Map<String, Object> model = new HashMap<String, Object>();
			        model.put("list1",list1);
			       model.put("list2",list2);
			    //    model.put("pid", req.getParameter("location").toString());
			//		model.put("fileno",req.getParameter("location1").toString());	
				
				return new ModelAndView("prescriptiongen3","model",model); 
		 }		
		   
		   
		   @RequestMapping(value="/dischargepr", method = RequestMethod.GET)
		   public ModelAndView dischargepr(Principal principal,Authentication authentication) {
		 	 
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		 	  //  List<Admitpat> list1= ddao.getAdmitpat1(principal.getName(),b);
		 	    List<Discharge> list2 = ddao.getDischarge("yes"); 
		 	   
		 	    Map<String,Object> model = new HashMap<String, Object>();
		 	
		 	    //model.put("list1", list1);
		 	    model.put("list2", list2);
		 	    
		 	 	return new ModelAndView("dischargepr","model",model); 
		 }
		   @RequestMapping(value="/dslippr", method = RequestMethod.GET)
		   public ModelAndView dslippr(Principal principal,Authentication authentication) {
		 	 
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		 	  //  List<Admitpat> list1= ddao.getAdmitpat1(principal.getName(),b);
		    	 List<Dslip> list2 = ddao.getDslip(); 
		 	    Map<String,Object> model = new HashMap<String, Object>();
		 	
		 	    //model.put("list1", list1);
		 	    model.put("list2", list2);
		 	    
		 	 	return new ModelAndView("dslippr","model",model); 
		 }
		  
		   @RequestMapping(value="/ipdpr", method = RequestMethod.GET)
		   public ModelAndView prpr2(Principal principal) {
		 	 
				List<Admitpat> list1= ddao.getAdmitpat1();
				List<Prescription>list4 = dao.search();
				 Map<String, Object> model = new HashMap<String, Object>();
			      
			      
			       model.put("list1", list1);
			       model.put("list4", list4);
		 	 	return new ModelAndView("prescriptiongen4","model",model); 
		 }		
		   //load from discharge
		   
		   @RequestMapping(value="/ipdpr1", method = RequestMethod.GET)
		   public ModelAndView prpr21(Principal principal,HttpServletRequest req, HttpServletResponse response) {
		 	 
				List<Admitpat> list1= ddao.getAdmitpat1();
				List<Prescription>list4 = dao.search();
				 Map<String, Object> model = new HashMap<String, Object>();
			      
			      
			       model.put("list1", list1);
			       model.put("list4", list4);
			       model.put("pname", req.getParameter("location1"));
			       model.put("flno", req.getParameter("location2"));
		 	 	return new ModelAndView("prescriptiongen4","model",model); 
		 }		
		   
		   @RequestMapping(value="/saveipdp", method = RequestMethod.POST)
		 	public ModelAndView  saveIP(@ModelAttribute("s") Prescription2 s,Authentication authentication) {
			   
			   Collection<? extends GrantedAuthority> varsb = authentication.getAuthorities();
		    	String b = varsb.toString();
		    	System.out.println(b);
		    	if(b.contains("[ROLE_ADMIN]")){
		    		System.out.println(b);
		    		s.setDocid("dbadmin1");
		    	}
		    	
		    	
		 	int saveip = 0; 
			String var = s.getTypeofdr();
	 		if(var == null){
					var = "null";
					
				}
	 		String var1[] = var.split(",");
	 		String vara = s.getDrugname();
	 		if(vara == null){
					vara = "null";
					
				}
	 		String var1a[] = vara.split(",");
	 		
	 		String varb = s.getStrdrug();
	 		if(varb == null){
					varb = "null";
					
				}
	 		
	 		String dos = s.getDosage();
	 		if(dos == null){
	 			dos = "null";
	 		}
	 		
	 		String dosage[] = dos.split(",");

	 		String var1b[] = varb.split(",");
	 		
	 		String varc = s.getDm();
	 		if(varc == null){
					varc = "off";
				
				}
	 		//System.out.println(varc);
	 		String var1c[] = varc.split(",");
	 		/*
	 		String vard = s.getDa();
	 		if(vard == null){
					vard = "off";
				
				}
	 		String var1d[] =vard.split(",");
	 	
	 		/*
	 		String vare = s.getDe();
	 		if(vare == null){
					vare = "off";
					
				}
	 		String var1e[] =vare.split(",");
	 		
	 	//	String varf = s.getDa();
	 	//	String var1f[] =varf.split(",");
	 		String varg = s.getDn();
	 		if(varg == null){
					varg = "off";
				
				}
	 		String var1g[] =varg.split(",");
	 		*/
	 		String varh = s.getBaf();
	 		if(varh == null){
					varh = "null";
					
				}
	 		String var1h[] =varh.split(",");
	 		
	 		String vari = s.getTotn();
	 		if(vari == null){
					vari = "null";
					
				}
	 		String var1i[] =vari.split(",");
	 		String varj = s.getNofdays();
	 		if(varj == null){
					varj = "null";
					
				}
	 		String var1j[] =varj.split(",");
	 		System.out.println(s.getDocid());
 			System.out.println(s.getDa());
 			System.out.println(s.getDe());
 			System.out.println(s.getDn());
	 		
	 		for(int i =0;i<var1.length;i++ ){System.out.println("checling");
	 			
	 			System.out.println(var1c[i]);
	 			//System.out.println(var1d[i]);
	 			
	 			saveip = ddao.savePrs2(s,var1[i],var1a[i],var1b[i],var1c[i],/*var1d[i],var1e[i],var1g[i]*/var1h[i],var1i[i],var1j[i],dosage[i]);
		              
		    }
		 	
		 			
		 		ModelAndView  mav = new ModelAndView();
		 		if(saveip > 0){
		 		mav.addObject("message", "The record has been saved sucessfully");
		 		mav.setViewName("redirect:ipdpr");		    
		 						    
		 		}

		 		else{
		 		mav.addObject("message", "Record could not be saved successfully ");
		 		mav.setViewName("redirect:ipdpr");
		 		}
		 		
		 		return mav;

}
		   @RequestMapping(value="/ipdpr1/{id}", method = RequestMethod.GET)
		   public @ResponseBody String ipdpr(@PathVariable String id) {
		 	  	 
		   	  String jsonFormatData = "";
		   	  System.out.println("User" + id);
		   	
		      // List<Patient> list2= dao.getPatientId1();
		       
		       List<Prescription2>list3 = ddao.getPrescriptionTab2(id);
		     
		  
		        Gson gson = new Gson(); 

		   	    jsonFormatData = gson.toJson(list3);

		   	return jsonFormatData; 
		   	}
		   
		 //sick
		   @RequestMapping(value="/sicks", method = RequestMethod.POST)
		 	public ModelAndView  saveS(@ModelAttribute("s") Sick s) {
		 	 int sav=0;
		 		sav=ddao.saveS(s);
		 		ModelAndView  mav = new ModelAndView();
		 		if(sav > 0){
		 		mav.addObject("message", "The record has been saved sucessfully");
		 		mav.setViewName("redirect:sick");		    
		 						    
		 		}

		 		else{
		 		mav.addObject("message", "Record could not be saved successfully ");
		 		mav.setViewName("redirect:sick");
		 		}
		 			
		 		 RedirectView redirectView = new RedirectView();
		 	     redirectView.setUrl("/HMS/sick.html");
		    return mav; 
		    

}
		   @RequestMapping(value="/sick", method = RequestMethod.GET)
			public ModelAndView sick(@ModelAttribute("s") Appointment p,Principal principal,Authentication authentication) {
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
				List<Appointment> list2=ddao.getappointment1(principal.getName(),b);  
			    List<Sick> list3= ddao.getsick();
				 Map<String, Object> model = new HashMap<String, Object>();
			       model.put("list2",list2);
			      model.put("list3",list3);
				return new ModelAndView("sick","model",model); 
				}
		   
		   
		   //referral
		   @RequestMapping(value="/referrals", method = RequestMethod.POST)
		 	public ModelAndView  saveR(@ModelAttribute("r") Referral r) {
		 	 int sav=0;
		 		sav=ddao.saveR(r);
		 		ModelAndView  mav = new ModelAndView();
		 		if(sav > 0){
		 		mav.addObject("message", "The record has been saved sucessfully");
		 		mav.setViewName("redirect:referral");		    
		 						    
		 		}

		 		else{
		 		mav.addObject("message", "Record could not be saved successfully ");
		 		mav.setViewName("redirect:referral");
		 		}
		 			
		 			
		 		 RedirectView redirectView = new RedirectView();
		 	     redirectView.setUrl("/HMS/referral.html");
		    return mav; 

}
		  
		
		   @RequestMapping(value="/referral", method = RequestMethod.GET)
			public ModelAndView referral(@ModelAttribute("r")  Referral r,Principal principal,Authentication authentication) {
			   Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
			   
			   List<Appointment> list2=ddao.getappointment(principal.getName(),b);			
				List<Referral> list3= ddao.getreferral();
			   
				 Map<String, Object> model = new HashMap<String, Object>();
			        model.put("list2",list2);
			        model.put("list3",list3);
			      
				return new ModelAndView("referral","model",model); 
				}
		   @RequestMapping(value="/glasgowcomasc", method = RequestMethod.POST)
		 	public ModelAndView  saveG(@ModelAttribute("g")glasgowcoma g ) {
		 	 int sav=0;
		 	sav=ddao.saveG(g);
		 	ModelAndView  mav = new ModelAndView();
	 		if(sav > 0){
	 		mav.addObject("message", "The record has been saved sucessfully");
	 		mav.setViewName("redirect:glasgowcoma");		    
	 						    
	 		}

	 		else{
	 		mav.addObject("message", "Record could not be saved successfully ");
	 		mav.setViewName("redirect:glasgowcoma");
	 		}
	 			
		 			
		 		 RedirectView redirectView = new RedirectView();
		      redirectView.setUrl("/HMS/glasgowcoma.html");
		    return mav; 

}
		   @RequestMapping(value="/glasgowcoma", method = RequestMethod.GET)
			public ModelAndView  glasgowcoma(Principal principal,Authentication authentication,
					HttpServletRequest req,HttpServletResponse res) {
	              authentication.getAuthorities();
		    	
		    	
		    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
		    	String b = var.toString();
		         
				List<Iochart> list3; 
						if(b.contains("[ROLE_NURSE]")){
							list3 =dao.getPatientdet(principal.getName());
						}
						else
						list3 = dao.getPatientdet();
						Map<String, Object> model = new HashMap<String, Object>();
					    model.put("list3", list3);
					    model.put("bac", req.getParameter("location"));

				return new ModelAndView("glasgowcoma","model",model); 
				}
		   @RequestMapping(value="/blantyrecomasc", method = RequestMethod.POST)
		 	public ModelAndView  saveB(@ModelAttribute("b")blantyrecoma b ) {
		 	 int sav=0;
		 	sav=ddao.saveB(b);
		 	ModelAndView  mav = new ModelAndView();
	 		if(sav > 0){
	 		mav.addObject("message", "The record has been saved sucessfully");
	 		mav.setViewName("redirect:blantyrecoma");		    
	 						    
	 		}

	 		else{
	 		mav.addObject("message", "Record could not be saved successfully ");
	 		mav.setViewName("redirect:blantyrecoma");
	 		}
	 			
		 			
		 		 RedirectView redirectView = new RedirectView();
		      redirectView.setUrl("/HMS/blantyrecoma.html");
		    return mav; 

}
		   @RequestMapping(value="/blantyrecoma", method = RequestMethod.GET)
       public ModelAndView  blantyrecoma(Principal principal,Authentication authentication,HttpServletRequest req,HttpServletResponse res) {
    authentication.getAuthorities();
	
	
	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	String b = var.toString();
   
	List<Iochart> list3; 
			if(b.contains("[ROLE_NURSE]")){
				list3 =dao.getPatientdet(principal.getName());
			}
			else
			list3 = dao.getPatientdet();
			Map<String, Object> model = new HashMap<String, Object>();
		    model.put("list3", list3);
		    model.put("bac", req.getParameter("location"));
	return new ModelAndView("blantyrecoma","model",model); 
	}
		   
		   @RequestMapping(value="/glasgow1", method = RequestMethod.GET)
			public @ResponseBody String iochart1(@ModelAttribute("s") Iochart s) {
				System.out.println("Patient"+s.getAdmitno());
				String jsonFormatData = "";
				
				 
				// List<glasgowcoma> list4 = ddao.getPatientdet1(s.getAdmitno());
				 List<glasgowcoma> list5 = ddao.getPatientdet3(s.getAdmitno());
		         
				 Map<String, Object> model = new HashMap<String, Object>();
			       
				    //    model.put("list1", list1);
				      //  model.put("list2", list2);
				
				    //   model.put("list4", list4);
				       model.put("list5", list5);
				 
						 Gson gson = new Gson(); 

						    jsonFormatData = gson.toJson(model);

		       
		
				
					 return jsonFormatData;
			}
		
					 @RequestMapping(value="/glasgow2/{admitno}/{id}", method = RequestMethod.GET)
						public @ResponseBody String iochart2(@PathVariable String admitno,@PathVariable String id,@ModelAttribute("s") Iochart s) {
							System.out.println("Patient"+s.getAdmitno());
							String jsonFormatData = "";
							
							 
						//	 List<Iochart> list4 = dao.getPatientdet1(s.getAdmitno());
							 List<glasgowcoma> list5 = ddao.getPatientdet3(admitno,id);
							// List<glasgowcoma> list7 = dao.getPatientdet3(admitno,id);
					         
							 Map<String, Object> model = new HashMap<String, Object>();
						       
							    //    model.put("list1", list1);
							      //  model.put("list2", list2);
							
							//       model.put("list4", list4);
							       model.put("list5", list5);
							  //     model.put("list7", list7);
							 
									 Gson gson = new Gson(); 

									    jsonFormatData = gson.toJson(model);

					       
					
							
								 return jsonFormatData;
					
					
							
				 //get previous records
			 
				}
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 @RequestMapping(value="/blantyre1", method = RequestMethod.GET)
						public @ResponseBody String iochart11(@ModelAttribute("s") Iochart s) {
							System.out.println("Patient"+s.getAdmitno());
							String jsonFormatData = "";
							
							 
							// List<glasgowcoma> list4 = ddao.getPatientdet1(s.getAdmitno());
							 List<blantyrecoma> list5 = ddao.getPatientdet31(s.getAdmitno());
					         
							 Map<String, Object> model = new HashMap<String, Object>();
						       
							    //    model.put("list1", list1);
							      //  model.put("list2", list2);
							
							    //   model.put("list4", list4);
							       model.put("list5", list5);
							 
									 Gson gson = new Gson(); 

									    jsonFormatData = gson.toJson(model);

					       
					
							
								 return jsonFormatData;
						}
					
								 @RequestMapping(value="/blantyre2/{admitno}/{id}", method = RequestMethod.GET)
									public @ResponseBody String iochart21(@PathVariable String admitno,@PathVariable String id,@ModelAttribute("s") Iochart s) {
										System.out.println("Patient"+s.getAdmitno());
										String jsonFormatData = "";
										
										 
									//	 List<Iochart> list4 = dao.getPatientdet1(s.getAdmitno());
										 List<blantyrecoma> list5 = ddao.getPatientdet31(admitno,id);
										// List<glasgowcoma> list7 = dao.getPatientdet3(admitno,id);
								         
										 Map<String, Object> model = new HashMap<String, Object>();
									       
										    //    model.put("list1", list1);
										      //  model.put("list2", list2);
										
										//       model.put("list4", list4);
										       model.put("list5", list5);
										  //     model.put("list7", list7);
										 
												 Gson gson = new Gson(); 

												    jsonFormatData = gson.toJson(model);

								       
								
										
											 return jsonFormatData;
								
								
										
							 //get previous records
						 
							}
								 
								 //delete prescription tabs
								 
								 @RequestMapping(value="/delpr/{drug}/{type}/{fileno}")
									public  @ResponseBody String  savebill(@ModelAttribute("s") Prescription s,@PathVariable String drug,@PathVariable String type,@PathVariable String fileno) {
									 int bsave = 0;
									 String jsonFormatData = "";
									
									bsave = ddao.deletepr(drug,type,fileno);
									
									ModelAndView  mav = new ModelAndView();
									 Gson gson = new Gson();
									 gson.toJson(bsave);
									if(bsave > 0){
										jsonFormatData =  gson.toJson("success");
													    
									}

									else{
										jsonFormatData =gson.toJson("failure");
									}
								
								
									     return jsonFormatData;
										}
								  
								 

		  @RequestMapping(value="/diagnose/{path}", method = RequestMethod.GET)
			 public ModelAndView  diagnose(@PathVariable String path,Prescription s,Principal principal,Authentication authentication) {

		 
				  authentication.getAuthorities();
				  Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
				  String b = var.toString();
				 	List<Prescription> list1= ddao.getDocIDdiag(principal.getName(),b,"diagnose");
				 	if(list1.isEmpty()){
				 		s.setDocid(b);
				 	list1.add(s);
				 	}
				     List<Patient> list2= dao.getPatientId1();
				     List<Diagnose>list3 = ddao.getHistvalue("diagnose");
				     List<Vitals> list15= ndao.getVitals(principal.getName());
					 List<Appointment> list16 = ddao.getAppointment1();
					 //List<Appointment> list3= dao.getAppointment();
				     List<Prescription>list4 = dao.search();
				 
				     Map<String, Object> model = new HashMap<String, Object>();
				       model.put("list1", list1);
				       model.put("list2", list2);
				       model.put("list3", list3);
				       model.put("list4", list4);
				       model.put("list16", list16);

				       if(path.contains("config")){
				    	   model.put("use","config");
				       }
				       else{
				    	   model.put("use","user"); 
				       }

				 	return new ModelAndView("diagnose","model",model);  
								}
		  
		  @RequestMapping(value="/diagnose", method = RequestMethod.GET)
			 public ModelAndView  diagnose1(Prescription s,Principal principal,Authentication authentication) {

		 
				  authentication.getAuthorities();
				  Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
				  String b = var.toString();
				 	List<Prescription> list1= ddao.getDocID2(principal.getName(),b);
				 	if(list1.isEmpty()){
				 		s.setDocid(b);
				 	list1.add(s);
				 	}
				     List<Patient> list2= dao.getPatientId1();
				     List<Diagnose>list3 = ddao.getHistvalue("diagnose");
				     List<Vitals> list15= ndao.getVitals(principal.getName());
					 List<Appointment> list16 = ddao.getAppointment1();
					 //List<Appointment> list3= dao.getAppointment();
				     List<Prescription>list4 = dao.search();
				 
				     Map<String, Object> model = new HashMap<String, Object>();
				       model.put("list1", list1);
				       model.put("list2", list2);
				       model.put("list3", list3);
				       model.put("list4", list4);
				       model.put("list16", list16);

				      

				 	return new ModelAndView("diagnoseuser","model",model);  
								}
		  //load diagnosed details data from prescription screen
		  
		  @RequestMapping(value="/diagnose2", method = RequestMethod.GET)
			 public ModelAndView  diagnose2(Prescription s,Principal principal,Authentication authentication,HttpServletRequest req, HttpServletResponse response) {

		 
				  authentication.getAuthorities();
				  Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
				  String b = var.toString();
				 	List<Prescription> list1= ddao.getDocID2(principal.getName(),b);
				 	if(list1.isEmpty()){
				 		s.setDocid(b);
				 	list1.add(s);
				 	}
				     List<Patient> list2= dao.getPatientId1();
				     List<Diagnose>list3 = ddao.getHistvalue("diagnose");
				     List<Vitals> list15= ndao.getVitals(principal.getName());
					 List<Appointment> list16 = ddao.getAppointment1();
					 //List<Appointment> list3= dao.getAppointment();
				     List<Prescription>list4 = dao.search();
				 
				     Map<String, Object> model = new HashMap<String, Object>();
				       model.put("list1", list1);
				       model.put("list2", list2);
				       model.put("list3", list3);
				       model.put("list4", list4);
				       model.put("list16", list16);
				       model.put("pnamea", req.getParameter("pnamea"));

				      

				 	return new ModelAndView("diagnoseuser","model",model);  
								}
	
		  @RequestMapping(value="/diagnosegc", method = RequestMethod.GET)
			 public ModelAndView  diagnosegc(Prescription s,Principal principal,Authentication authentication,HttpServletRequest req, HttpServletResponse response) {

		 
				  authentication.getAuthorities();
				  Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
				  String b = var.toString();
				 	List<Prescription> list1= ddao.getDocID2(principal.getName(),b);
				 	if(list1.isEmpty()){
				 		s.setDocid(b);
				 	list1.add(s);
				 	}
				     List<Patient> list2= dao.getPatientId1();
				     List<Diagnose>list3 = ddao.getHistvalue("diagnose");
				     List<Vitals> list15= ndao.getVitals(principal.getName());
					 List<Appointment> list16 = ddao.getAppointment1();
					 //List<Appointment> list3= dao.getAppointment();
				     List<Prescription>list4 = dao.search();
				 
				     Map<String, Object> model = new HashMap<String, Object>();
				       model.put("list1", list1);
				       model.put("list2", list2);
				       model.put("list3", list3);
				       model.put("list4", list4);
				       model.put("list16", list16);
				       model.put("fileno",req.getParameter("location").toString());
				       model.put("pname",req.getParameter("location1").toString());
				       model.put("pid",req.getParameter("location2").toString());
				       model.put("docid",req.getParameter("location3").toString()); 
				    //    model.put("sav",req.getParameter("location4").toString()); 
				      

				 	return new ModelAndView("diagnoseuser","model",model);  
								}
		  
		  @RequestMapping(value="/loaddiv1", method = RequestMethod.GET)
				public @ResponseBody String loaddiv1(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
						String jsonFormatData = "";
					int tab = Integer.parseInt(req.getParameter("tab"));
					int pid = Integer.parseInt(req.getParameter("pid"));
					int level = Integer.parseInt(req.getParameter("level"));
					
					 List<Diagnose> list = ddao.getLoadvalue(tab,pid,"diagdata","diagheader");
					 List<Diagnose> list1 = ddao.getHeaderVal1(tab,level,"diagheader");
					// List<Diagnose> list1 = ddao.getHeaderVal1(tab,pid);
					 Map<String, Object> model = new HashMap<String, Object>();
				       model.put("list", list);
				       model.put("list1", list1);
				     //  model.put("list1", list1);
					 Gson gson = new Gson(); 

					jsonFormatData = gson.toJson(model);

			       
			 return jsonFormatData;
			
			
					
		 //get previous records
	 		
		  
}
		  
		  @RequestMapping(value="/loadtab1", method = RequestMethod.POST)
				public @ResponseBody String loadtab(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
						String jsonFormatData = "";
					
						
					 int res = 0;
					 res = ddao.savediagtab(req.getParameter("lab"),"diagtab");
				/*	 List<Diagnose> list5 = null;
					 if(res > 0){
					 list5 = ddao.getTabsvalue(lab);
					 }
					 Map<String, Object> model = new HashMap<String, Object>();
				       model.put("list5", list5);
					*/
					
					 if(res > 0){
					 jsonFormatData = "success";
					 }
			      
			 return jsonFormatData;
	}
	
		  
		  
		  @RequestMapping(value="/loadtab", method = RequestMethod.POST)
				public @ResponseBody String loadtab(@ModelAttribute("s") Diagnose s) {
						String jsonFormatData = "";
					 int res = 0;
					
					 List<Diagnose> list5 = null;
					
					 list5 = ddao.getTabsvalue("diagtab");
					 
					 Map<String, Object> model = new HashMap<String, Object>();
				       model.put("list5", list5);
					
					 Gson gson = new Gson(); 

					jsonFormatData = gson.toJson(list5);

			       
			 return jsonFormatData;
			
		  }
		  //for admission lab module
		  @RequestMapping(value="/loadtab2", method = RequestMethod.POST)
			public @ResponseBody String loadtab2(@ModelAttribute("s") Diagnose s) {
					String jsonFormatData = "";
				 int res = 0;
				
				 List<Diagnose> list5 = null;
				
				 list5 = ddao.getTabsvalue1("diagtab");
				 
				 Map<String, Object> model = new HashMap<String, Object>();
			       model.put("list5", list5);
				
				 Gson gson = new Gson(); 

				jsonFormatData = gson.toJson(list5);

		       
		 return jsonFormatData;
		
	  }
		
			
			 @RequestMapping(value="/loadtxtvalues", method = RequestMethod.GET)
				public @ResponseBody String loadtxt(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
						String jsonFormatData = "";
					 int res = 0;
					
					 List<Diagnose> list6 = null;
					String fileno = req.getParameter("location6");
					 list6 = ddao.getTxtval(fileno,"diagnose");
					 
					 Map<String, Object> model = new HashMap<String, Object>();
				       model.put("list6", list6);
					
					 Gson gson = new Gson(); 

					jsonFormatData = gson.toJson(list6);

			       
			 return jsonFormatData;
					 
		 //get previous records
	 		
		  
}
		  
		  @RequestMapping(value="/savediag", method = RequestMethod.POST)
		 	public ModelAndView  savediag(@ModelAttribute("r") Diagnose s) {
		 	 int sav=0;
		 	  int savep1 = 0;
		 	  int savep2 = 0;
		 	  int savep3 = 0;
		      int savep4 = 0;
		 	  int savepa = 0;	
		 	 int savev = 0;	
		 	savepa= dao.saveact(s);
		 	
	 		
	 		String var = s.getTypeofdr();
	 		if(var == null){
					var = "null";
					
				}
	 		String var1[] = var.split(",");
	 		String vara = s.getDrugname();
	 		if(vara == null){
					vara = "null";
					
				}
	 		String var1a[] = vara.split(",");
	 		
	 		String varb = s.getStrdrug();
	 		if(varb == null){
					varb = "null";
					
				}
	 		String var1b[] = varb.split(",");
	 		
	 		String dos = s.getDosage();
	 		if(dos == null){
	 			dos = "null";
	 		}
	 		
	 		String dosage[] = dos.split(",");
	 		
	 		String varc = s.getDm();
	 		if(varc == null){
					varc = "off";
				
				}
	 		
	 		
	 		String var1c[] = varc.split(",");

	 		String varh = s.getBaf();
	 		if(varh == null){
					varh = "before";
					
				}
	 		String var1h[] =varh.split(",");
	 		
	 		String vari = s.getTotn();
	 		if(vari == null){
					vari = "null";
					
				}
	 		String var1i[] =vari.split(",");
	 		String varj = s.getNofdays();
	 		if(varj == null){
					varj = "null";
					
				}
	 		String var1j[] =varj.split(",");
	 		
	 		for(int i =0;i<var1.length;i++ ){
	             
	        savep1 = ddao.savePrs1(s,var1[i],var1a[i],var1b[i],var1c[i],/*var1d[i],var1e[i],var1g[i]*/var1h[i],var1i[i],var1j[i],dosage[i]);
	              
	    }
	 		
	 		
	 	
	 		
	 		savep3 = dao.savePrs(s);
			savev= ndao.saveVital(s);
			s.setTablename("diagnose");
		 	sav=ddao.savediagnose21(s);
		 		ModelAndView  mav = new ModelAndView();
		 		if(sav > 0 && savev >0 ){
		 		mav.addObject("message", "The record has been saved sucessfully");

		 		mav.setViewName("redirect:diagnose");		    

		 		}

		 		else{
		 		mav.addObject("message", "Record could not be saved successfully ");

		 		mav.setViewName("redirect:diagnose");

		 		}
		 			
		 	return mav; 

}
		  

		  //load header values
		  @RequestMapping(value="/loadhead", method = RequestMethod.POST)
			public @ResponseBody String loadtab2(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
					String jsonFormatData = "";
				 int res = 0;
				 int tab = Integer.parseInt(req.getParameter("tab"));
				 int level = Integer.parseInt(req.getParameter("level"));
				 
				 res = ddao.savediagheader(tab,req.getParameter("header"),level,"diagheader");
				 List<Diagnose> list5b = null;
					
				
			 if(res > 0){
				 list5b = ddao.getHeaderVal(tab,req.getParameter("header"),"diagheader");  
			 }
			 Map<String, Object> model = new HashMap<String, Object>();
		       model.put("list5b", list5b);
			
			 Gson gson = new Gson(); 

			jsonFormatData = gson.toJson(list5b);

				
		 return jsonFormatData;
}
		//update header
		  
		  //load header values
		  @RequestMapping(value="/updhead", method = RequestMethod.POST)
			public @ResponseBody String updhtab(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
					String jsonFormatData = "";
				 int res = 0;
				 //int tabid = Integer.parseInt(req.getParameter("tabid"));
				 int hid = Integer.parseInt(req.getParameter("hid"));
				 int level = Integer.parseInt(req.getParameter("level"));
				 		
				 res = ddao.upddiagheader(hid,req.getParameter("header"),level,"diagheader");
				 List<Diagnose> list5c = null;
					
				
			 if(res > 0){
				 list5c = ddao.getHeaderValsl(hid,"diagheader");  
			 }
			 Map<String, Object> model = new HashMap<String, Object>();
		       model.put("list5c", list5c);
			
			 Gson gson = new Gson(); 

			jsonFormatData = gson.toJson(list5c);

				
		 return jsonFormatData;
}
		  //update checkbox values
		  @RequestMapping(value="/updchname", method = RequestMethod.POST)
			public @ResponseBody String updhch(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
					String jsonFormatData = "";
				 int res = 0;
				 int tabid = Integer.parseInt(req.getParameter("cid"));
				 
			
				 		
				 res = ddao.updChname(tabid,req.getParameter("header"),"diagdata");
				 List<Diagnose> list5de = null;
					
				
			 if(res > 0){
				 list5de = ddao.getChknameVal(tabid,"diagdata");  
			 }
			 Map<String, Object> model = new HashMap<String, Object>();
		       model.put("list5de", list5de);
			
			 Gson gson = new Gson(); 

			jsonFormatData = gson.toJson(list5de);

				
		 return jsonFormatData;
}
		  
		  //update Tab values
		  @RequestMapping(value="/updtabs", method = RequestMethod.POST)
			public @ResponseBody String updtab(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
					String jsonFormatData = "";
				 int res = 0;
				 int tabid = Integer.parseInt(req.getParameter("tabid"));
				 
			
				 		
				 res = ddao.updtab(tabid,req.getParameter("tabvalue"),"diagtab");
				 List<Diagnose> list5f = null;
					
				
			 if(res > 0){
				 list5f = ddao.getTabvalue(tabid,"diagtab");  
			 }
			 Map<String, Object> model = new HashMap<String, Object>();
		       model.put("list5f", list5f);
			
			 Gson gson = new Gson(); 

			jsonFormatData = gson.toJson(list5f);

				
		 return jsonFormatData;
}
	
		  //save checkbox values
		  @RequestMapping(value="/loadchk", method = RequestMethod.POST)
			public @ResponseBody String loadtab4(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
					String jsonFormatData = "";
				 int res = 0;
				 int tab = Integer.parseInt(req.getParameter("tab"));
				 int hid = Integer.parseInt(req.getParameter("hid"));
				 int pid = Integer.parseInt(req.getParameter("pid"));
				 int level = Integer.parseInt(req.getParameter("level"));
				
				
				 res = ddao.saveChk(tab,req.getParameter("chkname"),pid,hid,level,"diagdata");
				
					
				String val = null;
			 if(res > 0){
				
				  val = "success";	
			 }
		
			
			 Gson gson = new Gson(); 
		

			jsonFormatData = gson.toJson(val);

				
		 return jsonFormatData;
}		  
		  
//Dental congiguration screens
		  
			 

@RequestMapping(value="/cdiagnose/{path}", method = RequestMethod.GET)
public ModelAndView  cdiagnose(@PathVariable String path,Prescription s,Principal principal,Authentication authentication) {


	  authentication.getAuthorities();
	  Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	  String b = var.toString();
	 	List<Prescription> list1= ddao.getDocIDdiag(principal.getName(),b,"cdiagnose");
	 	if(list1.isEmpty()){
	 		s.setDocid(b);
	 	list1.add(s);
	 	}
	     List<Patient> list2= dao.getPatientId1();
	     List<Diagnose>list3 = ddao.getHistvalue("cdiagnose");
	     List<Vitals> list15= ndao.getVitals(principal.getName());
		 List<Appointment> list16 = ddao.getAppointment1();
		 //List<Appointment> list3= dao.getAppointment();
	     List<Prescription>list4 = dao.search();
	 
	     Map<String, Object> model = new HashMap<String, Object>();
	       model.put("list1", list1);
	       model.put("list2", list2);
	       model.put("list3", list3);
	       model.put("list4", list4);
	       model.put("list16", list16);

	       if(path.contains("config")){
	    	   model.put("use","config");
	       }
	       else{
	    	   model.put("use","user"); 
	       }

	 	return new ModelAndView("cdiagnose","model",model);  
					}

@RequestMapping(value="/cdiagnose", method = RequestMethod.GET)
public ModelAndView  cdiagnose1(Prescription s,Principal principal,Authentication authentication) {


	  authentication.getAuthorities();
	  Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	  String b = var.toString();
	 	List<Prescription> list1= ddao.getDocID2(principal.getName(),b);
	 	if(list1.isEmpty()){
	 		s.setDocid(b);
	 	list1.add(s);
	 	}
	     List<Patient> list2= dao.getPatientId1();
	     List<Diagnose>list3 = ddao.getHistvalue("cdiagnose");
	     List<Vitals> list15= ndao.getVitals(principal.getName());
		 List<Appointment> list16 = ddao.getAppointment1();
		 //List<Appointment> list3= dao.getAppointment();
	     List<Prescription>list4 = dao.search();
	 
	     Map<String, Object> model = new HashMap<String, Object>();
	       model.put("list1", list1);
	       model.put("list2", list2);
	       model.put("list3", list3);
	       model.put("list4", list4);
	       model.put("list16", list16);

	      

	 	return new ModelAndView("cdiagnoseuser","model",model);  
					}

//laod values based on history screen

@RequestMapping(value="/cdiagnose2", method = RequestMethod.GET)
public ModelAndView  cdiagnose2(Prescription s,Principal principal,Authentication authentication,HttpServletRequest req, HttpServletResponse response) {


	  authentication.getAuthorities();
	  Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	  String b = var.toString();
	 	List<Prescription> list1= ddao.getDocID2(principal.getName(),b);
	 	if(list1.isEmpty()){
	 		s.setDocid(b);
	 	list1.add(s);
	 	}
	     List<Patient> list2= dao.getPatientId1();
	     List<Diagnose>list3 = ddao.getHistvalue("cdiagnose");
	     List<Vitals> list15= ndao.getVitals(principal.getName());
		 List<Appointment> list16 = ddao.getAppointment1();
		 //List<Appointment> list3= dao.getAppointment();
	     List<Prescription>list4 = dao.search();
	 
	     Map<String, Object> model = new HashMap<String, Object>();
	       model.put("list1", list1);
	       model.put("list2", list2);
	       model.put("list3", list3);
	       model.put("list4", list4);
	       model.put("list16", list16);
           model.put("pnamea",req.getParameter("pnamea"));  
	      

	 	return new ModelAndView("cdiagnoseuser","model",model);  
					}


@RequestMapping(value="/cdiagnosegc", method = RequestMethod.GET)
public ModelAndView  cdiagnosegc(Prescription s,Principal principal,Authentication authentication,HttpServletRequest req, HttpServletResponse response) {


	  authentication.getAuthorities();
	  Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	  String b = var.toString();
	 	List<Prescription> list1= ddao.getDocID2(principal.getName(),b);
	 	if(list1.isEmpty()){
	 		s.setDocid(b);
	 	list1.add(s);
	 	}
	     List<Patient> list2= dao.getPatientId1();
	     List<Diagnose>list3 = ddao.getHistvalue("cdiagnose");
	     List<Vitals> list15= ndao.getVitals(principal.getName());
		 List<Appointment> list16 = ddao.getAppointment1();
		 //List<Appointment> list3= dao.getAppointment();
	     List<Prescription>list4 = dao.search();
	 
	     Map<String, Object> model = new HashMap<String, Object>();
	       model.put("list1", list1);
	       model.put("list2", list2);
	       model.put("list3", list3);
	       model.put("list4", list4);
	       model.put("list16", list16);
	       model.put("fileno",req.getParameter("location").toString());
	       model.put("pname",req.getParameter("location1").toString());
	       model.put("pid",req.getParameter("location2").toString());
	       model.put("docid",req.getParameter("location3").toString()); 
	    //    model.put("sav",req.getParameter("location4").toString()); 
	      

	 	return new ModelAndView("cdiagnoseuser","model",model);  
					}
@RequestMapping(value="/cloaddiv1", method = RequestMethod.GET)
public @ResponseBody String cloaddiv1(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
		String jsonFormatData = "";
	int tab = Integer.parseInt(req.getParameter("tab"));
	int pid = Integer.parseInt(req.getParameter("pid"));
	int level = Integer.parseInt(req.getParameter("level"));
	
	 List<Diagnose> list = ddao.getLoadvalue(tab,pid,"cdiagdata","cdiagheader");
	 List<Diagnose> list1 = ddao.getHeaderVal1(tab,level,"cdiagheader");
	 List<Diagnose> list5 = ddao.getTeethvalues("teethvalues");
	// List<Diagnose> list1 = ddao.getHeaderVal1(tab,pid);
	 Map<String, Object> model = new HashMap<String, Object>();
       model.put("list", list);
       model.put("list1", list1);
       model.put("list5", list5);
     //  model.put("list1", list1);
	 Gson gson = new Gson(); 

	jsonFormatData = gson.toJson(model);

   
return jsonFormatData;


	
//get previous records


}

@RequestMapping(value="/cloaddivv", method = RequestMethod.GET)
public @ResponseBody String cloaddivv(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
		String jsonFormatData = "";
	int level = Integer.parseInt(req.getParameter("level"));
	int tab = Integer.parseInt(req.getParameter("tab"));
	
	 List<Diagnose> list = ddao.getlval1(level,"cdiagdata","diagheader",tab);
	 List<Diagnose> list1 = ddao.getHeaderVal1(tab,level,"cdiagheader");
	 List<Diagnose> list5 = ddao.getTeethvalues("teethvalues");
	 Map<String, Object> model = new HashMap<String, Object>();
       model.put("list", list);
       model.put("list1", list1);
       model.put("list5", list5);

     //  model.put("list1", list1);
	 Gson gson = new Gson(); 

	jsonFormatData = gson.toJson(model);

   
return jsonFormatData;


	
//get previous records


}

@RequestMapping(value="/cloadtab1", method = RequestMethod.POST)
public @ResponseBody String cloadtab(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
		String jsonFormatData = "";
	
		
	 int res = 0;
	 res = ddao.savediagtab(req.getParameter("lab"),"cdiagtab");
/*	 List<Diagnose> list5 = null;
	 if(res > 0){
	 list5 = ddao.getTabsvalue(lab);
	 }
	 Map<String, Object> model = new HashMap<String, Object>();
       model.put("list5", list5);
	*/
	 
	 if(res > 0){
	 jsonFormatData = "success";
	 }
   System.out.println();
return jsonFormatData;
}

@RequestMapping(value="/cloadtab", method = RequestMethod.POST)
public @ResponseBody String cloadtab(@ModelAttribute("s") Diagnose s) {
		String jsonFormatData = "";
	 int res = 0;
	
	 List<Diagnose> list5 = null;
	
	 list5 = ddao.getTabsvalue("cdiagtab");
	 
	 Map<String, Object> model = new HashMap<String, Object>();
       model.put("list5", list5);
	
	 Gson gson = new Gson(); 

	jsonFormatData = gson.toJson(list5);

   
return jsonFormatData;

}

@RequestMapping(value="/cloadtxtvalues", method = RequestMethod.GET)
public @ResponseBody String cloadtxt(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
		String jsonFormatData = "";
	 int res = 0;
	
	 List<Diagnose> list6 = null;
	String fileno = req.getParameter("location6");
	 list6 = ddao.getTxtval(fileno,"cdiagnose");
	 
	 Map<String, Object> model = new HashMap<String, Object>();
       model.put("list6", list6);
	
	 Gson gson = new Gson(); 

	jsonFormatData = gson.toJson(list6);

   
return jsonFormatData;
	 
//get previous records


}

@RequestMapping(value="/csavediag", method = RequestMethod.POST)
	public ModelAndView  csavediag(@ModelAttribute("r") Diagnose s) {
	 int sav=0;
	  int savep1 = 0;
	  int savep2 = 0;
	  int savep3 = 0;
  int savep4 = 0;
	  int savepa = 0;	
	 int savev = 0;	
	savepa= dao.saveact(s);
	
	
	String var = s.getTypeofdr();
	if(var == null){
		var = "null";
		
	}
	String var1[] = var.split(",");
	String vara = s.getDrugname();
	if(vara == null){
		vara = "null";
		
	}
	String var1a[] = vara.split(",");
	
	String varb = s.getStrdrug();
	if(varb == null){
		varb = "null";
		
	}
	String var1b[] = varb.split(",");
	
	String dos = s.getDosage();
	if(dos == null){
		dos = "null";
	}
	
	String dosage[] = dos.split(",");
	
	String varc = s.getDm();
	if(varc == null){
		varc = "off";
	
	}
	
	
	String var1c[] = varc.split(",");

	String varh = s.getBaf();
	if(varh == null){
		varh = "before";
		
	}
	String var1h[] =varh.split(",");
	
	String vari = s.getTotn();
	if(vari == null){
		vari = "null";
		
	}
	String var1i[] =vari.split(",");
	String varj = s.getNofdays();
	if(varj == null){
		varj = "null";
		
	}
	String var1j[] =varj.split(",");
	
	for(int i =0;i<var1.length;i++ ){
     
savep1 = ddao.savePrs1(s,var1[i],var1a[i],var1b[i],var1c[i],/*var1d[i],var1e[i],var1g[i]*/var1h[i],var1i[i],var1j[i],dosage[i]);
      
}
	
	

	
	savep3 = dao.savePrs(s);
savev= ndao.saveVital(s);
s.setTablename("cdiagnose");
	sav=ddao.savediagnose21(s);
		ModelAndView  mav = new ModelAndView();
		if(sav > 0 && savev >0 ){
		mav.addObject("message", "The record has been saved sucessfully");

		mav.setViewName("redirect:cdiagnose");		    

		}

		else{
		mav.addObject("message", "Record could not be saved successfully ");

		mav.setViewName("redirect:cdiagnose");

		}
			
	return mav; 

}


//load header values
@RequestMapping(value="/cloadhead", method = RequestMethod.POST)
public @ResponseBody String cloadtab2(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
		String jsonFormatData = "";
	 int res = 0;
	 int tab = Integer.parseInt(req.getParameter("tab"));
	 int level = Integer.parseInt(req.getParameter("level"));
	 
	 res = ddao.savediagheader(tab,req.getParameter("header"),level,"cdiagheader");
	 List<Diagnose> list5b = null;
		
	
 if(res > 0){
	 list5b = ddao.getHeaderVal(tab,req.getParameter("header"),"cdiagheader");  
 }
 Map<String, Object> model = new HashMap<String, Object>();
   model.put("list5b", list5b);

 Gson gson = new Gson(); 

jsonFormatData = gson.toJson(list5b);

	
return jsonFormatData;
}
//update header

//load header values
@RequestMapping(value="/cupdhead", method = RequestMethod.POST)
public @ResponseBody String cupdhtab(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
		String jsonFormatData = "";
	 int res = 0;
	 int tabid = Integer.parseInt(req.getParameter("tabid"));
	 int hid = Integer.parseInt(req.getParameter("hid"));
	 int level = Integer.parseInt(req.getParameter("level"));
	 		
	 res = ddao.upddiagheader(hid,req.getParameter("header"),level,"cdiagheader");
	 List<Diagnose> list5c = null;
		
	
 if(res > 0){
	 list5c = ddao.getHeaderValsl(hid,"cdiagheader");  
 }
 Map<String, Object> model = new HashMap<String, Object>();
   model.put("list5c", list5c);

 Gson gson = new Gson(); 

jsonFormatData = gson.toJson(list5c);

	
return jsonFormatData;
}
//update checkbox values
@RequestMapping(value="/cupdchname", method = RequestMethod.POST)
public @ResponseBody String cupdhch(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
		String jsonFormatData = "";
	 int res = 0;
	 int tabid = Integer.parseInt(req.getParameter("cid"));
	 

	 		
	 res = ddao.updChname(tabid,req.getParameter("header"),"cdiagdata");
	 List<Diagnose> list5de = null;
		
	
 if(res > 0){
	 list5de = ddao.getChknameVal(tabid,"cdiagdata");  
 }
 Map<String, Object> model = new HashMap<String, Object>();
   model.put("list5de", list5de);

 Gson gson = new Gson(); 

jsonFormatData = gson.toJson(list5de);

	
return jsonFormatData;
}

//update Tab values
@RequestMapping(value="/cupdtabs", method = RequestMethod.POST)
public @ResponseBody String cupdtab(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
		String jsonFormatData = "";
	 int res = 0;
	 int tabid = Integer.parseInt(req.getParameter("tabid"));
	 

	 		
	 res = ddao.updtab(tabid,req.getParameter("tabvalue"),"cdiagtab");
	 List<Diagnose> list5f = null;
		
	
 if(res > 0){
	 list5f = ddao.getTabvalue(tabid,"cdiagtab");  
 }
 Map<String, Object> model = new HashMap<String, Object>();
   model.put("list5f", list5f);

 Gson gson = new Gson(); 

jsonFormatData = gson.toJson(list5f);

	
return jsonFormatData;
}

//save checkbox values
@RequestMapping(value="/cloadchk", method = RequestMethod.POST)
public @ResponseBody String cloadtab4(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
		String jsonFormatData = "";
	 int res = 0;
	 int tab = Integer.parseInt(req.getParameter("tab"));
	 int hid = Integer.parseInt(req.getParameter("hid"));
	 int pid = Integer.parseInt(req.getParameter("pid"));
	 int level = Integer.parseInt(req.getParameter("level"));
	
	
	 res = ddao.saveChk(tab,req.getParameter("chkname"),pid,hid,level,"cdiagdata");
	
		
	String val = null;
 if(res > 0){
	 System.out.println("res "+res);
	  val = "success";	
 }


 Gson gson = new Gson(); 


jsonFormatData = gson.toJson(val);

	
return jsonFormatData;
}		  

//delete prescription tabs

@RequestMapping(value="/idelpr/{drug}/{type}/{fileno}")
	public  @ResponseBody String  deleteipd(@ModelAttribute("s") Prescription2 s,@PathVariable String drug,@PathVariable String type,@PathVariable String fileno) {
	 int bsave = 0;
	 String jsonFormatData = "";
	
	bsave = ddao.deleteipr(drug,type,fileno);
	
	ModelAndView  mav = new ModelAndView();
	 Gson gson = new Gson();
	 gson.toJson(bsave);
	if(bsave > 0){
		jsonFormatData =  gson.toJson("success");
					    
	}

	else{
		jsonFormatData =gson.toJson("failure");
	}


	     return jsonFormatData;
		}

//filter based on contents
@RequestMapping(value="/retds", method = RequestMethod.GET)
		public @ResponseBody String retds(HttpServletRequest req,@ModelAttribute("s") Diagnose s) {
				String jsonFormatData = "";
			
			
				List<Diagnose>listred = ddao.getHistvalue(req.getParameter("location2"),req.getParameter("location"));
			// List<Diagnose> list1 = ddao.getHeaderVal1(tab,pid);
			 Map<String, Object> model = new HashMap<String, Object>();
		       
		       model.put("listred", listred);
		     //  model.put("list1", list1);
			 Gson gson = new Gson(); 

			jsonFormatData = gson.toJson(model);

	       
	 return jsonFormatData;
	
	
	 
	
//get previous records
	

}
@RequestMapping(value="/prescription")
public  ModelAndView prescription(@ModelAttribute("p") Prescription s,Principal principal,Authentication authentication) {
	 
	 Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
   	String b = var.toString();
	 

    
    List<Diagnose>list3 = ddao.getCodc();
   
    
   
Map<String, Object> model = new HashMap<String, Object>();
     
      model.put("list3", list3);

	return new ModelAndView("prescriptiongen2","model",model); 
	}
}
