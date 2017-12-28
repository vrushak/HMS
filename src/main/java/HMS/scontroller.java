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
public class scontroller {
	@Autowired  
	staffControllerDao sdao;
	@Autowired 
	controllerDao dao;
	@RequestMapping(value="/assistant", method = RequestMethod.GET)
	public ModelAndView assistant(@ModelAttribute("p") Assistant p) {
		List<Assistant> list=sdao.getAssistantId();  
		List<Assistant> list1= sdao.getAssistantId1();
		 Map<String, Object> model = new HashMap<String, Object>();
	        model.put("list",list);
	        model.put("list1",list1);
		return new ModelAndView("assistantreg","model",model); 
		}
	@RequestMapping(value="/saveA", method = RequestMethod.POST)
	public ModelAndView Assistantsave(@ModelAttribute("p") Assistant p) {
		int saveau = 0;
		int saveaur = 0;
		int savea = 0;
		
		saveau =  sdao.saveuser(p);
	    saveaur =  sdao.saveuserrole(p);
	    savea = sdao.saveAssistant(p);
	    ModelAndView  mav = new ModelAndView();
	    if(saveau > 0 && saveaur > 0 && savea > 0){
	    mav.addObject("message", "The record has been saved sucessfully");
	    mav.setViewName("redirect:assistant");		    
	    				    
	    }

	    else{
	    mav.addObject("message", "Record could not be saved successfully ");
	    mav.setViewName("redirect:assistant");
	    }
	   
		 RedirectView redirectView = new RedirectView();
	     redirectView.setUrl("/HMS/assistant.html");
        return mav; 
		}
}
