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
import HMS.Patient;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ncontroller {

	@Autowired  
	controllerDao dao;
	@Autowired  
	nurseControllerDao ndao;
	@Autowired  
	doctControllerDao ddao;
	
	//Nurse redirection
		@RequestMapping(value="/nurse", method = RequestMethod.GET)
		public ModelAndView nurse(@ModelAttribute("p") Nurse p) {
			List<Nurse> list=ndao.getNurseId();  
			List<Nurse> list1= ndao.getNurseId1();
			 Map<String, Object> model = new HashMap<String, Object>();
		        model.put("list",list);
		        model.put("list1",list1);
			return new ModelAndView("nursereg","model",model); 
			}
		
		 //patient save
			@RequestMapping(value="/saveN", method = RequestMethod.POST)
			public ModelAndView nursesave(@ModelAttribute("p") Nurse p) {
			
				int saven = 0;
				int saveun = 0;
				int saveunr = 0;
				
				saveun = ndao.saveuser(p);
			    saveunr =  ndao.saveuserrole(p);
				saven = dao.saveNurse(p);
				
				ModelAndView  mav = new ModelAndView();
				if(saveun > 0 && saveunr > 0 && saven > 0){
				mav.addObject("message", "The record has been saved sucessfully");
				mav.setViewName("redirect:nurse");		    
								    
				}

				else{
				mav.addObject("message", "Record could not be saved successfully ");
				mav.setViewName("redirect:nurse");
				}
				 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/HMS/nurse.html");
		        return mav; 
				}
			
			 @RequestMapping(value="/nurseact/{nid}", method = RequestMethod.GET)
				public ModelAndView staff(@PathVariable String nid,@ModelAttribute("s") Nurseassign s) {
				      
				  List<Nurseassign> list2= ndao.getNurseassign2(nid);
				  List<Nurseassign> list1= ndao.getNurseassign1(nid);
				  
				  Map<String, Object> model = new HashMap<String, Object>();
				  //      model.put("list",list);
				        model.put("list1",list1);
				        model.put("list2",list2);
				  
				  return new ModelAndView("nurseact","model",model);
					
					
					}
			  
			  @RequestMapping(value="/nursetr/{pid}", method = RequestMethod.GET)
			 	public ModelAndView staff1(@PathVariable String pid, @ModelAttribute("s") Treatment s) {
			 	  s.setPid(pid);
			 	  List<Treatment> list2 = dao.getTreatment(s); 
			 		return new ModelAndView("nursetr","list2",list2); 
			 		}
			  
			//get assign nurse details
				
				@RequestMapping(value="/nurseassign", method = RequestMethod.GET)
				public ModelAndView  nurseassign(@ModelAttribute("s") Nurseassign s) {
				     List<Admitpat> list1= dao.getAdmitpat();
			    	 List<Nurse> list2= ndao.getNurseId1();
			    	 List<Nurseassign> list3= ndao.getNurseassign();
			    	
					 Map<String, Object> model = new HashMap<String, Object>();
				        model.put("list1",list1);
				        model.put("list2",list2);
				        model.put("list3",list3);
					return new ModelAndView("nurseassign","model",model); 
					}
				//save assign nurse
				
				@RequestMapping(value="/saveNr", method = RequestMethod.POST)
				public ModelAndView  saveNr(@ModelAttribute("s") Nurseassign s) {
                      int saven = 0;				 
					saven = ndao.saveNr(s);
					System.out.println(s.getNname());
					ModelAndView  mav = new ModelAndView();
					if(saven > 0){
					mav.addObject("message", "The record has been saved sucessfully");
					mav.setViewName("redirect:nurseassign");		    
									    
					}

					else{
					mav.addObject("message", "Record could not be saved successfully ");
					mav.setViewName("redirect:nurseassign");
					}
					 RedirectView redirectView = new RedirectView();
				     redirectView.setUrl("/HMS/nurseassign.html");
			      return mav; 
					}
				
				// vitals screen load
				
				@RequestMapping(value="/vitals", method = RequestMethod.GET)
				public ModelAndView  vitals(Principal principal,Authentication authentication,HttpServletRequest req,HttpServletResponse res) {
					Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
			    	String b = var.toString();
			    	
					List<Vitals> list4= ndao.getVitals(principal.getName());
					List<Appointment> list3;
					if(b.contains("[ROLE_NURSE]")){
				     list3	= dao.getAppointment();
					
					}
					else{
						list3 = ddao.getAppointment1();
					}
			    	//List<Appointment> list3= dao.getAppointment();
			    	
			    	Map<String, Object> model = new HashMap<String, Object>();
			        model.put("list4",list4);
			        model.put("list3",list3);
			        model.put("bac", req.getParameter("location"));
					return new ModelAndView("vitals","model",model); 
					}
				
				
				@RequestMapping(value="/getvtdetails/{user}/{id}", method = RequestMethod.GET)
				public@ResponseBody String vitals(@PathVariable String user,@PathVariable String id,@ModelAttribute("s") Vitals s,Principal principal,Authentication authentication) {
					
					Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
			    	String b = var.toString();
			    	List<Vitals> list4= ndao.getVitals(user);
			    	List<Vitals> list1 = ndao.getVitalinfo(id);
			    	
			    	
			    	
			    	
			    	
				
				    	
				    	
					 Map<String, Object> model = new HashMap<String, Object>();
				        model.put("list1",list1);
				        model.put("list4",list4);
				        
				        String jsonFormatData = "";
						
						 Gson gson = new Gson(); 
						 
					//	 Map<String, Object> model = new HashMap<String, Object>();
						  //     
						//       model.put("list2",list2);
						  //     model.put("list3",list3);
						    jsonFormatData = gson.toJson(model);
					return  jsonFormatData;  
					}
				
				@RequestMapping(value="/savevit", method = RequestMethod.POST)
				public ModelAndView  saveVital(Principal principal,Authentication authentication,@ModelAttribute("s") Vitals s) {
					authentication.getAuthorities();
			    	
			    	System.out.println("Authentication" +authentication.getAuthorities());
			    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
			    	String b = var.toString();
			    	
					int savev = 0;
				savev= ndao.saveVital(s);
				ModelAndView  mav = new ModelAndView();
				 if(b.contains("[ROLE_DOCTOR]")){
				if(savev > 0){
				mav.addObject("message", "The record has been saved sucessfully");
				mav.setViewName("redirect:vitals");		    
								    
				}

				else{
				mav.addObject("message", "Record could not be saved successfully ");
				mav.setViewName("redirect:vitals");
				}	 
				
				
				 }
			
				 else{
					 if(savev > 0){
							mav.addObject("message", "The record has been saved sucessfully");
							mav.setViewName("redirect:vitals");		    
											    
							}

							else{
							mav.addObject("message", "Record could not be saved successfully ");
							mav.setViewName("redirect:vitals");
							}	 
							
							
				 }
					
			      return mav; 
					}
				
}
