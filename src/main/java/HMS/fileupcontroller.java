package HMS;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.naming.ldap.Control;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.PathVariable;    
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.apache.commons.codec.binary.Base64;
import com.google.gson.Gson;

import HMS.controllerDao;
import HMS.Patient;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import sun.misc.BASE64Decoder;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class fileupcontroller {
	@Autowired  
	staffControllerDao sdao;
	@Autowired 
	controllerDao dao;
	@Autowired 
	doctControllerDao ddao;
	
	private static String UPLOAD_DIRECTORY;
	private static final int THRESHOLD_SIZE     = 1024 * 1024 * 3;  // 3MB
	
	@RequestMapping("uploadform")
	public ModelAndView uploadForm(@ModelAttribute("s") FileUpload s){
		String os = System.getProperty("os.name");
		
		if (os.indexOf("Win") >= 0) {
			UPLOAD_DIRECTORY ="c://Docs//";
		} else {
			
			UPLOAD_DIRECTORY="/home/tmp/Docs";
		}
		System.out.println(s.getBase());
		return new ModelAndView("uploadform");	
	}
	/*
	@RequestMapping(value="savefile",method=RequestMethod.POST)
	public ModelAndView saveimage( @ModelAttribute("s") Lab s,@RequestParam CommonsMultipartFile file,HttpSession session) throws Exception
	{
	String os = System.getProperty("os.name");
		
		if (os.indexOf("Win") >= 0) {
			UPLOAD_DIRECTORY ="c://Docs//";
		} else {
			
			UPLOAD_DIRECTORY="/home/tmp/Docs";
		}
	
		String filname;
		int savefup = 0;
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(UPLOAD_DIRECTORY+s.getPid()+File.separator+s.getFileno()+File.separator+s.getDate1()));
		 
		ServletFileUpload upload = new ServletFileUpload(factory);
		ServletContext context = session.getServletContext();
		
		File files = new File(UPLOAD_DIRECTORY+s.getPid()+File.separator+s.getFileno()+ File.separator +s.getDate1());
		if(!files.exists()){
		files.mkdirs();
	    }
		
		
	
		if(s.getIop().length() == 0){
			
			filname = s.getPid()+ File.separator + s.getFileno()+ File.separator +s.getDate1()+ File.separator + "No File Uploaded";
			s.setIop("No File Uploaded");
		}else{
			//new Date().getTime()+file.getOriginalFilename()
			String timestamp = s.getIop();
		    filname = s.getPid()+ File.separator + s.getFileno()+ File.separator +s.getDate1()+ File.separator + timestamp;
			s.setIop(timestamp);
		}
	
		File files1 = new File(UPLOAD_DIRECTORY+File.separator+filname);
	
		s.setTestname(filname.replace("\\", "/"));
	
	
  
		byte[] bytes = file.getBytes();
		//if(!file.getOriginalFilename().e)
		BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(files1.getPath())));
		stream.write(bytes);
		stream.flush();
		stream.close();
	savefup = dao.saveLabfile(s);
	ModelAndView  mav = new ModelAndView();
	if(savefup > 0){
					   
					    mav.addObject("message", "The record has been updated sucessfully");
					    mav.setViewName("redirect:labup");
				}
	else{
		    mav.addObject("message", "Updating failed ");
		    mav.setViewName("redirect:labup");
	}
		
        return mav; 
	
	
	
	}
	
	*/
	
	@SuppressWarnings("restriction")
	@RequestMapping(value="/savefile",method=RequestMethod.POST)
	public @ResponseBody String saveimage( @ModelAttribute("s") Lab s,HttpSession session,HttpServletRequest req) throws Exception
	{
    
	//CommonsMultipartFile file = null;
	
    byte[] decoded = Base64.decodeBase64(req.getParameter("name"));
	
	String jsonFormatData = "";
	String os = System.getProperty("os.name");
	
		if (os.indexOf("Win") >= 0) {
			UPLOAD_DIRECTORY ="c://Docs//";
		} else {
			
			UPLOAD_DIRECTORY="/home/tmp/Docs";
		}
	
		String filname;
		int savefup = 0;
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(UPLOAD_DIRECTORY+req.getParameter("location1")+File.separator+req.getParameter("location2")+File.separator+req.getParameter("location8")));
		 
		ServletFileUpload upload = new ServletFileUpload(factory);
		ServletContext context = session.getServletContext();
		
		File files = new File(UPLOAD_DIRECTORY+req.getParameter("location1")+File.separator+req.getParameter("location2")+ File.separator +req.getParameter("location8"));
		if(!files.exists()){
		files.mkdirs();
	    }
		
		
	
		if(req.getParameter("location7").length() == 0){
			
			filname = req.getParameter("location1")+ File.separator +req.getParameter("location2")+ File.separator +req.getParameter("location8")+ File.separator + "No File Uploaded";
			s.setIop("No File Uploaded");
		}else{
			//new Date().getTime()+file.getOriginalFilename()
			String timestamp = req.getParameter("location7");
		    filname = req.getParameter("location1")+ File.separator +req.getParameter("location2")+ File.separator +req.getParameter("location8")+ File.separator + timestamp;
			s.setIop(timestamp);
		}
		
		File files1 = new File(UPLOAD_DIRECTORY+File.separator+filname);
	
		s.setTestname(filname.replace("\\", "/"));
		
		
		BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(files1.getPath())));
		stream.write(decoded);
		stream.flush();
		stream.close();
		
		s.setPid(req.getParameter("location1"));
		s.setFileno(req.getParameter("location2"));
		s.setDate1(req.getParameter("location3"));
		s.setDocid(req.getParameter("location6"));
		s.setSamplecol(req.getParameter("location4"));
		s.setTresult(req.getParameter("location5"));
	savefup = dao.saveLabfile1(s);
	if(savefup > 0){
		jsonFormatData = "Success";
	}
	
	return jsonFormatData; 
	}
	
	
	@RequestMapping(value="/deletefile",method=RequestMethod.POST)
	public @ResponseBody String DeleteFile(HttpServletRequest req){
	    String jsonformatdata = ""; 
		int filedelete = 0;
		String os = System.getProperty("os.name");
		if (os.indexOf("Win") >= 0) {
			UPLOAD_DIRECTORY ="c://Docs//";
		} else {
			
			UPLOAD_DIRECTORY="/home/tmp/Docs";
		}
		  try{
	    		
	    	
	    		
	    		File file = new File(UPLOAD_DIRECTORY+File.separator+req.getParameter("location"));

	    		if(file.delete()){
	    			System.out.println(file.getName() + " is deleted!");
	    			filedelete = dao.filedelete(req.getParameter("location"));
	    			if(filedelete > 0){
	    				jsonformatdata = "Success";
	    			}
	    			else{
	    				jsonformatdata = "Failure";
	    			}
	    		}else{
	    			System.out.println("Delete operation is failed.");
	    			 jsonformatdata = "Delete";
	    		}

	    	}catch(Exception e){

	    		e.printStackTrace();

	    	}
			return jsonformatdata;

	   
	}
}
