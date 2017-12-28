package HMS;

import org.springframework.orm.hibernate3.HibernateTemplate;

import java.security.cert.PolicyNode;
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.util.List;

import org.apache.taglibs.standard.tag.common.core.NullAttributeException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;  
import org.springframework.jdbc.core.JdbcTemplate;  
import org.springframework.jdbc.core.RowMapper;  
import java.util.*;  

import HMS.Patient;


public class patientControllerDao {

	
	
	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	} 
	
	public Patient pia;
	public List<Patient> getPatientId() {
		return template.query("select max(CAST(SUBSTRING_INDEX(pid,'-',-1) as decimal)) from patient",new RowMapper<Patient>(){  
	        public Patient mapRow(ResultSet rs, int row) throws SQLException {   
		   Patient p = new Patient();
		     
		      p.setPid(rs.getString(1));
		      return p;
	        }
		});
	}
	
	public List<Patient> getPatientId1() {
		
		return template.query("select pid,fname,lname,regdate,dob,age,gender,mstatus,pofvisit,landphone,mobile,email,ssn,address,city,country,pcode,ethnicity,mname,CONCAT(fname,' ', mname,' ',lname),state,child,mo,fo,modate,fodate,address2 from patient order by CAST(SUBSTRING_INDEX(pid,'-',-1) as decimal) desc;",new RowMapper<Patient>(){  
	        public Patient mapRow(ResultSet rs, int row) throws SQLException {   
		        pia = new Patient();
		     
		       pia.setPid(rs.getString(1));
		       pia.setFname(rs.getString(2));
		       pia.setLname(rs.getString(3));
		       pia.setRegdate(rs.getString(4));
		       pia.setDob(rs.getString(5));
		       pia.setAge(rs.getString(6));
		       pia.setGender(rs.getString(7));
		       System.out.println(rs.getString(7));
		       pia.setMstatus(rs.getString(8));
		       pia.setPofvisit(rs.getString(9));
		       pia.setLandphone(rs.getString(10));
		       pia.setMobile(rs.getString(11));
		       pia.setEmail(rs.getString(12));
		       pia.setSsn(rs.getString(13));
		       pia.setAddress1(rs.getString(14));
		       pia.setCity(rs.getString(15));
		       pia.setCountry(rs.getString(16));
		       pia.setPcode(rs.getString(17));
		       pia.setEthnicity(rs.getString(18));
		       pia.setMname(rs.getString(19));
		      
		       pia.setCombine(rs.getString(20));
		        pia.setState(rs.getString(21));
		       pia.setChild(rs.getString(22));
		       pia.setMo(rs.getString(23));
		       pia.setFo(rs.getString(24));
		       pia.setModate(rs.getString(25));
		       pia.setFodate(rs.getString(26));
		      System.out.println(pia.getFname());
		       pia.setAddress2(rs.getString(27));
		   return pia;
	        }
		});
	}

	public int savePatient(Patient p) {
		
		String sql = "insert into patient (pid,fname,lname,regdate,dob,age,gender,mstatus,pofvisit,landphone,mobile,email,ssn,address,city,country,pcode,ethnicity,mname,state,child,mo,fo,modate,fodate,address2) values('"+p.getPid()+"','"+p.getFname()+"','"+p.getLname()+"','"+p.getRegdate()+"','"+p.getDob()+"','"+p.getAge()+"','"+p.getGender()+"','"+p.getMstatus()+"','"+p.getPofvisit()+"','"+p.getLandphone()+"','"+p.getMobile()+"','"+p.getEmail()+"','"+p.getSsn()+"','"+p.getAddress1()+"','"+p.getCity()+"','"+p.getCountry()+"','"+p.getPcode()+"','"+p.getEthnicity()+"','"+p.getMname()+"','"+p.getState()+"','"+p.getChild()+"','"+p.getMo()+"','"+p.getFo()+"','"+p.getModate()+"','"+p.getFodate()+"','"+p.getAddress2()+"') on duplicate key update fname='"+p.getFname()+"',lname='"+p.getLname()+"',regdate='"+p.getRegdate()+"',dob='"+p.getDob()+"',age='"+p.getAge()+"',gender='"+p.getGender()+"',mstatus='"+p.getMstatus()+"',pofvisit='"+p.getPofvisit()+"',landphone='"+p.getLandphone()+"',mobile='"+p.getMobile()+"',email='"+p.getEmail()+"',ssn='"+p.getSsn()+"',address='"+p.getAddress1()+"',city='"+p.getCity()+"',country='"+p.getCountry()+"',pcode='"+p.getPcode()+"',ethnicity='"+p.getEthnicity()+"',mname='"+p.getMname()+"',state='"+p.getState()+"',child='"+p.getChild()+"',mo='"+p.getMo()+"',fo='"+p.getFo()+"',modate='"+p.getModate()+"',fodate='"+p.getFodate()+"',address2='"+p.getAddress2()+"'";
		return template.update(sql);
		// TODO Auto-generated method stub
		
	}
	
public int savePatientInsurance(Patient p) {
		
		String sql = "insert into insurance (pid,pins,sins,grp1,grp2,gid1,gid2,ph1,ph2,policyh1,policyh2,policyno1,policyno2,mid1,mid2) values('"+p.getPid()+"','"+p.getPins()+"','"+p.getSins()+"','"+p.getGrp1()+"','"+p.getGrp2()+"','"+p.getGid1()+"','"+p.getGid2()+"','"+p.getPh1()+"','"+p.getPh2()+"','"+p.getPolicyh1()+"','"+p.getPolicyh2()+"','"+p.getPolicyno1()+"','"+p.getPolicyno2()+"','"+p.getMid1()+"','"+p.getMid2()+"') on duplicate key update pins = '"+p.getPins()+"',sins='"+p.getSins()+"',grp1='"+p.getGrp1()+"',grp2='"+p.getGrp2()+"',gid1='"+p.getGid1()+"',gid2='"+p.getGid2()+"',ph1='"+p.getPh1()+"',ph2='"+p.getPh2()+"',policyh1='"+p.getPolicyh1()+"',policyh2='"+p.getPolicyh2()+"',policyno1='"+p.getPolicyno1()+"',policyno2='"+p.getPolicyno2()+"',mid1 ='"+p.getMid1()+"',mid2='"+p.getMid2()+"'";
		return template.update(sql);
		// TODO Auto-generated method stub
		
	}

public int savePatientInsurance1(Patient p) {
	
	String sql = "update insurance set pins='"+p.getPins()+"',mid1='"+p.getMid1()+"',policyh1 = '"+p.getPolicyh1()+"',policyno1 = '"+p.getPolicyno1()+"' where pid='"+p.getPid()+"'";
	return template.update(sql);
	// TODO Auto-generated method stub
	
}

public int savePatientaddition(Patient p) {
	
	String sql = "insert into additionalinfo (pid,personname,relationship,employer,rdateofbirth,ager,workphone,mobilephone,raddress,rprovince,rstate,rcountry,spname,spdate,nofon,nofphone,referrence,family,allergies,presurgery,testrelease,spouse) values('"+p.getPid()+"','"+p.getPersonname()+"','"+p.getRelationship()+"','"+p.getEmployer()+"','"+p.getRdateofbirth()+"','"+p.getAger()+"','"+p.getWorkphone()+"','"+p.getMobilephone()+"','"+p.getRaddress()+"','"+p.getRprovince()+"','"+p.getState()+"','"+p.getRcountry()+"','"+p.getSpname()+"','"+p.getSpdate()+"','"+p.getNofon()+"','"+p.getNphone()+"','"+p.getRefference()+"','"+p.getFamily()+"','"+p.getAllergies()+"','"+p.getPresurgery()+"','"+p.getTestrelease()+"','"+p.getSpouse()+"') on duplicate key update personname='"+p.getPersonname()+"',relationship ='"+p.getRelationship()+"',employer='"+p.getEmployer()+"',rdateofbirth='"+p.getRdateofbirth()+"',ager='"+p.getAger()+"',workphone='"+p.getWorkphone()+"',mobilephone='"+p.getMobilephone()+"',raddress='"+p.getRaddress()+"',rprovince='"+p.getRprovince()+"',rstate='"+p.getRstate()+"',rcountry='"+p.getRcountry()+"',spname='"+p.getSpname()+"',spdate='"+p.getSpdate()+"',nofon='"+p.getNofon()+"',nofphone='"+p.getNphone()+"',referrence='"+p.getRefference()+"',family='"+p.getFamily()+"',allergies='"+p.getAllergies()+"',presurgery='"+p.getPresurgery()+"',testrelease='"+p.getTestrelease()+"',spouse='"+p.getSpouse()+"'";
	return template.update(sql);
	// TODO Auto-generated method stub
	
}
public List<Patient> getInsurance(String pid) {
	// TODO Auto-generated method stub
	System.out.println(pid);
	return template.query("select pins,sins,grp1,grp2,gid1,gid2,ph1,ph2,policyh1,policyh2,policyno1,policyno2,mid1,mid2 from insurance where pid='"+pid+"'",new RowMapper<Patient>(){  
        public Patient mapRow(ResultSet rs, int row) throws SQLException { 
        
        	pia.setPins(rs.getString(1));
        	pia.setSins(rs.getString(2));
        	pia.setGrp1(rs.getString(3));
        	pia.setGrp2(rs.getString(4));
        	pia.setGid1(rs.getString(5));
        	pia.setGid2(rs.getString(6));
        	pia.setPh1(rs.getString(7));
        	pia.setPh2(rs.getString(8));
        	pia.setPolicyh1(rs.getString(9));
        	pia.setPolicyh2(rs.getString(10));
        	pia.setPolicyno1(rs.getString(11));
        	pia.setPolicyno2(rs.getString(12));
        	pia.setMid1(rs.getString(13));
        	pia.setMid2(rs.getString(14));
        	
        	return pia;
        }
	});
}

public List<Patient>getIc() {
	// TODO Auto-generated method stub
	
	return template.query("select distinct pins from insurance where pins not like 'null' and  pins not like '' union all select distinct sins from insurance where sins not like 'null' and sins not like''",new RowMapper<Patient>(){  
        public Patient mapRow(ResultSet rs, int row) throws SQLException { 
          Patient p = new Patient();
        	p.setPsis(rs.getString(1));
        	System.out.println(rs.getString(1));
        	return p;
        }
	});
}

public List<Patient> getAdditional(String pid) {
	// TODO Auto-generated method stub
	return template.query("select personname,relationship,employer,rdateofbirth,ager,workphone,mobilephone,raddress,rprovince,rstate,rcountry,spname,spdate,nofon,nofphone,referrence,family,allergies,presurgery,testrelease,spouse from additionalinfo where pid = '"+pid+"'",new RowMapper<Patient>(){  
        public Patient mapRow(ResultSet rs, int row) throws SQLException { 
        	Patient p = new Patient();
        	p.setPersonname(rs.getString(1));
        	p.setRelationship(rs.getString(2));
        	p.setEmployer(rs.getString(3));
        	p.setRdateofbirth(rs.getString(4));
        	p.setAger(rs.getString(5));
        	p.setWorkphone(rs.getString(6));
        	p.setMobilephone(rs.getString(7));
        	p.setRaddress(rs.getString(8));
        	p.setRprovince(rs.getString(9));
        	p.setRstate(rs.getString(10));
        	p.setRcountry(rs.getString(11));
        	p.setSpname(rs.getString(12));
        	p.setSpdate(rs.getString(13));
        	p.setNofon(rs.getString(14));
        	p.setNphone(rs.getString(15));
        	p.setRefference(rs.getString(16));
        	p.setFamily(rs.getString(17));
        	p.setAllergies(rs.getString(18));
        	p.setPresurgery(rs.getString(19));
        	p.setTestrelease(rs.getString(20));
        	p.setSpouse(rs.getString(21));
        	return p;
        }
	});
}

}
