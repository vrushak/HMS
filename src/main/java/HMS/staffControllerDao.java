package HMS;

import org.springframework.orm.hibernate3.HibernateTemplate;



import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.util.List;

import org.apache.taglibs.standard.tag.common.core.NullAttributeException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;  
import org.springframework.jdbc.core.JdbcTemplate;  
import org.springframework.jdbc.core.RowMapper;  
import java.util.*;  

import HMS.Patient;


public class staffControllerDao {

	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	} 
	
	
	
	
	public List<Assistant> getAssistantId() {
		return template.query("select max(CAST(SUBSTRING_INDEX(aid,'-',-1) as decimal)) from assistant",new RowMapper<Assistant>(){  
	        public Assistant mapRow(ResultSet rs, int row) throws SQLException {   
		       Assistant p = new Assistant();
		     
		      p.setAid(rs.getString(1));
		      return p;
	        }
		});
	}
//load all assistant details
public List<Assistant> getAssistantId1() {
	// TODO Auto-generated method stub
	return template.query("select aid,fname,lname,joindate,dob,age,gender,mname,regno,landphone,mobile,email,ssn,address,city,country,pcode,state,prfshift,emptype,dept,desg,specialization,qualification,(select username from users where users.userid = assistant.aid ),(select password from users where users.userid = assistant.aid),address2 from assistant order by CAST(SUBSTRING_INDEX(aid,'-',-1) as decimal) desc",new RowMapper<Assistant>(){  
        public Assistant mapRow(ResultSet rs, int row) throws SQLException {   
	       Assistant p = new Assistant();
	       
	       p.setAid(rs.getString(1));
	       p.setFname(rs.getString(2));
	       p.setLname(rs.getString(3));
	       p.setJoindate(rs.getString(4));
	       p.setDob(rs.getString(5));
	       p.setAge(rs.getString(6));
	       p.setGender(rs.getString(7));
	       p.setMname(rs.getString(8));
	       p.setRegnno(rs.getString(9));
	       p.setLandphone(rs.getString(10));
	       p.setMobile(rs.getString(11));
	       p.setEmail(rs.getString(12));
	       p.setSsn(rs.getString(13));
	       p.setAddress(rs.getString(14));
	       p.setCity(rs.getString(15));
	       p.setCountry(rs.getString(16));
	       p.setPcode(rs.getString(17));
	       p.setState(rs.getString(18));
	       p.setPrfshift(rs.getString(19));
	       p.setEmptype(rs.getString(20));
	       p.setDept(rs.getString(21));
	       p.setDesg(rs.getString(22));
	       p.setSpecialization(rs.getString(23));
	       p.setQualification(rs.getString(24));
	       p.setUsername(rs.getString(25));
	       p.setPassword(rs.getString(26));
	       p.setAddress2(rs.getString(27));
	    
	   return p;
        }
	});
}

public int saveAssistant(Assistant p) {
	  System.out.println(p.getAge());
	String sql = "insert into assistant(aid,fname,mname,lname,joindate,dob,age,gender,regno,landphone,mobile,email,ssn,address,city,country,pcode,state,prfshift,emptype,dept,desg,specialization,qualification,address2) values('"+p.getAid()+"','"+p.getFname()+"','"+p.getMname()+"','"+p.getLname()+"','"+p.getJoindate()+"','"+p.getDob()+"','"+p.getAge()+"','"+p.getGender()+"','"+p.getRegnno()+"','"+p.getLandphone()+"','"+p.getMobile()+"','"+p.getEmail()+"','"+p.getSsn()+"','"+p.getAddress()+"','"+p.getCity()+"','"+p.getCountry()+"','"+p.getPcode()+"','"+p.getState()+"','"+p.getPrfshift()+"','"+p.getEmptype()+"','"+p.getDept()+"','"+p.getDesg()+"','"+p.getSpecialization()+"','"+p.getQualification()+"','"+p.getAddress2()+"') on duplicate key update fname='"+p.getFname()+"',mname='"+p.getMname()+"',lname='"+p.getLname()+"',joindate='"+p.getJoindate()+"',dob='"+p.getDob()+"',age='"+p.getAge()+"',gender='"+p.getGender()+"',regno='"+p.getRegnno()+"',landphone='"+p.getLandphone()+"',mobile='"+p.getMobile()+"',email='"+p.getEmail()+"',ssn='"+p.getSsn()+"',address='"+p.getAddress()+"',city='"+p.getCity()+"',country='"+p.getCountry()+"',pcode='"+p.getPcode()+"',state='"+p.getState()+"',prfshift ='"+p.getPrfshift()+"',emptype='"+p.getEmptype()+"',dept='"+p.getDept()+"',desg='"+p.getDesg()+"',specialization='"+p.getSpecialization()+"',qualification='"+p.getQualification()+"',address2='"+p.getAddress2()+"'";
	return template.update(sql);
	// TODO Auto-generated method stub
	
}
public int saveuser(Assistant p) {
	// TODO Auto-generated method stub
	String sql = "insert into users(username,password,enabled,userid) values('"+p.getUsername()+"','"+p.getPassword()+"',1,'"+p.getAid()+"') on duplicate key update password = '"+p.getPassword()+"', username = '"+p.getUsername()+"'";
	return template.update(sql);
}

public int saveuserrole(Assistant p) {
	// TODO Auto-generated method stub
	String sql = "insert into userrole(roleid,username,userrole,userid,useremail) values(1,'"+p.getUsername()+"','ASSISTANT','"+p.getAid()+"','"+p.getEmail()+"') on duplicate key update username = '"+p.getUsername()+"'";
	return template.update(sql);
}
}
