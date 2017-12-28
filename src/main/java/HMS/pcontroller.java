package HMS;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
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
public class pcontroller {
	@Autowired  
	controllerDao dao;
	@Autowired 
	patientControllerDao pdao;
	
	//redirection to patient master
		@RequestMapping(value="/patient", method = RequestMethod.GET)
		public ModelAndView patient(@ModelAttribute("p") Patient p) {
			List<Patient> list=pdao.getPatientId();  
		
			List<Patient> list2= pdao.getPatientId1();
			
			   List<Patient> list4 = pdao.getIc();
			
		  // list2 = dao.getInsurance();

		   
		//  list2 = dao.getAdditional();
		    
			 Map<String, Object> model = new HashMap<String, Object>();
		        model.put("list",list);
		        model.put("list2",list2);
		        model.put("list4",list4);
			return new ModelAndView("patientreg","model",model); 
			}
		@RequestMapping(value="/ins", method = RequestMethod.GET)
		public @ResponseBody String Insurance(@ModelAttribute("p") Patient p) {
			String jsonFormatData = "";
		//	List<Patient> list=dao.getPatientId();  
		
			List<Patient> list2 = pdao.getInsurance(p.getPid());
		    List<Patient> list3 = pdao.getAdditional(p.getPid());
		   
		   
			
			
			 Gson gson = new Gson(); 
			 
			 Map<String, Object> model = new HashMap<String, Object>();
			  //     
			       model.put("list2",list2);
			       model.put("list3",list3);
			      
			    jsonFormatData = gson.toJson(model);
			
		  // list2 = dao.getInsurance();

		   
		//  list2 = dao.getAdditional();
		    
		//	 Map<String, Object> model = new HashMap<String, Object>();
		  //      model.put("list",list);
		   //     model.put("list2",list2);
			return jsonFormatData; 
			}
	// Emergency Patient
		
		@RequestMapping(value="/patientid", method = RequestMethod.GET)
		public @ResponseBody String Patient(@ModelAttribute("p") Patient p) {
	    List<Patient> list=pdao.getPatientId();  
		
			String jsonFormatData = "";
			
			 Gson gson = new Gson(); 
			 
		//	 Map<String, Object> model = new HashMap<String, Object>();
			  //     
			//       model.put("list2",list2);
			  //     model.put("list3",list3);
			    jsonFormatData = gson.toJson(list);
			
		  // list2 = dao.getInsurance();

		   
		//  list2 = dao.getAdditional();
		    
		//	 Map<String, Object> model = new HashMap<String, Object>();
		  //      model.put("list",list);
		   //     model.put("list2",list2);
			return jsonFormatData; 
			}

		 //patient save
		@RequestMapping(value="/saveP", method = RequestMethod.POST)
		public ModelAndView patientsave(@ModelAttribute("p") Patient p) {
		//	List<Patient> list=dao.getPatientId();  
			int savep = 0;
			int	savei = 0;
			int savea=  0;
			ModelAndView  mav = new ModelAndView();
		savep = pdao.savePatient(p);
		savei =	pdao.savePatientInsurance(p);
		savea =	pdao.savePatientaddition(p);
		if(savep > 0 && savei > 0 && savea > 0){
		  		    mav.addObject("message", "The record has been saved sucessfully");
		    mav.setViewName("redirect:patient");
	}
		else{
			 mav.addObject("message", "The record has been saved sucessfully");
			    mav.setViewName("redirect:patient");
		}
			 
		    RedirectView redirectView = new RedirectView();
		     redirectView.setUrl("/HMS/patient.html");
	        return mav; 
			}
	    
}
