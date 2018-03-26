package HMS;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.GenericFilterBean;
import org.springframework.web.servlet.view.RedirectView;

public class CustomFilter extends GenericFilterBean {
	
	@Override
    public void doFilter(
      ServletRequest request, 
      ServletResponse response,
      FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest reqs = (HttpServletRequest)request;
   	    HttpServletResponse resp = (HttpServletResponse)response;
       
   	    String k = "false";
   	    String res = null;
		try {
			k = LicenseManager.licence();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		if(k == "false"){
			res = "licensefailed";
		}
		else if(k == "diffmac"){
			res = "diffmac";
		}
        String uri = reqs.getRequestURI();
     
       if(!uri.contentEquals("/HMS/licence") && !uri.contains(".js") && !uri.contains(".css") && !uri.contains("/HMS/genlic") && !uri.contains("/HMS/sablic")){
    	   if(k.contentEquals("false") ||k.contentEquals("diffmac")){
    	   resp.sendRedirect("/HMS/licence?res="+res+"");
           
      	   return;
       }
       } 
    	   chain.doFilter(request, response);
       
       
    }
	
}
