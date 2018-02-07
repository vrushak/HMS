package HMS;



import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import com.mysql.cj.jdbc.PreparedStatement;

import java.sql.ResultSet;  
import java.sql.SQLException;

import org.apache.taglibs.standard.tag.common.core.NullAttributeException;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;  
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;  

import org.springframework.jdbc.core.RowMapper;  
import java.util.*;  

import HMS.Patient;



    
	
public class doctControllerDao {
	
	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	} 
	
	
	public int saveD(Doctor d){  
	    String sql="insert into doctor(docID,fname,mname,lname,dob,gender,doj,age,address1,city,state,country,pcode,ssn,landphone,mobile,email,prnum,qualification,specialization,shift,etype,department,designation,address2) values('"+d.getDocID()+"','"+d.getFname()+"','"+d.getMname()+"','"+d.getLname()+"','"+d.getDob()+"','"+d.getGender()+"','"+d.getDoj()+"','"+d.getAge()+"','"+d.getAddress1()+"','"+d.getCity()+"','"+d.getState()+"','"+d.getCountry()+"','"+d.getPcode()+"','"+d.getSsn()+"','"+d.getLandphone()+"','"+d.getMobile()+"','"+d.getEmail()+"','"+d.getPrnum()+"','"+d.getQualification()+"','"+d.getSpecialization()+"','"+d.getShift()+"','"+d.getEtype()+"','"+d.getDepartment()+"','"+d.getDesignation()+"','"+d.getAddress2()+"') on duplicate key update fname='"+d.getFname()+"',mname='"+d.getMname()+"',lname='"+d.getLname()+"',dob='"+d.getDob()+"',gender='"+d.getGender()+"',doj='"+d.getDoj()+"',age='"+d.getAge()+"',address1='"+d.getAddress1()+"',city='"+d.getCity()+"',state='"+d.getState()+"',country='"+d.getCountry()+"',ssn='"+d.getSsn()+"',pcode='"+d.getPcode()+"',ssn='"+d.getSsn()+"',landphone ='"+d.getLandphone()+"',mobile='"+d.getMobile()+"',email='"+d.getEmail()+"',prnum='"+d.getPrnum()+"',qualification='"+d.getQualification()+"',specialization='"+d.getSpecialization()+"',shift='"+d.getShift()+"',etype='"+d.getEtype()+"',department='"+d.getDepartment()+"',designation='"+d.getDesignation()+"',address2 = '"+d.getAddress2()+"'";  
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
			return template.query("select docID,fname,mname,lname,dob,gender,doj,age,address1,city,state,country,pcode,ssn,landphone,mobile,email,prnum,qualification,specialization,shift,etype,department,designation,CONCAT(fname,' ', mname,' ',lname),(select username from users where users.userid = doctor.docID ),(select password from users where users.userid = doctor.docID),address2 from doctor order by CAST(SUBSTRING_INDEX(docID,'-',-1) as decimal) desc;",new RowMapper<Doctor>(){  
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
			       p.setAddress2(rs.getString(28));
			   return p;
		        }
			});
		}
	
		
		public List<Prescription> getPrescription(String username,String userrole) {
			
			if(userrole.contains("[ROLE_DOCTOR]")){
			return template.query("select distinct pr1.pid,concat(pat.fname,' ',pat.mname,' ',pat.lname) patient,pr1.date,pr1.fileno,pr1.buttonval,pr1.tabid,pr1.textval,pr1.docid,concat(d.fname,' ',d.mname,' ',d.lname) from prescription1 pr1 join patient pat on pr1.pid = pat.pid join doctor d on pr1.docid = d.docID where pr1.docid in (select userid from userrole where username ='"+username+"') group by pr1.fileno order by CAST(SUBSTRING_INDEX(pr1.pid,'-',-1) as decimal) desc ",new RowMapper<Prescription>(){  
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
			
			else if(userrole.contains("[ROLE_ADMIN]")){
				
				return template.query("select distinct pr1.pid,concat(pat.fname,' ',pat.mname,' ',pat.lname) patient,pr1.date,pr1.fileno,pr1.buttonval,pr1.tabid,pr1.textval,pr1.docid,pr1.dname from prescription1 pr1 join patient pat on pr1.pid = pat.pid left outer join doctor d on pr1.docid = d.docID  group by pr1.fileno order by CAST(SUBSTRING_INDEX(pr1.pid,'-',-1) as decimal) desc ",new RowMapper<Prescription>(){  
			        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
				       Prescription p = new Prescription();
				       
				       System.out.println("Inside "+rs.getString(1) );
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
				return template.query("select distinct pr1.pid,concat(pat.fname,' ',pat.mname,' ',pat.lname) patient,pr1.date,pr1.fileno,pr1.buttonval,pr1.tabid,pr1.textval,pr1.docid,concat(d.fname,' ',d.mname,' ',d.lname) from prescription1 pr1 join patient pat on pr1.pid = pat.pid left outer join doctor d on pr1.docid = d.docID  group by pr1.fileno order by CAST(SUBSTRING_INDEX(pr1.pid,'-',-1) as decimal) desc ",new RowMapper<Prescription>(){  
			        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
				       Prescription p = new Prescription();
				       
				       System.out.println("Inside "+rs.getString(1) );
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
		public List<Prescription> getDocID2(String username,String userrole) {
			
			if(userrole.contains("[ROLE_DOCTOR]")){
				return template.query("select ap.docid,CONCAT(d.fname,' ', d.mname,' ',d.lname) Doctor,ap.pid,CONCAT(p.fname,' ', p.mname,' ',p.lname) Patient,CONCAT(ap.appointment,' ',ap.time),p.pofvisit,ap.fileno,ap.active,p.mobile from appointment ap join patient p on ap.pid=p.pid join doctor d on ap.docid = d.docID  where ap.docid in (select userid from userrole where username = '"+username+"')  and ap.active = 'on'",new RowMapper<Prescription>(){  
		        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
		        	
			       Prescription p = new Prescription();
			     
			      p.setDocid(rs.getString(1));
			      p.setDname(rs.getString(2));
			    
			      p.setPid(rs.getString(3));
			      p.setPname(rs.getString(4));
			      p.setAppointment(rs.getString(5));
			      p.setSpecialization(rs.getString(6));
			      p.setFileno(rs.getString(7));
			      p.setAc(rs.getString(8));
			      p.setIdc("");
			      p.setPas(rs.getString(9));
			      return p;
		        }
			});
			}
			else{
			
				return template.query("select ap.docid,CONCAT(d.fname,' ', d.mname,' ',d.lname) Doctor,ap.pid,CONCAT(p.fname,' ', p.mname,' ',p.lname) Patient,CONCAT(ap.appointment,' ',ap.time),p.pofvisit,ap.fileno,ap.active,p.mobile from appointment ap join patient p on ap.pid=p.pid join doctor d on ap.docid = d.docID where ap.active = 'on'",new RowMapper<Prescription>(){  
			        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
				       Prescription p = new Prescription();
				      
				      p.setDocid(rs.getString(1));
				      p.setDname(rs.getString(2));
				    
				   
				      p.setPid(rs.getString(3));
				      p.setPname(rs.getString(4));
				      p.setAppointment(rs.getString(5));
				      p.setSpecialization(rs.getString(6));
				      p.setFileno(rs.getString(7));
				      p.setAc(rs.getString(8));
				      p.setIdc("Admin");
				      p.setPas(rs.getString(9));
				      return p;
			        }
				});
			}
		}
		
public List<Prescription> getDocIDdiag(String username,String userrole,String cdiag) {
			
			if(userrole.contains("[ROLE_DOCTOR]")){
				return template.query("select ap.docid,CONCAT(d.fname,' ', d.mname,' ',d.lname) Doctor,ap.pid,CONCAT(p.fname,' ', p.mname,' ',p.lname) Patient,CONCAT(ap.appointment,' ',ap.time),p.pofvisit,ap.fileno from appointment ap join patient p on ap.pid=p.pid join doctor d on ap.docid = d.docID where ap.fileno not in (select fileno from "+cdiag+") and ap.docid in (select userid from userrole where username = '"+username+"')  and ap.active = 'on'",new RowMapper<Prescription>(){  
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
				System.out.println("inside else of docid");
				return template.query("select ap.docid,CONCAT(d.fname,' ', d.mname,' ',d.lname) Doctor,ap.pid,CONCAT(p.fname,' ', p.mname,' ',p.lname) Patient,CONCAT(ap.appointment,' ',ap.time),p.pofvisit,ap.fileno from appointment ap join patient p on ap.pid=p.pid join doctor d on ap.docid = d.docID where ap.fileno not in (select fileno from "+cdiag+") and ap.active = 'on'",new RowMapper<Prescription>(){  
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
				      System.out.println("getid" + p.getIdc());
				      return p;
			        }
				});
			}
		}
		
	// lab patients list for both inpatient as well as outpatient	
	public List<Prescription> getDocID3(String username,String userrole) {
			
			if(userrole.contains("[ROLE_DOCTOR]")){
				return template.query("select ap.docid,CONCAT(d.fname,' ', d.mname,' ',d.lname) Doctor,ap.pid,CONCAT(p.fname,' ', p.mname,' ',p.lname) Patient,CONCAT(ap.appointment,' ',ap.time),p.pofvisit,ap.fileno from appointment ap join patient p on ap.pid=p.pid join doctor d on ap.docid = d.docID left outer join admitpat ad on ap.fileno = ad.fileno  where ap.docid in (select userid from userrole where username = '"+username+"')",new RowMapper<Prescription>(){  
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
				System.out.println("inside else of docid");
				return template.query("select ap.docid,CONCAT(d.fname,' ', d.mname,' ',d.lname) Doctor,ap.pid,CONCAT(p.fname,' ', p.mname,' ',p.lname) Patient,CONCAT(ap.appointment,' ',ap.time),p.pofvisit,ap.fileno from appointment ap join patient p on ap.pid=p.pid join doctor d on ap.docid = d.docID left outer join admitpat ad on ap.fileno = ad.fileno;",new RowMapper<Prescription>(){  
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
				      System.out.println("getid" + p.getIdc());
				      return p;
			        }
				});
			}
		}

		//admit patient based on doctor advice
		public List<Prescription> getpreadm() {
			return template.query("select docid,dname,pid,pname,admit,date,fileno from prescription1 where admit='yes' and date not in (select admdate from admitpat where admitpat.pid = prescription1.pid )",new RowMapper<Prescription>(){  
		        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
			       Prescription p = new Prescription();
			       
			      
			       p.setDocid(rs.getString(1));
			       p.setDname(rs.getString(2));
			      
			       p.setPid(rs.getString(3));
			       p.setPname(rs.getString(4));
			     //  p.setSymptoms(rs.getString(5));
			      
		           p.setAdmit(rs.getString(6));
		           System.out.println(rs.getString(7));
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
		public int savePrs(Prescription p) {
			// TODO Auto-generated method stub
			
			String sql = "insert into prescription(docid,dname,pid,pname,admit,date,fileno,pc,pmsh,ph,dh,fh,ogh,psh,sge,scv,sres,sgas,smusc,sgenit,sendoc,sskin,scns,pge,poc,pns,pcv,prs,pas,pds,pir) values('"+p.getDocid()+"','"+p.getDname()+"','"+p.getPid()+"','"+p.getPname()+"','"+p.getAdmit()+"','"+p.getDate()+"','"+p.getFileno()+"','"+p.getPc()+"','"+p.getPmsh()+"','"+p.getPh()+"','"+p.getDh()+"','"+p.getFh()+"','"+p.getOgh()+"','"+p.getPsh()+"','"+p.getSge()+"','"+p.getScv()+"','"+p.getSres()+"','"+p.getSgas()+"','"+p.getSmusc()+"','"+p.getSgenit()+"','"+p.getSendoc()+"','"+p.getSskin()+"','"+p.getScns()+"','"+p.getPge()+"','"+p.getPoc()+"','"+p.getPns()+"','"+p.getPcv()+"','"+p.getPrs()+"','"+p.getPas()+"','"+p.getPds()+"','"+p.getPir()+"')";
			return template.update(sql);
		}

		public int saveact(Prescription p) {
			// TODO Auto-generated method stub
			
			String sql = "update appointment set active ='off' where pid = '"+p.getPid()+"' and appointment = '"+p.getDate()+"' ";
			return template.update(sql);
		}
		public int saveTre(Treatment p,String date,String dname,String comments) {
			System.out.println(p.getDname());
			// TODO Auto-generated method stub
			String sql = "insert into treatment(pname,pid,admdate,datetime,dailychart,dname,comments,admitno,fileno) values('"+p.getPname()+"','"+p.getPid()+"','"+p.getAdmdate()+"','"+date+"','"+p.getDailychart()+"','"+dname+"','"+comments+"','"+p.getAdmitno()+"','"+p.getFileno()+"') on duplicate key update datetime='"+date+"',dailychart='"+p.getDailychart()+"',dname='"+dname+"',comments='"+comments+"',ncomments='"+p.getNcomments()+"'";
			return template.update(sql);
		}

		public List<Treatment> getTreatment(Treatment p) {
			System.out.println("pn" +p.getAdmitno());
			return template.query("select concat(p.fname,' ',p.mname,' ',p.lname) patient,t.pid,adm.admdate,datetime,dailychart,t.dname,comments,ncomments,t.admitno,t.fileno from treatment t join patient p on p.pid = t.pid join admitpat adm on adm.admitno = t.admitno where t.admitno='"+p.getAdmitno()+"' ",new RowMapper<Treatment>(){  
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
		public int saved(Discharge s) {
			// TODO Auto-generated method stub
			
			String sql = "insert into discharge(pid,pname,dname,docid,admdate,disdate,treatment,dissum,investigation,management,fileno,admitno) values('"+s.getPid()+"','"+s.getPname()+"', '"+s.getDname()+"','"+s.getDocid()+"','"+s.getAdmdate()+"','"+s.getDisdate()+"','"+s.getTreatment()+"','"+s.getDissum()+"','"+s.getInvestigation()+"','"+s.getManagement()+"','"+s.getFileno()+"','"+s.getAdmitno()+"') on duplicate key update disdate ='"+s.getDisdate()+"',treatment ='"+s.getTreatment()+"',dissum='"+s.getDissum()+"',investigation='"+s.getInvestigation()+"',management='"+s.getManagement()+"' ";
			return template.update(sql);
		}

		public List<Discharge> getDischarge() {
			return template.query("select ds.pid,concat(pat.fname,' ',pat.mname,' ',pat.lname) Patient,pat.age,pat.gender,concat(d.fname,' ',d.mname,' ',d.lname) Doctor,ds.docid,adm.admdate,ds.disdate,ds.investigation,ds.fileno,ds.admitno,concat(adm.wardno,'/',adm.bedno) from discharge ds join patient pat on ds.pid = pat.pid join doctor d on ds.docid = d.docID join admitpat adm on ds.fileno = adm.fileno order by CAST(SUBSTRING_INDEX(ds.fileno,'-',-1) as decimal) desc",new RowMapper<Discharge>(){  
		        public Discharge mapRow(ResultSet rs, int row) throws SQLException {   
			       Discharge p = new Discharge();
			       p.setPid(rs.getString(1));
			       p.setPname(rs.getString(2));
			       p.setAge(rs.getString(3));
			       p.setGender(rs.getString(4));
			       p.setDname(rs.getString(5));
			       p.setDocid(rs.getString(6));
			       p.setAdmdate(rs.getString(7));
			       p.setDisdate(rs.getString(8));
			      
			       p.setInvestigation(rs.getString(9));
			   
			       p.setFileno(rs.getString(10));
			       p.setAdmitno(rs.getString(11));
			       p.setWardno(rs.getString(12));
			      
			       return p;
		        }
			});
		}
		
		
		//load discharge slip contents
		public List<Dslip> getDslip() {
			return template.query("select ds.pid,concat(pat.fname,' ',pat.mname,' ',pat.lname) Patient,pat.age,pat.gender,concat(d.fname,' ',d.mname,' ',d.lname) Doctor,ds.docid,adm.admdate,ds.disdate,ds.treatment,ds.dissum,ds.investigation,ds.management,ds.fileno,ds.admitno,ds.ec,ds.revisit,ds.amno,concat(adm.wardno,'/',adm.bedno) from dslip ds join patient pat on ds.pid = pat.pid join doctor d on ds.docid = d.docID join admitpat adm on ds.fileno = adm.fileno order by CAST(SUBSTRING_INDEX(ds.pid,'-',-1) as decimal) desc",new RowMapper<Dslip>(){  
		        public Dslip mapRow(ResultSet rs, int row) throws SQLException {   
			       Dslip p = new Dslip();
			       p.setPid(rs.getString(1));
			       p.setPname(rs.getString(2));
			       p.setAge(rs.getString(3));
			       p.setGender(rs.getString(4));
			       p.setDname(rs.getString(5));
			       p.setDocid(rs.getString(6));
			       p.setAdmdate(rs.getString(7));
			       p.setDisdate(rs.getString(8));
			       p.setTreatment(rs.getString(9));
			       p.setDissum(rs.getString(10));
			       p.setInvestigation(rs.getString(11));
			       p.setManagement(rs.getString(12));
			       p.setFileno(rs.getString(13));
			       p.setAdmitno(rs.getString(14));
			       p.setEc(rs.getString(15));
			       p.setRevisit(rs.getString(16));
			       p.setAmno(rs.getString(17));
			       p.setWardno(rs.getString(18));
			       return p;
		        }
			});
		}
		
		public int saveds(Dslip s) {
			// TODO Auto-generated method stub
			System.out.println("indc" +s.getDocid());
			String sql = "insert into dslip(pid,docid,disdate,treatment,dissum,investigation,management,fileno,admitno,revisit,ec,amno) values(?,?,?,?,?,?,?,?,?,?,?,?) on duplicate key update disdate =values(disdate),treatment =values(treatment),dissum=values(dissum),investigation=values(investigation),management=values(management),revisit=values(revisit),ec=values(ec),amno=values(amno)";
			  return template.update(sql, new Object[] {s.getPid(),s.getDocid(),s.getDisdate(),s.getTreatment(),s.getDissum(),s.getInvestigation(),s.getManagement(),s.getFileno(),s.getAdmitno(),s.getRevisit(),s.getEc(),s.getAmno()}); 

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
			
			return template.query("select name from erpho.product",new RowMapper<Prescription>(){  
		        public Prescription mapRow(ResultSet rs, int row) throws SQLException {  
		            Prescription s=new Prescription();  
		           System.out.println(rs.getString(1));
		            s.setDrugn(rs.getString(1));
		       return s;
			
		}
			 }); 
		}
		public List<Prescription> getPrescription3(String docid) {
			
			System.out.println(docid);
			return template.query("select pr3.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,date,fileno,buttonval,tabid,textval,docid,dname,admit from prescription1 pr3 join patient p on pr3.pid = p.pid where pr3.fileno ='"+docid+"'",new RowMapper<Prescription>(){  
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
			       * return template.query("select pid,pname,date,fileno,buttonval,tabid,textval,docid,dname,admit from prescription1 where fileno ='"+docid+"'",new RowMapper<Prescription>(){  
		     
			   return template.query("select    docid,dname,(SELECT  specialization from doctor where doctor.docID = '"+docid+"'),pid,pname,pc,pmsh,ph,dh,fh,ogh,psh,sge,scv,sres,sgas,smusc,sgenit,sendoc,sskin,scns,pge,poc,pns,pcv,prs,pas,pds,pir,admit,date,fileno from prescription where fileno = '"+docid+"'
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
/*
			public int savePrs1(Diagnose p, String var1, String var1a, String var1b, String var1c, /*String var1d, String var1e,  String var1g, String var1h, String var1i, String var1j,String dosage) {
				// TODO Auto-generated method stub
				String sql = "insert into prescriptiontab(pid,pname,fileno,typeofdr,drugname,strdrug,dm,baf,totn,nofdays,dosage,advice) values('"+p.getPpid()+"','"+p.getPname()+"','"+p.getFileno()+"','"+var1+"','"+var1a+"','"+var1b+"','"+var1c+"','"+var1h+"','"+var1i+"','"+var1j+"','"+dosage+"','"+p.getAdvice()+"')on duplicate key update typeofdr='"+var1+"',drugname='"+var1a+"',strdrug='"+var1b+"',dm='"+var1c+"',baf='"+var1h+"',totn='"+var1i+"',nofdays='"+var1j+"',dosage='"+dosage+"',advice = '"+p.getAdvice()+"'";
				return template.update(sql);
			}
			*/
	
	public int savePrs1(Diagnose p, String var1, String var1a, String var1b, String var1c, /*String var1d, String var1e,  String var1g,*/ String var1h, String var1i, String var1j,String dosage) {
				// TODO Auto-generated method stub
				   String sql="insert into prescriptiontab(pid,pname,fileno,typeofdr,drugname,strdrug,dm,baf,totn,nofdays,dosage,advice) values(?,?,?,?,?,?,?,?,?,?,?,?) on duplicate key update typeofdr=values(typeofdr),drugname=values(drugname),strdrug=values(strdrug),dm=values(dm),baf=values(baf),totn=values(totn),nofdays=values(nofdays),dosage=values(dosage),advice = values(advice)";  
				   return template.update(sql, new Object[] {p.getPpid(),p.getPname(),p.getFileno(),var1,var1a,var1b,var1c,var1h,var1i,var1j,dosage,p.getAdvice()}); 
					
				} 
			
			public List<Prescription> getPrescriptionTab(String docid) {
				// TODO Auto-generated method stub
				return template.query("select pt.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,pt.fileno,typeofdr,drugname,strdrug,dm,da,de,dn,baf,totn,nofdays,dosage,advice from prescriptiontab pt join patient p on pt.pid = p.pid where pt.fileno = '"+docid+"' and typeofdr not like 'null' and drugname not like 'null' and strdrug not like 'null' and totn not like 'null' and nofdays  not like 'null' and dosage not like 'null'",new RowMapper<Prescription>(){  
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
				       p.setDosage(rs.getString(14));
				       p.setAdvice(rs.getString(15));
				       return p;
			        }
				});
				
			}
			public int savePrs2(Prescription p,String string, String string2, String string3) {
				// TODO Auto-generated method stub
				String sql = "insert into prescription1(pid,pname,date,fileno,buttonval,tabid,textval,docid,dname,admit) values('"+p.getPid()+"','"+p.getPname()+"','"+p.getDate()+"','"+p.getFileno()+"','"+string+"','"+string2+"','"+string3+"','"+p.getDocid()+"','"+p.getDname()+"','"+p.getAdmit()+"') on duplicate key update pid='"+p.getPid()+"',pname='"+p.getPname()+"',tabid='"+string2+"',textval='"+string3+"',docid='"+p.getDocid()+"',dname='"+p.getDname()+"',admit='"+p.getAdmit()+"' "; 
				return template.update(sql);	
			}
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


			public List<Admitpat> getAdmitpat1(String id,String role) {
				// TODO Auto-generated method stub
			
				//docid in (select  userid from userrole where username='"+id+"' ) and
				if(role.contains("[ROLE_DOCTOR]")){
			return template.query("select distinct a.pid,concat(pat.fname,' ',pat.mname,' ',pat.lname) Patient,a.docid,concat(d.fname,' ',d.mname,' ',d.lname) Doctor,a.admdate,a.fileno,a.admitno,CONCAT(wardno,'/',bedno),a.cause,pat.age,pat.gender from admitpat a join appointment ap on  a.fileno = ap.fileno join doctor d on a.docid = d.docID join discharge dc join patient pat on a.pid = pat.pid where a.fileno not in (select fileno from discharge) or a.fileno not in (select fileno from dslip)",new RowMapper<Admitpat>(){  
					        public Admitpat mapRow(ResultSet rs, int row) throws SQLException {   
						       Admitpat p = new Admitpat();
						       System.out.println("inside admitno1");
						       p.setPid(rs.getString(1));
						       p.setPname(rs.getString(2));
						       p.setDocid(rs.getString(3));
					           p.setDname(rs.getString(4));
						       p.setAdmdate(rs.getString(5));
					           p.setFileno(rs.getString(6));
					           p.setAdmitno(rs.getString(7));
					           p.setWardno(rs.getString(8));
					           p.setCause(rs.getString(9));
					           p.setAge(rs.getString(10));
					           p.setGender(rs.getString(11));
					       //    p.setIdc(rs.getString(3));
						       return p;
						       
				}
				});
			}
				else{   
					 
				        	return template.query("select distinct a.pid,concat(pat.fname,' ',pat.mname,' ',pat.lname) Patient,a.docid,concat(d.fname,' ',d.mname,' ',d.lname) Doctor,a.admdate,a.fileno,a.admitno,CONCAT(wardno,'/',bedno),a.cause,pat.age,pat.gender from admitpat a join appointment ap on  a.fileno = ap.fileno join doctor d on a.docid = d.docID join discharge dc join patient pat on a.pid = pat.pid where a.fileno not in (select fileno from discharge) or a.fileno not in (select fileno from dslip)",new RowMapper<Admitpat>(){  
						        public Admitpat mapRow(ResultSet rs, int row) throws SQLException {   
							       Admitpat p = new Admitpat();
							       
							       p.setPid(rs.getString(1));
							       p.setPname(rs.getString(2));
							       p.setDocid(rs.getString(3));
						           p.setDname(rs.getString(4));
							       p.setAdmdate(rs.getString(5));
						           p.setFileno(rs.getString(6));
						           p.setAdmitno(rs.getString(7));
						           p.setWardno(rs.getString(8));
						           p.setCause(rs.getString(9));
						           p.setAge(rs.getString(10));
						           p.setGender(rs.getString(11));
						       //    p.setIdc(rs.getString(3));
							       return p;
							       
						    	}
							});
						}
				
}


			public List<Appointment> getAppointment1() {
				// TODO Auto-generated method stub ap.docid='"+user+"' and 
				
				return template.query("select ap.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,ap.docid,CONCAT(d.fname,' ', d.mname,' ',d.lname) doctor,ap.appointment,ap.time,CONCAT(ap.appointment,' ',ap.time),ap.fileno from appointment ap join patient p on ap.pid = p.pid join doctor d on ap.docid = d.docID order by ap.appointment desc",new RowMapper<Appointment>(){  
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
				   return p;
			        }
				});
			}
			public List<Prescription> getDocID3(String user) {
			return template.query("select distinct pr.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,pr.fileno,concat(d.fname,' ',d.mname,' ',d.lname) doctor,p.age,prd.pds from diagnose pr join patient p on p.pid=pr.pid left outer join doctor d on d.docID = pr.docid join prescription prd on prd.fileno = pr.fileno  where pr.docid in (select userid from users where username = '"+user+"') and pr.fileno in (select fileno from prescriptiontab) ",new RowMapper<Prescription>(){  
		        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
			       Prescription p = new Prescription();
			       p.setPid(rs.getString(1));
			       p.setPname(rs.getString(2));
			       p.setFileno(rs.getString(3));
			       p.setDname(rs.getString(4));
			      
			       p.setAppointment(rs.getString(5));
			       p.setPds(rs.getString(6));
			       return p;
		        }

			});
			
			}
			// for frontdesk and others
			public List<Prescription> getDocID3() {
				return template.query("select distinct pr.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,pr.fileno,pr.docid,concat(d.fname,' ',d.mname,' ',d.lname) doctor,p.age,prd.pds from diagnose pr join patient p on p.pid=pr.pid left outer join doctor d on d.docID = pr.docid join prescription prd on prd.fileno = pr.fileno and pr.fileno in (select fileno from prescriptiontab)",new RowMapper<Prescription>(){  
			        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
				       Prescription p = new Prescription();
				       p.setPid(rs.getString(1));
				       p.setPname(rs.getString(2));
				       p.setFileno(rs.getString(3));
				     
				      if(rs.getString(4).contains("dbadmin1")){
				    	  p.setDname("dbadmin1");  
				      }
				      else{
				       p.setDname(rs.getString(5));
				      }
				       p.setAppointment(rs.getString(6));
				       p.setPds(rs.getString(7));
				       return p;
			        }

				});
				
				}

			public List<Diagnose> getDoccID3(String user) {
				return template.query("select distinct pr.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,pr.fileno,concat(d.fname,' ',d.mname,' ',d.lname) doctor,p.age,prd.pds from cdiagnose pr join patient p on p.pid=pr.pid left outer join doctor d on d.docID = pr.docid join prescription prd on prd.fileno = pr.fileno  where pr.docid in (select userid from users where username = '"+user+"') and pr.fileno in (select fileno from prescriptiontab) ",new RowMapper<Diagnose>(){  
			        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
				       Diagnose p = new Diagnose();
				       p.setPpid(rs.getString(1));
				       p.setPname(rs.getString(2));
				       p.setFileno(rs.getString(3));
				       p.setDname(rs.getString(4));
				
				       p.setDatetime(rs.getString(5));
				       p.setPds(rs.getString(6));
				       return p;
			        }

				});
				
				}
				// for frontdesk and others
				public List<Diagnose> getDoccID3() {
					return template.query("select distinct pr.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,pr.fileno,pr.docid,concat(d.fname,' ',d.mname,' ',d.lname) doctor,p.age,prd.pds from cdiagnose pr join patient p on p.pid=pr.pid left outer join doctor d on d.docID = pr.docid join prescription prd on prd.fileno = pr.fileno and pr.fileno in (select fileno from prescriptiontab)",new RowMapper<Diagnose>(){  
				        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
					       Diagnose p = new Diagnose();
					       p.setPpid(rs.getString(1));
					       p.setPname(rs.getString(2));
					       p.setFileno(rs.getString(3));
					     
					      if(rs.getString(4).contains("dbadmin1")){
					    	  p.setDname("dbadmin1");  
					      }
					      else{
					       p.setDname(rs.getString(5));
					      }
					       p.setDatetime(rs.getString(6));
					       p.setPds(rs.getString(7));
					       return p;
				        }

					});
					
					}

			
			
			public List<Prescription> getPrescription2(String docid) {
				// TODO Auto-generated method stub
				  return template.query("select pr2.docid,concat(d.fname,' ',d.mname,' ',d.lname) doctor,d.specialization,pr2.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,pc,pmsh,ph,dh,fh,ogh,psh,sge,scv,sres,sgas,smusc,sgenit,sendoc,sskin,scns,pge,poc,pns,pcv,prs,pas,pds,pir,admit,date,pr2.fileno from prescription pr2 left outer join doctor d on d.docID = pr2.docid join patient p on pr2.pid = p.pid where pr2.fileno = '"+docid+"'",new RowMapper<Prescription>(){  
					  public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
					       Prescription p = new Prescription();
    
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
					       
					      
				        }
					});
					
					
					
					
				
			}


			public List<Prescription> getPrescriptionnew() {
				// TODO Auto-generated method stub
				return template.query("select distinct buttonval,tabid from prescription4",new RowMapper<Prescription>(){  
			        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
				       Prescription p = new Prescription();
				        p.setButtonl(rs.getString(1));
				       p.setTabid(rs.getString(2));
				    
				       return p;
			        }
				});
				}


			public int savePrs5(String string, String string2) {
				// TODO Auto-generated method stub
				String sql = "insert ignore into prescription4(buttonval,tabid) values('"+string+"','"+string2+"')";
				return template.update(sql);
			}
			
			
			
			public List<Admitpat> getAdmitpat1() {
				// TODO Auto-generated method stub
				return template.query("select adm.pid,concat(p.fname,' ',p.mname,' ',p.lname) Patient,adm.docid,concat(d.fname,' ',d.mname,' ',d.lname) doctor,admitno,adm.fileno,p.age,adm.admdate,adm.cause from admitpat adm join patient p on p.pid = adm.pid join doctor d on adm.docid = d.docID",new RowMapper<Admitpat>(){  
			        public Admitpat mapRow(ResultSet rs, int row) throws SQLException {   
				       Admitpat p = new Admitpat();
				       
				       p.setPid(rs.getString(1));
				       p.setPname(rs.getString(2));
				       p.setDocid(rs.getString(3));
				       p.setDname(rs.getString(4));
				       p.setAdmitno(rs.getString(5));
				       p.setFileno(rs.getString(6));
				       p.setAge(rs.getString(7));
				       p.setAdmdate(rs.getString(8));
				       p.setCause(rs.getString(9));
				       return p;
			        }
				});
			}
			
			public List<Prescription2> getPrescriptionTab2(String docid) {
				// TODO Auto-generated method stub
				return template.query("select pt.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,pt.fileno,typeofdr,drugname,strdrug,dm,da,de,dn,baf,totn,nofdays,pt.admitno,pt.docid,concat(d.fname,' ',d.mname,' ',d.lname) doctor,pt.edate,pt.diagnosed,pt.dosage from ipdprescription pt join patient p on pt.pid = p.pid left outer join doctor d on d.docID = pt.docid where pt.fileno = '"+docid+"'",new RowMapper<Prescription2>(){  
			        public Prescription2 mapRow(ResultSet rs, int row) throws SQLException {   
				       Prescription2 p = new Prescription2();
				       
				       
				      
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
				       p.setAdmitno(rs.getString(14));
				       p.setDocid(rs.getString(15));
				       if(rs.getString(15).contains("dbadmin1")){
				    	   p.setDname("dbadmin1");
				       }
				       else{
				    	   p.setDname(rs.getString(16));
				       }
				    
				       p.setDate(rs.getString(17));
				       p.setDiagnosed(rs.getString(18));
				       p.setDosage(rs.getString(19));
				       return p;
			        }
				});
				
			}
			
			public int savePrs2(Prescription2 p, String var1, String var1a, String var1b, String var1c, String var1h, String var1i, String var1j,String dosage) {
				// TODO Auto-generated method stub
				
				System.out.println(p.getDocid());
				
				String sql = "insert into ipdprescription(pid,docid,fileno,typeofdr,drugname,strdrug,dm,baf,totn,nofdays,admitno,edate,diagnosed,dosage) values('"+p.getPid()+"','"+p.getDocid()+"','"+p.getFileno()+"','"+var1+"','"+var1a+"','"+var1b+"','"+var1c+"','"+var1h+"','"+var1i+"','"+var1j+"','"+p.getAdmitno()+"','"+p.getDate()+"','"+p.getDiagnosed()+"','"+dosage+"')on duplicate key update docid='"+p.getDocid()+"',typeofdr='"+var1+"',drugname='"+var1a+"',strdrug='"+var1b+"',dm='"+var1c+"',baf='"+var1h+"',totn='"+var1i+"',nofdays='"+var1j+"',edate='"+p.getDate()+"',diagnosed = '"+p.getDiagnosed()+"',dosage = '"+dosage+"'";
				return template.update(sql);
			}


			public List<Prescription> getFilenos(String id) {
				// TODO Auto-generated method stub
				return template.query("select distinct pr.fileno,pr.date from prescription pr where pr.pid ='"+id+"' order by CAST(SUBSTRING_INDEX(pr.date,'-',-1) as decimal)",new RowMapper<Prescription>(){  
			        public Prescription mapRow(ResultSet rs, int row) throws SQLException {   
				       Prescription p = new Prescription();
				       
				      
				       p.setFileno(rs.getString(1));
				       p.setDate(rs.getString(2));
				     
				       return p;
			        }
				});
			}
			
			public int saveS(Sick s){  
			    String sql="insert into sicknote(pname,sdate,work,other,reason,dates,dat,pn,fin,docid ) values('"+s.getPname()+"','"+s.getSdate()+"','"+s.getWork()+"','"+s.getOther()+"','"+s.getReason()+"','"+s.getDates()+"','"+s.getDat()+"','"+s.getPn()+"','"+s.getFin()+"','"+s.getDocid()+"') on duplicate key update pname='"+s.getPname()+"',sdate='"+s.getSdate()+"',work='"+s.getWork()+"',other='"+s.getOther()+"',reason='"+s.getReason()+"',dates='"+s.getDates()+"',dat='"+s.getDat()+"',pn='"+s.getPn()+"',fin='"+s.getFin()+"',docid='"+s.getDocid()+"'";  
			    return template.update(sql);  
			}  				
			public List<Appointment> getappointment1() {
				// TODO Auto-generated method stub
				return template.query("select concat(pat.fname,' ',pat.mname,' ',pat.lname)pname,fileno,pat.pid,a.docid,concat(d.fname,' ',d.mname,' ',d.lname)doctor from appointment a join patient pat on a.pid = pat.pid join doctor d on d.docID = a.docid",new RowMapper<Appointment>(){  
			        public Appointment mapRow(ResultSet rs, int row) throws SQLException {   
			        	Appointment a = new Appointment();
				       a.setPname(rs.getString(1));
				       a.setFileno(rs.getString(2));
				       a.setPid(rs.getString(3));
				       a.setDocid(rs.getString(4));
				       a.setDname(rs.getString(5));
				   return a;
			        }
				});
			}
			public List<Sick> getsick() {
				// TODO Auto-generated method stub
				return template.query("select concat(d.fname,' ',d.mname,' ',d.lname) pname,sdate,work,other,reason,dates,dat,concat(pat.fname,' ',pat.mname,' ',pat.lname) patient,fin,pn,s.docid from sicknote s join patient pat on pat.pid = s.pn join doctor d on d.docID=s.docid;",new RowMapper<Sick>(){  
			        public Sick mapRow(ResultSet rs, int row) throws SQLException {   
			        	Sick s = new Sick();
				      s.setPname(rs.getString(1));
				      s.setSdate(rs.getString(2));
				      s.setWork(rs.getString(3));
				      s.setOther(rs.getString(4));
				      s.setReason(rs.getString(5));
				      s.setDates(rs.getString(6));
				      s.setDat(rs.getString(7));
				       s.setPatient(rs.getString(8));
	                   s.setFin(rs.getString(9));
	                   s.setPn(rs.getString(10));
	                   s.setDocid(rs.getString(11));
				       
				   return s;
			        }
				});
			}
					
			public int saveR(Referral r){  
			    String sql="insert into referral(redate,pname,treat,diagnosis,caseh,remarks,dname,sign,pid,fn,docid) values('"+r.getRedate()+"','"+r.getPname()+"','"+r.getTreat()+"','"+r.getDiagnosis()+"','"+r.getCaseh()+"','"+r.getRemarks()+"','"+r.getDname()+"','"+r.getSign()+"','"+r.getPid()+"','"+r.getFn()+"','"+r.getDocid()+"') on duplicate key update redate='"+r.getRedate()+"',pname='"+r.getPname()+"',treat='"+r.getTreat()+"',diagnosis='"+r.getDiagnosis()+"',caseh='"+r.getCaseh()+"',remarks='"+r.getRemarks()+"',dname='"+r.getDname()+"',sign='"+r.getSign()+"',pid='"+r.getPid()+"',fn='"+r.getFn()+"',docid='"+r.getDocid()+"'";  
			    return template.update(sql);  
			}  				
			public List<Appointment> getappointment() {
				// TODO Auto-generated method stub
				return template.query("select concat(pat.fname,' ',pat.mname,' ',pat.lname)pname,fileno,pat.pid,a.docid,concat(d.fname,' ',d.mname,' ',d.lname)doctor from appointment a join patient pat on a.pid = pat.pid join doctor d on d.docID = a.docid",new RowMapper<Appointment>(){  
			        public Appointment mapRow(ResultSet rs, int row) throws SQLException {   
			        	Appointment a = new Appointment();
				      a.setPname(rs.getString(1));
	                   a.setFileno(rs.getString(2));
	                   a.setPid(rs.getString(3));
	                   a.setDocid(rs.getString(4));
				       a.setDname(rs.getString(5));
				       
				   return a;
			        }
				});
			}
			public List<Referral> getreferral() {
				
				// TODO Auto-generated method stub
				
				return template.query("select redate,pname,treat,diagnosis,caseh,remarks,concat(d.fname,' ',d.mname,' ',d.lname)dname,sign,concat(pat.fname,' ',pat.mname,' ',pat.lname) patient,fn,r.pid,r.docid from referral r join patient pat on pat.pid = r.pid join doctor d on d.docID=r.docid;",new RowMapper<Referral>(){  
			        public Referral mapRow(ResultSet rs, int row) throws SQLException {   
			        	Referral r = new Referral();
			        
				      r.setRedate(rs.getString(1));
				      r.setPname(rs.getString(2));
				      r.setTreat(rs.getString(3));
				      r.setDiagnosis(rs.getString(4));
				      r.setCaseh(rs.getString(5));
				      r.setRemarks(rs.getString(6));
				      r.setDname(rs.getString(7));
				      r.setSign(rs.getString(8));
				      r.setPatient(rs.getString(9));
	                   r.setFn(rs.getString(10));
	                   r.setPid(rs.getString(11));
	                   r.setDocid(rs.getString(12));
				   
				   return r;
			        }
				});
			}
			public int saveG(glasgowcoma g) {
				   String sql="insert into glasgowcoma(pid,fileno,admitno,date,spontaneous,response,obey,total) values('"+g.getPid()+"','"+g.getFileno()+"','"+g.getAdmitno()+"','"+g.getDate()+"','"+g.getOpener()+"','"+g.getVerbal()+"','"+g.getMotor()+"','"+g.getTotal()+"') on duplicate key update date='"+g.getDate()+"',spontaneous='"+g.getOpener()+"',response='"+g.getVerbal()+"',obey='"+g.getMotor()+"',total='"+g.getTotal()+"'";  
				    return template.update(sql);  
				    
				}  				
			public List<Admitpat> getAdmitpat() {
					// TODO Auto-generated method stub
					return template.query("select concat(pat.fname,' ',pat.mname,' ',pat.lname) pname,a.pid,fileno,admdate,concat(wardno,' ',bedno) wardno from admitpat a join patient pat on a.pid = pat.pid",new RowMapper<Admitpat>(){  
				        public Admitpat mapRow(ResultSet rs, int row) throws SQLException {   
				        	Admitpat a= new Admitpat();
					       a.setPname(rs.getString(1));
					       a.setPid(rs.getString(2));
					       a.setFileno(rs.getString(3));
					       a.setAdmdate(rs.getString(4));
					       a.setWardno(rs.getString(5));
					       
					       
					   return a;
				        }
					});
				}
			public List<Patient> getPatient() {
				// TODO Auto-generated method stub
				return template.query("select regdate from patient",new RowMapper<Patient>(){  
			        public Patient mapRow(ResultSet rs, int row) throws SQLException {   
			        	Patient p= new Patient();
				       p.setRegdate(rs.getString(1));
				       
				   return p;
			        }
				});
			}
			public int saveB(blantyrecoma b) {
				   String sql="insert into blantyrecoma(pid,fileno,admitno,date,localize,cry,dir,total) values('"+b.getPid()+"','"+b.getFileno()+"','"+b.getAdmitno()+"','"+b.getDate()+"','"+b.getBestmotor()+"','"+b.getResponse()+"','"+b.getMovement()+"','"+b.getTotal()+"') on duplicate key update  date='"+b.getDate()+"',localize='"+b.getBestmotor()+"',cry='"+b.getResponse()+"',dir='"+b.getMovement()+"',total='"+b.getTotal()+"'";  
				    return template.update(sql);  
				} 
			public List<Admitpat> getAdmitpat11() {
				// TODO Auto-generated method stub
				return template.query("select concat(pat.fname,' ',pat.mname,' ',pat.lname) pname,a.pid,fileno,admdate,concat(wardno,' ',bedno) wardno from admitpat a join patient pat on a.pid = pat.pid",new RowMapper<Admitpat>(){  
			        public Admitpat mapRow(ResultSet rs, int row) throws SQLException {   
			        	Admitpat a= new Admitpat();
				       a.setPname(rs.getString(1));
				       a.setPid(rs.getString(2));
				       a.setFileno(rs.getString(3));
				       a.setAdmdate(rs.getString(4));
				       a.setWardno(rs.getString(5));
				       
				   return a;
			        }
				});
			}
			public List<Patient> getPatient1() {
				// TODO Auto-generated method stub
				return template.query("select regdate from patient",new RowMapper<Patient>(){  
			        public Patient mapRow(ResultSet rs, int row) throws SQLException {   
			        	Patient p= new Patient();
				       p.setRegdate(rs.getString(1));
				       
				   return p;
			        }
				});
			}
			
			public List<glasgowcoma> getPatientdet1(String fileno) {
				// TODO Auto-generated method stub
				   
				return template.query("select g.pid,g.fileno,g.admitno,g.date from glasgowcoma where g.admitno='"+fileno+"'",new RowMapper<glasgowcoma>(){  
			        public glasgowcoma mapRow(ResultSet rs, int row) throws SQLException {   
				       glasgowcoma i = new glasgowcoma();
				       i.setPid(rs.getString(1));
				       i.setFileno(rs.getString(2));
				       i.setAdmitno(rs.getString(3));
				       i.setDate(rs.getString(4));
				       
				      
				       
				       return i;
			        }
				});
			}

			public List<glasgowcoma> getPatientdet2(String admitno, String id) {
				// TODO Auto-generated method stub
				   
				return template.query("select time,type,amount,typecommence,amtgiv,urine,vomitus,remarks,admitno,doctord,doctsig,ratef,dremarks,date,aid from iochart2 where admitno='"+admitno+"' and date='"+id+"' ",new RowMapper<glasgowcoma>(){  
			        public glasgowcoma mapRow(ResultSet rs, int row) throws SQLException {   
				       glasgowcoma i = new glasgowcoma();
				       
				     //  i.setAmttot(rs.getString(16));
				      // i.setAmtgivtot(rs.getString(17));
				     //  i.setUrinetot(rs.getString(18));
				     //  i.setVomitustot(rs.getString(19));
				      System.out.println(rs.getString(2));
				      
				       
				       return i;
			        }
				});
			}
			
			public List<glasgowcoma> getPatientdet3(String fileno) {
				// TODO Auto-generated method stub
				   
				return template.query("select distinct date from glasgowcoma where admitno='"+fileno+"'",new RowMapper<glasgowcoma>(){  
			        public glasgowcoma mapRow(ResultSet rs, int row) throws SQLException {   
				       glasgowcoma i = new glasgowcoma();
				       System.out.println(rs.getString(1));
				      i.setDate(rs.getString(1));
				     
				      
				       
				       return i;
			        }
				});
			}
			
			public List<glasgowcoma> getPatientdet3(String admitno, String id) {
				// TODO Auto-generated method stub
				   
				return template.query(" select spontaneous,response,obey,date,total from glasgowcoma where admitno='"+admitno+"' and date='"+id+"' ",new RowMapper<glasgowcoma>(){  
			        public glasgowcoma mapRow(ResultSet rs, int row) throws SQLException {   
				       glasgowcoma i = new glasgowcoma();
				       i.setOpener(rs.getString(1));
				       i.setMotor(rs.getString(3));
				       i.setVerbal(rs.getString(2));
				       i.setDate(rs.getString(4));
				       i.setTotal(rs.getString(5));
				       return i;
			        }
				});
			}
			
			
			
			
			
			
			
			
			
			public List<blantyrecoma> getPatientdet11(String fileno) {
				// TODO Auto-generated method stub
				   
				return template.query("select g.pid,g.fileno,g.admitno,g.date from blantyrecoma where g.admitno='"+fileno+"'",new RowMapper<blantyrecoma>(){  
			        public blantyrecoma mapRow(ResultSet rs, int row) throws SQLException {   
			        	blantyrecoma i = new blantyrecoma();
				       i.setPid(rs.getString(1));
				       i.setFileno(rs.getString(2));
				       i.setAdmitno(rs.getString(3));
				       i.setDate(rs.getString(4));
				       
				      
				       
				       return i;
			        }
				});
			}

			public List<blantyrecoma> getPatientdet21(String admitno, String id) {
				// TODO Auto-generated method stub
				   
				return template.query("select time,type,amount,typecommence,amtgiv,urine,vomitus,remarks,admitno,doctord,doctsig,ratef,dremarks,date,aid from iochart2 where admitno='"+admitno+"' and date='"+id+"' ",new RowMapper<blantyrecoma>(){  
			        public blantyrecoma mapRow(ResultSet rs, int row) throws SQLException {   
			        	blantyrecoma i = new blantyrecoma();
				       
				     //  i.setAmttot(rs.getString(16));
				      // i.setAmtgivtot(rs.getString(17));
				     //  i.setUrinetot(rs.getString(18));
				     //  i.setVomitustot(rs.getString(19));
				      System.out.println(rs.getString(2));
				      
				       
				       return i;
			        }
				});
			}
			
			public List<blantyrecoma> getPatientdet31(String fileno) {
				// TODO Auto-generated method stub
				   
				return template.query("select distinct date from blantyrecoma where admitno='"+fileno+"'",new RowMapper<blantyrecoma>(){  
			        public blantyrecoma mapRow(ResultSet rs, int row) throws SQLException {   
			        	blantyrecoma i = new blantyrecoma();
				       System.out.println(rs.getString(1));
				      i.setDate(rs.getString(1));
				     
				      
				       
				       return i;
			        }
				});
			}
			
			public List<blantyrecoma> getPatientdet31(String admitno, String id) {
				// TODO Auto-generated method stub
				   
				return template.query(" select localize,cry,dir,date,total from blantyrecoma where admitno='"+admitno+"' and date='"+id+"' ",new RowMapper<blantyrecoma>(){  
			        public blantyrecoma mapRow(ResultSet rs, int row) throws SQLException {   
			        	blantyrecoma i = new blantyrecoma();
				       i.setBestmotor(rs.getString(1));
				       i.setResponse(rs.getString(2));
				       i.setMovement(rs.getString(3));
				       i.setDate(rs.getString(4));
				       i.setTotal(rs.getString(5));
				       return i;
			        }
				});
			}
//delete prescription tabs

			public int deletepr(String drug, String type,String fileno) {
			
				String sql = "delete from prescriptiontab where fileno = '"+fileno+"' and drugname like '%"+drug+"%' and typeofdr like '%"+type+"%'";
				return template.update(sql);
			}
			
			public int deleteipr(String drug, String type,String fileno) {
				
				String sql = "delete from ipdprescription where fileno = '"+fileno+"' and drugname like '%"+drug+"%' and typeofdr like '%"+type+"%'";
				return template.update(sql);
			}
			
			public List<Diagnose> getLoadvalue(int level,int pid,String tablename,String diagheader) {

				
				return template.query("select d.did,d.checkval,d.parentid,dh.header,d.hid from "+tablename+" d right outer join "+diagheader+" dh on dh.hid = d.hid where parentid = '"+pid+"' and tabid = '"+level+"'",new RowMapper<Diagnose>(){  

			        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
				       Diagnose p = new Diagnose();
				   		p.setDid(rs.getInt(1));
				   		p.setCheckval(rs.getString(2));
				   		p.setPid(rs.getInt(3));
				   		p.setHeader(rs.getString(4));

				   		p.setHid(rs.getInt(5));
				   		System.out.println(rs.getInt(3));

				       return p;
			        }
				});
			}

		public List<Diagnose> getlval1(int level,String tablename,String diagheader,int tab) {

				
				return template.query("select d.did,d.checkval,d.parentid,dh.header,d.hid from "+tablename+" d right outer join "+diagheader+" dh on dh.hid = d.hid where d.level='"+level+"' and d.tabid = '"+tab+"'",new RowMapper<Diagnose>(){  

			        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
				       Diagnose p = new Diagnose();
				   		p.setDid(rs.getInt(1));
				   		p.setCheckval(rs.getString(2));
				   		p.setPid(rs.getInt(3));
				   		p.setHeader(rs.getString(4));

				   		p.setHid(rs.getInt(5));
				   		

				       return p;
			        }
				});
			}

			
			//load header data
			public List<Diagnose> getHeaderVal(int level,String pid,String tablename) {
		
				return template.query("select hid,header from "+tablename+" where tid ='"+level+"' and header = '"+pid+"'",new RowMapper<Diagnose>(){  
			        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
				       Diagnose p = new Diagnose();
				   		p.setHid(rs.getInt(1));
				   		p.setHeader(rs.getString(2));
				   		
				       return p;
			        }
				});
			}
			
			public List<Diagnose> getHeaderVal1(int tab,int level,String tablename) {
				
				return template.query("select hid,header from "+tablename+" where tid ='"+tab+"' and level = '"+level+"'",new RowMapper<Diagnose>(){  
			        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
				       Diagnose p = new Diagnose();
				   		p.setHid(rs.getInt(1));
				   		p.setHeader(rs.getString(2));
				   		
				       return p;
			        }
				});
			}
			// load header data on tabclick
			
			

	// load history data for diagnose screen		
			public List<Diagnose> getHistvalue(String tablename) {
			return template.query("select d.pid,d.fileno,concat(pat.fname,' ',pat.mname,' ',pat.lname) patient,doc.docid,concat(doc.fname,' ',doc.mname,' ',doc.lname) doctor,d.diagnose,d.datetime from "+tablename+" d join patient pat on pat.pid = d.pid join doctor doc on doc.docid = d.docid",new RowMapper<Diagnose>(){  
			        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
				       Diagnose p = new Diagnose();
				   	p.setPpid(rs.getString(1));
				   	p.setFileno(rs.getString(2));
				   	p.setPname(rs.getString(3));
				   	p.setDocid(rs.getString(4));
				   	p.setDname(rs.getString(5));
				   	p.setDiagnose(rs.getString(6));
				   	p.setDatetime(rs.getString(7));
				   	System.out.println(rs.getString(6));
				    return p;
			        }
				});
			}		
			
	//load values based on fileno for discharge screen
			public List<Diagnose> getHistvalue1(String pid,String fileno,String tablename) {
				return template.query("select d.pid,d.fileno,concat(pat.fname,' ',pat.mname,' ',pat.lname) patient,doc.docid,concat(doc.fname,' ',doc.mname,' ',doc.lname) doctor,concat('Diagnose Details',d.diagnose,'\n\nProvisional Diagnosis\n',prep.pds) Diag,d.datetime from "+tablename+" d join patient pat on pat.pid = d.pid join doctor doc on doc.docid = d.docid right outer join prescription prep on prep.fileno = d.fileno where d.pid = '"+pid+"' and d.fileno ='"+fileno+"'",new RowMapper<Diagnose>(){  
				        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
					       Diagnose p = new Diagnose();
					   	p.setPpid(rs.getString(1));
					   	p.setFileno(rs.getString(2));
					   	p.setPname(rs.getString(3));
					   	p.setDocid(rs.getString(4));
					   	p.setDname(rs.getString(5));
					   	p.setDiagnose(rs.getString(6));
					   	p.setDatetime(rs.getString(7));
					    return p;
				        }
					});
				}		
				
			// save diagnose data
			public int savediagnose(Diagnose b) {
							   String sql="insert into "+b.getTablename()+"(pid,fileno,docid,datetime,diagnose) values('"+b.getPpid()+"','"+b.getFileno()+"','"+b.getDocid()+"','"+b.getDatetime()+"','"+b.getDiagnose()+"') on duplicate key update docid = '"+b.getDocid()+"',diagnose = '"+b.getDiagnose()+"',datetime = '"+b.getDatetime()+"'";  
				    return template.update(sql);  
				} 
			
			public int savediagnose21(Diagnose b) {
				   String sql="insert into "+b.getTablename()+"(pid,fileno,docid,datetime,diagnose) values(?,?,?,?,?) on duplicate key update docid = values(docid),diagnose = values(diagnose),datetime = values(datetime)";  
				  return template.update(sql, new Object[] { b.getPpid(),b.getFileno(),b.getDocid(),b.getDatetime(),b.getDiagnose()}); 
				 } 
			
		
			// save tab header
			public int savediagtab(String b,String tablename) {
				   String sql="insert into "+tablename+"(tabvalue) values('"+b+"') on duplicate key update tabvalue = '"+b+"'";  
				    return template.update(sql);  
				} 
			
			// save tab header

			public int savediagheader(int tabid,String header,int level,String tablename) {
					String sql="insert into "+tablename+"(tid,header,level) values('"+tabid+"','"+header+"','"+level+"') on duplicate key update header = '"+header+"',tid = '"+tabid+"'";  
					return template.update(sql);  
							} 
		//update header
			
			public int upddiagheader(int hid,String header,int level,String tablename ) {
				String sql="update "+tablename+" set header = '"+header+"',level='"+level+"' where hid = '"+hid+"'";  
				return template.update(sql);  
						} 
	//update checkbox
			public int updChname(int cid,String header,String tablename) {
				String sql="update "+tablename+" set checkval = '"+header+"' where did = '"+cid+"'";  
				return template.update(sql);  
						} 
	
			public int updtab(int tabid,String tabvalue,String tablename) {
				String sql="update "+tablename+" set tabvalue = '"+tabvalue+"' where tid = '"+tabid+"'";  
				return template.update(sql);  
						} 
		
			//save checkbox values
			
			public int saveChk(int tabid,String chkname,int pid,int hid,int level,String tablename) {
				String sql="insert into "+tablename+"(checkval,level,hid,tabid,parentid) values('"+chkname+"','"+level+"','"+hid+"','"+tabid+"','"+pid+"') on duplicate key update checkval = '"+chkname+"',tabid = '"+tabid+"',hid='"+hid+"',parentid='"+pid+"',level='"+level+"'";  
				return template.update(sql);  
						} 

			//load tabs
			public List<Diagnose> getTabsvalue(String b,String tablename) {
				return template.query("select tid,tabvalue from "+tablename+" where tabvalue = '"+b+"'",new RowMapper<Diagnose>(){  
				        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
					       Diagnose p = new Diagnose();
					   	p.setTabid(rs.getInt(1));
					   	p.setTabvalue(rs.getString(2));
					   	return p;
				        }
					});
				}	
			public List<Diagnose> getTabsvalue(String tablename) {
				return template.query("select tid,tabvalue from "+tablename+"",new RowMapper<Diagnose>(){  
				        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
					       Diagnose p = new Diagnose();
					   	p.setTabid(rs.getInt(1));
					   	p.setTabvalue(rs.getString(2));
					   	return p;
				        }
					});

				}


			public List<Diagnose> getHeaderValsl(int level,String tablename) {
				
				return template.query("select hid,header from "+tablename+" where hid ='"+level+"'",new RowMapper<Diagnose>(){  
			        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
				       Diagnose p = new Diagnose();
				   		p.setHid(rs.getInt(1));
				   		p.setHeader(rs.getString(2));
				   		
				       return p;
			        }
				});
			}

public List<Diagnose> getChknameVal(int level,String tablename) {
				
				return template.query("select did,checkval from "+tablename+" where did ='"+level+"'",new RowMapper<Diagnose>(){  
			        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
				       Diagnose p = new Diagnose();
				   		p.setDid(rs.getInt(1));
				   		p.setCheckval(rs.getString(2));
				   		
				       return p;
			        }
				});
			}

public List<Diagnose> getTabvalue(int level,String tablename) {
	
	return template.query("select tid,tabvalue from "+tablename+" where tid ='"+level+"'",new RowMapper<Diagnose>(){  
        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
	       Diagnose p = new Diagnose();
	   		p.setTabid(rs.getInt(1));
	   		p.setTabvalue(rs.getString(2));
	   		System.out.println("level"+rs.getInt(1));   		
	       return p;
        }
	});
}

public List<Diagnose> getTxtval(String fileno,String tablename) {
	
	return template.query("select fileno,datetime,diagnose,docid from "+tablename+" where fileno ='"+fileno+"'",new RowMapper<Diagnose>(){  
        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
	       Diagnose p = new Diagnose();
	   	
	   		p.setFileno(rs.getString(1));
	   		p.setDatetime(rs.getString(2));
	   		p.setDiagnose(rs.getString(3));
	   		p.setDocid(rs.getString(4));
	   			
	       return p;
        }
	});
}

//load doctor id and name for appointments
public List<Doctor> getDoc(String user) {
	// TODO Auto-generated method stub
	return template.query("select usr.userid from userrole usr join doctor n on n.docID = usr.userid where usr.username = '"+user+"'",new RowMapper<Doctor>(){  
        public Doctor mapRow(ResultSet rs, int row) throws SQLException {   
	   Doctor p = new Doctor();
	   
	      p.setDocID(rs.getString(1));
	      return p;
        }
	});
}

public List<Diagnose> getTeethvalues(String tablename) {
	// TODO Auto-generated method stub
	return template.query("select teid,teethval from "+tablename+"",new RowMapper<Diagnose>(){  
        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
	   Diagnose p = new Diagnose();
	   p.setTeid(rs.getString(1));
	   p.setTeethval(rs.getString(2));
	    
	      return p;
        }
	});
}

public List<Diagnose> getOpd() {
	// TODO Auto-generated method stub
	return template.query("select (select count(distinct fileno ) from diagnose where DATE_FORMAT(curdate(), '%d-%m-%Y') = SUBSTRING_INDEX(datetime,' ',1))+(select count(distinct fileno ) from cdiagnose where DATE_FORMAT(curdate(), '%d-%m-%Y') = SUBSTRING_INDEX(datetime,' ',1));",new RowMapper<Diagnose>(){  
        public Diagnose mapRow(ResultSet rs, int row) throws SQLException {   
	   Diagnose p = new Diagnose();
	   p.setDatetime(rs.getString(1));
	
	    
	      return p;
        }
	});
}

public List<Prescription2> getIpd() {
	// TODO Auto-generated method stub
	return template.query("select count(distinct fileno) from admitpat where fileno not in (select fileno from discharge)",new RowMapper<Prescription2>(){  
        public Prescription2 mapRow(ResultSet rs, int row) throws SQLException {   
	   Prescription2 p = new Prescription2();
	   p.setDate(rs.getString(1));
       return p;
        }
	});
}

//to load only dept values
public List<Deptspe> getdepartment() {
	return template.query("select department from deptdesig where department not like 'NA'",new RowMapper<Deptspe>(){  
        public Deptspe mapRow(ResultSet rs, int row) throws SQLException {   
        	Deptspe p = new Deptspe();
	     
	      p.setDepartment(rs.getString(1));
	  
	      return p;
        }
	});
}
public List<Deptspe> getspe() {
	return template.query("select specialization from deptdesig where specialization not like 'NA'",new RowMapper<Deptspe>(){  
        public Deptspe mapRow(ResultSet rs, int row) throws SQLException {   
        	Deptspe p = new Deptspe();
	     
	      p.setSpecialization(rs.getString(1));
	      return p;
        }
	});
}

}  
		
