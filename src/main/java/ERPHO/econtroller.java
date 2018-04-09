package ERPHO;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.PathVariable;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;

import ERPHO.controllerDao;
import ERPHO.Purchase;
import ERPHO.Sale;
import ERPHO.Spdiscount;
import ERPHO.TaxB;
import ERPHO.custDisc;
import HMS.Billgen;
import HMS.Patient;
import HMS.Prescription;
import HMS.patientControllerDao;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
//import controller.ManufactDao;
import ERPHO.Order;
import ERPHO.Customer;
import ERPHO.Manufacture;
import ERPHO.Product;
//import ERPHO.Purchase;
import ERPHO.Supply;

@Controller
public class econtroller {
	@Autowired   
	    controllerDao hodao;
	@Autowired   
    patientControllerDao pdao;
	//    ManufactDao dao;
	@Autowired
	ServletContext context;
	
	    //redirection to manufacture master
	private JasperReport jr;
	    @RequestMapping(value="/hmspharma", method = RequestMethod.GET)
		public ModelAndView HMSpharma(@ModelAttribute("m") Manufacture m) {
			
		     
	        return new ModelAndView("hmspharma"); 
			}
		
	    @RequestMapping(value="/hmspharma1", method = RequestMethod.GET)
		public ModelAndView HMSpharma1(@ModelAttribute("m") Manufacture m) {
			
		     
	        return new ModelAndView("hmspharma1"); 
			} 
		@RequestMapping(value="/manufactureho", method = RequestMethod.GET)
		public ModelAndView manufacture(@ModelAttribute("m") Manufacture m) {
			List<Manufacture> list=hodao.getManufacturename();  
			List<Manufacture> list1=hodao.getM();  
			
		    Map<String, Object> model = new HashMap<String, Object>();
	        model.put("list",list);
	        model.put("list1",list1);
		     
	        return new ModelAndView("Manufactentry","model",model); 
			}
		
		//redirection to supplier master
		 @RequestMapping("/supplierho")  
		    public ModelAndView viewemp(){  
		        List<Manufacture> list=hodao.getManufacturename1();  
		        List<Supply> list1 = hodao.getSupplyname1();
		        List<Supply> list2=hodao.getS(); 
		        Map<String, Object> model = new HashMap<String, Object>();
		        model.put("list",list);
		        model.put("list1",list1);
		        model.put("list2",list2);
		        return new ModelAndView("supplyentry","model",model);  
		    }  
		 
		 //saving manufacture masters
		 @RequestMapping(value="/save",method = RequestMethod.POST)
		    public ModelAndView save(@ModelAttribute("s") Manufacture s){  
			  int savem = 0;
		       savem =hodao.save(s);
		       ModelAndView  mav = new ModelAndView();
		       if(savem > 0){
		       mav.addObject("message", "The record has been saved sucessfully");
		       mav.setViewName("redirect:manufactureho.html");		    
		       				    
		       }

		       else{
		       mav.addObject("message", "Record could not be saved successfully ");
		       mav.setViewName("redirect:manufactureho.html");
		       }
		        RedirectView redirectView = new RedirectView();
		        redirectView.setUrl("/HMS/manufactureho.html");
		        return mav;//will redirect to viewemp request mapping  
		    }  
		//save to manufacturer  masters
			@RequestMapping(value="/checkmname",method = RequestMethod.GET)
			  public   @ResponseBody String checkmname(@ModelAttribute("m") Manufacture m){
		//		  List<Order> list1 = hodao.getOrderid();
				String jsonFormatData = "";
				
				List<Manufacture> list1 = hodao.getcheckmname1(m.getName());
				  Map<String, Object> model = new HashMap<String, Object>();
			    //    model.put("list1",list1);
			          model.put("list1", list1);
			        
			        Gson gson = new Gson(); 

				    jsonFormatData = gson.toJson(list1);

    

		
			 return jsonFormatData;
			}
			//saving supplier masters
			@RequestMapping(value="/savesupply",method = RequestMethod.POST)
		    public ModelAndView save(@ModelAttribute("s") Supply s){
				int saves = 0;
		     saves  = hodao.saves(s);
		     ModelAndView  mav = new ModelAndView();
		     if(saves > 0){
		     mav.addObject("message", "The record has been saved sucessfully");
		     mav.setViewName("redirect:supplierho.html");		    
		     				    
		     }

		     else{
		     mav.addObject("message", "Record could not be saved successfully ");
		     mav.setViewName("redirect:supplierho.html");
		     }
		     
		        RedirectView redirectView = new RedirectView();
		        redirectView.setUrl("/HMS/supplierho.html");
		        return mav;//will redirect to viewemp request mapping  
		    }  
			
			
			
			//save to supplier  masters
			@RequestMapping(value="/checksname",method = RequestMethod.GET)
			  public   @ResponseBody String checksname(@ModelAttribute("s") Supply s){
		//		  List<Order> list1 = hodao.getOrderid();
				String jsonFormatData = "";
				
				List<Supply> list2 = hodao.getchecksname1(s.getName());
				  Map<String, Object> model = new HashMap<String, Object>();
			    //    model.put("list1",list1);
			          model.put("list2", list2);
			        
			        Gson gson = new Gson(); 

				    jsonFormatData = gson.toJson(list2);

       

		
			 return jsonFormatData;
			}
			//redirection to customermasters
			
			@RequestMapping(value="/customerho", method = RequestMethod.GET)
			public ModelAndView customer(@ModelAttribute("c") Customer c) {
				  List<Customer> list=hodao.getCustomername1("customer");  
				  List<Customer> list2=hodao.getCustomerId("customer"); 
				   Map<String, Object> model = new HashMap<String, Object>();
			        model.put("list",list);
			        model.put("list2",list2);
				return new ModelAndView("customerho","model",model); 
			}
			
			//saving customer masters
			@RequestMapping(value="/savecustomerho",method = RequestMethod.POST)
		    public ModelAndView save(@ModelAttribute("c") Customer c,HttpServletRequest request){  
				int savec = 0;
			
		       savec = hodao.savec(c,"customer");
		       ModelAndView  mav = new ModelAndView();
		       if(savec > 0){
		       mav.addObject("message", "The record has been saved sucessfully");
		       mav.setViewName("redirect:customerho.html");		    
		       				    
		       }

		       else{
		       mav.addObject("message", "Record could not be saved successfully ");
		       mav.setViewName("redirect:customerho.html");
		       }
		        RedirectView redirectView = new RedirectView();
		        redirectView.setUrl("/HMS/customerho.html");
		        return mav;//will redirect to viewemp request mapping  
		    }  
			
			
			// for dispensary
			
			
			
			@RequestMapping(value="/dcustomerho", method = RequestMethod.GET)
			public ModelAndView dcustomer(@ModelAttribute("c") Customer c) {
				  List<Customer> list=hodao.getCustomername1("dcustomer");  
				  List<Customer> list2=hodao.getCustomerId("dcustomer"); 
				   Map<String, Object> model = new HashMap<String, Object>();
			        model.put("list",list);
			        model.put("list2",list2);
				return new ModelAndView("dcustomerho","model",model); 
			}
			
			//saving customer masters
			@RequestMapping(value="/dsavecustomerho",method = RequestMethod.POST)
		    public ModelAndView dsave(@ModelAttribute("c") Customer c,HttpServletRequest request){  
				int savec = 0;
			
		       savec = hodao.savec(c,"dcustomer");
		       ModelAndView  mav = new ModelAndView();
		       if(savec > 0){
		       mav.addObject("message", "The record has been saved sucessfully");
		       mav.setViewName("redirect:dcustomerho.html");		    
		       				    
		       }

		       else{
		       mav.addObject("message", "Record could not be saved successfully ");
		       mav.setViewName("redirect:dcustomerho.html");
		       }
		        RedirectView redirectView = new RedirectView();
		        redirectView.setUrl("/HMS/customerho.html");
		        return mav;//will redirect to viewemp request mapping  
		    }  
			//update customermasters
			@RequestMapping(value="/csupdateho",method = RequestMethod.POST)
		    public ModelAndView update(@ModelAttribute("c") Customer c,HttpServletRequest request,HttpServletResponse response){  
		        hodao.updatec(c);  
		        RedirectView redirectView = new RedirectView();
		        redirectView.setUrl("/HMS/customerho.html");
		        return new ModelAndView(redirectView);//will redirect to viewemp request mapping  
		    }  
			
			//redirection to product masters
			 @RequestMapping("/productho")  
			    public ModelAndView viewproduct(@ModelAttribute("p") Product p){  
			        List<Manufacture> list=hodao.getManufacturename1();  
			        List<Supply> list1=hodao.getSupplyname(); 
			        List<Product> list2=hodao.getP(); 
			   //     List<Purchase>list2 = hodao.getCurrentstks();
			        List<Product>list3 = hodao.search1();
			        Map<String, Object> model = new HashMap<String, Object>();
			        model.put("list",list);
			        model.put("list1", list1);
			        model.put("list2", list2);
			        model.put("list3", list3);
			        return new ModelAndView("productho","model",model); 
			        
			      
			  }  
			 // to get product details based on name
			 
				@RequestMapping(value="/checkpcode",method = RequestMethod.GET)
				  public   @ResponseBody String checkpcode(@ModelAttribute("p") Product p){
			//		  List<Order> list1 = hodao.getOrderid();
					String jsonFormatData = "";
					
					List<Product> list2 = hodao.getcheckpcode(p.getPrc());
					  Map<String, Object> model = new HashMap<String, Object>();
				    //    model.put("list1",list1);
				          model.put("list2", list2);
				        
				        Gson gson = new Gson(); 

					    jsonFormatData = gson.toJson(list2);

	       
	
			
				 return jsonFormatData;
				}
			//save product masters
				@RequestMapping(value="/checkpname",method = RequestMethod.GET)
				  public   @ResponseBody String checkpname(@ModelAttribute("p") Product p){
			//		  List<Order> list1 = hodao.getOrderid();
					String jsonFormatData = "";
					
					List<Product> list2 = hodao.getcheckpname(p.getName());
					  Map<String, Object> model = new HashMap<String, Object>();
				    //    model.put("list1",list1);
				          model.put("list2", list2);
				        
				        Gson gson = new Gson(); 

					    jsonFormatData = gson.toJson(list2);

	       
	
			
				 return jsonFormatData;
				}
			//save product masters
			
			@RequestMapping(value="/saveproductho",method = RequestMethod.POST)
		    public ModelAndView save(@ModelAttribute("p") Product p){  
			//	String supply[] = p.getSupplier().split("/");
				//for(int i =0;i<supply.length;i++){
					// hodao.savep(p,supply[i]);  
				//}
				int savep = 0;
		       savep = hodao.savep(p);  
		       ModelAndView  mav = new ModelAndView();
		       if(savep > 0){
		       mav.addObject("message", "The record has been saved sucessfully");
		       mav.setViewName("redirect:productho.html");		    
		       				    
		       }

		       else{
		       mav.addObject("message", "Record could not be saved successfully ");
		       mav.setViewName("redirect:productho.html");
		       }
		        RedirectView redirectView = new RedirectView();
		        redirectView.setUrl("/HMS/productho.html");
		        return mav;//will redirect to viewemp request mapping  //will redirect to viewemp request mapping  
		    }  
			
			 @RequestMapping(value="/orderho")
			    public ModelAndView search(@ModelAttribute("p") Product p){  
				 
			      
			        List<Product> list=hodao.searchProduct(); 
			        List<Product> list5=hodao.Reorder(); 
			        List<Order> list4 = hodao.getorderId();
			        List<Order> list1 = hodao.getorderDetails();
			        List<Product> list3 =hodao.searchRq();
			        List<Supply> list6 = hodao.getSupplyname();
			        Map<String, Object> model = new HashMap<String, Object>();
			        model.put("list",list);
			        model.put("list1", list1);
			        model.put("list3",list3);
			        model.put("list4",list4);
			        model.put("list5",list5);
			        model.put("list6",list6);
		 	        return new ModelAndView("order","model",model);//will redirect to viewemp request mapping  
			    }  
			 
		
			 //save order
			 @RequestMapping(value="/saveOrderho",method = RequestMethod.POST)
			    public ModelAndView save(@ModelAttribute("d") Order d,HttpServletRequest request,HttpServletResponse response){  
					int saveo = 0;
				   String name[] = request.getParameterValues("productName");
				//   String supplier[] = request.getParameterValues("Supplier");
				   String pack[] = request.getParameterValues("unit");
				   String quantity[] = request.getParameterValues("quantity");
				   String stock[] = request.getParameterValues("stks");
			//	    String up[] = request.getParameterValues("up2[]");
				    String prccode[] = request.getParameterValues("ean");
				    System.out.println("ean"+d.getEan());
				    System.out.println("ean"+d.getProductName());
				//   String total[] = request.getParameterValues("total2[]");
				    
				    
				 
				    for(int i=0;i<name.length;i++){
				    	saveo =  hodao.saveo(d,name[i],pack[i],quantity[i],stock[i],prccode[i]);//up[i],total[i],);
				    	//products below reorder level will not be listed after product ordered
				    	 hodao.updateActive(name[i]);
				    	 hodao.updateorpr(name[i],"off");
				    	 
				    }
			       
				 
				    ModelAndView  mav = new ModelAndView();
				       if(saveo > 0){
				       mav.addObject("message", "The record has been saved sucessfully");
				       mav.setViewName("redirect:orderho.html");		    
				       				    
				       }

				       else{
				       mav.addObject("message", "Record could not be saved successfully ");
				       mav.setViewName("redirect:orderho.html");
				       } 
				       return mav;
			 }
                   
			 
			 //active order details
			 
			 @RequestMapping(value="/getDetailsho.html")
			    public  @ResponseBody String  orderDetails1(@ModelAttribute("o") Order o){
				 String jsonFormatData = ""; 
				 List<Order> list1 = hodao.getorderDetails();
			        List<Order> listact= hodao.getorderDetails1(o.getOrderid()); 
			        List<Product> list=hodao.searchProduct(); 
			        
			       
			        Map<String, Object> model = new HashMap<String, Object>();
			   //     model.put("list1",list1);
			        model.put("listact",listact);
			    //    model.put("list",list);
			        Gson gson = new Gson(); 

				    jsonFormatData = gson.toJson(listact); 
				    return jsonFormatData;
			    }  

			 // sale screen redirection
			 
			 @RequestMapping("/saleho")  
			    public ModelAndView viewCustomer1(@ModelAttribute("c") Customer c){  
				  List<Customer> list=hodao.getCustomername("customer");
			
				  /*
			        List<Customer> list1=dao.getCustomername1(c); 
			      
			        List<Customer> list3=dao.getCustomername3(c); 
			        */
			        List<Purchase> list4=hodao.getProducts("purchase");
			        List<Purchase> list10=hodao.search3();
			        List<Sale>list5 = hodao.getinvId("saleho");
			        List<Sale>list9 = hodao.getinvId1("saleho");
			        List<TaxB>list6 = hodao.getTax();
			        List<custDisc>list7 = hodao.getCustDis();
			        List<Spdiscount>list8 = hodao.getSpdis();
			        List<Patient>list11 = pdao.getPatients();
				      
			       
			        Map<String, Object> model = new HashMap<String, Object>();
			        model.put("list",list);
			        
			       // model.put("list1",list1);
			     //   model.put("list2",list2);
			       // model.put("list3",list3);
			        model.put("list4",list4);
			        model.put("list5",list5);
			        model.put("list6",list6);
			        model.put("list7",list7);
			        model.put("list8",list8);
			        model.put("list9", list9);
			        model.put("list10",list10);
			        model.put("list11", list11);
			        return new ModelAndView("sales","model",model);
			          
			    }  
				
				@RequestMapping(value="/gtinvoice",method = RequestMethod.GET)
				  public   @ResponseBody String getInvoice(@ModelAttribute("p") Sale p){
			//		  List<Order> list1 = hodao.getOrderid();
					String jsonFormatData = "";
				
					List<Sale> list2 = hodao.getsaleInv(p.getInvoice(),"saleho","productstock");
					  Map<String, Object> model = new HashMap<String, Object>();
				    //    model.put("list1",list1);
				          model.put("list2", list2);
				        
				        Gson gson = new Gson(); 

					    jsonFormatData = gson.toJson(list2);

	       
	
			
				 return jsonFormatData;
	
				        //will redirect to viewemp request mapping 
				        
				}
				
			     /*
			  @RequestMapping("/pentry")  
			    public ModelAndView savePurchase(@ModelAttribute("p") Purchase p ){  
				 dao.savepe(p);  
				 
				 return new ModelAndView("purchase");//will redirect to viewemp request mapping 
			    }  
			    */
				
				@RequestMapping(value="/getinvprds",method = RequestMethod.GET)
				  public   @ResponseBody String getInvoiceprds(@ModelAttribute("p") Sale p){
			//		  List<Order> list1 = hodao.getOrderid();
					String jsonFormatData = "";
					
					List<Sale> list1b = hodao.getinvprods(p.getPname(),"purchase","productstock");
				
					  Map<String, Object> model = new HashMap<String, Object>();
				    //    model.put("list1",list1);
				          model.put("list1b", list1b);
				        
				        Gson gson = new Gson(); 

					    jsonFormatData = gson.toJson(list1b);

	       
	
			
				 return jsonFormatData;
	
				        //will redirect to viewemp request mapping 
				        
				}
				

			 //sales submission
			  @RequestMapping("/saleho2")  
			    public ModelAndView viewCustomer2(@ModelAttribute("s") Sale s,HttpServletRequest request,HttpServletResponse response ){
				  System.out.println("code reacg");
				 /* if((s.getCustName().equalsIgnoreCase("new"))||(s.getCustId().equalsIgnoreCase("new"))){
					  dao.savecs(s);
				  }
				  else{
				  */
				 int savess = 0;
				 int updsass = 0;
				    System.out.println("inelse");
				    String name[] = request.getParameterValues("pname");
				    String batch[] = request.getParameterValues("batch");
				    String expdate[] = request.getParameterValues("expDate");
				    String mpack[] = request.getParameterValues("spack");
				    String mdesc[] = request.getParameterValues("spsize");
				    String sudesc[] = request.getParameterValues("sudesc");
				    String  stk1[] = request.getParameterValues("stk[]");
				    String unit[] = request.getParameterValues("unit");
				    String  qty1[] = request.getParameterValues("qty[]"); 
				    String up[] = request.getParameterValues("unitprice");
				    String  price1[] = request.getParameterValues("price[]");
				    String ean[] = request.getParameterValues("ean");
				    
				    System.out.println(name.length);
				    System.out.println(batch.length);
				    System.out.println(expdate.length);
				//    System.out.println(unit.length);
				    System.out.println(up.length);
				       for(int i=0;i<qty1.length;i++){
				    	savess = hodao.savess(s,name[i],batch[i],expdate[i],unit[i],up[i],qty1[i],stk1[i],price1[i],mpack[i],mdesc[i],sudesc[i],ean[i],"saleho");
				    	updsass =  hodao.update(name[i],qty1[i],batch[i],"productstock");
				    	 hodao.updatereord(name[i],"on"); 
				    }
				       ModelAndView  mav = new ModelAndView();
				       if(savess > 0 && updsass > 0){
				       mav.addObject("message", "The record has been saved sucessfully");
				       mav.setViewName("redirect:saleho.html");		    
				       				    
				       }

				       else{
				       mav.addObject("message", "Record could not be saved successfully ");
				       mav.setViewName("redirect:saleho.html");
				       }
				    RedirectView redirectView = new RedirectView();
			        redirectView.setUrl("/HMS/saleho.html");
			        return mav;//will redirect to viewemp request mapping 
			        
				  
			    }  
      //distribute screen
			  
			  @RequestMapping(value="/distribute", method = RequestMethod.GET)
				public ModelAndView distribute(@ModelAttribute("d") Distribute d) {
					List<Distribute> list=hodao.getBranchProducts(); 
					List<Distribute> list1 = hodao.getAllocation();
					
					 Map<String, Object> model = new HashMap<String, Object>();
					 model.put("list",list);
					 model.put("list1",list1);
			        return new ModelAndView("distribute","model",model); 
					}
			  
			  //get details based on id
			  
			  
			  @RequestMapping(value="/getbrdetails", method = RequestMethod.GET)
				public ModelAndView distribute2(@ModelAttribute("d") Distribute d) {
					List<Distribute> list=hodao.getBranchProducts(); 
				    List<Distribute> list1 = hodao.getAllocation();
					List<Distribute> list2 = hodao.getBrdetails(d);
					
					 Map<String, Object> model = new HashMap<String, Object>();
					 model.put("list",list);
					 model.put("list1",list1);
					 model.put("list2", list2);
			        return new ModelAndView("distribute","model",model); 
					}
			  
//saving distribute orders
			  
			  @RequestMapping(value="/saveallc", method = RequestMethod.POST)
				public ModelAndView distribute1(@ModelAttribute("d") Distribute d) {
					hodao.saved(d);  
					RedirectView redirectView = new RedirectView();
			        redirectView.setUrl("/HMS/distribute.html");
			        return new ModelAndView(redirectView);//will redirect to viewemp request mapping 
			        
					}
			  //allocation id auto generation
			  
//quotation generation

			  /*@RequestMapping(value="/quotation",method = RequestMethod.GET)
			    public ModelAndView proforma(@ModelAttribute("q") quotation q,HttpServletRequest request,HttpServletResponse response){  
			        
					  List<Customer> list=hodao.getCustomername();
						
					  
				     //   List<Purchase> list4=hodao.getProducts();
				       // List<Sale>list5 = hodao.getinvId();
				       // List<TaxB>list6 = hodao.getTax();
				        List<custDisc>list7 = hodao.getCustDis();
				        List<Spdiscount>list8 = hodao.getSpdis();
				       
				        List<quotation>list9 = hodao.getquotation();
				        List<quotation>list11 = hodao.getquotationid();
				        
				        List<quotation>list13 = hodao.updhistory();
					      
				       
				        Map<String, Object> model = new HashMap<String, Object>();
				        model.put("list",list);
				        
				       // model.put("list1",list1);
				     //   model.put("list2",list2);
				       // model.put("list3",list3);
				      //  model.put("list4",list4);
				       // model.put("list5",list5);
				       // model.put("list6",list6);
				        model.put("list7",list7);
				        model.put("list8",list8);
				        model.put("list9", list9);
				        model.put("list11",list11);
				        model.put("list13",list13);
				        
			        return new ModelAndView("quotation","model",model);//will redirect to viewemp request mapping  
			    }  
				*/
	//quotation save
  
				@RequestMapping(value="/saveq",method = RequestMethod.POST)
				  public ModelAndView quotation(@ModelAttribute("s") quotation s,HttpServletRequest request,HttpServletResponse response ){
					  System.out.println("code reacg");
					 /* if((s.getCustName().equalsIgnoreCase("new"))||(s.getCustId().equalsIgnoreCase("new"))){
						  dao.savecs(s);
					  }
					  else{
					  */
					 
					    System.out.println("inelse");
					    String name[] = request.getParameterValues("pname");
					   
					    String unit[] = request.getParameterValues("unit");
					    String up[] = request.getParameterValues("up2[]");
					    String  qty1[] = request.getParameterValues("qty[]"); 
					    
					    String  stk1[] = request.getParameterValues("stk[]");
					    String  price1[] = request.getParameterValues("price[]");
					    
					    
					    System.out.println(name.length);
					    
					     System.out.println(unit.length);
					    System.out.println(up.length);
					    System.out.println(qty1.length);
					    System.out.println(stk1.length);
					    System.out.println(price1.length);
					    
					       for(int i=0;i<qty1.length;i++){
					    	 hodao.savequotation(s,name[i],unit[i],up[i],qty1[i],stk1[i],price1[i]);
					 //   	 hodao.update(name[i],stk1[i]);
					    }
					    
					    RedirectView redirectView = new RedirectView();
				        redirectView.setUrl("/HMS/quotation.html");
				        return new ModelAndView(redirectView);//will redirect to viewemp request mapping 
				        
					  
				    }  
				
				@RequestMapping(value="/checkstat",method = RequestMethod.POST)
				  public ModelAndView checkstat(@ModelAttribute("s") quotation s,HttpServletRequest request,HttpServletResponse response ){
					   hodao.updatestat(s);
					  RedirectView redirectView = new RedirectView();
				        redirectView.setUrl("/HMS/quotation.html");
				        return new ModelAndView(redirectView);//will redirect to viewemp request mapping 
				        
				}
				
				/*
				@RequestMapping(value="/getcust",method = RequestMethod.GET)
			    public ModelAndView cust(@ModelAttribute("q") quotation q,HttpServletRequest request,HttpServletResponse response){  
			        
					  List<Customer> list=hodao.getCustomername();
						
					  
				        List<Purchase> list4=hodao.getProducts();
				        List<Sale>list5 = hodao.getinvId();
				        List<TaxB>list6 = hodao.getTax();
				        List<custDisc>list7 = hodao.getCustDis();
				        List<Spdiscount>list8 = hodao.getSpdis();
				       
				        List<quotation>list9 = hodao.getquotation();
				        
				       List<quotation>list10 = hodao.proformacust(q);
				       List<quotation>list11 = hodao.getquotationid();
				       List<quotation>list13 = hodao.updhistory();
					      
				       
				        Map<String, Object> model = new HashMap<String, Object>();
				        model.put("list",list);
				        
				       // model.put("list1",list1);
				     //   model.put("list2",list2);
				       // model.put("list3",list3);
				        model.put("list4",list4);
				        model.put("list5",list5);
				        model.put("list6",list6);
				        model.put("list7",list7);
				        model.put("list8",list8);
				        model.put("list9", list9);
				        model.put("list10",list10);
				        model.put("list11", list11);
				        model.put("list13",list13);
			        return new ModelAndView("quotation","model",model);//will redirect to viewemp request mapping  
			    }  
                     
				@RequestMapping(value="/getcust1",method = RequestMethod.GET)
			    public ModelAndView cust1(@ModelAttribute("q") quotation q,HttpServletRequest request,HttpServletResponse response){  
			        
					  List<Customer> list=hodao.getCustomername();
						
					  
				        List<Purchase> list4=hodao.getProducts();
				        List<Sale>list5 = hodao.getinvId();
				        List<TaxB>list6 = hodao.getTax();
				        List<custDisc>list7 = hodao.getCustDis();
				        List<Spdiscount>list8 = hodao.getSpdis();
				       
				        List<quotation>list9 = hodao.getquotation();
				        
				       List<quotation>list10 = hodao.proformacust(q);
				       List<quotation>list11 = hodao.getquotationid();
					   List<quotation>list12 = hodao.updproforma(q);  
					   List<quotation>list13 = hodao.updhistory();
				       
				        Map<String, Object> model = new HashMap<String, Object>();
				        model.put("list",list);
				        
				       // model.put("list1",list1);
				     //   model.put("list2",list2);
				       // model.put("list3",list3);
				        model.put("list4",list4);
				        model.put("list5",list5);
				        model.put("list6",list6);
				        model.put("list7",list7);
				        model.put("list8",list8);
				        model.put("list9", list9);
				        model.put("list10",list10);
				        model.put("list11", list11);
				        model.put("list12",list12);
				        model.put("list13",list13);
			        return new ModelAndView("quotation","model",model);//will redirect to viewemp request mapping  
			    }  
   */
	//purchase entry load
				
				
				@RequestMapping(value="/purchaseho",method = RequestMethod.GET)
				  public ModelAndView checkstat(@ModelAttribute("s") Purchase s,HttpServletRequest request,HttpServletResponse response ){
					  List<Order> list1 = hodao.getOrderid();
					  List<Purchase> list2 = hodao.getAllocationid("purchase");
					  List<Purchase> list2a = hodao.getAllocationid1a("purchase");
					  Map<String, Object> model = new HashMap<String, Object>();
					  
				       model.put("list1",list1);
				       model.put("list2",list2);
				       model.put("list2a",list2a);   
				        return new ModelAndView("purchase","model",model);//will redirect to viewemp request mapping 
				        
				}
				
				//load dispensary purchaseho
				@RequestMapping(value="/dpurchaseho",method = RequestMethod.GET)
				  public ModelAndView dcheckstat(@ModelAttribute("s") Purchase s,HttpServletRequest request,HttpServletResponse response ){
					  List<Order> list1 = hodao.getOrderid();
					  List<Purchase> list2 = hodao.getAllocationid("dpurchase");
					  List<Purchase> list2a = hodao.getAllocationid1a("dpurchase");
					  Map<String, Object> model = new HashMap<String, Object>();
					  
				       model.put("list1",list1);
				       model.put("list2",list2);
				       model.put("list2a",list2a);   
				        return new ModelAndView("dpurchase","model",model);//will redirect to viewemp request mapping 
				        
				}
				
				@RequestMapping(value="/getsupplyorder",method = RequestMethod.GET)
				  public   @ResponseBody String Supply(@ModelAttribute("p") Purchase p){
			//		  List<Order> list1 = hodao.getOrderid();
					String jsonFormatData = "";
				
					List<Purchase> list2 = hodao.getsupplyorder(p.getSupplier());
					  Map<String, Object> model = new HashMap<String, Object>();
				    //    model.put("list1",list1);
				          model.put("list2", list2);
				        
				        Gson gson = new Gson(); 

					    jsonFormatData = gson.toJson(model);

	       
	
			
				 return jsonFormatData;
	
				        //will redirect to viewemp request mapping 
				        
				}
				
				//for dispensary
				
			
				
				 
				  @RequestMapping(value="/purchaseSaveho")
				    public ModelAndView purchase(@ModelAttribute("p") Purchase p,HttpServletRequest request,HttpServletResponse response){
					  int pur1 = 0;
					  int pur2 = 0;
					  int pur3 = 0;
					  
					  System.out.println("inelse");
					    String ean1[] = request.getParameterValues("ean1");
					    String name[] = request.getParameterValues("pname1");
					    String batch[] = request.getParameterValues("Batch1");
					   // String mdate[] = request.getParameterValues("mDate1");
					    String exp[] = request.getParameterValues("expDate1");
					    String mpack[] = request.getParameterValues("mpack");
					    String mdesc[] = request.getParameterValues("mdesc");
					    String sudesc[] = request.getParameterValues("sudesc");
					    String  qty1[] = request.getParameterValues("qty[]"); 
					    String  discount1[] = request.getParameterValues("discount1[]"); 
					    String up[] = request.getParameterValues("up2[]");
					    String  free[] = request.getParameterValues("free");
					    String  price1[] = request.getParameterValues("price[]");
					    
					  //  String unit[] = request.getParameterValues("unitp");
					  //  String  tax1[] = request.getParameterValues("tax1[]"); 
					    
					 
					    
					   
					       for(int i=0;i<name.length;i++){
					    	   
					    	
					   pur1  = 	 hodao.savepurchase(p,name[i],batch[i],exp[i],qty1[i],up[i],discount1[i],free[i],price1[i],ean1[i],mpack[i],mdesc[i],sudesc[i]);
					   pur2  =	 hodao.saveproductpriceho(p,name[i],batch[i],up[i],free[i]);
					    	     hodao.updatecatho(name[i]);
					    	     hodao.updateean(name[i]);
					    	     hodao.updatecatho1(name[i]);
					    	     
					   pur3  = 	 hodao.saveproductstockho(ean1[i],name[i],batch[i],exp[i],mpack[i],mdesc[i],up[i],qty1[i],discount1[i],free[i],sudesc[i],price1[i],"70","0","NA","0","0","0","0","0.00");
					             hodao.updatecatho2(name[i]);
					             hodao.updatereord(name[i],"on");
					    	 
					 //   	 hodao.update(name[i],stk1[i]);
					    }
					    
					       ModelAndView  mav = new ModelAndView();
					       if(pur1 > 0 && pur2> 0 && pur3>0){
					       mav.addObject("message", "The record has been saved sucessfully");
					       mav.setViewName("redirect:purchaseho.html");		    
					       				    
					       }

					       else{
					       mav.addObject("message", "Record could not be saved successfully ");
					       mav.setViewName("redirect:purchaseho.html");
					       }
					    RedirectView redirectView = new RedirectView();
				        redirectView.setUrl("/HMS/purchaseho.html");
				        return mav;//will redirect to viewemp request mapping 
				        
					  
				    }  
				  
//save dispensary purchase 
				  @RequestMapping(value="/dpurchaseSaveho")
				    public ModelAndView dpurchase(@ModelAttribute("p") Purchase p,HttpServletRequest request,HttpServletResponse response){
					  int pur1 = 0;
					  int pur2 = 0;
					  int pur3 = 0;
					  
					    String ean1[] = request.getParameterValues("ean1");
					    String name[] = request.getParameterValues("pname1");
					    String batch[] = request.getParameterValues("Batch1");
					   // String mdate[] = request.getParameterValues("mDate1");
					    String exp[] = request.getParameterValues("expDate1");
					    String mpack[] = request.getParameterValues("mpack");
					    String mdesc[] = request.getParameterValues("mdesc");
					    String sudesc[] = request.getParameterValues("sudesc");
					    String  qty1[] = request.getParameterValues("qty[]"); 
					    String  discount1[] = request.getParameterValues("discount1[]"); 
					    String up[] = request.getParameterValues("up2[]");
					    String  free[] = request.getParameterValues("free");
					    String  price1[] = request.getParameterValues("price[]");
					    
					  //  String unit[] = request.getParameterValues("unitp");
					  //  String  tax1[] = request.getParameterValues("tax1[]"); 
					    
					 
					    
					   
					       for(int i=0;i<name.length;i++){
					    	   
					    	
					   pur1  = 	 hodao.dsavepurchase(p,name[i],batch[i],exp[i],qty1[i],up[i],discount1[i],free[i],price1[i],ean1[i],mpack[i],mdesc[i],sudesc[i]);
					   //pur2  =	 hodao.dsaveproductpriceho(p,name[i],batch[i],up[i],free[i]);
					    	     hodao.dupdatecatho(name[i]);
					    	   //  hodao.dupdateean(name[i]);
					    	    // hodao.dupdatecatho1(name[i]);
					    	     
					   pur3  = 	 hodao.dsaveproductstockho(ean1[i],name[i],batch[i],exp[i],mpack[i],mdesc[i],up[i],qty1[i],discount1[i],free[i],sudesc[i],price1[i],"70","0","NA","0","0","0","0","0.00");
					   hodao.dupdatecatho2(name[i]);
					    	 
					 //   	 hodao.update(name[i],stk1[i]);
					    }
					    
					       ModelAndView  mav = new ModelAndView();
					       if(pur1 > 0 && pur3>0){
					       mav.addObject("message", "The record has been saved sucessfully");
					       mav.setViewName("redirect:dpurchaseho.html");		    
					       				    
					       }

					       else{
					       mav.addObject("message", "Record could not be saved successfully ");
					       mav.setViewName("redirect:dpurchaseho.html");
					       }
					    RedirectView redirectView = new RedirectView();
				        redirectView.setUrl("/HMS/purchaseho.html");
				        return mav;//will redirect to viewemp request mapping 
				        
					  
				    }  
					       
				  //get order based on id
				  @RequestMapping(value="/pentryho",method = RequestMethod.GET)
				  public ModelAndView checkstat(@ModelAttribute("o") Order o,HttpServletRequest request,HttpServletResponse response ){
				//	  List<Order> list1 = hodao.getOrderid();
					  List<Order> listact= hodao.getorderDetails(); 
				//	  List<Order> list2 = hodao.getsupplyorder(o);
					  
					  Map<String, Object> model = new HashMap<String, Object>();
				        model.put("listact",listact);
				     //   model.put("list1", list1);
				  //      model.put("list2",list2);
				        return new ModelAndView("purchaseho","model",model);//will redirect to viewemp request mapping 
				        
				}
				// product price
				  @RequestMapping(value="/propriceho", method = RequestMethod.GET)
					public ModelAndView propricing(HttpServletRequest request,HttpServletResponse response) {
					  List<Productprice> list = hodao.getInfoSearch();
					  List<Product> list1 = hodao.getInfoSearch1();
					  Map<String, Object> model = new HashMap<String, Object>();
				        model.put("list",list);
				       model.put("list1", list1);
				  //      model.put("list2",list2);
						return new ModelAndView("productpriceho","model",model); 
					}
				  @RequestMapping(value="/psearchho", method = RequestMethod.GET)
					public ModelAndView prosearchp(@ModelAttribute("ps") Productprice ps) {
					  System.out.println("category is" +ps.getCategory());
					  List<Productprice> list = hodao.getproSearch(ps);
					  List<Product> list1 = hodao.getInfoSearch1();
						
					  Map<String, Object> model = new HashMap<String, Object>();
				        model.put("list",list);
				        model.put("list1",list1);
						return new ModelAndView("productpriceho","model",model); 
						}								
             //product stocks
				  @RequestMapping(value="/stopriceho", method = RequestMethod.GET)
					public ModelAndView stopricing(HttpServletRequest request,HttpServletResponse response) {
					  List<Productstock> list = hodao.getInfoStkSearch("productstock");
					  List<Product> list1 = hodao.getInfoSearch1();
					  Map<String, Object> model = new HashMap<String, Object>();
				        model.put("list",list);
				       model.put("list1", list1);
				  //      model.put("list2",list2);
						return new ModelAndView("productstocks","model",model); 
					}
				  @RequestMapping(value="/pssearchho", method = RequestMethod.GET)
					public ModelAndView prosearch(@ModelAttribute("ps") Productstock ps) {
					
					  List<Productstock> list = hodao.getstockSearch(ps,"productstock");
					  List<Product> list1 = hodao.getInfoSearch1();
					  Map<String, Object> model = new HashMap<String, Object>();
					  model.put("list", list);
					  model.put("list1", list1);
					  model.put("name",ps.getName());
					  model.put("code",ps.getCode());
					  model.put("category",ps.getCategory());
					  model.put("exp",ps.getExpDate());
					  model.put("to",ps.getToDate());
					  model.put("limit",ps.getRecords());
					  model.put("batch",ps.getBatch());
						return new ModelAndView("productstocks","model",model); 
					}

                  //product stocks edit
@RequestMapping("/pssaveho")  
public ModelAndView saveprStks(@ModelAttribute("ps") Productstock ps,HttpServletRequest request,HttpServletResponse response ){  
	System.out.println("Batch "+ps.getBatch());
	int pssave = 0;
	int pur3 = 0;
	   String ean1[] = request.getParameterValues("code");
	    String name[] = request.getParameterValues("name");
	    String batch[] = request.getParameterValues("batch");
	   // String mdate[] = request.getParameterValues("mDate1");
	    String exp[] = request.getParameterValues("expDate");
	    String mpack[] = request.getParameterValues("mpack");
	    String mpsize[] = request.getParameterValues("mpsize");
	    String cp[] = request.getParameterValues("cp");
	    String prqty[] = request.getParameterValues("prqty");
	    String prprice[] = request.getParameterValues("prprice");
	    String  qty1[] = request.getParameterValues("quantity");
	    String sudesc[] = request.getParameterValues("sudesc");
	    String stkpr[] = request.getParameterValues("stkpr");
	    String markup[] = request.getParameterValues("markup");
	    String sp[] = request.getParameterValues("sp");
	    String spdesc[] = request.getParameterValues("spdesc");
	    String spsize[] = request.getParameterValues("spsize");
	    String stksp[] = request.getParameterValues("stksp");
	    String sellqty[] = request.getParameterValues("sellqty");
	    String sunits[] = request.getParameterValues("sunits");
	    String tprice[] = request.getParameterValues("tprice");
	    
	    for(int i=0;i<name.length;i++){
	    	
	    	 pssave =hodao.saveproductstockho1(ean1[i],name[i],batch[i],exp[i],mpack[i],mpsize[i],cp[i],prqty[i],prprice[i],qty1[i],sudesc[i],stkpr[i],markup[i],sp[i],spdesc[i],spsize[i],stksp[i],sellqty[i],sunits[i],tprice[i],"productstock");
	    }
	    
 //pssave = hodao.saveprStks(ps);  
 ModelAndView  mav = new ModelAndView();
 if(pssave > 0){
 mav.addObject("message", "The record has been saved sucessfully");
 mav.setViewName("redirect:stopriceho.html");		    
 				    
 }

 else{
 mav.addObject("message", "Record could not be saved successfully ");
 mav.setViewName("redirect:stopriceho.html");
 }
 RedirectView redirectView = new RedirectView();
 redirectView.setUrl("/HMS/stopriceho.html");
 return mav;//will redirect to viewemp request mapping 
} 
@RequestMapping("/prsaveho")  
public ModelAndView saveprPr(@ModelAttribute("ps") Productprice pr ){  
    int prsave = 0;
	prsave =hodao.saveprPr(pr);  
	
	ModelAndView  mav = new ModelAndView();
	if(prsave > 0){
	mav.addObject("message", "The record has been saved sucessfully");
	mav.setViewName("redirect:propriceho.html");		    
					    
	}

	else{
	mav.addObject("message", "Record could not be saved successfully ");
	mav.setViewName("redirect:propriceho.html");
	}
 RedirectView redirectView = new RedirectView();
 redirectView.setUrl("/HMS/propriceho.html");
 return mav;//will redirect to viewemp request mapping 
}   

//save to customer  masters
@RequestMapping(value="/checkcphone",method = RequestMethod.GET)
  public   @ResponseBody String checkcphone(@ModelAttribute("c") Customer c){
//		  List<Order> list1 = hodao.getOrderid();
	String jsonFormatData = "";
	
	List<Customer> list2 = hodao.getcheckcphone(c.getPhone(),"customer");
	  Map<String, Object> model = new HashMap<String, Object>();
    //    model.put("list1",list1);
          model.put("list2", list2);
        
        Gson gson = new Gson(); 

	    jsonFormatData = gson.toJson(list2);




 return jsonFormatData;
}

//for dispensary customer

//save to customer  masters
@RequestMapping(value="/dcheckcphone",method = RequestMethod.GET)
public   @ResponseBody String dcheckcphone(@ModelAttribute("c") Customer c){
//		  List<Order> list1 = hodao.getOrderid();
	String jsonFormatData = "";
	
	List<Customer> list2 = hodao.getcheckcphone(c.getPhone(),"dcustomer");
	  Map<String, Object> model = new HashMap<String, Object>();
  //    model.put("list1",list1);
        model.put("list2", list2);
      
      Gson gson = new Gson(); 

	    jsonFormatData = gson.toJson(list2);




return jsonFormatData;
}
@RequestMapping(value="/delor/{fileno}/{drug}")
public  @ResponseBody String  savebill(@PathVariable String drug,@PathVariable String fileno) {
 int bsave = 0;
 String jsonFormatData = "";
String result;
bsave = hodao.deletepr(fileno,drug);


if(bsave > 0){
	result = "success";
				    
}

else{
	result = "failure";
}
Gson gson = new Gson(); 
jsonFormatData = gson.toJson(result);

     return jsonFormatData;
	}

//to print sales reports

@RequestMapping(value="/salespdf", method = RequestMethod.GET)
public void billpdf(@ModelAttribute("s") Sale s,ModelAndView modelAndView,HttpServletRequest req, HttpServletResponse response) throws JRException, IOException {
	
 response.setContentType("application/pdf");
 response.setHeader("Content-Disposition",  "inline"); 
 
 List<Sale> list2 = hodao.getsaleReports(req.getParameter("location"),req.getParameter("location1"),"saleho");
  
 JasperReport report = getReport("/invoice.jrxml");
      //fill the report with data source objects
 String realPath = context.getRealPath("/");
 Map<String,Object> parameterMap = new HashMap<String,Object>();
 parameterMap.put("realPath", realPath);
 
 JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
     JasperPrint jasperPrint = JasperFillManager.fillReport(report,  parameterMap, JRdataSource);
	      
     OutputStream out = response.getOutputStream();
       JasperExportManager.exportReportToPdfStream(jasperPrint,out);//export PDF directly

	}  
public JasperReport getReport(String op) throws JRException {
    
    InputStream stream = getClass().getResourceAsStream(op);
    jr = JasperCompileManager.compileReport(stream);

return jr;
}

//dispensary
@RequestMapping(value="/dsalespdf", method = RequestMethod.GET)
public void dbillpdf(@ModelAttribute("s") Sale s,ModelAndView modelAndView,HttpServletRequest req, HttpServletResponse response) throws JRException, IOException {
	
 response.setContentType("application/pdf");
 response.setHeader("Content-Disposition",  "inline"); 
 
 List<Sale> list2 = hodao.getsaleReports(req.getParameter("location"),req.getParameter("location1"),"dsaleho");
  
 JasperReport report = getReport("/invoice.jrxml");
      //fill the report with data source objects
 String realPath = context.getRealPath("/");
 Map<String,Object> parameterMap = new HashMap<String,Object>();
 parameterMap.put("realPath", realPath);
 
 JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
     JasperPrint jasperPrint = JasperFillManager.fillReport(report,  parameterMap, JRdataSource);
	      
     OutputStream out = response.getOutputStream();
       JasperExportManager.exportReportToPdfStream(jasperPrint,out);//export PDF directly

	} 

@RequestMapping(value="/salespdf1", method = RequestMethod.GET)
public void salespdf(@ModelAttribute("s") Sale s,ModelAndView modelAndView,HttpServletRequest req, HttpServletResponse response) throws JRException, IOException {
	
 response.setContentType("application/pdf");
 response.setHeader("Content-Disposition",  "inline"); 
 
	List<Sale> list2 = hodao.getsaleInv(req.getParameter("invoice"),"saleho","productstock");
 JasperReport report = getReport("/invoice1.jrxml");
      //fill the report with data source objects
 String realPath = context.getRealPath("/");
 Map<String,Object> parameterMap = new HashMap<String,Object>();
 parameterMap.put("realPath", realPath);
 
 JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
     JasperPrint jasperPrint = JasperFillManager.fillReport(report,  parameterMap, JRdataSource);
	      
     OutputStream out = response.getOutputStream();
       JasperExportManager.exportReportToPdfStream(jasperPrint,out);//export PDF directly

	}  


@RequestMapping(value="/dsalespdf1", method = RequestMethod.GET)
public void dsalespdf(@ModelAttribute("s") Sale s,ModelAndView modelAndView,HttpServletRequest req, HttpServletResponse response) throws JRException, IOException {
	
 response.setContentType("application/pdf");
 response.setHeader("Content-Disposition",  "inline"); 
 
	List<Sale> list2 = hodao.getsaleInv(req.getParameter("invoice"),"dsaleho","dproductstock");
 JasperReport report = getReport("/invoice1.jrxml");
      //fill the report with data source objects
 String realPath = context.getRealPath("/");
 Map<String,Object> parameterMap = new HashMap<String,Object>();
 parameterMap.put("realPath", realPath);
 
 JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
     JasperPrint jasperPrint = JasperFillManager.fillReport(report,  parameterMap, JRdataSource);
	      
     OutputStream out = response.getOutputStream();
       JasperExportManager.exportReportToPdfStream(jasperPrint,out);//export PDF directly

	}  


@RequestMapping(value="/prpur", method = RequestMethod.GET)
public void prpdf(@ModelAttribute("s") Purchase s,ModelAndView modelAndView,HttpServletRequest req, HttpServletResponse response) throws JRException, IOException {
	
 response.setContentType("application/pdf");
 response.setHeader("Content-Disposition",  "inline"); 
 
	List<Purchase> list2 = hodao.getPrpur(req.getParameter("allo"),"purchase");
 JasperReport report = getReport("/prpurchase.jrxml");
      //fill the report with data source objects
 String realPath = context.getRealPath("/");
 Map<String,Object> parameterMap = new HashMap<String,Object>();
 parameterMap.put("realPath", realPath);
 
 JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
     JasperPrint jasperPrint = JasperFillManager.fillReport(report,  parameterMap, JRdataSource);
	      
     OutputStream out = response.getOutputStream();
       JasperExportManager.exportReportToPdfStream(jasperPrint,out);//export PDF directly

	}  

@RequestMapping(value="/dprpur", method = RequestMethod.GET)
public void dprpdf(@ModelAttribute("s") Purchase s,ModelAndView modelAndView,HttpServletRequest req, HttpServletResponse response) throws JRException, IOException {
	
 response.setContentType("application/pdf");
 response.setHeader("Content-Disposition",  "inline"); 
 
	List<Purchase> list2 = hodao.getPrpur(req.getParameter("allo"),"dpurchase");
 JasperReport report = getReport("/prpurchase.jrxml");
      //fill the report with data source objects
 String realPath = context.getRealPath("/");
 Map<String,Object> parameterMap = new HashMap<String,Object>();
 parameterMap.put("realPath", realPath);
 
 JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
     JasperPrint jasperPrint = JasperFillManager.fillReport(report,  parameterMap, JRdataSource);
	      
     OutputStream out = response.getOutputStream();
       JasperExportManager.exportReportToPdfStream(jasperPrint,out);//export PDF directly

	}

//order screen print

@RequestMapping(value="/orderpr", method = RequestMethod.GET)
public void orderpr(ModelAndView modelAndView,HttpServletRequest req, HttpServletResponse response) throws JRException, IOException {
	
 response.setContentType("application/pdf");
 response.setHeader("Content-Disposition",  "inline"); 
 
 List<Order> list1= hodao.getorderDetails1(req.getParameter("location")); 
 JasperReport report = getReport("/order.jrxml");
      //fill the report with data source objects
 String realPath = context.getRealPath("/");
 Map<String,Object> parameterMap = new HashMap<String,Object>();
 parameterMap.put("realPath", realPath);
 
 JRDataSource JRdataSource = new JRBeanCollectionDataSource(list1);
     JasperPrint jasperPrint = JasperFillManager.fillReport(report,  parameterMap, JRdataSource);
	      
     OutputStream out = response.getOutputStream();
       JasperExportManager.exportReportToPdfStream(jasperPrint,out);//export PDF directly

	}  

//get Batch details in purchase entry

//save to customer  masters
@RequestMapping(value="/getBatdet",method = RequestMethod.GET)
public   @ResponseBody String batchdet(HttpServletRequest req, HttpServletResponse response){
//		  List<Order> list1 = hodao.getOrderid();
	String jsonFormatData = "";
	
	List<Productstock> list2 = hodao.getBatdet(req.getParameter("location"),"productstock",req.getParameter("location1"));
	  Map<String, Object> model = new HashMap<String, Object>();
  //    model.put("list1",list1);
        model.put("list2", list2);
      
      Gson gson = new Gson(); 

	    jsonFormatData = gson.toJson(list2);




return jsonFormatData;
}

@RequestMapping(value="/dgetBatdet",method = RequestMethod.GET)
public   @ResponseBody String dbatchdet(HttpServletRequest req, HttpServletResponse response){
//		  List<Order> list1 = hodao.getOrderid();
	String jsonFormatData = "";
	
	List<Productstock> list2 = hodao.getBatdet(req.getParameter("location"),"dproductstock",req.getParameter("location1"));
	  Map<String, Object> model = new HashMap<String, Object>();
  //    model.put("list1",list1);
        model.put("list2", list2);
      
      Gson gson = new Gson(); 

	    jsonFormatData = gson.toJson(list2);




return jsonFormatData;
}


//product stocks
		  @RequestMapping(value="/dstopriceho", method = RequestMethod.GET)
			public ModelAndView dstopricing(HttpServletRequest request,HttpServletResponse response) {
			  List<Productstock> list = hodao.getInfoStkSearch("dproductstock");
			  List<Product> list1 = hodao.getInfoSearch1();
			  Map<String, Object> model = new HashMap<String, Object>();
		        model.put("list",list);
		       model.put("list1", list1);
		  //      model.put("list2",list2);
				return new ModelAndView("dproductstocks","model",model); 
			}
		  @RequestMapping(value="/dpssearchho", method = RequestMethod.GET)
			public ModelAndView dprosearch(@ModelAttribute("ps") Productstock ps) {
			
			  List<Productstock> list = hodao.getstockSearch(ps,"dproductstock");
			  List<Product> list1 = hodao.getInfoSearch1();
			  Map<String, Object> model = new HashMap<String, Object>();
			  model.put("list", list);
			  model.put("list1", list1);
			  model.put("name",ps.getName());
			  model.put("code",ps.getCode());
			  model.put("category",ps.getCategory());
			  model.put("exp",ps.getExpDate());
			  model.put("to",ps.getToDate());
			  model.put("limit",ps.getRecords());
			  model.put("batch",ps.getBatch());
				return new ModelAndView("dproductstocks","model",model); 
			}

         //product stocks edit
@RequestMapping("/dpssaveho")  
public ModelAndView dsaveprStks(@ModelAttribute("ps") Productstock ps,HttpServletRequest request,HttpServletResponse response ){  

int pssave = 0;
int pur3 = 0;
String ean1[] = request.getParameterValues("code");
String name[] = request.getParameterValues("name");
String batch[] = request.getParameterValues("batch");
// String mdate[] = request.getParameterValues("mDate1");
String exp[] = request.getParameterValues("expDate");
String mpack[] = request.getParameterValues("mpack");
String mpsize[] = request.getParameterValues("mpsize");
String cp[] = request.getParameterValues("cp");
String prqty[] = request.getParameterValues("prqty");
String prprice[] = request.getParameterValues("prprice");
String  qty1[] = request.getParameterValues("quantity");
String sudesc[] = request.getParameterValues("sudesc");
String stkpr[] = request.getParameterValues("stkpr");
String markup[] = request.getParameterValues("markup");
String sp[] = request.getParameterValues("sp");
String spdesc[] = request.getParameterValues("spdesc");
String spsize[] = request.getParameterValues("spsize");
String stksp[] = request.getParameterValues("stksp");
String sellqty[] = request.getParameterValues("sellqty");
String sunits[] = request.getParameterValues("sunits");
String tprice[] = request.getParameterValues("tprice");

for(int i=0;i<name.length;i++){
	
	 pssave =hodao.saveproductstockho1(ean1[i],name[i],batch[i],exp[i],mpack[i],mpsize[i],cp[i],prqty[i],prprice[i],qty1[i],sudesc[i],stkpr[i],markup[i],sp[i],spdesc[i],spsize[i],stksp[i],sellqty[i],sunits[i],tprice[i],"dproductstock");
}

//pssave = hodao.saveprStks(ps);  
ModelAndView  mav = new ModelAndView();
if(pssave > 0){
mav.addObject("message", "The record has been saved sucessfully");
mav.setViewName("redirect:dstopriceho.html");		    
		    
}

else{
mav.addObject("message", "Record could not be saved successfully ");
mav.setViewName("redirect:dstopriceho.html");
}
RedirectView redirectView = new RedirectView();
redirectView.setUrl("/HMS/stopriceho.html");
return mav;//will redirect to viewemp request mapping 
}

// dispensary sales screen redirection


// sale screen redirection

@RequestMapping("/dsaleho")  
   public ModelAndView dviewCustomer1(@ModelAttribute("c") Customer c){  
	  List<Customer> list=hodao.getCustomername("dcustomer");

	  /*
       List<Customer> list1=dao.getCustomername1(c); 
     
       List<Customer> list3=dao.getCustomername3(c); 
       */
       List<Purchase> list4=hodao.getProducts("dpurchase");
       List<Purchase> list10=hodao.search3();
       List<Sale>list5 = hodao.getinvId("dsaleho");
       List<Sale>list9 = hodao.getinvId1("dsaleho");
       List<TaxB>list6 = hodao.getTax();
       List<custDisc>list7 = hodao.getCustDis();
       List<Spdiscount>list8 = hodao.getSpdis();
       List<Patient>list11 = pdao.getPatients();
	      
      
       Map<String, Object> model = new HashMap<String, Object>();
       model.put("list",list);
       
      // model.put("list1",list1);
    //   model.put("list2",list2);
      // model.put("list3",list3);
       model.put("list4",list4);
       model.put("list5",list5);
       model.put("list6",list6);
       model.put("list7",list7);
       model.put("list8",list8);
       model.put("list9", list9);
       model.put("list10",list10);
       model.put("list11", list11);
       return new ModelAndView("dsales","model",model);
         
   }  
	
	@RequestMapping(value="/dgtinvoice",method = RequestMethod.GET)
	  public   @ResponseBody String dgetInvoice(@ModelAttribute("p") Sale p){
//		  List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";
	
		List<Sale> list2 = hodao.getsaleInv(p.getInvoice(),"dsaleho","dproductstock");
		  Map<String, Object> model = new HashMap<String, Object>();
	    //    model.put("list1",list1);
	          model.put("list2", list2);
	        
	        Gson gson = new Gson(); 

		    jsonFormatData = gson.toJson(list2);




	 return jsonFormatData;

	        //will redirect to viewemp request mapping 
	        
	}
	
    /*
 @RequestMapping("/pentry")  
   public ModelAndView savePurchase(@ModelAttribute("p") Purchase p ){  
	 dao.savepe(p);  
	 
	 return new ModelAndView("purchase");//will redirect to viewemp request mapping 
   }  
   */
	
	@RequestMapping(value="/dgetinvprds",method = RequestMethod.GET)
	  public   @ResponseBody String dgetInvoiceprds(@ModelAttribute("p") Sale p){
//		  List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";
		
		List<Sale> list1b = hodao.getinvprods(p.getPname(),"dpurchase","dproductstock");
	
		  Map<String, Object> model = new HashMap<String, Object>();
	    //    model.put("list1",list1);
	          model.put("list1b", list1b);
	        
	        Gson gson = new Gson(); 

		    jsonFormatData = gson.toJson(list1b);




	 return jsonFormatData;

	        //will redirect to viewemp request mapping 
	        
	}
	

//sales submission
 @RequestMapping("/dsaleho2")  
   public ModelAndView dviewCustomer2(@ModelAttribute("s") Sale s,HttpServletRequest request,HttpServletResponse response ){
	  System.out.println("code reacg");
	 /* if((s.getCustName().equalsIgnoreCase("new"))||(s.getCustId().equalsIgnoreCase("new"))){
		  dao.savecs(s);
	  }
	  else{
	  */
	 int savess = 0;
	 int updsass = 0;
	    System.out.println("inelse");
	    String name[] = request.getParameterValues("pname");
	    String batch[] = request.getParameterValues("batch");
	    String expdate[] = request.getParameterValues("expDate");
	    String mpack[] = request.getParameterValues("spack");
	    String mdesc[] = request.getParameterValues("spsize");
	    String sudesc[] = request.getParameterValues("sudesc");
	    String  stk1[] = request.getParameterValues("stk[]");
	    String unit[] = request.getParameterValues("unit");
	    String  qty1[] = request.getParameterValues("qty[]"); 
	    String up[] = request.getParameterValues("unitprice");
	    String  price1[] = request.getParameterValues("price[]");
	    String ean[] = request.getParameterValues("ean");
	    
	    System.out.println(name.length);
	    System.out.println(batch.length);
	    System.out.println(expdate.length);
	//    System.out.println(unit.length);
	    System.out.println(up.length);
	       for(int i=0;i<qty1.length;i++){
	    	savess = hodao.savess(s,name[i],batch[i],expdate[i],unit[i],up[i],qty1[i],stk1[i],price1[i],mpack[i],mdesc[i],sudesc[i],ean[i],"dsaleho");
	    	updsass =  hodao.update(name[i],qty1[i],batch[i],"dproductstock");
	    	 
	    }
	       ModelAndView  mav = new ModelAndView();
	       if(savess > 0 && updsass > 0){
	       mav.addObject("message", "The record has been saved sucessfully");
	       mav.setViewName("redirect:dsaleho.html");		    
	       				    
	       }

	       else{
	       mav.addObject("message", "Record could not be saved successfully ");
	       mav.setViewName("redirect:dsaleho.html");
	       }
	    RedirectView redirectView = new RedirectView();
       redirectView.setUrl("/HMS/saleho.html");
       return mav;//will redirect to viewemp request mapping 
       
	  
   }  

}
