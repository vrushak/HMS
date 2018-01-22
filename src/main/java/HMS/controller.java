package HMS;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import com.google.gson.Gson;

import HMS.controllerDao;
import HMS.Patient;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class controller {
	@Autowired  
	controllerDao dao;
	@Autowired  
	patientControllerDao pdao;
	@Autowired  
	doctControllerDao ddao;
	//print docsillgen4
	
	@RequestMapping(value="/prdocs", method = RequestMethod.GET)
	   public ModelAndView docs() {
	 	 
	 	
	 	    
	 	 	return new ModelAndView("printdocs"); 
	 }

	//load user
	 @RequestMapping(value="/updateur", method = RequestMethod.GET)
	   public ModelAndView Updateur() {
	 	 
	 	   // List<Admitpat> list1= dao.getAdmitpat1();
	 	    List<Register> list2 = dao.getNrole(); 
	 	    Map<String,Object> model = new HashMap<String, Object>();
	 	
	 	  //  model.put("list1", list1);
	 	    model.put("list2", list2);
	 	    
	 	 	return new ModelAndView("updateur","model",model); 
	 }
	 
	 @RequestMapping(value="/saveur", method = RequestMethod.POST)
		public ModelAndView  saveUr(@ModelAttribute("s") Register s) {
		 int saves = 0;
		 saves = dao.saveur(s);
		 ModelAndView  mav = new ModelAndView();
		 if(saves > 0){
		 	 mav.addObject("message", "The record has been updated sucessfully");
		 	 mav.setViewName("redirect:updateur");
		 			}
		   
	        return mav; 
			}
	 //update assistant
	 
	 @RequestMapping(value="/loadas", method = RequestMethod.GET)
	   public ModelAndView Assistantrl() {
	 	 
	 	   // List<Admitpat> list1= dao.getAdmitpat1();
	 	    List<Register> list3 = dao.getArole(); 
	 	    Map<String,Object> model = new HashMap<String, Object>();
	 	
	 	  //  model.put("list1", list1);
	 	    model.put("list3", list3);
	 	    
	 	 	return new ModelAndView("updateal","model",model); 
	 }
	 @RequestMapping(value="/saveas", method = RequestMethod.POST)
		public ModelAndView  saveAs(@ModelAttribute("s") Register s) {
		 int saves = 0;
		 saves = dao.saveas(s);
		 ModelAndView  mav = new ModelAndView();
		 if(saves > 0){
		   mav.addObject("message", "The role has been updated sucessfully");
		 	mav.setViewName("redirect:loadas");
		 }
		   
	        return mav; 
			}
	 
	 @RequestMapping(value="/dischargeas", method = RequestMethod.GET)
	   public ModelAndView discharge() {
	 	 
	 	   // List<Admitpat> list1= dao.getAdmitpat1();
	 	    List<Discharge> list2 = dao.getDischarge(); 
	 	    Map<String,Object> model = new HashMap<String, Object>();
	 	
	 	  //  model.put("list1", list1);
	 	    model.put("list2", list2);
	 	    
	 	 	return new ModelAndView("discharge","model",model); 
	 }
	
		//Nurse redirection
	
		@RequestMapping(value="/chkuser/{username}", method = RequestMethod.GET)
		public @ResponseBody String chkuser(@PathVariable String username) {
	    List<Register> list=dao.checkuserext(username);  
		
			String jsonFormatData = "";
			
			 Gson gson = new Gson(); 
			 
		
			    jsonFormatData = gson.toJson(list);
			
		  
			return jsonFormatData; 
			}

		 //patient save
		
			
			
				@RequestMapping(value="/addstocks", method = RequestMethod.GET)
				public ModelAndView addstock(@ModelAttribute("p") Doctor p) {
			//		List<Doctor> list=dao.getDocID();  
					List<Stock> list= dao.getStockId();
					List<Stock> list1= dao.getStockId1();
					 Map<String, Object> model = new HashMap<String, Object>();
				  //      model.put("list",list);
					    model.put("list",list);
				        model.put("list1",list1);
					return new ModelAndView("stock","model",model); 
					}
				
				@RequestMapping(value="/saveS", method = RequestMethod.POST)
				public ModelAndView  saveStock(@ModelAttribute("s") Stock s) {
				 int saves = 0;
				 saves = dao.saveS(s);
				 ModelAndView  mav = new ModelAndView();
				 if(saves > 0){
				 				    
				 				    mav.addObject("message", "The record has been saved sucessfully");
				 				    mav.setViewName("redirect:addstocks");
				 			}
				   RedirectView redirectView = new RedirectView();
				     redirectView.setUrl("/HMS/addstocks.html");
			        return mav; 
					}
				
				@RequestMapping(value="/getStocks", method = RequestMethod.GET)
				public ModelAndView getstock(@ModelAttribute("p") Stock p) {
			//		List<Doctor> list=dao.getDocID();  
					List<Stock> list1= dao.getStockId1();
					List<Transaction>list2=dao.getTransid();
					 Map<String, Object> model = new HashMap<String, Object>();
				  //      model.put("list",list);
				        model.put("list1",list1);
				       model.put("list2", list2);
					return new ModelAndView("transaction","model",model); 
					}
				@RequestMapping(value="/saveT", method = RequestMethod.POST)
				public ModelAndView  saveTrans(@ModelAttribute("s") Transaction s) {
				 int savet = 0;
				 int upds = 0;
				savet =	dao.saveTr(s);
				upds = dao.updateStk(s);
				
				ModelAndView  mav = new ModelAndView();
				if(savet > 0 && upds > 0){
								   
								    mav.addObject("message", "The record has been saved sucessfully");
								    mav.setViewName("redirect:getStocks");
							}
				else{
					    mav.addObject("message", "Record could not be saved successfully ");
					    mav.setViewName("redirect:getStocks");
				}
					 RedirectView redirectView = new RedirectView();
				     redirectView.setUrl("/HMS/getStocks.html");
			        return mav; 
					}
				
				@RequestMapping(value="/cappointment", method = RequestMethod.GET)
				public ModelAndView getAppointment(@ModelAttribute("p") Appointment p) {
					List<Appointment> list= dao.getFileno1();
			   		List<Doctor> list1= dao.getDocID1();
				    List<Patient> list2= dao.getPatientId1();
					List<Appointment> list3= dao.getAppointment();
					
			  Map<String, Object> model = new HashMap<String, Object>();
			            model.put("list",list);
				        model.put("list1",list1);
				        model.put("list2",list2);
				        model.put("list3", list3);
			  		return new ModelAndView("appointment","model",model); 
					}
				@RequestMapping(value="/saveApp", method = RequestMethod.POST)
				public ModelAndView  saveAppointment(@ModelAttribute("s") Appointment s) {
				 
					int app = 0;
					
				app =	dao.saveApp(s);
				ModelAndView  mav = new ModelAndView();
				if(app > 0){
								    
								    mav.addObject("message", "The record has been saved sucessfully");
								    mav.setViewName("redirect:cappointment");
							}

					else{
									    mav.addObject("message", "Record could not be saved successfully ");
									    mav.setViewName("redirect:cappointment");
								}
					 RedirectView redirectView = new RedirectView();
				     redirectView.setUrl("/HMS/cappointment.html");
			        return mav; 
					}
				@RequestMapping(value="/cancelapp", method = RequestMethod.POST)
				public ModelAndView  CancelAppointment(@ModelAttribute("s") Appointment s) {
				 int capp = 0;
				capp=dao.cancelApp(s);
				ModelAndView  mav = new ModelAndView();
				if(capp > 0){
								    
								    mav.addObject("message", "Appointment has been cancelled");
								    mav.setViewName("redirect:cappointment");
							}

					
					 RedirectView redirectView = new RedirectView();
				     redirectView.setUrl("/HMS/cappointment.html");
			        return mav; 
					}
				@RequestMapping(value="/admitpat", method = RequestMethod.GET)
				public ModelAndView doctoract(@ModelAttribute("p") Appointment p) {
				 List<Admitpat> list= dao.getAdmitpatid();
					List<Doctor> list1= dao.getDocID1();
				    List<Prescription> list2= dao.getpreadm();
				    List<Admitpat> list3= dao.getAdmitpat();
			 Map<String, Object> model = new HashMap<String, Object>();
			          
			          model.put("list", list);
			          model.put("list1", list1);
			          model.put("list2", list2);
				      model.put("list3", list3);
					return new ModelAndView("admitpat","model",model); 
					}
				@RequestMapping(value="/saveAdm", method = RequestMethod.POST)
				public ModelAndView  saveAdmit(@ModelAttribute("s") Admitpat s) {
				 int admp = 0;
				 
				admp = dao.saveAdm(s);
						
				ModelAndView  mav = new ModelAndView();
				if(admp > 0){
				mav.addObject("message", "The record has been saved sucessfully");
				mav.setViewName("redirect:admitpat");		    
								    
				}

				else{
				mav.addObject("message", "Record could not be saved successfully ");
				mav.setViewName("redirect:admitpat");
				}
					 RedirectView redirectView = new RedirectView();
				     redirectView.setUrl("/HMS/admitpat.html");
			        return mav; 
					}
				

 
  @RequestMapping(value="/billconfig", method = RequestMethod.GET)
  public ModelAndView billconfig(@ModelAttribute("p") Billconfig p) {
	  List<Billconfig> list1= dao.getBillconfig();
  
  Map<String, Object> model = new HashMap<String, Object>();
  model.put("list1", list1);
   
  	return new ModelAndView("billconfig","model",model); 
  	}
  
  @RequestMapping(value="/saveBill", method = RequestMethod.POST)
	public ModelAndView  saveBillconfig(@ModelAttribute("s") Billconfig s) {
	 int bill = 0;
	String var = s.getFeetype();
	System.out.println(var);
    String[] var1 = var.split(",");
    String var2 = s.getCharges();
    String[] var3 = var2.split(",");
    String var4 = s.getAid();
    String var5[] = var4.split(",");
    
    for(int i =0;i<var1.length;i++ ){
	bill = dao.saveBillconfig(var1[i],var3[i],var5[i]);
    }
    ModelAndView  mav = new ModelAndView();
    if(bill > 0){
    mav.addObject("message", "The record has been saved sucessfully");
    mav.setViewName("redirect:billconfig");		    
    				    
    }

    else{
    mav.addObject("message", "Record could not be saved successfully ");
    mav.setViewName("redirect:billconfig");
    }
		 RedirectView redirectView = new RedirectView();
	     redirectView.setUrl("/HMS/billconfig.html");
     return mav; 
		}
    
  @RequestMapping(value="/billgen", method = RequestMethod.GET)
  public ModelAndView billgener(@ModelAttribute("p") Billgen p) {
	
	  List<Billconfig> list1= dao.getBillconfig();
	 
	  List<Billgen> list2= dao.getBill();
	  List<Billgen> list3= dao.getBill1();
	 
  Map<String,Object> model = new HashMap<String, Object>();
  model.put("list1", list1);
  model.put("list2", list2);
  model.put("list3", list3);
  	return new ModelAndView("billgen","model",model); 
  	}

	@RequestMapping(value="/billgen4/{user}/{fileno}", method = RequestMethod.GET)
	public @ResponseBody String iochart1(@PathVariable String user,@PathVariable String fileno) {
		
		String jsonFormatData = "";
		System.out.println(fileno);
		 List<Billgen> list9 = dao.getBill8(fileno);
		 List<Billgen> list6 = dao.getBill4(user);
	     //List<Iochart> list5 = dao.getPatientdet3(s.getAdmitno());
		 List<Billgen> list8 = dao.getBill7(fileno);
	
		 Map<String, Object> model = new HashMap<String, Object>();
	       
		    //    model.put("list1", list1);
		      //  model.put("list2", list2);
		
		       model.put("list6", list6);
		        model.put("list8", list8);
		        model.put("list9", list9);
				 Gson gson = new Gson(); 

				    jsonFormatData = gson.toJson(model);

     

		
			 return jsonFormatData;
	}
  @RequestMapping(value="/billhistory", method = RequestMethod.GET)
  public ModelAndView billhistory(@ModelAttribute("p") Billgen p) {
	
	  List<Billconfig> list1= dao.getBillconfig();
	 
	  List<Billgen> list2= dao.getBill();
	  List<Billgen> list3= dao.getBill1();
	 System.out.println(p.getPname());
	  List<Billgen> list4= dao.getBill2(p);
	 
  Map<String,Object> model = new HashMap<String, Object>();
  model.put("list1", list1);
  model.put("list2", list2);
  model.put("list3", list3);
  if(list4.isEmpty()){
	  model.put("note", "No previous bills generated for the selected patient");
	  return new ModelAndView("billgen","model",model);
	}
  else{
  model.put("list4", list4);
  	return new ModelAndView("viewold","model",model); 
  	}
  }
  
  @RequestMapping(value="/billsave", method = RequestMethod.POST)
	public  @ResponseBody String  savebill(@ModelAttribute("s") Billgen s) {
	 int bsave = 0;
	 String jsonFormatData = "";
	bsave = dao.savebill(s);
	Patient p = new Patient();
	p.setPid(s.getPid());
	p.setPins(s.getInsurancec());
	p.setPolicyh1(s.getPolicyholder());
	p.setPolicyno1(s.getPolicyno());
	p.setMid1(s.getMid());
	pdao.savePatientInsurance1(p);	
	ModelAndView  mav = new ModelAndView();
	if(bsave > 0){
		jsonFormatData = "success";
					    
	}

	else{
		jsonFormatData = "failure";
	}
		 RedirectView redirectView = new RedirectView();
	     redirectView.setUrl("/HMS/billgen.html");
	     return jsonFormatData;
		}
  
  
  
//hospital inventory page redirection 
  @RequestMapping(value="/hospital", method = RequestMethod.GET)
	public ModelAndView hospital() {
		
		return new ModelAndView("hospitalinv"); 
		}
  
//hospital inventory page redirection 
 
 
  
  @RequestMapping(value="/saveTre1", method = RequestMethod.POST)
	public ModelAndView  saveTransaction1(@ModelAttribute("s") Treatment s) {
	
	  int savetr = 0;
	  
		savetr = dao.saveTre(s);
			
		ModelAndView  mav = new ModelAndView();
		if(savetr > 0){
		mav.addObject("message", "The record has been saved sucessfully");
		mav.setViewName("redirect:nursedesk");		    
						    
		}

		else{
		mav.addObject("message", "Record could not be saved successfully ");
		mav.setViewName("redirect:nursedesk");
		}
		 RedirectView redirectView = new RedirectView();
	     redirectView.setUrl("/HMS/nursedesk");
     return mav; 
		}
  
  @RequestMapping(value="/retstocks", method = RequestMethod.GET)
	public ModelAndView returnStocks(@ModelAttribute("p") Stock p) {
//		List<Doctor> list=dao.getDocID();  
		List<Stock> list1= dao.getStockId1();
		List<Transaction>list2=dao.getTransid1();
		 Map<String, Object> model = new HashMap<String, Object>();
	  //      model.put("list",list);
	        model.put("list1",list1);
	       model.put("list2", list2);
		return new ModelAndView("return","model",model); 
		}
	@RequestMapping(value="/retS", method = RequestMethod.POST)
	public ModelAndView  save(@ModelAttribute("s") Transaction s) {
	 int rets = 0;
	 int retss = 0;
	 //dao.saveTr(s);
		
		rets = dao.returnStk(s);
		retss = dao.returnStks(s);
		 
		ModelAndView  mav = new ModelAndView();
		if(rets > 0 && retss > 0){
		mav.addObject("message", "The record has been saved sucessfully");
		mav.setViewName("redirect:retstocks");		    
						    
		}

		else{
		mav.addObject("message", "Record could not be saved successfully ");
		mav.setViewName("redirect:retstocks");
		}
		RedirectView redirectView = new RedirectView();
	     redirectView.setUrl("/HMS/retstocks.html");
      return mav; 
		}
	
	
	
	//lab config masters
	@RequestMapping(value="/labcmast", method = RequestMethod.GET)
	public ModelAndView  labcmaster() {
	List<Lab> list1= dao.getLabconcat();
	List<Lab> list2= dao.getLabconscat();
		
		
		 Map<String, Object> model = new HashMap<String, Object>();
	       model.put("list1",list1);
	       model.put("list2",list2);
		return new ModelAndView("labcmast","model",model); 
		}
	
	@RequestMapping(value="/labssave", method = RequestMethod.POST)
	public ModelAndView  saveNr(@ModelAttribute("s") Lab s,HttpServletRequest req,HttpServletResponse res) {
	
	//	dao.savecategory(s);
	//	dao.savescategory(s);
		 RedirectView redirectView = new RedirectView();
	     redirectView.setUrl("/HMS/labcmast.html");
          return new ModelAndView(redirectView); 
		}
	
	//lab config redirection
	@RequestMapping(value="/labconfig", method = RequestMethod.GET)
	public ModelAndView  labconfig() {
		 List<Lab> list1= dao.getLabconfig();
    	
    	
		 Map<String, Object> model = new HashMap<String, Object>();
	        model.put("list1",list1);
	     
		return new ModelAndView("labconfig","list1",list1); 
		}
	
	@RequestMapping(value="/savelabc.html", method = RequestMethod.POST)
	public ModelAndView  saveLabc(@ModelAttribute("s") Lab s,HttpServletRequest req,HttpServletResponse res) {
	  int savconf = 0;
		 String category[] = req.getParameterValues("category");
		 String subcategory[] = req.getParameterValues("subcategory");
		 String range[] = req.getParameterValues("range");
		 for(int i= 0;i<category.length;i++){
			savconf =  dao.savescategory(s,category[i],subcategory[i],range[i]);
		 }	
		 ModelAndView  mav = new ModelAndView();
		 if(savconf > 0){
			 mav.addObject("message", "The record has been saved sucessfully");
			 mav.setViewName("redirect:labconfig");		    
		}
  else{
				mav.addObject("message", "Record could not be saved successfully ");
				mav.setViewName("redirect:labconfig");
				
		 }
		
      return mav; 
		}
	
	//lab config redirection
		@RequestMapping(value="/labact", method = RequestMethod.GET)
		public ModelAndView  labact() {
		    
			return new ModelAndView("labact"); 
			}
		@RequestMapping(value="/labbill", method = RequestMethod.GET)
		public ModelAndView  labbill() {
		    
			return new ModelAndView("labbill"); 
			}
		
		//lab code check
		
		@RequestMapping(value="/labconfig1/{value}", method = RequestMethod.GET)
		public @ResponseBody String iochart1(@PathVariable String value, @ModelAttribute("s") Iochart s) {
			System.out.println("Patient"+s.getAdmitno());
			String jsonFormatData = "";
			
			 
			List<Lab> list6= dao.getLabconfig1(value);
	         
			 Map<String, Object> model = new HashMap<String, Object>();
		       
			    //    model.put("list1", list1);
			      //  model.put("list2", list2);
			
			       model.put("list6", list6);
			      
			 
					 Gson gson = new Gson(); 

					    jsonFormatData = gson.toJson(list6);

	       
	
			
				 return jsonFormatData;
		}
//io-chart
		@RequestMapping(value="/iochart", method = RequestMethod.GET)
		public ModelAndView  iochart(Principal principal,Authentication authentication) {
              authentication.getAuthorities();
	    	
	    	System.out.println("Authentication" +authentication.getAuthorities());
	    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	    	String b = var.toString();
	         
			List<Iochart> list3; 
					if(b.contains("[ROLE_NURSE]")){
						//list3 =dao.getPatientdet(principal.getName());
						list3 = dao.getPatientdet();
					}
					else
					list3 = dao.getPatientdet();
			return new ModelAndView("iochart","list3",list3); 
			}
		
		@RequestMapping(value="/iochart1", method = RequestMethod.GET)
		public @ResponseBody String iochart1(@ModelAttribute("s") Iochart s) {
			System.out.println("Patient"+s.getAdmitno());
			String jsonFormatData = "";
			
			 
			 List<Iochart> list4 = dao.getPatientdet1(s.getAdmitno());
			 List<Iochart> list5 = dao.getPatientdet3(s.getAdmitno());
	         
			 Map<String, Object> model = new HashMap<String, Object>();
		       
			    //    model.put("list1", list1);
			      //  model.put("list2", list2);
			
			       model.put("list4", list4);
			       model.put("list5", list5);
			 
					 Gson gson = new Gson(); 

					    jsonFormatData = gson.toJson(model);

	       
	
			
				 return jsonFormatData;
		}
	
				 @RequestMapping(value="/iochart2/{admitno}/{id}", method = RequestMethod.GET)
					public @ResponseBody String iochart2(@PathVariable String admitno,@PathVariable String id,@ModelAttribute("s") Iochart s) {
						System.out.println("Patient"+s.getAdmitno());
						String jsonFormatData = "";
						
						 
					//	 List<Iochart> list4 = dao.getPatientdet1(s.getAdmitno());
						 List<Iochart> list5 = dao.getPatientdet2(admitno,id);
						 List<Iochart> list7 = dao.getPatientdet3(admitno,id);
				         
						 Map<String, Object> model = new HashMap<String, Object>();
					       
						    //    model.put("list1", list1);
						      //  model.put("list2", list2);
						
						//       model.put("list4", list4);
						       model.put("list5", list5);
						       model.put("list7", list7);
						 
								 Gson gson = new Gson(); 

								    jsonFormatData = gson.toJson(model);

				       
				
						
							 return jsonFormatData;
				
				
						
			 //get previous records
		 
			}
		
		
		@RequestMapping(value="/saveIo", method = RequestMethod.POST)
		public   ModelAndView  saveIo(HttpServletRequest req,HttpServletResponse res,@ModelAttribute("s") Iochart s,BindingResult result,Model model) throws IOException {
			
			
			  
			int saves = 0;
			dao.saveiochart(s);
			String aid1 = s.getAid1();
			String aid1a[] = aid1.split(",");
			
			System.out.println("aid is"+ aid1a.length);
			String date = s.getDate();
		//	String datea[] = date.split(",");
			
			String time = s.getTime();
			String timea[] = time.split(",");
			
			String type = s.getOraltype();
			String typeaa[] = type.split(",");
			
			
			String amount = s.getOralamt();
			String amta[] = amount.split(",");
			
			String typecomm = s.getOralcommence();
			String typea[] = typecomm.split(",");
			
			String amtgiv = s.getAmtgiv();
			String amounta[] = amtgiv.split(",");
			
			String urine = s.getUrine();
			String urinea[] = urine.split(",");
			
			String vomitus = s.getVomitus();
			String vomitusa[] = vomitus.split(",");
			
			String remarks = s.getRemarks();
			String remarksa[] = remarks.split(",");
			
			String doctord = s.getDoctord();
			String doctora[] = doctord.split(",");
			
			String doctsign = s.getDoctsig();
			String doctsigna[] = doctsign.split(",");
			
			String rate = s.getRatef();
			String ratea[] = rate.split(",");
			
			String nursesig1 = s.getNsign();
			String nursesig[] = nursesig1.split(",");
			
			String doctrmks = s.getDoctrmks();
			String doctrmksa[] = doctrmks.split(",");
			System.out.println(amta.length);
			System.out.println(timea.length);
			System.out.println(typeaa.length);
			System.out.println(typea.length);
			System.out.println(amounta.length);
			System.out.println(urinea.length);
			System.out.println(vomitusa.length);
			System.out.println(remarksa.length);
			System.out.println(doctora.length);
			System.out.println(doctsigna.length);
			System.out.println(ratea.length);
			System.out.println(nursesig.length);
			for(int i=0;i<aid1a.length;i++){
				System.out.println(nursesig[i]);
			saves =	dao.saveiochart1(s,aid1a[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],vomitusa[i],remarksa[i],doctora[i],doctsigna[i],ratea[i],doctrmksa[i],nursesig[i]);
			}
			System.out.println("successfully saved" +saves);
			PrintWriter out = res.getWriter();
			res.setContentType("text/html");
			
			ModelAndView  mav = new ModelAndView();
			
		if(saves > 0){
			    System.out.println("here");
			    mav.addObject("message", "The record has been saved sucessfully");
			    mav.setViewName("redirect:iochart");
		}
			// Map<String, Object> model = new HashMap<String, Object>();
			 
			/*
		
			RedirectView redirectView = new RedirectView();
		
		     redirectView.setUrl("/HMS/iochart");
	     */
	     return mav; 
				 
		
			
			//return new ModelAndView("iochart","message",savemessage); 
			}

		
		@RequestMapping(value="/drugchart", method = RequestMethod.GET)
		public ModelAndView  drugchart(Principal principal,Authentication authentication) {
    authentication.getAuthorities();
	    	
	    	System.out.println("Authentication" +authentication.getAuthorities());
	    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	    	String b = var.toString();
	         
			List<Iochart> list3; 
					if(b.contains("[ROLE_NURSE]")){
						//list3 =dao.getPatientdet(principal.getName());
						list3 = dao.getPatientdet();
					}
					else
					list3 = dao.getPatientdet();
					 List<Prescription>list4 = dao.search();		
					 Map<String, Object> model = new HashMap<String, Object>();
				      
				      
				       model.put("list3", list3);
				       model.put("list4", list4);
			return new ModelAndView("drugchart","model",model); 
			}
		
		@RequestMapping(value="/saveDr", method = RequestMethod.POST)
		public   @ResponseBody String  saveDr(HttpServletRequest req,HttpServletResponse res,@ModelAttribute("s") Drugchart s,BindingResult result,Principal principal,Authentication authentication) throws IOException,ServletException {
			 String jsonFormatData = "";
			int saved = 0;
			int saven = 0;
			int savead = 0;
			int savean = 0;
			
            authentication.getAuthorities();
	    	
	    	System.out.println("Authentication" +authentication.getAuthorities());
	    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	    	String b = var.toString();
	    	//	String date = s.getDate();
			//	String datea[] = date.split(",");
			String fileno = req.getParameter("fileno");
	    	System.out.println("FileNO" +fileno);
				System.out.println(s.getPid());
				System.out.println(s.getTime());
				String time = s.getTime();
				String timea[] = time.split(",");
				
				System.out.println("tlength id"+timea.length);
				String type = s.getOraltype();
				String typeaa[] = type.split(",");
				
				
				String amount = s.getOralamt();
				String amta[] = amount.split(",");
				
				String typecomm = s.getOralcommence();
				String typea[] = typecomm.split(",");
				
				String amtgiv = s.getAmtgiv();
				String amounta[] = amtgiv.split(",");
				
				String urine = s.getUrine();
				String urinea[] = urine.split(",");
				
			
				
			
				
				String doctord = s.getDoctord();
				String doctora[] = doctord.split(",");
				
			
				
				String aid = s.getAid1();
				String aida[] = aid.split(",");
				System.out.println("tlength id"+aida.length);
				
				String disc = s.getDiscontinue();
				if(disc == null){
					
						disc = "off";
						
					
					}
				String disca[] = disc.split(",");
				
				
				
				String rate = s.getRatef();
				if(rate == null){
					
						rate = "off";
						
					
					}
				String ratea[] = rate.split(",");
				
				
				
				String nursesign = s.getNursesig();
				
				if(nursesign == null){
					nursesign = "off";
				}
				String nursesigna[] = nursesign.split(",");
				
				
				String doctrmks = s.getDoctrmks();
				if(doctrmks == null){
					doctrmks = "off";
				}
				String doctrmksa[] = doctrmks.split(",");
				
				String vomitus = s.getVomitus();
				System.out.println("Vomitus is "+ vomitus);
				if(vomitus == null){
					vomitus = "off";
				}
				String vomitusa[] = vomitus.split(",");
				
				System.out.println("ext" +s.getExtflag());
	    	
	    	if(b.contains("[ROLE_DOCTOR]")){
	    		for(int i=0;i<aida.length;i++){
	    			
					//System.out.println("nursesig " +nursesigna[i]);
		   saved = dao.savedrchart01(s,aida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],doctora[i],disca[i]);
				
	    		}	
			}
	    	
	    	else if(b.contains("[ROLE_NURSE]")){
	    		System.out.println("Role is "+b);
	    		for(int i=0;i<aida.length;i++){
	    			System.out.println("aida is" +aida.length);
	    			System.out.println(vomitusa.length);
	    			System.out.println(nursesigna.length);
	    			
					//System.out.println("nursesig " +nursesigna[i]);
	    		saven =	dao.savedrchart1(s,aida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],doctora[i],ratea[i],vomitusa[i],nursesigna[i],doctrmksa[i],disca[i]);
	    	  //		dao.savedrchart02(aida[i],typeaa[i]);
				}	
			}
	    	else if(b.contains("[ROLE_CHIEFNURSE]")){
	    		System.out.println("Role is "+b);
	    		for(int i=0;i<aida.length;i++){
	    			System.out.println("aida is" +aida.length);
	    			System.out.println(vomitusa.length);
	    			System.out.println(nursesigna.length);
	    			
					//System.out.println("nursesig " +nursesigna[i]);
	    		saven =	dao.savedrchart1(s,aida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],doctora[i],ratea[i],vomitusa[i],nursesigna[i],doctrmksa[i],disca[i]);
	    	  //		dao.savedrchart02(aida[i],typeaa[i]);
				}	
			}
	    	else if(b.contains("[ROLE_ADMIN]") && s.getExtflag().contains("doct")){
	            for(int i=0;i<aida.length;i++){
	    			
					//System.out.println("nursesig " +nursesigna[i]);
		   savead = dao.savedrchart01(s,aida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],doctora[i],disca[i]);
				
	    		}	
	    	}
	    	
            else if(b.contains("[ROLE_ADMIN]") && s.getExtflag().contains("nurse")){
            	for(int i=0;i<aida.length;i++){
	    			System.out.println("aida is" +aida.length);
	    			System.out.println(vomitusa.length);
	    			System.out.println(nursesigna.length);
	    			
					//System.out.println("nursesig " +nursesigna[i]);
	    		savean =	dao.savedrchart1(s,aida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],doctora[i],ratea[i],vomitusa[i],nursesigna[i],doctrmksa[i],disca[i]);
	    	  //		dao.savedrchart02(aida[i],typeaa[i]);
				}	
	    	}
	    	  
	    	else{
	    		
	    	}
	    	
		//	dao.savedrchart1(s);
			
	//		dao.savedrchart(s);
		
		//	String date = s.getDate();
		//	String datea[] = date.split(",");
		/*	
			String time = s.getTime();
			String timea[] = time.split(",");
			
			System.out.println("tlength id"+timea.length);
			String type = s.getOraltype();
			String typeaa[] = type.split(",");
			
			
			String amount = s.getOralamt();
			String amta[] = amount.split(",");
			
			String typecomm = s.getOralcommence();
			String typea[] = typecomm.split(",");
			
			String amtgiv = s.getAmtgiv();
			String amounta[] = amtgiv.split(",");
			
			String urine = s.getUrine();
			String urinea[] = urine.split(",");
			
		
			
		
			
			String doctord = s.getDoctord();
			String doctora[] = doctord.split(",");
			
		
			
			String aid = s.getAid1();
			String aida[] = aid.split(",");
			System.out.println("tlength id"+aida.length);
			
			
			String rate = s.getRatef();
			if(rate == null){
				
					rate = "off";
					
				
				}
			String ratea[] = rate.split(",");
			
			
			
			String nursesign = s.getNursesig();
			
			if(nursesign == null){
				nursesign = "off";
			}
			String nursesigna[] = nursesign.split(",");
			
			
			String doctrmks = s.getDoctrmks();
			if(doctrmks == null){
				doctrmks = "off";
			}
			String doctrmksa[] = doctrmks.split(",");
			
			String vomitus = s.getVomitus();
			if(vomitus == null){
				vomitus = "off";
			}
			String vomitusa[] = vomitus.split(",");
			//System.out.println(s.getVomitus());
		
			System.out.println("tlength id"+aida.length);
			System.out.println("tlength id"+ratea.length);
			System.out.println("tlength id"+nursesigna.length);
			System.out.println("tlength id"+doctrmksa.length);
			System.out.println("tlength id"+vomitusa.length);
			
			for(int i=0;i<aida.length;i++){
			
				//System.out.println("nursesig " +nursesigna[i]);
			dao.savedrchart1(s,aida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],doctora[i],ratea[i],vomitusa[i],nursesigna[i],doctrmksa[i]);
			}
			    */
			 RedirectView redirectView = new RedirectView();
		     redirectView.setUrl("/HMS/drugchart");
		 
	    if(savead > 0){
	    	jsonFormatData = "success";
	    }
	    else if(savean > 0){
	    	jsonFormatData = "success";
	    }
	    else if(saved > 0){
	    	jsonFormatData = "success";	
	    }
	    else if(saven > 0){
	    	jsonFormatData = "success";
	    }
	    else{
	    	jsonFormatData = "Failure";
	    }




	 return jsonFormatData;
				
				
			}
		//check for reorder level
		
		@RequestMapping(value="/reorder", method = RequestMethod.GET)
		public ModelAndView  Reorder() {
			List<Stock> list2= dao.getReorder();
			List<Stock> list= dao.getStockId();
			List<Stock> list1= dao.getStockId1();
			 Map<String, Object> model = new HashMap<String, Object>();
		  //      model.put("list",list);
			    model.put("list",list);
		        model.put("list1",list1);
		        model.put("list2",list2);
			return new ModelAndView("reorder","model",model); 
			}
		
		@RequestMapping(value="/savehour", method = RequestMethod.POST)
		public   ModelAndView  saveHour(@ModelAttribute("s") Hourchart s,BindingResult result) {
		
			dao.savehochart(s);
			
			String tabid = s.getTabid();
		 	String tabida[] = tabid.split(",");
			
			String time = s.getTime();
			String timea[] = time.split(",");
			
			String type = s.getOraltype();
			String typeaa[] = type.split(",");
			
			
			String amount = s.getOralamt();
			String amta[] = amount.split(",");
			
			String typecomm = s.getOralcommence();
			String typea[] = typecomm.split(",");
			
			String amtgiv = s.getAmtgiv();
			String amounta[] = amtgiv.split(",");
			
			String urine = s.getUrine();
			String urinea[] = urine.split(",");
			
			String aid1 = s.getAid1();
			String aid1a[] = aid1.split(",");
			
			String nursesig1= s.getNsign();
			String nursesig[] = nursesig1.split(",");
			/*
			
			String vomitus = s.getVomitus();
			String vomitusa[] = vomitus.split(",");
			
			String remarks = s.getRemarks();
			String remarksa[] = remarks.split(",");
			
			String doctord = s.getDoctord();
			String doctora[] = doctord.split(",");
			
			String doctsign = s.getDoctsig();
			String doctsigna[] = doctsign.split(",");
			
			String rate = s.getRatef();
			String ratea[] = rate.split(",");
			 
			String doctrmks = s.getDoctrmks();
			String doctrmksa[] = doctrmks.split(",");
			
			*/
			int saves = 0;
			for(int i=0;i<tabida.length;i++){
				System.out.println(timea[i]);
				
				System.out.println(tabida.length);
				System.out.println(aid1a.length);
				System.out.println(amta.length);
				System.out.println(typea.length);
				System.out.println(amounta.length);
				System.out.println(urinea.length);
			saves = dao.savehochart1(s,aid1a[i],tabida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],nursesig[i]);
			}
			ModelAndView  mav = new ModelAndView();
			
			if(saves > 0){
				    System.out.println("here");
				    mav.addObject("message", "The record has been saved sucessfully");
				    mav.setViewName("redirect:hourchart");
			}
			 RedirectView redirectView = new RedirectView();
		     redirectView.setUrl("/HMS/hourchart");
	     return mav; 
				 
				
			}
		
		//load hour chart details
		
		@RequestMapping(value="/hourchart", method = RequestMethod.GET)
		public ModelAndView  hourchart(Principal principal,Authentication authentication) {
                 authentication.getAuthorities();
	    	
	    	System.out.println("Authentication" +authentication.getAuthorities());
	    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	    	String b = var.toString();
	         
			List<Iochart> list3; 
					if(b.contains("[ROLE_NURSE]")){
						//list3 =dao.getPatientdet(principal.getName());
						list3 = dao.getPatientdet(); 
					}
					else
					list3 = dao.getPatientdet(); 
		//	List<Iochart> list3= dao.getPatientdet(principal.getName());
			return new ModelAndView("hourchart","list3",list3); 
			}
		
		@RequestMapping(value="/hourchart1", method = RequestMethod.GET)
		public @ResponseBody String hourchart1(@ModelAttribute("s") Hourchart s) {
			System.out.println("Patient"+s.getAdmitno());
			String jsonFormatData = "";
			
			 
			 List<Hourchart> list4 = dao.getPatientdet1h(s.getAdmitno());
			 List<Hourchart> list5 = dao.getPatientdet3h(s.getAdmitno());
	         
			 Map<String, Object> model = new HashMap<String, Object>();
		       
			    //    model.put("list1", list1);
			      //  model.put("list2", list2);
			
			       model.put("list4", list4);
			       model.put("list5", list5);
			 
					 Gson gson = new Gson(); 

					    jsonFormatData = gson.toJson(model);

	       
	
			
				 return jsonFormatData;
		}
	
				 @RequestMapping(value="/hochart2/{admitno}/{id}", method = RequestMethod.GET)
					public @ResponseBody String hochart2(@PathVariable String admitno,@PathVariable String id,@ModelAttribute("s") Hourchart s) {
						System.out.println("Patient"+s.getAdmitno());
						String jsonFormatData = "";
						
						 
					//	 List<Iochart> list4 = dao.getPatientdet1(s.getAdmitno());
						 List<Hourchart> list5 = dao.getPatientdet2h(admitno,id);
				         
						 Map<String, Object> model = new HashMap<String, Object>();
					       
						    //    model.put("list1", list1);
						      //  model.put("list2", list2);
						
						//       model.put("list4", list4);
						       model.put("list5", list5);
						 
								 Gson gson = new Gson(); 

								    jsonFormatData = gson.toJson(model);

				       
				
						
							 return jsonFormatData;
				
				
						
			 //get previous records
		 
			}
		

				 // load drug chart
				 
					@RequestMapping(value="/drugchart1", method = RequestMethod.GET)
					public @ResponseBody String drugchart1(@ModelAttribute("s") Drugchart s) {
						System.out.println("Patient"+s.getAdmitno());
						String jsonFormatData = "";
						
						 
						// List<Drugchart> list4 = dao.getPatientdet1d(s.getAdmitno());
						 List<Drugchart> list5 = dao.getPatientdet3d(s.getAdmitno());
				         
						 Map<String, Object> model = new HashMap<String, Object>();
					       
						    //    model.put("list1", list1);
						      //  model.put("list2", list2);
						
						  //     model.put("list4", list4);
						       model.put("list5", list5);
						 
								 Gson gson = new Gson(); 

								    jsonFormatData = gson.toJson(model);

				       
				
						
							 return jsonFormatData;
					}
				
							 @RequestMapping(value="/drugchart2/{admitno}/{id}", method = RequestMethod.GET)
								public @ResponseBody String drugchart2(@PathVariable String admitno,@PathVariable String id,@ModelAttribute("s") Drugchart s) {
									System.out.println("Patient"+s.getAdmitno());
									String jsonFormatData = "";
									
									 
								//	 List<Iochart> list4 = dao.getPatientdet1(s.getAdmitno());
									 List<Drugchart> list6 = dao.getPatientdet2d(admitno,id);
							         System.out.println(s.getRatef());
									 Map<String, Object> model = new HashMap<String, Object>();
								       
									    //    model.put("list1", list1);
									      //  model.put("list2", list2);
									
									//       model.put("list4", list4);
									       model.put("list6", list6);
									 
											 Gson gson = new Gson(); 

											    jsonFormatData = gson.toJson(model);

							       
							
									
										 return jsonFormatData;
							
							
									
						 //get previous records
					 
						}
					
							 @RequestMapping(value="/drugchart3/{admitno}/{drname}/{date}", method = RequestMethod.GET)
								public @ResponseBody String drugchart3(@PathVariable String date,@PathVariable String admitno,@PathVariable String drname,@ModelAttribute("s") Drugchart s) {
									System.out.println("Patient in"+admitno);
									String jsonFormatData = "";
									
									 
								//	 List<Iochart> list4 = dao.getPatientdet1(s.getAdmitno());
									 List<Drugchart> list8 = dao.getPatientdet4d(admitno,drname,date);
							         System.out.println("ratef gh" +s.getRatef());
									 Map<String, Object> model = new HashMap<String, Object>();
								       
									    //    model.put("list1", list1);
									      //  model.put("list2", list2);
									
									//       model.put("list4", list4);
									       model.put("list8", list8);
									 
											 Gson gson = new Gson(); 

											    jsonFormatData = gson.toJson(model);

							       
							
									
										 return jsonFormatData;
							
							
									
						 //get previous records
					 
						}
			
	//opd drugchart
							 
							 @RequestMapping(value="/opdchart", method = RequestMethod.GET)
								public ModelAndView  opdchart(Principal principal,Authentication authentication) {
						    authentication.getAuthorities();
							    	
							    	System.out.println("Authentication" +authentication.getAuthorities());
							    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
							    	String b = var.toString();
							         
									List<Appointment> list3 =dao.getPatientOpd(principal.getName());
									 List<Prescription>list4 = dao.search();
									 Map<String, Object> model = new HashMap<String, Object>();
								      
								      
								       model.put("list3", list3);
								       model.put("list4", list4);
										
									return new ModelAndView("opdchart","model",model); 
									}
								
								@RequestMapping(value="/saveOpd", method = RequestMethod.POST)
								public   @ResponseBody String  saveOpd(HttpServletRequest req,HttpServletResponse res,@ModelAttribute("s") Drugchart s,BindingResult result,Principal principal,Authentication authentication) throws IOException,ServletException {
									 String jsonFormatData = "";
									int saved = 0;
									int saven = 0;
									int savead = 0;
									int savean = 0;
									
						            authentication.getAuthorities();
							    	
							    	System.out.println("Authentication" +authentication.getAuthorities());
							    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
							    	String b = var.toString();
							    	//	String date = s.getDate();
									//	String datea[] = date.split(",");
									String fileno = req.getParameter("fileno");
							    	System.out.println("FileNO" +fileno);
										System.out.println(s.getPid());
										System.out.println(s.getTime());
										String time = s.getTime();
										String timea[] = time.split(",");
										
										System.out.println("tlength id"+timea.length);
										String type = s.getOraltype();
										String typeaa[] = type.split(",");
										
										
										String amount = s.getOralamt();
										String amta[] = amount.split(",");
										
										String typecomm = s.getOralcommence();
										String typea[] = typecomm.split(",");
										
										String amtgiv = s.getAmtgiv();
										String amounta[] = amtgiv.split(",");
										
										String urine = s.getUrine();
										String urinea[] = urine.split(",");
										
									
										
									
										
										String doctord = s.getDoctord();
										String doctora[] = doctord.split(",");
										
									
										
										String aid = s.getAid1();
										String aida[] = aid.split(",");
										System.out.println("tlength id"+aida.length);
										
										String disc = s.getDiscontinue();
										if(disc == null){
											
												disc = "off";
												
											
											}
										String disca[] = disc.split(",");
										
										
										
										String rate = s.getRatef();
										if(rate == null){
											
												rate = "off";
												
											
											}
										String ratea[] = rate.split(",");
										
										
										
										String nursesign = s.getNursesig();
										
										if(nursesign == null){
											nursesign = "off";
										}
										String nursesigna[] = nursesign.split(",");
										
										
										String doctrmks = s.getDoctrmks();
										if(doctrmks == null){
											doctrmks = "off";
										}
										String doctrmksa[] = doctrmks.split(",");
										
										String vomitus = s.getVomitus();
										System.out.println("Vomitus is "+ vomitus);
										if(vomitus == null){
											vomitus = "off";
										}
										String vomitusa[] = vomitus.split(",");
										
										System.out.println("ext" +s.getExtflag());
							    	
							    	if(b.contains("[ROLE_DOCTOR]")){
							    		for(int i=0;i<aida.length;i++){
							    			
											//System.out.println("nursesig " +nursesigna[i]);
								   saved = dao.saveOpdchart01(s,aida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],doctora[i],disca[i]);
										
							    		}	
									}
							    	
							    	else if(b.contains("[ROLE_NURSE]") || b.contains("[ROLE_CHIEFNURSE]")){
							    		System.out.println("Role is "+b);
							    		for(int i=0;i<aida.length;i++){
							    			System.out.println("aida is" +aida.length);
							    			System.out.println(vomitusa.length);
							    			System.out.println(nursesigna.length);
							    			
											//System.out.println("nursesig " +nursesigna[i]);
							    		saven =	dao.saveOpdchart1(s,aida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],doctora[i],ratea[i],vomitusa[i],nursesigna[i],doctrmksa[i],disca[i]);
							    	  //		dao.savedrchart02(aida[i],typeaa[i]);
										}	
									}
							    	else if(b.contains("[ROLE_ADMIN]") && s.getExtflag().contains("doct")){
							            for(int i=0;i<aida.length;i++){
							    			
											//System.out.println("nursesig " +nursesigna[i]);
								   savead = dao.saveOpdchart01(s,aida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],doctora[i],disca[i]);
										
							    		}	
							    	}
							    	
						            else if(b.contains("[ROLE_ADMIN]") && s.getExtflag().contains("nurse")){
						            	for(int i=0;i<aida.length;i++){
							    			System.out.println("aida is" +aida.length);
							    			System.out.println(vomitusa.length);
							    			System.out.println(nursesigna.length);
							    			
											//System.out.println("nursesig " +nursesigna[i]);
							    		savean =	dao.saveOpdchart1(s,aida[i],timea[i],typeaa[i],amta[i],typea[i],amounta[i],urinea[i],doctora[i],ratea[i],vomitusa[i],nursesigna[i],doctrmksa[i],disca[i]);
							    	  //		dao.savedrchart02(aida[i],typeaa[i]);
										}	
							    	}
							    	  
							    	else{
							    		
							    	}
							    	
							
									 RedirectView redirectView = new RedirectView();
								     redirectView.setUrl("/HMS/drugchart");
								 
							    if(savead > 0){
							    	jsonFormatData = "success";
							    }
							    else if(savean > 0){
							    	jsonFormatData = "success";
							    }
							    else if(saved > 0){
							    	jsonFormatData = "success";	
							    }
							    else if(saven > 0){
							    	jsonFormatData = "success";
							    }
							    else{
							    	jsonFormatData = "Failure";
							    }




							 return jsonFormatData;
										
										
									}
								
								 // load drug chart
								 
								@RequestMapping(value="/opdchart1", method = RequestMethod.GET)
								public @ResponseBody String opdchart1(@ModelAttribute("s") Drugchart s) {
									System.out.println("Patient"+s.getAdmitno());
									String jsonFormatData = "";
									
									 
									// List<Drugchart> list4 = dao.getPatientdet1d(s.getAdmitno());
									 List<Drugchart> list5 = dao.getPatientdet3Opd(s.getAdmitno());
							         
									 Map<String, Object> model = new HashMap<String, Object>();
								       
									    //    model.put("list1", list1);
									      //  model.put("list2", list2);
									
									  //     model.put("list4", list4);
									       model.put("list5", list5);
									 
											 Gson gson = new Gson(); 

											    jsonFormatData = gson.toJson(model);

							       
							
									
										 return jsonFormatData;
								}
							
										 @RequestMapping(value="/opdchart2/{admitno}/{id}", method = RequestMethod.GET)
											public @ResponseBody String opdchart2(@PathVariable String admitno,@PathVariable String id,@ModelAttribute("s") Drugchart s) {
												System.out.println("Patient"+s.getAdmitno());
												String jsonFormatData = "";
												
												 
											//	 List<Iochart> list4 = dao.getPatientdet1(s.getAdmitno());
												 List<Drugchart> list6 = dao.getPatientdet2Opd(admitno,id);
										         System.out.println(s.getRatef());
												 Map<String, Object> model = new HashMap<String, Object>();
											       
												    //    model.put("list1", list1);
												      //  model.put("list2", list2);
												
												//       model.put("list4", list4);
												       model.put("list6", list6);
												 
														 Gson gson = new Gson(); 

														    jsonFormatData = gson.toJson(model);

										       
										
												
													 return jsonFormatData;
										
										
												
									 //get previous records
								 
									}
								
										 @RequestMapping(value="/opdchart3/{admitno}/{drname}/{date}", method = RequestMethod.GET)
											public @ResponseBody String opdchart3(@PathVariable String date,@PathVariable String admitno,@PathVariable String drname,@ModelAttribute("s") Drugchart s) {
												System.out.println("Patient in"+admitno);
												String jsonFormatData = "";
												
												 
											//	 List<Iochart> list4 = dao.getPatientdet1(s.getAdmitno());
												 List<Drugchart> list8 = dao.getPatientdet4Opd(admitno,drname,date);
										         System.out.println("ratef gh" +s.getRatef());
												 Map<String, Object> model = new HashMap<String, Object>();
											       
												    //    model.put("list1", list1);
												      //  model.put("list2", list2);
												
												//       model.put("list4", list4);
												       model.put("list8", list8);
												 
														 Gson gson = new Gson(); 

														    jsonFormatData = gson.toJson(model);

										       
										
												
													 return jsonFormatData;
										
										
												
									 //get previous records
								 
									}
										 @RequestMapping(value="/labup2", method = RequestMethod.GET)
											public ModelAndView  labup2(Principal principal,Authentication authentication,HttpServletRequest req, HttpServletResponse response) {
											 
											 Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
										    	String b = var.toString();
											 
												 List<Lab> list2= dao.getLabconfig();
												 List<Prescription> list1= ddao.getDocID2(principal.getName(),b);
												 List<Lab> list3= dao.getLabupload();
										    	String s = "how";
												 Map<String, Object> model = new HashMap<String, Object>();
											        model.put("list1",list1);
											        model.put("list2",list2);
											        model.put("list3",list3);
											        model.put("fileno",req.getParameter("location").toString());
											        model.put("pname",req.getParameter("location1").toString());
											        model.put("pid",req.getParameter("location2").toString());
												return new ModelAndView("lab","model",model); 
												}	
										 @RequestMapping(value="/labup", method = RequestMethod.GET)
											public ModelAndView  labup(Principal principal,Authentication authentication) {
											 
											 Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
										    	String b = var.toString();
											 
												 List<Lab> list2= dao.getLabconfig();
												 List<Prescription> list1= ddao.getDocID3(principal.getName(),b);
												 List<Lab> list3= dao.getLabupload();
										    	
												 Map<String, Object> model = new HashMap<String, Object>();
											        model.put("list1",list1);
											        model.put("list2",list2);
											        model.put("list3",list3);
												return new ModelAndView("lab","model",model); 
												}			
			//get the subcategories
										 @RequestMapping(value="/labup1", method = RequestMethod.GET)
											public @ResponseBody String opdchart1(@ModelAttribute("s") Lab s) {
												
												String jsonFormatData = "";
												
												 
											
												 List<Lab> list4= dao.getLabconfig(s.getCategory());
										         
												 Map<String, Object> model = new HashMap<String, Object>();
											       
												  
												       model.put("list4", list4);
												 
														 Gson gson = new Gson(); 

														    jsonFormatData = gson.toJson(model);

										       
										
												
													 return jsonFormatData;
											}
										 
										 @RequestMapping(value="/labprint", method = RequestMethod.GET)
											public ModelAndView  labprint(Principal principal,Authentication authentication) {
											 
											 Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
										    	String b = var.toString();
											 
												 List<Lab> list2= dao.getLabconfig();
												 List<Prescription> list1= ddao.getDocID2(principal.getName(),b);
												 List<Lab> list3= dao.getLabupload();
										    	
												 Map<String, Object> model = new HashMap<String, Object>();
											        model.put("list1",list1);
											        model.put("list2",list2);
											        model.put("list3",list3);
												return new ModelAndView("labprint","list3",list3); 
													
											
												}
						 @RequestMapping(value="/del", method = RequestMethod.GET)
						public ModelAndView  Cancelsubcat(@ModelAttribute("s") Appointment s,HttpServletRequest req, HttpServletResponse response) {
											 int capp = 0;
											capp=dao.cancelSub(req.getParameter("val"));
											ModelAndView  mav = new ModelAndView();
											if(capp > 0){
															    
															    mav.addObject("message", "Record has been deleted");
															    mav.setViewName("redirect:labconfig");
														}
											else{
												  mav.addObject("message", "Record has not been deleted");
												    mav.setViewName("redirect:labconfig");
											}
												
												 RedirectView redirectView = new RedirectView();
											     redirectView.setUrl("/HMS/labconfig.html");
										        return mav; 
												}
						 
						 
						 @RequestMapping(value="/pdf", method = RequestMethod.GET)
							
							public ModelAndView billgen(@ModelAttribute("s") Appointment s,ModelAndView modelAndView) {
							
								
								List<Appointment> list3= dao.getAppointment();
								   Map<String,Object> parameterMap = new HashMap<String,Object>();
								   JRDataSource JRdataSource = new JRBeanCollectionDataSource(list3);
								   
							        parameterMap.put("datasource", JRdataSource);
							 
							        //xlsReport bean has ben declared in the jasper-views.xml file
							        modelAndView = new ModelAndView("pdfReport", parameterMap);
							 
							        return modelAndView;
							 
								}
}


