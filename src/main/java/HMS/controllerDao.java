package HMS;

import org.springframework.orm.hibernate3.HibernateTemplate;

import java.awt.BasicStroke;
import java.awt.Color;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.sql.ResultSet;  
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.taglibs.standard.tag.common.core.NullAttributeException;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.jdbc.JDBCCategoryDataset;
import org.jfree.data.jdbc.JDBCXYDataset;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import org.jfree.ui.ApplicationFrame;
import org.springframework.jdbc.core.BeanPropertyRowMapper;  
import org.springframework.jdbc.core.JdbcTemplate;  
import org.springframework.jdbc.core.RowMapper;  
import java.util.*;  

import javax.swing.JFrame;
import javax.swing.SwingUtilities;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;


import HMS.Patient;


public class controllerDao {
    
	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  
	
	//get patient id
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
		
		return template.query("select pid,fname,lname,regdate,dob,age,gender,mstatus,pofvisit,landphone,mobile,email,ssn,address,city,country,pcode,ethnicity,mname,CONCAT(fname,' ', mname,' ',lname),state,child,mo,fo,modate,fodate from patient order by pid desc",new RowMapper<Patient>(){  
	        public Patient mapRow(ResultSet rs, int row) throws SQLException {   
		        pia = new Patient();
		     
		       pia.setPid(rs.getString(1));
		       pia.setFname(rs.getString(2));
		       pia.setLname(rs.getString(3));
		       pia.setRegdate(rs.getString(4));
		       pia.setDob(rs.getString(5));
		       pia.setAge(rs.getString(6));
		       pia.setGender(rs.getString(7));
		    
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
	
		    
		   return pia;
	        }
		});
	}

	public int savePatient(Patient p) {
		
		String sql = "insert into patient (pid,fname,lname,regdate,dob,age,gender,mstatus,pofvisit,landphone,mobile,email,ssn,address,city,country,pcode,ethnicity,mname,state,child,mo,fo,modate,fodate) values('"+p.getPid()+"','"+p.getFname()+"','"+p.getLname()+"','"+p.getRegdate()+"','"+p.getDob()+"','"+p.getAge()+"','"+p.getGender()+"','"+p.getMstatus()+"','"+p.getPofvisit()+"','"+p.getLandphone()+"','"+p.getMobile()+"','"+p.getEmail()+"','"+p.getSsn()+"','"+p.getAddress1()+"','"+p.getCity()+"','"+p.getCountry()+"','"+p.getPcode()+"','"+p.getEthnicity()+"','"+p.getMname()+"','"+p.getState()+"','"+p.getChild()+"','"+p.getMo()+"','"+p.getFo()+"','"+p.getModate()+"','"+p.getFodate()+"') on duplicate key update fname='"+p.getFname()+"',lname='"+p.getLname()+"',regdate='"+p.getRegdate()+"',dob='"+p.getDob()+"',age='"+p.getAge()+"',gender='"+p.getGender()+"',mstatus='"+p.getMstatus()+"',pofvisit='"+p.getPofvisit()+"',landphone='"+p.getLandphone()+"',mobile='"+p.getMobile()+"',email='"+p.getEmail()+"',ssn='"+p.getSsn()+"',address='"+p.getAddress1()+"',city='"+p.getCity()+"',country='"+p.getCountry()+"',pcode='"+p.getPcode()+"',ethnicity='"+p.getEthnicity()+"',mname='"+p.getMname()+"',state='"+p.getState()+"',child='"+p.getChild()+"',mo='"+p.getMo()+"',fo='"+p.getFo()+"',modate='"+p.getModate()+"',fodate='"+p.getFodate()+"'";
		return template.update(sql);
		// TODO Auto-generated method stub
		
	}
	
public int savePatientInsurance(Patient p) {
		
		String sql = "insert into insurance (pid,pins,sins,grp1,grp2,gid1,gid2,ph1,ph2,policyh1,policyh2) values('"+p.getPid()+"','"+p.getPins()+"','"+p.getSins()+"','"+p.getGrp1()+"','"+p.getGrp2()+"','"+p.getGid1()+"','"+p.getGid2()+"','"+p.getPh1()+"','"+p.getPh2()+"','"+p.getPolicyh1()+"','"+p.getPolicyh2()+"') on duplicate key update pins = '"+p.getPins()+"',sins='"+p.getSins()+"',grp1='"+p.getGrp1()+"',grp2='"+p.getGrp2()+"',gid1='"+p.getGid1()+"',gid2='"+p.getGid2()+"',ph1='"+p.getPh1()+"',ph2='"+p.getPh2()+"',policyh1='"+p.getPolicyh1()+"',policyh2='"+p.getPolicyh2()+"'";
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
	System.out.println("inside insurance");
	return template.query("select pins,sins,grp1,grp2,gid1,gid2,ph1,ph2,policyh1,policyh2 from insurance where pid='"+pid+"'",new RowMapper<Patient>(){  
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
        	System.out.println(pia.getPins());
        	System.out.println(pia.getFname());
        	return pia;
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


	//get nurse id
		public List<Nurse> getNurseId() {
			return template.query("select max(CAST(SUBSTRING_INDEX(nid,'-',-1) as decimal)) from nurse",new RowMapper<Nurse>(){  
		        public Nurse mapRow(ResultSet rs, int row) throws SQLException {   
			       Nurse p = new Nurse();
			     
			      p.setNid(rs.getString(1));
			      return p;
		        }
			});
		}
	
	
// load all nurse details
	public List<Nurse> getNurseId1() {
		// TODO Auto-generated method stub
		return template.query("select nid,fname,lname,joindate,dob,age,gender,mname,regno,landphone,mobile,email,ssn,address,city,country,pcode,state,prfshift,emptype,dept,desg,specialization,qualification,CONCAT(fname,' ', mname,' ',lname),(select username from users where users.userid = nurse.nid ),(select password from users where users.userid = nurse.nid) from nurse",new RowMapper<Nurse>(){  
	        public Nurse mapRow(ResultSet rs, int row) throws SQLException {   
		       Nurse p = new Nurse();
		       
		       p.setNid(rs.getString(1));
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
		       p.setCombine(rs.getString(25));
		       p.setUsername(rs.getString(26));
		       p.setPassword(rs.getString(27));
		   return p;
	        }
		});
	}
	
public int saveNurse(Nurse p) {
		
		String sql = "insert into nurse (nid,fname,mname,lname,joindate,dob,age,gender,regno,landphone,mobile,email,ssn,address,city,country,pcode,state,prfshift,emptype,dept,desg,specialization,qualification) values('"+p.getNid()+"','"+p.getFname()+"','"+p.getMname()+"','"+p.getLname()+"','"+p.getJoindate()+"','"+p.getDob()+"','"+p.getAge()+"','"+p.getGender()+"','"+p.getRegnno()+"','"+p.getLandphone()+"','"+p.getMobile()+"','"+p.getEmail()+"','"+p.getSsn()+"','"+p.getAddress()+"','"+p.getCity()+"','"+p.getCountry()+"','"+p.getPcode()+"','"+p.getState()+"','"+p.getPrfshift()+"','"+p.getEmptype()+"','"+p.getDept()+"','"+p.getDesg()+"','"+p.getSpecialization()+"','"+p.getQualification()+"') on duplicate key update fname='"+p.getFname()+"',mname='"+p.getMname()+"',lname='"+p.getLname()+"',joindate='"+p.getJoindate()+"',dob='"+p.getDob()+"',age='"+p.getAge()+"',gender='"+p.getGender()+"',regno='"+p.getRegnno()+"',landphone='"+p.getLandphone()+"',mobile='"+p.getMobile()+"',email='"+p.getEmail()+"',ssn='"+p.getSsn()+"',address='"+p.getAddress()+"',city='"+p.getCity()+"',country='"+p.getCountry()+"',pcode='"+p.getPcode()+"',state='"+p.getState()+"',prfshift ='"+p.getPrfshift()+"',emptype='"+p.getEmptype()+"',dept='"+p.getDept()+"',desg='"+p.getDesg()+"',specialization='"+p.getSpecialization()+"',qualification='"+p.getQualification()+"'";
		return template.update(sql);
		// TODO Auto-generated method stub
		
	}


//get assistant id
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
		return template.query("select aid,fname,lname,joindate,dob,age,gender,mname,regno,landphone,mobile,email,ssn,address,city,country,pcode,state,prfshift,emptype,dept,desg,specialization,qualification,(select username from users where users.userid = assistant.aid ),(select password from users where users.userid = assistant.aid) from assistant",new RowMapper<Assistant>(){  
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
		    
		   return p;
	        }
		});
	}
	
public int saveAssistant(Assistant p) {
		  System.out.println(p.getAge());
		String sql = "insert into assistant(aid,fname,mname,lname,joindate,dob,age,gender,regno,landphone,mobile,email,ssn,address,city,country,pcode,state,prfshift,emptype,dept,desg,specialization,qualification) values('"+p.getAid()+"','"+p.getFname()+"','"+p.getMname()+"','"+p.getLname()+"','"+p.getJoindate()+"','"+p.getDob()+"','"+p.getAge()+"','"+p.getGender()+"','"+p.getRegnno()+"','"+p.getLandphone()+"','"+p.getMobile()+"','"+p.getEmail()+"','"+p.getSsn()+"','"+p.getAddress()+"','"+p.getCity()+"','"+p.getCountry()+"','"+p.getPcode()+"','"+p.getState()+"','"+p.getPrfshift()+"','"+p.getEmptype()+"','"+p.getDept()+"','"+p.getDesg()+"','"+p.getSpecialization()+"','"+p.getQualification()+"') on duplicate key update fname='"+p.getFname()+"',mname='"+p.getMname()+"',lname='"+p.getLname()+"',joindate='"+p.getJoindate()+"',dob='"+p.getDob()+"',age='"+p.getAge()+"',gender='"+p.getGender()+"',regno='"+p.getRegnno()+"',landphone='"+p.getLandphone()+"',mobile='"+p.getMobile()+"',email='"+p.getEmail()+"',ssn='"+p.getSsn()+"',address='"+p.getAddress()+"',city='"+p.getCity()+"',country='"+p.getCountry()+"',pcode='"+p.getPcode()+"',state='"+p.getState()+"',prfshift ='"+p.getPrfshift()+"',emptype='"+p.getEmptype()+"',dept='"+p.getDept()+"',desg='"+p.getDesg()+"',specialization='"+p.getSpecialization()+"',qualification='"+p.getQualification()+"'";
		return template.update(sql);
		// TODO Auto-generated method stub
		
	}

public int saveD(Doctor d){  
    String sql="insert into doctor(docID,fname,mname,lname,dob,gender,doj,age,address1,city,state,country,pcode,ssn,landphone,mobile,email,prnum,qualification,specialization,shift,etype,department,designation) values('"+d.getDocID()+"','"+d.getFname()+"','"+d.getMname()+"','"+d.getLname()+"','"+d.getDob()+"','"+d.getGender()+"','"+d.getDoj()+"','"+d.getAge()+"','"+d.getAddress1()+"','"+d.getCity()+"','"+d.getState()+"','"+d.getCountry()+"','"+d.getPcode()+"','"+d.getSsn()+"','"+d.getLandphone()+"','"+d.getMobile()+"','"+d.getEmail()+"','"+d.getPrnum()+"','"+d.getQualification()+"','"+d.getSpecialization()+"','"+d.getShift()+"','"+d.getEtype()+"','"+d.getDepartment()+"','"+d.getDesignation()+"') on duplicate key update fname='"+d.getFname()+"',mname='"+d.getMname()+"',lname='"+d.getLname()+"',dob='"+d.getDob()+"',gender='"+d.getGender()+"',doj='"+d.getDoj()+"',age='"+d.getAge()+"',address1='"+d.getAddress1()+"',city='"+d.getCity()+"',state='"+d.getState()+"',country='"+d.getCountry()+"',ssn='"+d.getSsn()+"',pcode='"+d.getPcode()+"',ssn='"+d.getSsn()+"',landphone ='"+d.getLandphone()+"',mobile='"+d.getMobile()+"',email='"+d.getEmail()+"',prnum='"+d.getPrnum()+"',qualification='"+d.getQualification()+"',specialization='"+d.getSpecialization()+"',shift='"+d.getShift()+"',etype='"+d.getEtype()+"',department='"+d.getDepartment()+"',designation='"+d.getDesignation()+"'";  
    return template.update(sql);  
}  
//get nurse id
public List<Doctor> getDocID() {
	return template.query("select max(CAST(SUBSTRING_INDEX(docID,'-',-1) as decimal)) from doctor",new RowMapper<Doctor>(){  
        public Doctor mapRow(ResultSet rs, int row) throws SQLException {   
	       Doctor p = new Doctor();
	     System.out.println(rs.getString(1));
	      p.setDocID(rs.getString(1));
	      return p;
        }
	});
}
// load all nurse details
	public List<Doctor> getDocID1() {
		// TODO Auto-generated method stub
		return template.query("select docID,fname,mname,lname,dob,gender,doj,age,address1,city,state,country,pcode,ssn,landphone,mobile,email,prnum,qualification,specialization,shift,etype,department,designation,CONCAT(fname,' ', mname,' ',lname),(select username from users where users.userid = doctor.docID ),(select password from users where users.userid = doctor.docID) from doctor",new RowMapper<Doctor>(){  
	        public Doctor mapRow(ResultSet rs, int row) throws SQLException {   
		       Doctor p = new Doctor();
		       p.setDocID(rs.getString(1));
		       p.setFname(rs.getString(2));
		       p.setMname(rs.getString(3));
		       p.setLname(rs.getString(4));
		       p.setDob(rs.getString(5));
		       p.setGender(rs.getString(6));
		       p.setDoj(rs.getString(7));
		       p.setAge(rs.getString(8));
		       p.setAddress1(rs.getString(9));
		       p.setCity(rs.getString(10));
		       p.setState(rs.getString(11));
		       p.setCountry(rs.getString(12));
		       p.setPcode(rs.getString(13));
		       p.setSsn(rs.getString(14));
		       p.setLandphone(rs.getString(15));
		       p.setMobile(rs.getString(16));
		       p.setEmail(rs.getString(17));
		       p.setPrnum(rs.getString(18));
		       p.setQualification(rs.getString(19));
		       
		       p.setSpecialization(rs.getString(20));
		       p.setShift(rs.getString(21));
		       p.setEtype(rs.getString(22));
		       p.setDepartment(rs.getString(23));
		       p.setDesignation(rs.getString(24));
		       p.setCombine(rs.getString(25));
		       p.setUsername(rs.getString(26));
		       p.setPassword(rs.getString(27));
		    
		   return p;
	        }
		});
	}
  
// save stocks
	
	public List<Stock> getStockId1() {
		// TODO Auto-generated method stub
		return template.query("select pid,pname,ptype,quantity,pack,up,total,reorder,expdate,pc,invid from addstock",new RowMapper<Stock>(){  
	        public Stock mapRow(ResultSet rs, int row) throws SQLException {   
		       Stock p = new Stock();
		       
		       p.setPid(rs.getString(1));
		       p.setPname(rs.getString(2));
		       p.setPtype(rs.getString(3));
		       p.setQuantity(rs.getString(4));
		       p.setPack(rs.getString(5));
		       p.setUp(rs.getString(6));
		       p.setTotal(rs.getString(7));
		       p.setReorder(rs.getString(8));
		       p.setExpdate(rs.getString(9));
		       p.setPc(rs.getString(10));
		       p.setInvid(rs.getString(11));
		    
		   return p;
	        }
		});
	}
	
public int saveS(Stock p) {
	  System.out.println("stk" +p.getPid());
		String sql = "insert into addstock(pid,pname,ptype,quantity,pack,up,total,reorder,expdate,pc,invid) values('"+p.getPid()+"','"+p.getPname()+"','"+p.getPtype()+"','"+p.getQuantity()+"','"+p.getPack()+"','"+p.getUp()+"','"+p.getTotal()+"','"+p.getReorder()+"','"+p.getExpdate()+"','"+p.getPc()+"','"+p.getInvid()+"') on duplicate key update pid='"+p.getPid()+"',pname='"+p.getPname()+"',ptype='"+p.getPtype()+"',quantity='"+p.getQuantity()+"',up='"+p.getUp()+"',total='"+p.getTotal()+"',reorder='"+p.getReorder()+"',expdate='"+p.getExpdate()+"',pc='"+p.getPc()+"'";
		return template.update(sql);
		// TODO Auto-generated method stub
		
	}

// transaction display
public List<Transaction> getTransid() {
	// TODO Auto-generated method stub
	return template.query("select pid,pname,ptype,quantity,allocatedto,allocationdate,expretdate,actdateret,quantret,pc,expiry,requant,(select quantity from addstock where addstock.pid= transaction.pid),invid,tid from transaction",new RowMapper<Transaction>(){  
        public Transaction mapRow(ResultSet rs, int row) throws SQLException {   
	       Transaction p = new Transaction();
	       
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setPtype(rs.getString(3));
	       p.setQuantity(rs.getString(4));
	       p.setPack(rs.getString(5));
	       p.setAllodate(rs.getString(6));
	       p.setExpdate(rs.getString(7));
	       p.setAllocdate(rs.getString(8));
	       p.setAllocqret(rs.getString(9));
	       p.setPc(rs.getString(10));
	       p.setExpiry(rs.getString(11));
	       p.setRequant(rs.getString(12));
	       p.setCsd(rs.getString(13));
	       p.setInvid(rs.getString(14));
	       p.setTid(rs.getInt(15));
	   return p;
        }
	});
}

//
public List<Transaction> getTransid1() {
	// TODO Auto-generated method stub
	return template.query("select pid,pname,ptype,quantity,allocatedto,allocationdate,expretdate,actdateret,quantret,pc,expiry,requant,(select quantity from addstock where addstock.pid= transaction.pid),invid,tid  from transaction where ptype='Returnable'",new RowMapper<Transaction>(){  
        public Transaction mapRow(ResultSet rs, int row) throws SQLException {   
	       Transaction p = new Transaction();
	       
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setPtype(rs.getString(3));
	       p.setQuantity(rs.getString(4));
	       p.setPack(rs.getString(5));
	       p.setAllodate(rs.getString(6));
	       p.setExpdate(rs.getString(7));
	       p.setAllocdate(rs.getString(8));
	       p.setAllocqret(rs.getString(9));
	       p.setPc(rs.getString(10));
	       p.setExpiry(rs.getString(11));
	       p.setRequant(rs.getString(12));
	       p.setCsd(rs.getString(13));
	       p.setInvid(rs.getString(14));
	       p.setTid(rs.getInt(15));
	   return p;
        }
	});
}

public int saveTr(Transaction p) {
	  
	String sql = "insert into transaction(pid,pname,ptype,quantity,allocatedto,allocationdate,expretdate,actdateret,quantret,pc,expiry,invid,tid) values('"+p.getPid()+"','"+p.getPname()+"','"+p.getPtype()+"','"+p.getQuantity()+"','"+p.getPack()+"','"+p.getAllodate()+"','"+p.getExpdate()+"','"+p.getAllocdate()+"','"+p.getQuantity()+"','"+p.getPc()+"','"+p.getExpiry()+"','"+p.getInvid()+"','"+p.getTid()+"') on duplicate key update pname='"+p.getPname()+"',ptype='"+p.getPtype()+"',quantity='"+p.getQuantity()+"',allocatedto='"+p.getPack()+"',allocationdate='"+p.getAllodate()+"',expretdate='"+p.getExpdate()+"',actdateret='"+p.getAllocdate()+"',quantret='"+p.getQuantity()+"',pc='"+p.getPc()+"',expiry='"+p.getExpiry()+"' ";
	return template.update(sql);
	// TODO Auto-generated method stub
	
}

public int updateStk(Transaction s) {
	// TODO Auto-generated method stub
	 String sql = "update addstock set quantity = quantity - '"+s.getQuantity()+"' ,total = quantity * up  where pid ='"+s.getPid()+"'";
	 return template.update(sql);
}

public int returnStk(Transaction s) {
	 //TODO Auto-generated method stub
	String sql = "update transaction set quantret = quantret - '"+s.getAllocqret()+"'  where invid ='"+s.getInvid()+"' and allocatedto ='"+s.getPack()+"'";
	return template.update(sql);
}
public int returnStks(Transaction s) {
	// TODO Auto-generated method stub
	String sql = "update addstock set quantity = quantity + '"+s.getAllocqret()+"', total = quantity * up   where pid ='"+s.getPid()+"'";
	 return template.update(sql);
}

// appointments history
public List<Appointment> getAppointment() {
	// TODO Auto-generated method stub
	return template.query("select ap.pid,concat(p.fname,' ',p.mname,' ',p.lname)patient,ap.docid,CONCAT(d.fname,' ',d.mname,' ',d.lname) doctor,ap.appointment,ap.time,CONCAT(ap.appointment,' ',ap.time),ap.fileno,ap.active from appointment ap join patient p on p.pid = ap.pid join doctor d on d.docID = ap.docid order by appointment,time",new RowMapper<Appointment>(){  
        public Appointment mapRow(ResultSet rs, int row) throws SQLException {   
	       Appointment p = new Appointment();
	     
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setDocid(rs.getString(3));
	       p.setDname(rs.getString(4));
	       p.setAppointment(rs.getString(5));
	       p.setTime(rs.getString(6));
	       p.setCombine(rs.getString(7));
	       p.setFileno(rs.getString(8));
	       p.setActive(rs.getString(9));
	  
	   return p;
        }
	});
}


public int saveApp(Appointment p) {
	String sql = "insert into appointment(pid,pname,docid,appointment,time,active,fileno) values('"+p.getPid()+"','"+p.getPname()+"','"+p.getDocid()+"','"+p.getAppointment()+"','"+p.getTime()+"','on','"+p.getFileno()+"') on duplicate key update pname='"+p.getPname()+"',docid='"+p.getDocid()+"',appointment='"+p.getAppointment()+"',time='"+p.getTime()+"',active = 'on',fileno='"+p.getFileno()+"'";
	return template.update(sql);
	
}

public int cancelApp(Appointment p) {
	String sql = "delete from appointment where fileno='"+p.getFileno()+"'";
	return template.update(sql);
	
}
//list of admitted patients
public List<Admitpat> getAdmitpat() {
	// TODO Auto-generated method stub
	return template.query("select adm.pid,concat(p.fname,' ',p.mname,' ',p.lname) Patient,adm.docid,concat(d.fname,' ',d.mname,' ',d.lname) doctor,wardno,bedno,admitno,cause,admdate,adm.fileno from admitpat adm join patient p on p.pid = adm.pid join doctor d on adm.docid = d.docID where adm.fileno not in (select fileno from discharge)",new RowMapper<Admitpat>(){  
        public Admitpat mapRow(ResultSet rs, int row) throws SQLException {   
	       Admitpat p = new Admitpat();
	       
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setDocid(rs.getString(3));
	    
	       p.setDname(rs.getString(4));
	       p.setWardno(rs.getString(5));
	       p.setBedno(rs.getString(6));
           p.setDischarge(rs.getString(7));
           p.setCause(rs.getString(8));
           p.setAdmdate(rs.getString(9));
           p.setFileno(rs.getString(10));
	       return p;
        }
	});
}

public int saveAdm(Admitpat p) {
	// TODO Auto-generated method stub
	String sql = "insert into admitpat(pid,pname,docid,wardno,bedno,admitno,cause,admdate,dname,fileno) values('"+p.getPid()+"','"+p.getPname()+"','"+p.getDocid()+"','"+p.getWardno()+"','"+p.getBedno()+"','"+p.getAdmitno()+"','"+p.getCause()+"','"+p.getAdmdate()+"','"+p.getDname()+"','"+p.getFileno()+"') on duplicate key update pname='"+p.getPname()+"',docid='"+p.getDocid()+"',wardno='"+p.getWardno()+"',bedno='"+p.getBedno()+"',discharge='"+p.getDischarge()+"',cause='"+p.getCause()+"',admdate='"+p.getAdmdate()+"',dname='"+p.getDname()+"'";
	return template.update(sql);
}

//prescriptions history
public List<Prescription> getPrescription(String docid) {
	
	if(docid.contains("D-")){
	return template.query("select distinct pid,pname,date,fileno,buttonval,tabid,textval,docid,dname from prescription1  where docid = '"+docid+"' group by fileno ",new RowMapper<Prescription>(){  
        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
	       Prescription p = new Prescription();
	       
	       
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setDate(rs.getString(3));
	       p.setFileno(rs.getString(4));
	      
	       p.setButtonl(rs.getString(5));
	       p.setTabid(rs.getString(6));
	       p.setDf(rs.getString(7));
	       p.setDocid(rs.getString(8));
	       p.setDname(rs.getString(9));
	       return p;
        }
	});
	}
	
	else{
		return template.query("select distinct pid,pname,date,fileno,buttonval,tabid,textval,docid,dname from prescription1 group by fileno ",new RowMapper<Prescription>(){  
	        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
		       Prescription p = new Prescription();
		       
		   
		       p.setPid(rs.getString(1));
		       p.setPname(rs.getString(2));
		       p.setDate(rs.getString(3));
		       p.setFileno(rs.getString(4));
		      
		       p.setButtonl(rs.getString(5));
		       p.setTabid(rs.getString(6));
		       p.setDf(rs.getString(7));
		       p.setDocid(rs.getString(8));
		       p.setDname(rs.getString(9));
		       return p;
	        }
		});
	}
}
public List<Prescription> getDocID2(String username ,String userrole) {
	
	if(userrole.contains("[ROLE_DOCTOR]")){
		return template.query("select ap.docid,CONCAT(d.fname,' ', d.mname,' ',d.lname) Doctor,ap.pid,CONCAT(p.fname,' ', p.mname,' ',p.lname) Patient,CONCAT(ap.appointment,' ',ap.time),p.pofvisit,ap.fileno from appointment ap join patient p on ap.pid=p.pid join doctor d on ap.docid = d.docID  where ap.docid in (select userid from userrole where username = '"+username+"')  and ap.appointment= curdate() and ap.active = 'on'",new RowMapper<Prescription>(){  
        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
        	 System.out.println("code re");
	       Prescription p = new Prescription();
	     
	      p.setDocid(rs.getString(1));
	      p.setDname(rs.getString(2));
	    
	      p.setPid(rs.getString(3));
	      p.setPname(rs.getString(4));
	      p.setAppointment(rs.getString(5));
	      p.setSpecialization(rs.getString(6));
	      p.setFileno(rs.getString(7));
	      p.setIdc("");
	      return p;
        }
	});
	}
	else{
		
		return template.query("select ap.docid,CONCAT(d.fname,' ', d.mname,' ',d.lname) Doctor,ap.pid,CONCAT(p.fname,' ', p.mname,' ',p.lname) Patient,CONCAT(ap.appointment,' ',ap.time),p.pofvisit,ap.fileno from appointment ap join patient p on ap.pid=p.pid join doctor d on ap.docid = d.docID",new RowMapper<Prescription>(){  
	        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
		       Prescription p = new Prescription();
		      
		      p.setDocid(rs.getString(1));
		      p.setDname(rs.getString(2));
		    
		   
		      p.setPid(rs.getString(3));
		      p.setPname(rs.getString(4));
		      p.setAppointment(rs.getString(5));
		      p.setSpecialization(rs.getString(6));
		      p.setFileno(rs.getString(7));
		      p.setIdc("Admin");
		      
		      return p;
	        }
		});
	}
}

//admit patient based on doctor advice
public List<Prescription> getpreadm() {
	return template.query("select distinct pr.docid,concat(d.fname,' ',d.mname,' ',d.lname) doctor,pr.pid,concat(p.fname,' ',p.mname,' ',p.lname) Patient,presc.admit,date,presc.fileno from diagnose pr left outer join doctor d on d.docID = pr.docid join patient p on p.pid=pr.pid join prescription presc on presc.fileno = pr.fileno where admit='yes' and pr.fileno not in (select fileno from admitpat where admitpat.fileno = pr.fileno )",new RowMapper<Prescription>(){  
        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
	       Prescription p = new Prescription();
	       
	      
	       p.setDocid(rs.getString(1));
	       p.setDname(rs.getString(2));
	      
	       p.setPid(rs.getString(3));
	       p.setPname(rs.getString(4));
	     //  p.setSymptoms(rs.getString(5));
	      
           p.setAdmit(rs.getString(6));
        
           p.setFileno(rs.getString(7));
	       return p;
        }
	});
}
	


//for admin refference
/*
public List<Prescription> getPrescription() {
	return template.query("select docid,dname,(SELECT  specialization from doctor where doctor.docID = prescription.docid),pid,pname,symptoms,treatment,medicine,admit,date,ka,pm,systemic,gtest,gvalue from prescription ",new RowMapper<Prescription>(){  
        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
	       Prescription p = new Prescription();
	       
	       
	       p.setDocid(rs.getString(1));
	       p.setDname(rs.getString(2));
	       p.setSpecialization(rs.getString(3));
	       p.setPid(rs.getString(4));
	       p.setPname(rs.getString(5));
	       p.setSymptoms(rs.getString(6));
	       p.setTreatment(rs.getString(7));
           p.setMedicine(rs.getString(8));
           p.setAdmit(rs.getString(9));
           p.setDate(rs.getString(10));
           p.setKa(rs.getString(11));
           p.setPm(rs.getString(12));
           p.setSystemic(rs.getString(13));
           p.setGtest(rs.getString(14));
           p.setGvalue(rs.getString(15));
	       return p;
        }
	});
}
*/
public List<Prescription> getDocID2(){
	
	return template.query("select docid,(SELECT CONCAT(fname,' ', mname,' ',lname) from doctor where doctor.docID = appointment.docid),(SELECT  specialization from doctor where doctor.docID = appointment.docid),pid,pname,appointment from appointment",new RowMapper<Prescription>(){  
        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
	       Prescription p = new Prescription();
	      
	      p.setDocid(rs.getString(1));
	      p.setDname(rs.getString(2));
	      p.setSpecialization(rs.getString(3));
	      p.setPid(rs.getString(4));
	      p.setPname(rs.getString(5));
	      p.setAppointment(rs.getString(6));
	      return p;
        }
	});
}
/*
public int savePrs(Diagnose p) {
	// TODO Auto-generated method stub
	
	String sql = "insert into prescription(docid,dname,pid,pname,admit,date,fileno,pds,pir) values('"+p.getDocid()+"','"+p.getDname()+"','"+p.getPpid()+"','"+p.getPname()+"','"+p.getAdmit()+"','"+p.getDatetime()+"','"+p.getFileno()+"','"+p.getPds()+"','"+p.getPir()+"') on duplicate key update admit='"+p.getAdmit()+"',date='"+p.getDatetime()+"',pds='"+p.getPds()+"',pir='"+p.getPir()+"'";
	return template.update(sql);
}
*/
public int savePrs(Diagnose b) {
	   String sql="insert into prescription(docid,dname,pid,pname,admit,date,fileno,pds,pir) values(?,?,?,?,?,?,?,?,?) on duplicate key update admit = values(admit),date = values(date),pds = values(pds),pir= values(pir)";  
	  return template.update(sql, new Object[] { b.getDocid(),b.getDname(),b.getPpid(),b.getPname(),b.getAdmit(),b.getDatetime(),b.getFileno(),b.getPds(),b.getPir()}); 
	 } 

public int saveact(Diagnose p) {
	// TODO Auto-generated method stub
	
	String sql = "update appointment set active ='off' where fileno = '"+p.getFileno()+"'";
	return template.update(sql);
}
public int saveTre(Treatment p) {
	// TODO Auto-generated method stub
	String sql = "insert into treatment(pname,pid,admdate,datetime,dailychart,dname,comments,admitno,fileno) values('"+p.getPname()+"','"+p.getPid()+"','"+p.getAdmdate()+"','"+p.getDatetime()+"','"+p.getDailychart()+"','"+p.getDname()+"','"+p.getComments()+"','"+p.getAdmitno()+"','"+p.getFileno()+"') on duplicate key update datetime='"+p.getDatetime()+"',dailychart='"+p.getDailychart()+"',dname='"+p.getDname()+"',comments='"+p.getComments()+"',ncomments='"+p.getNcomments()+"'";
	return template.update(sql);
}

public List<Treatment> getTreatment(Treatment p) {

	return template.query("select (SELECT pname from admitpat where admitno='"+p.getAdmitno()+"'),pid,admdate,datetime,dailychart,dname,comments,ncomments,admitno,fileno from treatment where admitno='"+p.getAdmitno()+"' ",new RowMapper<Treatment>(){  
        public Treatment mapRow(ResultSet rs, int row) throws SQLException {   
	       Treatment p = new Treatment();
	    
	      p.setPname(rs.getString(1));
	      p.setPid(rs.getString(2));
	      p.setAdmdate(rs.getString(3));
	      p.setDatetime(rs.getString(4));
	      p.setDailychart(rs.getString(5));
	      p.setDname(rs.getString(6));
	      p.setComments(rs.getString(7));
	      p.setNcomments(rs.getString(8));
	      p.setAdmitno(rs.getString(9));
	      p.setFileno(rs.getString(10));
	      return p;
        }
	});
}

public List<Billconfig> getBillconfig() {
	return template.query("select feetype,charges,aid from billconfig ",new RowMapper<Billconfig>(){  
        public Billconfig mapRow(ResultSet rs, int row) throws SQLException {   
	       Billconfig p = new Billconfig();
	    /*
	      p.setCsfee(rs.getString(1));
	      p.setNursech(rs.getString(2));
	      p.setWardch(rs.getString(3));
	      p.setBedch(rs.getString(4));
	      p.setFoodch(rs.getString(5));
	      p.setSch(rs.getString(6));
	      p.setInjch(rs.getString(7));
	      p.setIcuch(rs.getString(8));
	      p.setLabch(rs.getString(9));
	      
        */
	       p.setFeetype(rs.getString(1));
	       p.setCharges(rs.getString(2));
	       p.setAid(rs.getString(3));
	       return p;
        }
	});
}
public int saveBillconfig(String fee, String amt,String aid) {
	// TODO Auto-generated method stub
	String sql = "insert into billconfig(feetype,charges,aid) values('"+fee+"','"+amt+"','"+aid+"') on duplicate key update feetype='"+fee+"',charges='"+amt+"' ";
	return template.update(sql);
}


public List<Billgen> getBill1() {
	return template.query("select a.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,a.fileno,CONCAT(adm.wardno,'/',adm.bedno),adm.admdate,concat(d.fname,' ',d.mname,' ',d.lname) doctor,adm.admitno from appointment a join patient p on a.pid=p.pid join doctor d on d.docID = a.docid left outer join admitpat adm on a.fileno = adm.fileno ",new RowMapper<Billgen>(){  
        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
	       Billgen p = new Billgen();
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setFileno(rs.getString(3));
	       p.setWardno(rs.getString(4));
	       p.setAdmdate(rs.getString(5));
	     
	      // p.setAddress(rs.getString(5));
	       p.setDname(rs.getString(6));
	       p.setAdmitno(rs.getString(7));
	       return p;
        }
	});
}

public List<Billgen> getBill() {
	
	return template.query("select max(CAST(SUBSTRING_INDEX(invoice,'-',-1) as decimal)) from billgen where invoicedate =DATE_FORMAT(curdate(), '%d-%m-%Y')",new RowMapper<Billgen>(){  
        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
        	
	       Billgen p = new Billgen();
	       p.setInvoice(rs.getString(1));
		return p;
        }
	});
}

public List<Billgen> getBill2(String pid,String name) {
	
	return template.query("select invoice,invoicedate,pname,pid,address,wardno,doctor,admdate,disdate,cashier,feetype,charges,price,subtotal,tax,discount,total,admitno,mid,policyholder,policyno,insurancec,type,fileno,quantity from billgen where pname = '"+name+"' or pid='"+pid+"'",new RowMapper<Billgen>(){  
        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
       
	       Billgen p = new Billgen();
	       p.setInvoice(rs.getString(1));
	       p.setInvoicedate(rs.getString(2));
	       p.setPname(rs.getString(3));
	       p.setPid(rs.getString(4));
	       p.setAddress(rs.getString(5));
	       p.setWardno(rs.getString(6));
	       p.setDoctor(rs.getString(7));
	       p.setAdmdate(rs.getString(8));
	       p.setDisdate(rs.getString(9));
	       p.setCashier(rs.getString(10));
	       p.setFeetype(rs.getString(11));
	       p.setCharges(rs.getString(12));
	       p.setPrice(rs.getString(13));
	       p.setSubtotal(rs.getString(14));
	      
	       p.setTax(rs.getString(15)); 
	       
	       
	       p.setDiscount(rs.getString(16));
	       p.setTotal(rs.getString(17));
	       p.setAdmitno(rs.getString(18));
	       p.setMid(rs.getString(19));
	       p.setPolicyholder(rs.getString(20));
	   
	       p.setPolicyno(rs.getString(21));
	       p.setInsurancec(rs.getString(22));
	       p.setType(rs.getString(23));
	       p.setFileno(rs.getString(24));
	       p.setQuantity(rs.getString(25));
	      
		return p;
        }
	});
}
//for printing induvidual report based on invoice id

public List<Billgen> getBill3a(String invid) {
	
	return template.query("select invoice,invoicedate,pname,pid,address,wardno,doctor,admdate,disdate,cashier,REPLACE(feetype, ',', '\n'),REPLACE(charges, ',', '\n'),REPLACE(price, ',', '\n'),subtotal,tax,discount,total,admitno,mid,policyholder,policyno,insurancec,type,fileno,REPLACE(quantity, ',', '\n') from billgen where invoice = '"+invid+"'",new RowMapper<Billgen>(){  
        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
       
	       Billgen p = new Billgen();
	       p.setInvoice(rs.getString(1));
	       p.setInvoicedate(rs.getString(2));
	       p.setPname(rs.getString(3));
	       p.setPid(rs.getString(4));
	       p.setAddress(rs.getString(5));
	       p.setWardno(rs.getString(6));
	       p.setDoctor(rs.getString(7));
	       p.setAdmdate(rs.getString(8));
	       p.setDisdate(rs.getString(9));
	       p.setCashier(rs.getString(10));
	       p.setFeetype(rs.getString(11));
	       p.setCharges(rs.getString(12));
	       p.setPrice(rs.getString(13));
	       p.setSubtotal(rs.getString(14));
	      
	       p.setTax(rs.getString(15)); 
	       
	       
	       p.setDiscount(rs.getString(16));
	       p.setTotal(rs.getString(17));
	       p.setAdmitno(rs.getString(18));
	       p.setMid(rs.getString(19));
	       p.setPolicyholder(rs.getString(20));
	   
	       p.setPolicyno(rs.getString(21));
	       p.setInsurancec(rs.getString(22));
	       p.setType(rs.getString(23));
	       p.setFileno(rs.getString(24));
	       p.setQuantity(rs.getString(25));
	      
		return p;
        }
	});
}
//for printing overall reports
public List<Billgen> getBill3(String fdate,String edate) {
	
	return template.query("select invoice,invoicedate,pname,pid,address,wardno,doctor,admdate,disdate,cashier,feetype,charges,price,subtotal,tax,discount,total,admitno,mid,policyholder,policyno,insurancec,type,fileno,quantity,prch from billgen where invoicedate between '"+fdate+"' and '"+edate+"'",new RowMapper<Billgen>(){  
        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
       
	       Billgen p = new Billgen();
	       p.setInvoice(rs.getString(1));
	       p.setInvoicedate(rs.getString(2));
	       p.setPname(rs.getString(3));
	       p.setPid(rs.getString(4));
	       p.setAddress(rs.getString(5));
	       p.setWardno(rs.getString(6));
	       p.setDoctor(rs.getString(7));
	       p.setAdmdate(rs.getString(8));
	       p.setDisdate(rs.getString(9));
	       p.setCashier(rs.getString(10));
	       p.setFeetype(rs.getString(11));
	       p.setCharges(rs.getString(12));
	       p.setPrice(rs.getString(13));
	       p.setSubtotal(rs.getString(14));
	      
	       p.setTax(rs.getString(15)); 
	       
	       
	       p.setDiscount(rs.getString(16));
	       p.setTotal(rs.getString(17));
	       p.setAdmitno(rs.getString(18));
	       p.setMid(rs.getString(19));
	       p.setPolicyholder(rs.getString(20));
	   
	       p.setPolicyno(rs.getString(21));
	       p.setInsurancec(rs.getString(22));
	       p.setType(rs.getString(23));
	       p.setFileno(rs.getString(24));
	       p.setQuantity(rs.getString(25));
	       p.setPrch(rs.getString(26));
		return p;
        }
	});
}
public int savebill(Billgen s) {
	// TODO Auto-generated method stub
	String sql = "insert into billgen(invoice,invoicedate,pname,pid,address,wardno,doctor,admdate,disdate,cashier,feetype,charges,price,subtotal,tax,discount,total,admitno,mid,policyholder,policyno,insurancec,type,quantity,fileno) values('"+s.getInvoice()+"','"+s.getInvoicedate()+"','"+s.getPname()+"','"+s.getPid()+"','"+s.getAddress()+"','"+s.getWardno()+"','"+s.getDoctor()+"','"+s.getAdmdate()+"','"+s.getDisdate()+"','"+s.getCashier()+"','"+s.getFeetype()+"','"+s.getCharges()+"','"+s.getPrice()+"','"+s.getSubtotal()+"','"+s.getTax()+"','"+s.getDiscount()+"','"+s.getTotal()+"','"+s.getAdmitno()+"','"+s.getMid()+"','"+s.getPolicyholder()+"','"+s.getPolicyno()+"','"+s.getInsurancec()+"','"+s.getType()+"','"+s.getQuantity()+"','"+s.getFileno()+"') on duplicate key update invoiceDate = '"+s.getInvoicedate()+"',address='"+s.getAddress()+"',wardno='"+s.getWardno()+"',doctor='"+s.getDoctor()+"',admdate='"+s.getAdmdate()+"',disdate='"+s.getDisdate()+"',cashier='"+s.getCashier()+"',feetype='"+s.getFeetype()+"',charges='"+s.getCharges()+"',price='"+s.getPrice()+"',subtotal='"+s.getSubtotal()+"',tax='"+s.getTax()+"',discount='"+s.getDiscount()+"',total='"+s.getTotal()+"',admitno='"+s.getAdmitno()+"',mid='"+s.getMid()+"',policyholder='"+s.getPolicyholder()+"',policyno='"+s.getPolicyno()+"',insurancec='"+s.getInsurancec()+"',type='"+s.getType()+"',quantity='"+s.getQuantity()+"',fileno='"+s.getFileno()+"'";
	return template.update(sql);
}

public int saved(Discharge s) {
	// TODO Auto-generated method stub
	
	String sql = "insert into discharge(pid,pname,dname,docid,admdate,disdate,investigation,fileno,admitno) values(?,?,?,?,?,?,?,?,?) on duplicate key update disdate =values(disdate),investigation=values(investigation)";
	  return template.update(sql, new Object[] {s.getPid(),s.getPname(),s.getDname(),s.getDocid(),s.getAdmdate(),s.getDisdate(),s.getInvestigation(),s.getFileno(),s.getAdmitno()}); 
}

public List<Discharge> getDischarge() {
	return template.query("select pid,pname,dname,docid,admdate,disdate,investigation,fileno,admitno from discharge",new RowMapper<Discharge>(){  
        public Discharge mapRow(ResultSet rs, int row) throws SQLException {   
	       Discharge p = new Discharge();
	       p.setPid(rs.getString(1));
	       System.out.println(rs.getString(2));
	       p.setPname(rs.getString(2));
	       p.setDname(rs.getString(3));
	       p.setDocid(rs.getString(4));
	       p.setAdmdate(rs.getString(5));
	       p.setDisdate(rs.getString(6));
	       p.setInvestigation(rs.getString(7));
	       p.setFileno(rs.getString(8));
	       p.setAdmitno(rs.getString(9));
	       return p;
        }
	});
}

public int saveNr(Nurseassign s) {
	// TODO Auto-generated method stub
	System.out.println(s.getPid());
	String sql = "insert into nurseassign(pid,pname,nname,nid,wardno) values('"+s.getPid()+"','"+s.getPname()+"', '"+s.getNname()+"','"+s.getNid()+"','"+s.getWardno()+"') on duplicate key update nid = '"+s.getNid()+"',nname='"+s.getNname()+"'";
	return template.update(sql);
}

public List<Nurseassign> getNurseassign() {
	return template.query("select pid,pname,nid,nname,wardno from  nurseassign",new RowMapper<Nurseassign>(){  
        public Nurseassign mapRow(ResultSet rs, int row) throws SQLException {   
	       Nurseassign p = new Nurseassign();
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setNid(rs.getString(3));
	       p.setNname(rs.getString(4));
	       p.setWardno(rs.getString(5));
	       return p;
        }
	});
}

public List<Nurseassign> getNurseassign1(String uid) {
	return template.query("select pid,pname,nid,nname,wardno from  nurseassign where nid in (select userid from userrole where username = '"+uid+"')",new RowMapper<Nurseassign>(){  
        public Nurseassign mapRow(ResultSet rs, int row) throws SQLException {   
	       Nurseassign p = new Nurseassign();
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setNid(rs.getString(3));
	       p.setNname(rs.getString(4));
	       p.setWardno(rs.getString(5));
	       return p;
        }
	});
}

public int saveuser(Doctor p) {
	// TODO Auto-generated method stub
	String sql = "insert into users(username,password,enabled,userid) values('"+p.getUsername()+"','"+p.getPassword()+"',1,'"+p.getDocID()+"') on duplicate key update password = '"+p.getPassword()+"', username = '"+p.getUsername()+"'";
	return template.update(sql);
}

public int saveuserrole(Doctor p) {
	// TODO Auto-generated method stub
	String sql = "insert into userrole(roleid,username,userrole,userid,useremail) values(1,'"+p.getUsername()+"','DOCTOR','"+p.getDocID()+"','"+p.getEmail()+"') on duplicate key update username = '"+p.getUsername()+"'";
	return template.update(sql);
}

//get medicines from product master
public List<Prescription> search(){
	//select name,(select round(sum(currentstock),3) from erpho.productstock where productstock.name=product.name and productstock.currentstock > 0) from erpho.product
	return template.query("select erpho.productstock.name,round(sum(currentstock),0) from erpho.productstock where  erpho.productstock.currentstock > 0 group by productstock.name",new RowMapper<Prescription>(){  
        public Prescription mapRow(ResultSet rs, int row) throws SQLException {  
            Prescription s=new Prescription();  
      
            s.setDrugn(rs.getString(1));
            s.setPstock1(rs.getInt(2));
           
       return s;
	
}
	 }); 
}

public int saveLabcon(Lab s) {
	// TODO Auto-generated method stub
	String sql = "insert into labconfig(category,subcategory,rangev) values('"+s.getCategory()+"','"+s.getSubcategory()+"','"+s.getRange()+"') on duplicate key update subcategory = '"+s.getSubcategory()+"'";
	return template.update(sql);
}

public List<Lab> getLabconfig() {
	// TODO Auto-generated method stub
	return template.query("select category,subcategory,rangev from labconfig",new RowMapper<Lab>(){  
        public Lab mapRow(ResultSet rs, int row) throws SQLException {   
	       Lab p = new Lab();
	      
	       p.setCategory(rs.getString(1));
	       p.setSubcategory(rs.getString(2));
	       p.setRange(rs.getString(3));
	      
	       return p;
        }
	});
}
public List<Lab> getLabconfig1(String value) {
	// TODO Auto-generated method stub
	return template.query("select count(rangev) from labconfig where rangev ='"+value+"' ",new RowMapper<Lab>(){  
        public Lab mapRow(ResultSet rs, int row) throws SQLException {   
	       Lab p = new Lab();
	      
	      
	       p.setRange(rs.getString(1));
	      
	       return p;
        }
	});
}


//json format for contents load on tab click
public List<Lab> getLabconfig(String category) {
	// TODO Auto-generated method stub
	
	return template.query("select category,subcategory,rangev from labconfig where category like '"+category+"'",new RowMapper<Lab>(){  
        public Lab mapRow(ResultSet rs, int row) throws SQLException {   
	       Lab p = new Lab();
	      
	       p.setCategory(rs.getString(1));
	       p.setSubcategory(rs.getString(2));
	       p.setRange(rs.getString(3));
	      System.out.println(rs.getString(3));
	       return p;
        }
	});
}
// get lab config master data


public List<Lab> getLabconcat() {
	// TODO Auto-generated method stub
	return template.query("select catcode,catname from category",new RowMapper<Lab>(){  
        public Lab mapRow(ResultSet rs, int row) throws SQLException {   
	       Lab p = new Lab();
	       p.setCatcode(rs.getString(1));
	       p.setCatname(rs.getString(2));
	       
	       return p;
        }
	});

}

public List<Lab> getLabconscat() {
	// TODO Auto-generated method stub
	return template.query("select category,subcategory,catcode from subcategory",new RowMapper<Lab>(){  
        public Lab mapRow(ResultSet rs, int row) throws SQLException {   
	       Lab p = new Lab();
	       p.setCategory(rs.getString(1));
	       p.setSubcategory(rs.getString(2));
	       p.setRange(rs.getString(3));
	      // p.setCatname(rs.getString(4));
	        return p;
        }
	});

}

public int savecategory(Lab s) {
	// TODO Auto-generated method stub
	String sql = "insert into category(catcode,catname) values('"+s.getCatcode()+"','"+s.getCatname()+"') on duplicate key update catname='"+s.getCatname()+"'";
	return template.update(sql);
}

public int savescategory(Lab s,String category,String subcategory,String catcode) {
	// TODO Auto-generated method stub
	String sql = "insert into labconfig(category,rangev,subcategory) values('"+category+"','"+catcode+"','"+subcategory+"') on duplicate key update subcategory = '"+subcategory+"'";
	return template.update(sql);
}


	// TODO Auto-generated method stub
	public List<Doctor> getuserrole(String name) {
		// TODO Auto-generated method stub
		return template.query("select userid from userrole where username='"+name+"'",new RowMapper<Doctor>(){  
	        public Doctor mapRow(ResultSet rs, int row) throws SQLException {   
		      Doctor p = new Doctor();
		       p.setUsername(rs.getString(1));
		       System.out.println(rs.getString(1));
		        return p;
	        }
		});


}

	public List<Admitpat> getAdmitpat(String username, String userrole) {
		// TODO Auto-generated method stub
		if(userrole.contains("[ROLE_DOCTOR]")){
			
			return template.query("select ad.pid,concat(pat.fname,' ',pat.mname,' ',pat.lname) patient,ad.docid,concat(d.fname,' ',d.mname,' ',d.lname),wardno,bedno,discharge,cause,admdate,ad.fileno,ad.admitno from admitpat ad join patient pat on ad.pid = pat.pid join doctor d on ad.docid = d.docID where ad.docid in (select userid from userrole where username ='"+username+"')",new RowMapper<Admitpat>(){  
		        public Admitpat mapRow(ResultSet rs, int row) throws SQLException {   
			       Admitpat p = new Admitpat();
			       
			       p.setPid(rs.getString(1));
			       p.setPname(rs.getString(2));
			       p.setDocid(rs.getString(3));
			    
			       p.setDname(rs.getString(4));
			       p.setWardno(rs.getString(5));
			       p.setBedno(rs.getString(6));
		           p.setDischarge(rs.getString(7));
		           p.setCause(rs.getString(8));
		           p.setAdmdate(rs.getString(9));
		           p.setIdc(rs.getString(3));
		           p.setFileno(rs.getString(10));
		           p.setAdmitno(rs.getString(11));
		      //     p.setIdc(rs.getString(3));
			       return p;
		        }
			});
		}
		else{
			
			return template.query("select ad.pid,concat(pat.fname,' ',pat.mname,' ',pat.lname) patient,ad.docid,concat(d.fname,' ',d.mname,' ',d.lname),wardno,bedno,discharge,cause,admdate,ad.fileno,ad.admitno from admitpat ad join patient pat on ad.pid = pat.pid join doctor d on ad.docid = d.docID",new RowMapper<Admitpat>(){  
		        public Admitpat mapRow(ResultSet rs, int row) throws SQLException {   
			       Admitpat p = new Admitpat();
			       
			       p.setPid(rs.getString(1));
			       p.setPname(rs.getString(2));
			       p.setDocid(rs.getString(3));
			    System.out.println("rs" + rs.getString(3));
			       p.setDname(rs.getString(4));
			       p.setWardno(rs.getString(5));
			       p.setBedno(rs.getString(6));
		           p.setDischarge(rs.getString(7));
		           p.setCause(rs.getString(8));
		           p.setAdmdate(rs.getString(9));
		           p.setFileno(rs.getString(10));
		           p.setAdmitno(rs.getString(11));
		          // p.setIdc(docid);
			       return p;
		        }
			});
		}
		
		
	}
	
	public List<Vitals> getVitalinfo(String id) {
	
		// TODO Auto-generated method stub
		return template.query("select (select pname from appointment where fileno='"+id+"') ,fileno,height,unitheight,weight,weightunit,temperature,tunit,abdominalc,bp,bmi,fi,fe,arest,pulse,timestamp from vital where fileno='"+id+"'",new RowMapper<Vitals>(){  
	        public Vitals mapRow(ResultSet rs, int row) throws SQLException {   
		       Vitals p= new Vitals();
		       p.setPid(rs.getString(1));
		       p.setFileno(rs.getString(2));
		       p.setHeight(rs.getString(3));
		       p.setUnith(rs.getString(4));
		       p.setWeight(rs.getString(5));
		       p.setUnitw(rs.getString(6));
		       p.setTemperature(rs.getString(7));
		       p.setUnitt(rs.getString(8));
		       p.setAc(rs.getString(9));
		       p.setBp(rs.getString(10));
		       p.setBmi(rs.getString(11));
		       p.setFi(rs.getString(12));
		       p.setFe(rs.getString(13));
		       p.setRest(rs.getString(14));
		       p.setPulse(rs.getString(15));
		     
		       p.setTime(rs.getString(16));
	return p;
	        }
		});


}

	
	public List<Iochart> getVitalinfo() {
		
		// TODO Auto-generated method stub
		return template.query("select name,age,gender,date,fileno,doctord,doctsig,ratef,nursesig,time,type,amount,typecommence,amtgiv,urine,vomitus,remarks",new RowMapper<Iochart>(){  
	        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
		       Iochart i = new Iochart();
		       i.setName(rs.getString(1));
		       i.setAge(rs.getString(2));
		       i.setGender(rs.getString(3));
		       i.setAdmdate(rs.getString(4));
		       i.setFileno(rs.getString(5));
		       i.setDoctord(rs.getString(6));
		       i.setDoctsig(rs.getString(7));
		       i.setRatef(rs.getString(8));
		       i.setNursesig(rs.getString(9));
		       i.setTime(rs.getString(10));
		       i.setOraltype(rs.getString(11));
		       i.setOralamt(rs.getString(12));
		       i.setOralcommence(rs.getString(13));
		       i.setAmtgiv(rs.getString(14));
		       i.setUrine(rs.getString(15));
		       i.setVomitus(rs.getString(16));
		       i.setRemarks(rs.getString(17));
	          return i;
	        }
		});
}

	public int saveVital(Vitals s) {
		
		String sql = "insert into vital(pid,fileno,height,unitheight,weight,weightunit,temperature,tunit,abdominalc,bp,pulse,bmi,fi,fe,arest,timestamp) values('"+s.getPid()+"','"+s.getFileno()+"','"+s.getHeight()+"','"+s.getUnith()+"','"+s.getWeight()+"','"+s.getUnitw()+"','"+s.getTemperature()+"','"+s.getUnitt()+"','"+s.getAc()+"','"+s.getBp()+"','"+s.getPulse()+"','"+s.getBmi()+"','"+s.getFi()+"','"+s.getFe()+"','"+s.getRest()+"',NOW()) ";
		return template.update(sql);// TODO Auto-generated method stub
		
	}
	
	public int saveiochart(Iochart i) {
		// TODO Auto-generated method stub
		String sql = "insert into iochart(pid,name,age,gender,admdate,fileno,doctord,doctsig,ratef,nursesig,date,admitno) values('"+i.getPid()+"','"+i.getName()+"','"+i.getAge()+"','"+i.getGender()+"','"+i.getAdmdate()+"','"+i.getFileno()+"','"+i.getDoctord()+"','"+i.getDoctsig()+"','"+i.getRatef()+"','"+i.getNursesig()+"',curdate(),'"+i.getAdmitno()+"') on duplicate key update time='"+i.getTime()+"',type='"+i.getOraltype()+"',amount='"+i.getOralamt()+"',typecommence='"+i.getOralcommence()+"',amtgiv='"+i.getAmtgiv()+"',urine='"+i.getUrine()+"',vomitus='"+i.getVomitus()+"',remarks='"+i.getRemarks()+"',date= curdate()";
				return template.update(sql);
	}
	// "on duplicate key update time='"+i.getTime()+"',type='"+i.getOraltype()+"',amount='"+i.getOralamt()+"',typecommence='"+i.getOralcommence()+"',amtgiv='"+i.getAmtgiv()+"',urine='"+i.getUrine()+"',vomitus='"+i.getVomitus()+"',remarks='"+i.getRemarks()+"'date= curdate()";
	
//get patient details on page load for iochart
	public List<Iochart> getPatientdet(String name) {
		// TODO Auto-generated method stub
		return template.query("select na.pid,concat(p.fname,' ',p.mname,' ',p.lname),na.fileno,na.admitno,adm.wardno,concat(n.fname,' ',n.mname,' ',n.lname),p.age,p.gender,adm.admdate,adm.dname from nurseassign na join patient p on p.pid = na.pid join nurse n on n.nid = na.nid join admitpat adm on adm.fileno = na.fileno where na.nid in (select userid from users where username ='"+name+"')",new RowMapper<Iochart>(){  
	        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
		       Iochart i = new Iochart();
		       i.setPid(rs.getString(1));
		       i.setName(rs.getString(2));
		       i.setFileno(rs.getString(3));
		       i.setAdmitno(rs.getString(4));
		       i.setWardno(rs.getString(5));
		       i.setNursesig(rs.getString(6));
			   i.setAge(rs.getString(7));
		       i.setGender(rs.getString(8));
		       i.setAdmdate(rs.getString(9));
		       i.setDoctsig(rs.getString(10));
		      
		       return i;
	        }
		});
		       
	}

	public List<Iochart> getPatientdet1(String fileno) {
		// TODO Auto-generated method stub
		   
		return template.query("select io.pid,concat(p.fname,' ',p.mname,' ',p.lname),io.fileno,p.age,p.gender,adm.admdate,adm.wardno,io.nursesig,io.admitno,date from iochart io join patient p on p.pid = io.pid join admitpat adm on adm.fileno = io.fileno where io.admitno='"+fileno+"'",new RowMapper<Iochart>(){  
	        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
		       Iochart i = new Iochart();
		       i.setPid(rs.getString(1));
		       i.setName(rs.getString(2));
		       i.setFileno(rs.getString(3));
		       i.setAge(rs.getString(4));
		       i.setGender(rs.getString(5));
		       i.setAdmdate(rs.getString(6));
		       i.setWardno(rs.getString(7));
		    
		       i.setNursesig(rs.getString(8));
		       i.setAdmitno(rs.getString(9));
		       i.setDate(rs.getString(10));
		      System.out.println(rs.getString(2));
		      
		       
		       return i;
	        }
		});
	}

	public List<Iochart> getPatientdet2(String admitno, String id) {
		// TODO Auto-generated method stub
		   
		return template.query("select time,type,amount,typecommence,amtgiv,urine,vomitus,remarks,admitno,doctord,doctsig,ratef,dremarks,date,aid,nursesig from iochart2 where admitno='"+admitno+"' and date='"+id+"' ",new RowMapper<Iochart>(){  
	        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
		       Iochart i = new Iochart();
		       i.setTime(rs.getString(1));
		       i.setOraltype(rs.getString(2));
		       i.setOralamt(rs.getString(3));
		       i.setOralcommence(rs.getString(4));
		       i.setAmtgiv(rs.getString(5));
		       i.setUrine(rs.getString(6));
		       i.setVomitus(rs.getString(7));
		       i.setRemarks(rs.getString(8));
		       i.setAdmitno(rs.getString(9));
		       i.setDoctord(rs.getString(10));
		       i.setDoctsig(rs.getString(11));
		       i.setRatef(rs.getString(12));
		       i.setDoctrmks(rs.getString(13));
		       i.setDate(rs.getString(14));
		       i.setAid1(rs.getString(15));
		       i.setNursesig(rs.getString(16));
		     //  i.setAmttot(rs.getString(16));
		      // i.setAmtgivtot(rs.getString(17));
		     //  i.setUrinetot(rs.getString(18));
		     //  i.setVomitustot(rs.getString(19));
		      System.out.println(rs.getString(2));
		      
		       
		       return i;
	        }
		});
	}
	
	public List<Iochart> getPatientdet3(String fileno) {
		// TODO Auto-generated method stub
		   
		return template.query("select distinct date from iochart2 where admitno='"+fileno+"'",new RowMapper<Iochart>(){  
	        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
		       Iochart i = new Iochart();
		       System.out.println(rs.getString(1));
		      i.setDate(rs.getString(1));
		     
		      
		       
		       return i;
	        }
		});
	}
	
	public List<Iochart> getPatientdet3(String admitno, String id) {
		// TODO Auto-generated method stub
		   
		return template.query(" select sum(amount),sum(amtgiv),sum(urine),sum(vomitus) from iochart2 where admitno='"+admitno+"' and date='"+id+"' ",new RowMapper<Iochart>(){  
	        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
		       Iochart i = new Iochart();
		       i.setAmttot(rs.getString(1));
		       i.setAmtgivtot(rs.getString(2));
		       i.setUrinetot(rs.getString(3));
		       i.setVomitustot(rs.getString(4));
		     //  i.setAmttot(rs.getString(16));
		      // i.setAmtgivtot(rs.getString(17));
		     //  i.setUrinetot(rs.getString(18));
		     //  i.setVomitustot(rs.getString(19));
		      System.out.println(rs.getString(2));
		      
		       
		       return i;
	        }
		});
	}
	public int saveuser(Nurse p) {
		// TODO Auto-generated method stub
		String sql = "insert into users(username,password,enabled,userid) values('"+p.getUsername()+"','"+p.getPassword()+"',1,'"+p.getNid()+"') on duplicate key update password = '"+p.getPassword()+"', username = '"+p.getUsername()+"'";
		return template.update(sql);
	}

	public int saveuserrole(Nurse p) {
		// TODO Auto-generated method stub
		String sql = "insert into userrole(roleid,username,userrole,userid,useremail) values(1,'"+p.getUsername()+"','NURSE','"+p.getNid()+"','"+p.getEmail()+"') on duplicate key update username = '"+p.getUsername()+"'";
		return template.update(sql);
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

	public List<Prescription> getPrescription3(String docid) {
	
	System.out.println(docid);
	return template.query("select pid,pname,date,fileno,buttonval,tabid,textval,docid,dname,admit from prescription1 where fileno ='"+docid+"' ",new RowMapper<Prescription>(){  
        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
	       Prescription p = new Prescription();
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setDate(rs.getString(3));
	       p.setFileno(rs.getString(4));
	      
	       p.setButtonl(rs.getString(5));
	       p.setTabid(rs.getString(6));
	       p.setDf(rs.getString(7));
	       p.setDocid(rs.getString(8));
	       p.setDname(rs.getString(9));
	       p.setAdmit(rs.getString(10));
	       
	       System.out.println(rs.getString(6));
		return p;
	       
	      /* 
	       docid,dname,(SELECT  specialization from doctor where doctor.docID = '"+docid+"'),pid,pname,pc,pmsh,ph,dh,fh,ogh,psh,sge,scv,sres,sgas,smusc,sgenit,sendoc,sskin,scns,pge,poc,pns,pcv,prs,pas,pds,pir,admit,date,fileno from prescription where fileno = '"+docid+"'
	       p.setDocid(rs.getString(1));
	       p.setDname(rs.getString(2));
	       p.setSpecialization(rs.getString(3));
	       p.setPid(rs.getString(4));
	       p.setPname(rs.getString(5));
	       p.setPc(rs.getString(6));
	       p.setPmsh(rs.getString(7));
           p.setPh(rs.getString(8));
           System.out.println(rs.getString(9));
           p.setDh(rs.getString(9));
           p.setFh(rs.getString(10));
           p.setOgh(rs.getString(11));
           p.setPsh(rs.getString(12));
           p.setSge(rs.getString(13));
           p.setScv(rs.getString(14));
           p.setSres(rs.getString(15));
           p.setSgas(rs.getString(16));
           p.setSmusc(rs.getString(17));
           p.setSgenit(rs.getString(18));
           p.setSendoc(rs.getString(19));
           p.setSskin(rs.getString(20));
           p.setScns(rs.getString(21));
           p.setPge(rs.getString(22));
           p.setPoc(rs.getString(23));
           p.setPns(rs.getString(24));
           p.setPcv(rs.getString(25));
           p.setPrs(rs.getString(26));
           p.setPas(rs.getString(27));
           p.setPds(rs.getString(28));
           p.setPir(rs.getString(29));
           p.setAdmit(rs.getString(30));
           p.setDate(rs.getString(31));
           p.setIdc(rs.getString(1));
           p.setFileno(rs.getString(32));
	       return p;
	       
	       */
        }
	});
	
	
	
	
}
//io-chart

	public int savePrs1(Prescription p, String var1, String var1a, String var1b, String var1c, String var1d, String var1e,  String var1g, String var1h, String var1i, String var1j) {
		// TODO Auto-generated method stub
		String sql = "insert into prescriptiontab(pid,pname,fileno,typeofdr,drugname,strdrug,dm,da,de,dn,baf,totn,nofdays) values('"+p.getPid()+"','"+p.getPname()+"','"+p.getFileno()+"','"+var1+"','"+var1a+"','"+var1b+"','"+var1c+"','"+var1d+"','"+var1e+"','"+var1g+"','"+var1h+"','"+var1i+"','"+var1j+"')";
		return template.update(sql);
	}

	public List<Prescription> getPrescriptionTab(String docid) {
		// TODO Auto-generated method stub
		return template.query("select pid,pname,fileno,typeofdr,drugname,strdrug,dm,da,de,dn,baf,totn,nofdays from prescriptiontab where fileno = '"+docid+"'",new RowMapper<Prescription>(){  
	        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
		       Prescription p = new Prescription();
		       
		       
		      
		       p.setPid(rs.getString(1));
		       p.setPname(rs.getString(2));
		       p.setFileno(rs.getString(3));
		       p.setTypeofdr(rs.getString(4));
		       p.setDrugname(rs.getString(5));
		       p.setStrdrug(rs.getString(6));
		       p.setDm(rs.getString(7));
		       p.setDa(rs.getString(8));
		       p.setDe(rs.getString(9));
		       p.setDn(rs.getString(10));
		       p.setBaf(rs.getString(11));
		       p.setTotn(rs.getString(12));
		       p.setNofdays(rs.getString(13));
		       return p;
	        }
		});
		
	}

	public List<Nurseassign> getNurseassign2(String nid) {
		return template.query("select userid from userrole where username = '"+nid+"'",new RowMapper<Nurseassign>(){  
	        public Nurseassign mapRow(ResultSet rs, int row) throws SQLException {   
		       Nurseassign p = new Nurseassign();
		      
		       p.setNid(rs.getString(1));
		       
		       return p;
	        }
		});
	}

	public int saveiochart1(Iochart i, String aid1a,String timea,String typeaa, String amta, String typea, String amounta, String urinea, String vomitusa, String remarksa, String doctora, String doctsigna,String ratea, String doctrmksa,String nursesig) {
		System.out.println("inside" +timea);
		System.out.println("inside" +typeaa);
		System.out.println(aid1a);
		String sql = "insert into iochart2(pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,vomitus,remarks,doctord,doctsig,ratef,dremarks,date,aid,nursesig) values('"+i.getPid()+"','"+i.getAdmitno()+"','"+i.getFileno()+"','"+timea+"','"+typeaa+"','"+amta+"','"+typea+"','"+amounta+"','"+urinea+"','"+vomitusa+"','"+remarksa+"','"+doctora+"','"+doctsigna+"','"+ratea+"','"+doctrmksa+"',DATE_FORMAT(curdate(),'%d-%m-%Y'),'"+aid1a+"','"+nursesig+"') on duplicate key update time='"+timea+"',type='"+typeaa+"',amount='"+amta+"',typecommence='"+typea+"',amtgiv='"+amounta+"',urine='"+urinea+"',vomitus='"+vomitusa+"',remarks='"+remarksa+"',doctord='"+doctora+"',doctsig='"+doctsigna+"',ratef='"+ratea+"',dremarks='"+doctrmksa+"',date= DATE_FORMAT(curdate(),'%d-%m-%Y'),nursesig='"+nursesig+"'";
		return template.update(sql);
		// TODO Auto-generated method stub
		
	}

	public List<Admitpat> getAdmitpatid() {
		// TODO Auto-generated method stub
		return template.query("select max(CAST(SUBSTRING_INDEX(admitno,'-',-1) as decimal)) from admitpat",new RowMapper<Admitpat>(){  
	        public Admitpat mapRow(ResultSet rs, int row) throws SQLException {   
		   Admitpat p = new Admitpat();
		     
		      p.setAdmitno(rs.getString(1));
		      return p;
	        }
		});
	}

	public List<Stock> getStockId() {
		// TODO Auto-generated method stub
		return template.query("select max(CAST(SUBSTRING_INDEX(invid,'-',-1) as decimal)) from addstock",new RowMapper<Stock>(){  
	        public Stock mapRow(ResultSet rs, int row) throws SQLException {   
		   Stock p = new Stock();
		     
		      p.setInvid(rs.getString(1));
		      return p;
	        }
		});
	}

	public List<Appointment> getFileno1() {
		// TODO Auto-generated method stub
		return template.query("select max(CAST(SUBSTRING_INDEX(fileno,'-',-1) as decimal)) from appointment",new RowMapper<Appointment>(){  
	        public Appointment mapRow(ResultSet rs, int row) throws SQLException {   
		   Appointment p = new Appointment();
		   
		      p.setFileno(rs.getString(1));
		      return p;
	        }
		});
	}

	public List<Stock> getReorder() {
		// TODO Auto-generated method stub
		return template.query("select pid,pname,ptype,quantity,pack,up,total,reorder,expdate,pc,invid from addstock where CAST(quantity AS UNSIGNED) <= CAST(reorder AS UNSIGNED)",new RowMapper<Stock>(){  
	        public Stock mapRow(ResultSet rs, int row) throws SQLException {   
		   Stock p = new Stock();
		     
		      p.setPid(rs.getString(1));
		      p.setPname(rs.getString(2));
		      p.setPtype(rs.getString(3));
		      p.setQuantity(rs.getString(4));
		      p.setPack(rs.getString(5));
		      p.setUp(rs.getString(6));
		      p.setTotal(rs.getString(7));
		      p.setReorder(rs.getString(8));
		      p.setExpdate(rs.getString(9));
		      p.setPc(rs.getString(10));
		      p.setInvid(rs.getString(11));
		      return p;
	        }
		});
	}

	public int savePrs2(Prescription p,String string, String string2, String string3) {
		// TODO Auto-generated method stub
		String sql = "insert into prescription1(pid,pname,date,fileno,buttonval,tabid,textval,docid,dname,admit) values('"+p.getPid()+"','"+p.getPname()+"','"+p.getDate()+"','"+p.getFileno()+"','"+string+"','"+string2+"','"+string3+"','"+p.getDocid()+"','"+p.getDname()+"','"+p.getAdmit()+"')";
		return template.update(sql);	
	}

	public List<Vitals> getVitals(String nid) {
		// TODO Auto-generated method stub
		return template.query("select userid from userrole where username = '"+nid+"'",new RowMapper<Vitals>(){  
	        public Vitals mapRow(ResultSet rs, int row) throws SQLException {   
		     Vitals p = new Vitals();
		     
		      p.setNid(rs.getString(1));
		      return p;
	        }
		});
	}
	
	public int savedrchart(Drugchart i) {
		// TODO Auto-generated method stub
		String sql = "insert into drugchart(pid,name,age,gender,admdate,fileno,doctsig,date,admitno) values('"+i.getPid()+"','"+i.getName()+"','"+i.getAge()+"','"+i.getGender()+"','"+i.getAdmdate()+"','"+i.getFileno()+"','"+i.getDoctsig()+"',curdate(),'"+i.getAdmitno()+"') on duplicate key update time='"+i.getTime()+"',type='"+i.getOraltype()+"',amount='"+i.getOralamt()+"',typecommence='"+i.getOralcommence()+"',amtgiv='"+i.getAmtgiv()+"',urine='"+i.getUrine()+"',vomitus='"+i.getVomitus()+"',remarks='"+i.getRemarks()+"',date= curdate()";
				return template.update(sql);
	}
	


public int savehochart(Hourchart i) {
	// TODO Auto-generated method stub
	String sql = "insert into hourchart(pid,name,age,gender,admdate,fileno,nursesig,date,admitno,wardno) values('"+i.getPid()+"','"+i.getName()+"','"+i.getAge()+"','"+i.getGender()+"','"+i.getAdmdate()+"','"+i.getFileno()+"','"+i.getNursesig()+"',curdate(),'"+i.getAdmitno()+"','"+i.getWardno()+"') ";

			return template.update(sql);
}
//on duplicate key update time='"+i.getTime()+"',type='"+i.getOraltype()+"',amount='"+i.getOralamt()+"',typecommence='"+i.getOralcommence()+"',amtgiv='"+i.getAmtgiv()+"',urine='"+i.getUrine()+"',vomitus='"+i.getVomitus()+"',remarks='"+i.getRemarks()+"',date= curdate()";
public int savehochart1(Hourchart s,String aid1, String string, String string2, String string3, String string4, String string5, String string6, String string7,String nursesig) {
	System.out.println("Aid" +aid1);
	// TODO Auto-generated method stub
	String sql = "insert into hourchart2(pid,admitno,fileno,tabid,2am,6am,10am,2pm,6pm,10pm,date,aid,nsign) values('"+s.getPid()+"','"+s.getAdmitno()+"','"+s.getFileno()+"','"+string+"','"+string2+"','"+string3+"','"+string4+"','"+string5+"','"+string6+"','"+string7+"',DATE_FORMAT(curdate(),'%d-%m-%Y'),'"+aid1+"','"+nursesig+"') on duplicate key update  2am = '"+string2+"', 6am='"+string3+"', 10am = '"+string4+"', 2pm = '"+string5+"', 6pm='"+string6+"', 10pm='"+string7+"',nsign='"+nursesig+"' ";
    return template.update(sql);
}
//load hourchart details
/*
public List<Hourchart> getPatientdeth() {
	// TODO Auto-generated method stub
	return template.query("select pid,pname,(select age from patient where admitpat.pid= patient.pid),(select gender from patient where admitpat.pid= patient.pid),fileno,admdate,CONCAT(wardno,'/',bedno),dname,(select nname from nurseassign where nurseassign.pid=admitpat.pid),admitno from admitpat",new RowMapper<Iochart>(){  
        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
	       Hourchart i = new Hochart();
	       i.setPid(rs.getString(1));
	       i.setName(rs.getString(2));
	       i.setAge(rs.getString(3));
	       i.setGender(rs.getString(4));
	    
	       i.setFileno(rs.getString(5));
	       i.setAdmdate(rs.getString(6));
	       i.setWardno(rs.getString(7));
	       i.setDoctsig(rs.getString(8));
	       i.setNursesig(rs.getString(9));
	       i.setAdmitno(rs.getString(10));
	       return i;
        }
	});
	       
}
*/
public List<Hourchart> getPatientdet1h(String admitno) {
	// TODO Auto-generated method stub
	   
	return template.query("select io.pid,concat(p.fname,' ',p.mname,' ',p.lname),io.fileno,p.age,p.gender,adm.admdate,adm.wardno,io.nursesig,io.admitno,date from hourchart io join patient p on p.pid = io.pid join admitpat adm on adm.fileno = io.fileno where io.admitno='"+admitno+"'",new RowMapper<Hourchart>(){  
        public Hourchart mapRow(ResultSet rs, int row) throws SQLException {   
	       Hourchart i = new Hourchart();
	       i.setPid(rs.getString(1));
	       i.setName(rs.getString(2));
	       i.setFileno(rs.getString(3));
	       i.setAge(rs.getString(4));
	       i.setGender(rs.getString(5));
	       i.setAdmdate(rs.getString(6));
	       i.setWardno(rs.getString(7));
	    
	       i.setNursesig(rs.getString(8));
	       i.setAdmitno(rs.getString(9));
	       i.setDate(rs.getString(10));
	       
	      System.out.println(rs.getString(2));
	      
	       
	       return i;
        }
	});
}

public List<Hourchart> getPatientdet2h(String admitno, String id) {
	// TODO Auto-generated method stub
	   
	return template.query("select 2am,6am,10am,2pm,6pm,10pm,tabid,date,aid,nsign from hourchart2 where admitno='"+admitno+"' and date='"+id+"' ",new RowMapper<Hourchart>(){  
        public Hourchart mapRow(ResultSet rs, int row) throws SQLException {   
	       Hourchart i = new Hourchart();
	       i.setTime(rs.getString(1));
	       i.setOraltype(rs.getString(2));
	       i.setOralamt(rs.getString(3));
	       i.setOralcommence(rs.getString(4));
	       i.setAmtgiv(rs.getString(5));
	       i.setUrine(rs.getString(6));
	       i.setTabid(rs.getString(7));
	       i.setDate(rs.getString(8));
	       i.setAid1(rs.getString(9));
	       i.setNsign(rs.getString(10));
	      System.out.println(rs.getString(2));
	      
	       
	       return i;
        }
	});
}

public List<Hourchart> getPatientdet3h(String admitno) {
	// TODO Auto-generated method stub
	   
	return template.query("select distinct date from hourchart2 where admitno='"+admitno+"'",new RowMapper<Hourchart>(){  
        public Hourchart mapRow(ResultSet rs, int row) throws SQLException {   
	       Hourchart i = new Hourchart();
	      i.setDate(rs.getString(1));
	     
	      
	       
	       return i;
        }
	});
}

//load drug chart

/*
public List<Drugchart> getPatientdet1d(String admitno) {
	// TODO Auto-generated method stub
	   
	return template.query("select pid,name,fileno,age,gender,admdate,wardno,nursesig,admitno,date,wardno from hourchart where admitno='"+admitno+"'",new RowMapper<Drugchart>(){  
        public Drugchart mapRow(ResultSet rs, int row) throws SQLException {   
	       Drugchart i = new Drugchart();
	       i.setPid(rs.getString(1));
	       i.setName(rs.getString(2));
	       i.setFileno(rs.getString(3));
	       i.setAge(rs.getString(4));
	       i.setGender(rs.getString(5));
	       i.setAdmdate(rs.getString(6));
	       i.setWardno(rs.getString(7));
	    
	       i.setNursesig(rs.getString(8));
	       i.setAdmitno(rs.getString(9));
	       i.setDate(rs.getString(10));
	       i.setWardno(rs.getString(11));
	      System.out.println(rs.getString(2));
	      
	       
	       return i;
        }
	});
}
*/

public int savedrchart1(Drugchart i,String aid, String string, String string2, String string3, String string4, String amounta, String urinea, String doctora, String ratea, String vomitusa, String nursesigna, String doctrmksa,String disc) {
	// TODO Auto-generated method stub
	System.out.println("nsig"+ nursesigna);
	String sql = "insert into drugchart2(pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,doctord,ratef,vomitus,nursesig,dremarks,ndate,aid,discontinue) values('"+i.getPid()+"','"+i.getAdmitno()+"','"+i.getFileno()+"','"+string+"','"+string2+"','"+string3+"','"+string4+"','"+amounta+"','"+urinea+"','"+doctora+"','"+ratea+"','"+vomitusa+"','"+nursesigna+"','"+doctrmksa+"',substring('"+string+"',2,10),'"+aid+"','"+disc+"') on duplicate key update time='"+string+"',type='"+string2+"',amount='"+string3+"',typecommence='"+string4+"',amtgiv='"+amounta+"',urine='"+urinea+"',ratef = '"+ratea+"',doctord='"+doctora+"', vomitus='"+vomitusa+"',nursesig='"+nursesigna+"',dremarks='"+doctrmksa+"',ndate=substring('"+string+"',2,10),discontinue='"+disc+"'";
	return template.update(sql);
	}

/*
public int savedrchart1(Drugchart i) {
	// TODO Auto-generated method stub
	//System.out.println("nsig"+ nursesigna);
	System.out.println("Time" +i.getOraltype());
	System.out.println("Time" +i.getFileno());
	System.out.println(i.getRatef());
	String sql = "insert into drugchart2(pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,doctord,ratef,vomitus,nursesig,dremarks,date,aid,discontinue) values('"+i.getPid()+"','"+i.getAdmitno()+"','"+i.getFileno()+"','"+i.getTime()+"','"+i.getOraltype()+"','"+i.getOralamt()+"','"+i.getOralcommence()+"','"+i.getAmtgiv()+"','"+i.getUrine()+"','"+i.getDoctord()+"','"+i.getRatef()+"','"+i.getVomitus()+"','"+i.getNursesig()+"','"+i.getDoctrmks()+"',curdate(),'"+i.getAid1()+"','"+i.getDiscontinue()+"') on duplicate key update time='"+i.getTime()+"',type='"+i.getOraltype()+"',amount='"+i.getOralamt()+"',typecommence='"+i.getOralcommence()+"',amtgiv='"+i.getAmtgiv()+"',urine='"+i.getUrine()+"',ratef = '"+i.getRatef()+"',doctord='"+i.getDoctord()+"', vomitus='"+i.getVomitus()+"',nursesig='"+i.getNursesig()+"',dremarks='"+i.getDoctrmks()+"',date= curdate(),discontinue='"+i.getDiscontinue()+"',aid='"+i.getAid1()+"'";
	return template.update(sql);
	}
*/
public int savedrchart01(Drugchart i,String aid, String string, String string2, String string3, String string4, String amounta, String urinea, String doctora,String disc) {
	// TODO Auto-generated method stub
   String sql = "insert into drugchart2(pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,doctord,date,aid,discontinue) values('"+i.getPid()+"','"+i.getAdmitno()+"','"+i.getFileno()+"','"+string+"','"+string2+"','"+string3+"','"+string4+"','"+amounta+"','"+urinea+"','"+doctora+"',DATE_FORMAT(curdate(),'%d-%m-%Y'),'"+aid+"','"+disc+"') on duplicate key update time='"+string+"',type='"+string2+"',amount='"+string3+"',typecommence='"+string4+"',amtgiv='"+amounta+"',urine='"+urinea+"',date= DATE_FORMAT(curdate(),'%d-%m-%Y'),discontinue='"+disc+"'";
	return template.update(sql);
	}
public List<Drugchart> getPatientdet2d(String admitno, String id) {
	// TODO Auto-generated method stub
	   
	return template.query("select distinct pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,doctord,ratef,vomitus,nursesig,dremarks,date,aid,discontinue from drugchart2 where admitno='"+admitno+"' and date='"+id+"' and date not like 'null' group by type order by aid ",new RowMapper<Drugchart>(){  
        public Drugchart mapRow(ResultSet rs, int row) throws SQLException {   
	       Drugchart i = new Drugchart();
	        i.setPid(rs.getString(1));
	        i.setAdmitno(rs.getString(2));
	        i.setFileno(rs.getString(3));
            i.setTime(rs.getString(4));
		       i.setOraltype(rs.getString(5));
		       i.setOralamt(rs.getString(6));
		       i.setOralcommence(rs.getString(7));
		       i.setAmtgiv(rs.getString(8));
		       i.setUrine(rs.getString(9));
		      i.setDoctord(rs.getString(10));
		       i.setRatef(rs.getString(11));
		       i.setVomitus(rs.getString(12));
		       i.setNursesig(rs.getString(13));
		       i.setDoctrmks(rs.getString(14));
		       i.setDate(rs.getString(15));
		       i.setAid1(rs.getString(16));
		       i.setDiscontinue(rs.getString(17));
		     //  i.setAid1(rs.getString(15));
	      System.out.println(rs.getString(11));
	      
	       
	       return i;
        }
	});
}

public List<Drugchart> getPatientdet3d(String admitno) {
	// TODO Auto-generated method stub
	   
	return template.query("select distinct date from drugchart2 where admitno='"+admitno+"' and date not like 'null'",new RowMapper<Drugchart>(){  
        public Drugchart mapRow(ResultSet rs, int row) throws SQLException {   
	       Drugchart i = new Drugchart();
	      i.setDate(rs.getString(1));
	     
	      
	       
	       return i;
        }
	});
}

public List<Drugchart> getPatientdet4d(String admitno,String drname,String time) {
	// TODO Auto-generated method stub
	   System.out.println("pat4" +drname);
	   System.out.println(time);
	return template.query("select pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,doctord,ratef,vomitus,nursesig,dremarks,date,aid,discontinue from drugchart2 where admitno='"+admitno+"' and type ='"+drname+"' and dremarks is NOT NULL and ratef is not null and vomitus is not null and nursesig is not null",new RowMapper<Drugchart>(){  
        public Drugchart mapRow(ResultSet rs, int row) throws SQLException {   
	       Drugchart i = new Drugchart();
	       i.setPid(rs.getString(1));
	        i.setAdmitno(rs.getString(2));
	        i.setFileno(rs.getString(3));
           i.setTime(rs.getString(4));
		       i.setOraltype(rs.getString(5));
		       i.setOralamt(rs.getString(6));
		       i.setOralcommence(rs.getString(7));
		       i.setAmtgiv(rs.getString(8));
		       i.setUrine(rs.getString(9));
		      i.setDoctord(rs.getString(10));
		       i.setRatef(rs.getString(11));
		       i.setVomitus(rs.getString(12));
		       i.setNursesig(rs.getString(13));
		       i.setDoctrmks(rs.getString(14));
		       i.setDate(rs.getString(15));
		       i.setAid1(rs.getString(16));
		       i.setDiscontinue(rs.getString(17));
		     //  i.setAid1(rs.getString(15));
	      System.out.println("rs.getString(11) " +rs.getString(11));
	      
	       
	       return i;
	     
	      
	       
	       
        }
	});
}
public List<Register> checkuserext(String username) {
	// TODO Auto-generated method stub
	return template.query("select count(username) from users where username='"+username+"'",new RowMapper<Register>(){  
        public Register mapRow(ResultSet rs, int row) throws SQLException {   
	       Register i = new Register();
	      i.setUsername(rs.getString(1));
	     
	     return i;
        }
	});
}

public List<Billgen> getBill4(String user) {
	// TODO Auto-generated method stub
	
		
		return template.query("select p.address,concat(i.mid1,'=',i.mid2),concat(i.policyno1,'=',i.policyno2),concat(i.policyh1,'=',i.policyh2),concat(i.pins,'=',i.sins) from patient p left outer join insurance i on p.pid = i.pid where p.pid='"+user+"'",new RowMapper<Billgen>(){  
	        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
	        	
		       Billgen p = new Billgen();
		       p.setAddress(rs.getString(1));
		       p.setMid(rs.getString(2));
		       p.setPolicyno(rs.getString(3));
		       p.setPolicyholder(rs.getString(4));
		       p.setInsurancec(rs.getString(5));
			return p;
	        }
		});
	}

public List<Billgen> getBill7(String fileno) {
	// TODO Auto-generated method stub
	
		
		return template.query("select disdate,(select distinct dname from prescription1 where fileno ='"+fileno+"' ) from discharge where fileno='"+fileno+"'",new RowMapper<Billgen>(){  
	        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
	        	System.out.println("bill" + rs.getString(1));
		       Billgen p = new Billgen();
		       p.setDisdate(rs.getString(1));
		       p.setDname(rs.getString(2));
			return p;
	        }
		});
	}
public List<Billgen> getBill8(String fileno) {
	// TODO Auto-generated method stub
	
		
		return template.query("select dname from prescription1 where fileno='"+fileno+"'",new RowMapper<Billgen>(){  
	        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
	        	System.out.println("bill" + rs.getString(1));
		       Billgen p = new Billgen();
		     
		       p.setDname(rs.getString(1));
			return p;
	        }
		});
	}
public List<Iochart> getPatientdet() {
	return template.query("select adm.pid,concat(p.fname,' ',p.mname,' ',p.lname),adm.fileno,adm.admitno,concat(adm.wardno,'/',adm.bedno),na.nname,p.age,p.gender,adm.admdate,adm.dname from admitpat adm left outer join nurseassign na on adm.fileno = na.fileno join patient p on p.pid = adm.pid",new RowMapper<Iochart>(){  
        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
	       Iochart i = new Iochart();
	       i.setPid(rs.getString(1));
	       i.setName(rs.getString(2));
	      
	       i.setFileno(rs.getString(3));
	       i.setAdmitno(rs.getString(4));
	       i.setWardno(rs.getString(5));
	       i.setNursesig(rs.getString(6));
	       i.setAge(rs.getString(7));
	       i.setGender(rs.getString(8));
	       i.setAdmdate(rs.getString(9));
	       
	       i.setDoctsig(rs.getString(10));
	       
	       
	       
	       
		  
	      
	  
	      
	       return i;
        }
	});
}
//change head nurse
public List<Register> getNrole() {
	// TODO Auto-generated method stub
	return template.query("select ur.userid,concat(n.fname,' ',n.mname,' ',n.lname)Nurse,ur.userrole from userrole ur join nurse n on n.nid = ur.userid  where ur.userrole='NURSE' or ur.userrole='CHIEFNURSE'",new RowMapper<Register>(){  
        public Register mapRow(ResultSet rs, int row) throws SQLException {   
	       Register i = new Register();
	       i.setNid(rs.getString(1));
	       i.setNname(rs.getString(2));
	       i.setNrole(rs.getString(3));
	   return i;
        }
	});
}

public List<Register> getArole() {
	// TODO Auto-generated method stub
	return template.query("select ur.userid,concat(a.fname,' ',a.mname,' ',a.lname)Assistant,ur.userrole from userrole ur join assistant a on a.aid = ur.userid  where ur.userrole='ASSISTANT' or ur.userrole='Accounts Admin' or ur.userrole ='PHARMACIST' or ur.userrole='SALESMANAGER'",new RowMapper<Register>(){  
        public Register mapRow(ResultSet rs, int row) throws SQLException {   
	       Register i = new Register();
	       i.setAid(rs.getString(1));
	       i.setAname(rs.getString(2));
	       i.setArole(rs.getString(3));
	   return i;
        }
	});
}

//update nurse to headnurse or viceacersa
public int saveur(Register s) {
	String sql = "update userrole set userrole = '"+s.getNrole()+"' where userid='"+s.getNid()+"'";
	return template.update(sql);
}

public int saveas(Register s) {
	String sql = "update userrole set userrole = '"+s.getArole()+"' where userid='"+s.getAid()+"'";
	return template.update(sql);
}

public int saveOpdchart1(Drugchart i,String aid, String string, String string2, String string3, String string4, String amounta, String urinea, String doctora, String ratea, String vomitusa, String nursesigna, String doctrmksa,String disc) {
	// TODO Auto-generated method stub
	System.out.println("nsig"+ nursesigna);
	String sql = "insert into opdchart(pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,doctord,ratef,vomitus,nursesig,dremarks,ndate,aid,discontinue) values('"+i.getPid()+"','"+i.getAdmitno()+"','"+i.getFileno()+"','"+string+"','"+string2+"','"+string3+"','"+string4+"','"+amounta+"','"+urinea+"','"+doctora+"','"+ratea+"','"+vomitusa+"','"+nursesigna+"','"+doctrmksa+"',substring('"+string+"',2,10),'"+aid+"','"+disc+"') on duplicate key update time='"+string+"',type='"+string2+"',amount='"+string3+"',typecommence='"+string4+"',amtgiv='"+amounta+"',urine='"+urinea+"',ratef = '"+ratea+"',doctord='"+doctora+"', vomitus='"+vomitusa+"',nursesig='"+nursesigna+"',dremarks='"+doctrmksa+"',ndate=substring('"+string+"',2,10),discontinue='"+disc+"'";
	return template.update(sql);
	}

/*
public int savedrchart1(Drugchart i) {
	// TODO Auto-generated method stub
	//System.out.println("nsig"+ nursesigna);
	System.out.println("Time" +i.getOraltype());
	System.out.println("Time" +i.getFileno());
	System.out.println(i.getRatef());
	String sql = "insert into drugchart2(pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,doctord,ratef,vomitus,nursesig,dremarks,date,aid,discontinue) values('"+i.getPid()+"','"+i.getAdmitno()+"','"+i.getFileno()+"','"+i.getTime()+"','"+i.getOraltype()+"','"+i.getOralamt()+"','"+i.getOralcommence()+"','"+i.getAmtgiv()+"','"+i.getUrine()+"','"+i.getDoctord()+"','"+i.getRatef()+"','"+i.getVomitus()+"','"+i.getNursesig()+"','"+i.getDoctrmks()+"',curdate(),'"+i.getAid1()+"','"+i.getDiscontinue()+"') on duplicate key update time='"+i.getTime()+"',type='"+i.getOraltype()+"',amount='"+i.getOralamt()+"',typecommence='"+i.getOralcommence()+"',amtgiv='"+i.getAmtgiv()+"',urine='"+i.getUrine()+"',ratef = '"+i.getRatef()+"',doctord='"+i.getDoctord()+"', vomitus='"+i.getVomitus()+"',nursesig='"+i.getNursesig()+"',dremarks='"+i.getDoctrmks()+"',date= curdate(),discontinue='"+i.getDiscontinue()+"',aid='"+i.getAid1()+"'";
	return template.update(sql);
	}
*/
public int saveOpdchart01(Drugchart i,String aid, String string, String string2, String string3, String string4, String amounta, String urinea, String doctora,String disc) {
	// TODO Auto-generated method stub
   String sql = "insert into opdchart(pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,doctord,date,aid,discontinue) values('"+i.getPid()+"','"+i.getAdmitno()+"','"+i.getFileno()+"','"+string+"','"+string2+"','"+string3+"','"+string4+"','"+amounta+"','"+urinea+"','"+doctora+"',DATE_FORMAT(curdate(),'%d-%m-%Y'),'"+aid+"','"+disc+"') on duplicate key update time='"+string+"',type='"+string2+"',amount='"+string3+"',typecommence='"+string4+"',amtgiv='"+amounta+"',urine='"+urinea+"',date= DATE_FORMAT(curdate(),'%d-%m-%Y'),discontinue='"+disc+"'";
	return template.update(sql);
	}
public List<Drugchart> getPatientdet2Opd(String admitno, String id) {
	// TODO Auto-generated method stub
	   
	return template.query("select distinct pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,doctord,ratef,vomitus,nursesig,dremarks,date,aid,discontinue from opdchart where fileno='"+admitno+"' and date='"+id+"' and date not like 'null' group by type order by aid ",new RowMapper<Drugchart>(){  
        public Drugchart mapRow(ResultSet rs, int row) throws SQLException {   
	       Drugchart i = new Drugchart();
	        i.setPid(rs.getString(1));
	        i.setAdmitno(rs.getString(2));
	        i.setFileno(rs.getString(3));
            i.setTime(rs.getString(4));
		       i.setOraltype(rs.getString(5));
		       i.setOralamt(rs.getString(6));
		       i.setOralcommence(rs.getString(7));
		       i.setAmtgiv(rs.getString(8));
		       i.setUrine(rs.getString(9));
		      i.setDoctord(rs.getString(10));
		       i.setRatef(rs.getString(11));
		       i.setVomitus(rs.getString(12));
		       i.setNursesig(rs.getString(13));
		       i.setDoctrmks(rs.getString(14));
		       i.setDate(rs.getString(15));
		       i.setAid1(rs.getString(16));
		       i.setDiscontinue(rs.getString(17));
		     //  i.setAid1(rs.getString(15));
	      System.out.println(rs.getString(11));
	      
	       
	       return i;
        }
	});
}

public List<Drugchart> getPatientdet3Opd(String admitno) {
	// TODO Auto-generated method stub
	   
	return template.query("select distinct date from opdchart where fileno='"+admitno+"' and date not like 'null'",new RowMapper<Drugchart>(){  
        public Drugchart mapRow(ResultSet rs, int row) throws SQLException {   
	       Drugchart i = new Drugchart();
	      i.setDate(rs.getString(1));
	     
	      
	       
	       return i;
        }
	});
}

public List<Drugchart> getPatientdet4Opd(String admitno,String drname,String time) {
	// TODO Auto-generated method stub
	   System.out.println("pat4" +drname);
	   System.out.println(time);
	return template.query("select pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,doctord,ratef,vomitus,nursesig,dremarks,date,aid,discontinue from opdchart where fileno='"+admitno+"' and type ='"+drname+"'",new RowMapper<Drugchart>(){  
        public Drugchart mapRow(ResultSet rs, int row) throws SQLException {   
	       Drugchart i = new Drugchart();
	       i.setPid(rs.getString(1));
	        i.setAdmitno(rs.getString(2));
	        i.setFileno(rs.getString(3));
           i.setTime(rs.getString(4));
		       i.setOraltype(rs.getString(5));
		       i.setOralamt(rs.getString(6));
		       i.setOralcommence(rs.getString(7));
		       i.setAmtgiv(rs.getString(8));
		       i.setUrine(rs.getString(9));
		      i.setDoctord(rs.getString(10));
		       i.setRatef(rs.getString(11));
		       i.setVomitus(rs.getString(12));
		       i.setNursesig(rs.getString(13));
		       i.setDoctrmks(rs.getString(14));
		       i.setDate(rs.getString(15));
		       i.setAid1(rs.getString(16));
		       i.setDiscontinue(rs.getString(17));
		     //  i.setAid1(rs.getString(15));
	      System.out.println("rs.getString(11) " +rs.getString(11));
	      
	       
	       return i;
	     
	      
	       
	       
        }
	});
}

public List<Appointment> getPatientOpd(String name) {
	// TODO Auto-generated method stub
	return template.query("select na.pid,concat(p.fname,' ',p.mname,' ',p.lname),na.fileno,p.age,p.gender,concat(d.fname,' ',d.mname,' ',d.lname)Doctor,na.docid from appointment na join patient p on p.pid = na.pid join doctor d on d.docID = na.docid",new RowMapper<Appointment>(){  
        public Appointment mapRow(ResultSet rs, int row) throws SQLException {   
	       Appointment i = new Appointment();
	       i.setPid(rs.getString(1));
	       i.setPname(rs.getString(2));
	       i.setFileno(rs.getString(3));
	      
	       i.setAppointment(rs.getString(4));
	       i.setTime(rs.getString(5));
	       i.setDname(rs.getString(6));
	       i.setDocid(rs.getString(7));
	       
	     return i;
        }
	});
	       
}

public List<Iochart> getPatientOpd() {
	return template.query("select adm.pid,concat(p.fname,' ',p.mname,' ',p.lname),adm.fileno,adm.admitno,concat(adm.wardno,'/',adm.bedno),na.nname,p.age,p.gender,adm.admdate,adm.dname from admitpat adm left outer join nurseassign na on adm.fileno = na.fileno join patient p on p.pid = adm.pid",new RowMapper<Iochart>(){  
        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
	       Iochart i = new Iochart();
	       i.setPid(rs.getString(1));
	       i.setName(rs.getString(2));
	      
	       i.setFileno(rs.getString(3));
	       i.setAdmitno(rs.getString(4));
	       i.setWardno(rs.getString(5));
	       i.setNursesig(rs.getString(6));
	       i.setAge(rs.getString(7));
	       i.setGender(rs.getString(8));
	       i.setAdmdate(rs.getString(9));
	       
	       i.setDoctsig(rs.getString(10));
	       
	       
	       
	       
		  
	      
	  
	      
	       return i;
        }
	});
}

public void getChart(Hourchart h,String fileno,String date) throws SQLException, Exception {
	JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/hms", "com.mysql.jdbc.Driver","root","root");
	dataset.executeQuery("select '2' as columnname,`2am` as value from hourchart2 where fileno = '"+fileno+"' and date='"+date+"' and tabid = 'Temperature' union all select '6' as columnname,`6am` as value from hourchart2 where fileno = '"+fileno+"' and date='"+date+"' and tabid = 'Temperature' union all select '10' as columnname,`10am` as value from hourchart2 where fileno = '"+fileno+"' and date='"+date+"' and tabid = 'Temperature' union all select '14' as columnname,`2pm` as value from hourchart2 where fileno = '"+fileno+"' and date='"+date+"' and tabid = 'Temperature' union all select '18' as columnname,`6pm` as value  from hourchart2 where fileno = '"+fileno+"' and date='"+date+"' and tabid = 'Temperature' union all select '22' as columnname,`10pm` as value  from hourchart2 where fileno = '"+fileno+"' and date='"+date+"'and tabid = 'Temperature'");
	
	JFreeChart chart = ChartFactory .createLineChart("Health Report","Time", "Temperature °C",dataset, PlotOrientation.VERTICAL,true, true, false);
	
	CategoryPlot plot = chart.getCategoryPlot();
	LineAndShapeRenderer renderer = new LineAndShapeRenderer();
	renderer.setSeriesPaint(0, Color.RED);
	renderer.setSeriesStroke(0, new BasicStroke(4.0f));
	plot.setRenderer(renderer);
	plot.setBackgroundPaint(Color.CYAN);
	plot.setRangeGridlinesVisible(true);
	plot.setRangeGridlinePaint(Color.BLACK);
	 
	plot.setDomainGridlinesVisible(true);
	plot.setDomainGridlinePaint(Color.BLACK);
	
	
		ChartPanel chartPanel = new ChartPanel(chart);
		chartPanel.setPreferredSize(new java.awt.Dimension(300, 300));
		
		JFrame f = new JFrame("Chart");
		
		f.setContentPane(chartPanel);
		f.pack();
		f.setVisible(true);
		
}

public List<Hourchart> getChart2(Hourchart h,String fileno) {
	return template.query("select 2am as value,concat(date,' ','02:00')datetime from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 6am,concat(date,' ','06:00')datetime from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 10am,concat(date,' ','10:00')datetime from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 2pm,concat(date,' ','14:00')datetime from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 6pm,concat(date,' ','18:00')datetime from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 10pm,concat(date,' ','22:00')datetime from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' order by datetime",new RowMapper<Hourchart>(){
			 public Hourchart mapRow(ResultSet rs, int row) throws SQLException { 		
	Hourchart h = new Hourchart();
	h.setAmtgiv(rs.getString(1));
	h.setDate(rs.getString(2));
    
	return h;

    }
	});
	}
/*
public void getChart2(Hourchart h,String fileno) throws SQLException, Exception {
	System.out.println(fileno);
	JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/hms", "com.mysql.jdbc.Driver","root","root");
	dataset.executeQuery("select '2'as columnname,date from hourchart2 where fileno = 'Fileno-2'  and tabid = 'Temperature'");
	
	JFreeChart chart = ChartFactory .createLineChart("Health Report","Date","Temperature °C",dataset, PlotOrientation.VERTICAL,true, true, false);
	
	CategoryPlot plot = chart.getCategoryPlot();
	LineAndShapeRenderer renderer = new LineAndShapeRenderer();
	
	renderer.setSeriesPaint(0, Color.RED);
	renderer.setSeriesStroke(0, new BasicStroke(4.0f));
	
	plot.setRenderer(renderer);
	plot.setBackgroundPaint(Color.CYAN);
	plot.setRangeGridlinesVisible(true);
	plot.setRangeGridlinePaint(Color.BLACK);
	 
	plot.setDomainGridlinesVisible(true);
	plot.setDomainGridlinePaint(Color.BLACK);

	
		ChartPanel chartPanel = new ChartPanel(chart);
		chartPanel.setPreferredSize(new java.awt.Dimension(300, 300));
		
		JFrame f = new JFrame("Chart");
		
		f.setContentPane(chartPanel);
		f.pack();
		f.setVisible(true);
		
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
	    ChartUtilities.writeChartAsPNG(bos, chart, 500, 500);

	           
	           
	
		
}
/*
public List<Hourchart> getChart2(Hourchart h,String fileno) {
	return template.query("select 2am,6am,10am,2pm,6pm,10pm,date from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature'",new RowMapper<Hourchart>(){
			 public Hourchart mapRow(ResultSet rs, int row) throws SQLException { 		
	Hourchart h = new Hourchart();
	h.setAmtgiv(rs.getString(1));
	h.setAid1(rs.getString(2));
    h.setDoctord(rs.getString(3));
    h.setDoctrmks(rs.getString(4));
    h.setDoctsig(rs.getString(5));
    h.setOralamt(rs.getString(6));
    h.setDate(rs.getString(7));
	return h;

    }
	});
	}
	*/
/*
public void getChart2(Hourchart h,String fileno) throws SQLException, Exception {


	JDBCXYDataset dataset=new JDBCXYDataset("jdbc:mysql://localhost:3306/hms", "com.mysql.jdbc.Driver","root","root");
	String str1 = "select 2am,date from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature'";
	String str2 = "select 6am,date from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature'";
	String str3 = "select 10am,date from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature'";
	
	
	
	
	 dataset.executeQuery(str1);
	 
	 
	/* 
	 final XYSeries ser1 = new XYSeries("2am");
    final XYSeries ser2 = new XYSeries("6am");
	dataset.executeQuery(str2);
	
	final XYSeries ser3 = new XYSeries("10am");
    dataset.executeQuery(str3);
    
    final XYSeriesCollection  dataset1 = new  XYSeriesCollection( ); 
	dataset1.addSeries(ser1);
	dataset1.addSeries(ser2);
    dataset1.addSeries(ser3);

	//select 6am,date  from hourchart2 where fileno = '"+fileno+"' and  tabid = 'Temperature' union all select 10am,date from hourchart2 where fileno = '"+fileno+"' and  tabid = 'Temperature' union all select 2pm,date from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 6pm,date  from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 10pm,date from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature'
	
	
    
	
	JFreeChart xylineChart = ChartFactory .createXYLineChart("Health Report","Temperature °C", "Date",dataset, PlotOrientation.HORIZONTAL,true, true, false);
	
		ChartPanel chartPanel = new ChartPanel(xylineChart);
		chartPanel.setPreferredSize(new java.awt.Dimension(300, 300));
		ByteArrayOutputStream b = new ByteArrayOutputStream();
		final XYPlot plot = xylineChart.getXYPlot( );
		
		DateAxis dateAxis = new DateAxis("Date");
		dateAxis.setDateFormatOverride(new SimpleDateFormat("dd-MM-yyyy")); 
		plot.setRangeAxis(dateAxis);
		
		// sets plot background
		            plot.setBackgroundPaint(Color.CYAN);
					 
					// sets paint color for the grid lines
					plot.setRangeGridlinesVisible(true);
					plot.setRangeGridlinePaint(Color.BLACK);
					 
					plot.setDomainGridlinesVisible(true);
					plot.setDomainGridlinePaint(Color.BLACK);
	      
	      
	      XYLineAndShapeRenderer renderer = new XYLineAndShapeRenderer( );
	    
	      plot.setRenderer( renderer ); 
	     
		
		JFrame f = new JFrame("Chart");
		
		f.setContentPane(chartPanel);
		f.pack();
		f.setVisible(true);
			
}


/*
public void getChart2(Hourchart h) throws SQLException, Exception {

	JDBCXYDataset dataset=new JDBCXYDataset("jdbc:mysql://localhost:3306/hms", "com.mysql.jdbc.Driver","root","root");
	dataset.executeQuery("select 2am,DATE_FORMAT(STR_TO_DATE(date, '%Y-%m-%d'), '%Y-%m-%d') from hourchart2 where fileno = 'Fileno-2' and tabid='Temperature'");
	
	TimeSeriesCollection dataset1 = new TimeSeriesCollection();
	
	JFreeChart chart = ChartFactory.createTimeSeriesChart("Health Report","Temperature °C", "Date",dataset1, true, true, false);
			 
		
			XYPlot plot = chart.getXYPlot();
			
			 
			 
			DateAxis axis = (DateAxis) plot.getDomainAxis();
			axis.setDateFormatOverride(new SimpleDateFormat("dd-MMM-yyyy HH:mm"));
	 
			// sets plot background
			plot.setBackgroundPaint(Color.DARK_GRAY);
			 
			// sets paint color for the grid lines
			plot.setRangeGridlinesVisible(true);
			plot.setRangeGridlinePaint(Color.BLACK);
			 
			plot.setDomainGridlinesVisible(true);
			plot.setDomainGridlinePaint(Color.BLACK);
			
    


		ChartPanel chartPanel = new ChartPanel(chart);
		chartPanel.setPreferredSize(new java.awt.Dimension(300, 300));
		
		
	      
	      XYLineAndShapeRenderer renderer = new XYLineAndShapeRenderer( );
	      renderer.setSeriesPaint( 0 , Color.RED );
	    
	      renderer.setSeriesStroke( 0 , new BasicStroke( 4.0f ) );
	     
	      plot.setRenderer( renderer ); 
	     
		
		JFrame f = new JFrame("Chart");
		
		f.setContentPane(chartPanel);
		f.pack();
		f.setVisible(true);
		
}
*/

// file upload details
public int saveLabfile(Lab s) {
	// TODO Auto-generated method stub
	System.out.println(s.getDname());
	String sql = "insert into labupload(pid,fileno,docurl,date,dname,tresult,iop,samplecol) values('"+s.getPid()+"','"+s.getFileno()+"','"+s.getTestname()+"','"+s.getDate1()+"','"+s.getDname()+"','"+s.getTresult()+"','"+s.getIop()+"','"+s.getSamplecol()+"') on duplicate key update docurl = '"+s.getTestname()+"',dname='"+s.getDname()+"',tresult='"+s.getTresult()+"',iop ='"+s.getIop()+"',samplecol='"+s.getSamplecol()+"'";
	return template.update(sql);
}

public List<Lab> getLabupload() {
	return template.query("select l.pid,concat(p.fname,' ',p.mname,' ',p.lname)Patient,l.fileno,l.docurl,l.date,l.dname,l.tresult,l.iop,l.samplecol from labupload l join Patient p on l.pid = p.pid ",new RowMapper<Lab>(){
			 public Lab mapRow(ResultSet rs, int row) throws SQLException { 		
	Lab h = new Lab();
	h.setPid(rs.getString(1));
	h.setPname(rs.getString(2));
	h.setFileno(rs.getString(3));
	h.setTestname(rs.getString(4));
	h.setDate1(rs.getString(5));
	h.setDname(rs.getString(6));
	h.setTresult(rs.getString(7));
    h.setIop(rs.getString(8));
    h.setSamplecol(rs.getString(9));
	return h;

    }
	});
	}

public int cancelSub(String sub) {
	String sql = "delete from labconfig where rangev='"+sub+"'";
	return template.update(sql);
	
}

//appointments history
public List<Appointment> getAppointment(String fileno) {
	// TODO Auto-generated method stub
	return template.query("select ap.pid,concat(p.fname,' ',p.mname,' ',p.lname)patient,ap.docid,CONCAT(d.fname,' ',d.mname,' ',d.lname) doctor,CONCAT(ap.appointment,' ',ap.time),ap.fileno from appointment ap join patient p on p.pid = ap.pid join doctor d on d.docID = ap.docid where fileno ='"+fileno+"'order by appointment,time",new RowMapper<Appointment>(){  
     public Appointment mapRow(ResultSet rs, int row) throws SQLException {   
	       Appointment p = new Appointment();
	     
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setDocid(rs.getString(3));
	       p.setDname(rs.getString(4));
	       p.setAppointment(rs.getString(5));
	       p.setFileno(rs.getString(6));
	    
	  
	   return p;
     }
	});
}
//admission print
public List<Admitpat> getAdmitpat(String fileno) {
	// TODO Auto-generated method stub
	return template.query("select adm.pid,concat(p.fname,' ',p.mname,' ',p.lname) Patient,adm.docid,concat(d.fname,' ',d.mname,' ',d.lname) doctor,wardno,bedno,admitno,cause,admdate,adm.fileno from admitpat adm join patient p on p.pid = adm.pid join doctor d on adm.docid = d.docID where adm.fileno = '"+fileno+"'",new RowMapper<Admitpat>(){  
        public Admitpat mapRow(ResultSet rs, int row) throws SQLException {   
	       Admitpat p = new Admitpat();
	       
	       p.setPid(rs.getString(1));
	       p.setPname(rs.getString(2));
	       p.setDocid(rs.getString(3));
	       p.setDname(rs.getString(4));
	       p.setWardno(rs.getString(5));
	       p.setBedno(rs.getString(6));
	       p.setAdmitno(rs.getString(7));
           p.setCause(rs.getString(8));
           p.setAdmdate(rs.getString(9));
           p.setFileno(rs.getString(10));
	       return p;
        }
	});
}

}


	