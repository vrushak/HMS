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

public class nurseControllerDao {

	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
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
			return template.query("select nid,fname,lname,joindate,dob,age,gender,mname,regno,landphone,mobile,email,ssn,address,city,country,pcode,state,prfshift,emptype,dept,desg,specialization,qualification,CONCAT(fname,' ', mname,' ',lname),(select username from users where users.userid = nurse.nid ),(select password from users where users.userid = nurse.nid),address2 from nurse order by CAST(SUBSTRING_INDEX(nid,'-',-1) as decimal) desc;",new RowMapper<Nurse>(){  
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
			       p.setAddress2(rs.getString(28));
			   return p;
		        }
			});
		}
		
	public int saveNurse(Nurse p) {
			
			String sql = "insert into nurse (nid,fname,mname,lname,joindate,dob,age,gender,regno,landphone,mobile,email,ssn,address,city,country,pcode,state,prfshift,emptype,dept,desg,specialization,qualification,address2) values('"+p.getNid()+"','"+p.getFname()+"','"+p.getMname()+"','"+p.getLname()+"','"+p.getJoindate()+"','"+p.getDob()+"','"+p.getAge()+"','"+p.getGender()+"','"+p.getRegnno()+"','"+p.getLandphone()+"','"+p.getMobile()+"','"+p.getEmail()+"','"+p.getSsn()+"','"+p.getAddress()+"','"+p.getCity()+"','"+p.getCountry()+"','"+p.getPcode()+"','"+p.getState()+"','"+p.getPrfshift()+"','"+p.getEmptype()+"','"+p.getDept()+"','"+p.getDesg()+"','"+p.getSpecialization()+"','"+p.getQualification()+"','"+p.getAddress2()+"') on duplicate key update fname='"+p.getFname()+"',mname='"+p.getMname()+"',lname='"+p.getLname()+"',joindate='"+p.getJoindate()+"',dob='"+p.getDob()+"',age='"+p.getAge()+"',gender='"+p.getGender()+"',regno='"+p.getRegnno()+"',landphone='"+p.getLandphone()+"',mobile='"+p.getMobile()+"',email='"+p.getEmail()+"',ssn='"+p.getSsn()+"',address='"+p.getAddress()+"',city='"+p.getCity()+"',country='"+p.getCountry()+"',pcode='"+p.getPcode()+"',state='"+p.getState()+"',prfshift ='"+p.getPrfshift()+"',emptype='"+p.getEmptype()+"',dept='"+p.getDept()+"',desg='"+p.getDesg()+"',specialization='"+p.getSpecialization()+"',qualification='"+p.getQualification()+"',address2='"+p.getAddress2()+"'";
			return template.update(sql);
			// TODO Auto-generated method stub
			
		}

	public int saveNr(Nurseassign s) {
		// TODO Auto-generated method stub
		System.out.println(s.getPid());
		String sql = "insert into nurseassign(pid,pname,nname,nid,wardno,fileno,admitno) values('"+s.getPid()+"','"+s.getPname()+"', '"+s.getNname()+"','"+s.getNid()+"','"+s.getWardno()+"','"+s.getFileno()+"','"+s.getAdmitno()+"') on duplicate key update nid = '"+s.getNid()+"',nname='"+s.getNname()+"'";
		return template.update(sql);
	}

	public List<Nurseassign> getNurseassign() {
		return template.query("select na.pid,concat(p.fname,' ',p.mname,' ',p.lname) patient,na.nid,concat(n.fname,' ',n.mname,' ',n.lname) nurse,adm.wardno,na.fileno,na.admitno from  nurseassign na join patient p on p.pid=na.pid join nurse n on na.nid = n.nid join admitpat adm on adm.fileno = na.fileno where na.fileno not in (select fileno from discharge)",new RowMapper<Nurseassign>(){  
	        public Nurseassign mapRow(ResultSet rs, int row) throws SQLException {   
		       Nurseassign p = new Nurseassign();
		       p.setPid(rs.getString(1));
		       p.setPname(rs.getString(2));
		       p.setNid(rs.getString(3));
		       p.setNname(rs.getString(4));
		       p.setWardno(rs.getString(5));
		       p.setFileno(rs.getString(6));
		       p.setAdmitno(rs.getString(7));
		       return p;
	        }
		});
	}

	public List<Nurseassign> getNurseassign1(String uid) {
		return template.query("select pid,pname,nid,nname,wardno from  nurseassign where nid in (select userid from userrole where username = '"+uid+"') and fileno not in (select fileno from discharge)",new RowMapper<Nurseassign>(){  
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
	
	public List<Nurseassign> getNurseassign2(String nid) {
		return template.query("select userid from userrole where username = '"+nid+"'",new RowMapper<Nurseassign>(){  
	        public Nurseassign mapRow(ResultSet rs, int row) throws SQLException {   
		       Nurseassign p = new Nurseassign();
		      
		       p.setNid(rs.getString(1));
		       
		       return p;
	        }
		});
	}
	public List<Vitals> getVitals(String nid) {
		// TODO Auto-generated method stub
		return template.query("select usr.userid,concat(n.fname,' ',n.mname,' ',n.lname) Nurse from userrole usr join nurse n on n.nid = usr.userid where usr.username = '"+nid+"'",new RowMapper<Vitals>(){  
	        public Vitals mapRow(ResultSet rs, int row) throws SQLException {   
		     Vitals p = new Vitals();
		     
		      p.setNid(rs.getString(1));
		      p.setNname(rs.getString(2));
		      return p;
	        }
		});
	}
	
	public List<Vitals> getVitalinfo(String id) {
		
		// TODO Auto-generated method stub
		return template.query("select v.pid,v.fileno,height,unitheight,weight,weightunit,temperature,tunit,abdominalc,bp,bmi,fi,fe,arest,pulse,timestamp,concat(p.fname,' ',p.mname,' ',p.lname) patient,v.nid,concat(n.fname,' ',n.mname,' ',n.lname),v.docid,concat(d.fname,' ',d.mname,' ',d.lname) doctor from vital v join patient p on p.pid=v.pid left outer join nurse n on v.nid = n.nid left outer join doctor d on d.docID = v.docid where v.fileno='"+id+"'",new RowMapper<Vitals>(){  
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
		       p.setPname(rs.getString(17));
		       p.setNid(rs.getString(18));
		       p.setNname(rs.getString(19));
		       p.setDocid(rs.getString(20));
		       p.setDname(rs.getString(21));
		       
		       
		       System.out.println(rs.getString(19));
		       System.out.println(rs.getString(21));
		       
		       
		       
	return p;
	        }
		});


}

public List<Vitals> getVitalinfo1(String id) {
		
		// TODO Auto-generated method stub
		return template.query("select v.pid,v.fileno,concat(v.height,' ',unitheight)height,concat(v.weight,' ',weightunit)weight,concat(temperature,' ',tunit)temperature,v.abdominalc,bp,bmi,concat(v.fi,' ',v.fe,' ',arest)Respiration,pulse,timestamp from vital v where v.pid='"+id+"'",new RowMapper<Vitals>(){  
	        public Vitals mapRow(ResultSet rs, int row) throws SQLException {   
		       Vitals p= new Vitals();
		       p.setPid(rs.getString(1));
		       
		       p.setFileno(rs.getString(2));
		       p.setHeight(rs.getString(3));
		      
		       p.setWeight(rs.getString(4));
		       
		       p.setTemperature(rs.getString(5));
		      
		       p.setAc(rs.getString(6));
		       p.setBp(rs.getString(7));
		       p.setBmi(rs.getString(8));
		       p.setFi(rs.getString(9));
		     
		      
		       p.setPulse(rs.getString(10));
		     
		       p.setTime(rs.getString(11));
		      
		       
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
		
		String sql = "insert into vital(pid,fileno,height,unitheight,weight,weightunit,temperature,tunit,abdominalc,bp,pulse,bmi,fi,fe,arest,timestamp,nid,docid) values('"+s.getPid()+"','"+s.getFileno()+"','"+s.getHeight()+"','"+s.getUnith()+"','"+s.getWeight()+"','"+s.getUnitw()+"','"+s.getTemperature()+"','"+s.getUnitt()+"','"+s.getAc()+"','"+s.getBp()+"','"+s.getPulse()+"','"+s.getBmi()+"','"+s.getFi()+"','"+s.getFe()+"','"+s.getRest()+"',NOW(),'"+s.getNid()+"','"+s.getDocid()+"') on duplicate key update height = '"+s.getHeight()+"',unitheight='"+s.getUnith()+"',weight='"+s.getWeight()+"',weightunit='"+s.getUnitw()+"',temperature='"+s.getTemperature()+"',tunit='"+s.getUnitt()+"',abdominalc='"+s.getAc()+"',bp='"+s.getBp()+"',pulse='"+s.getPulse()+"',bmi='"+s.getBmi()+"',fi='"+s.getFi()+"',fe='"+s.getFe()+"',arest='"+s.getRest()+"',timestamp =NOW(),nid = '"+s.getNid()+"',docid='"+s.getDocid()+"'";
		return template.update(sql);// TODO Auto-generated method stub
		
	}
	//to load from doctor screen
public int saveVital(Diagnose s) {
		
		String sql = "insert into vital(pid,fileno,height,unitheight,weight,weightunit,temperature,tunit,abdominalc,bp,pulse,bmi,fi,fe,arest,timestamp,nid,docid) values('"+s.getPpid()+"','"+s.getFileno()+"','"+s.getHeight()+"','"+s.getUnith()+"','"+s.getWeight()+"','"+s.getUnitw()+"','"+s.getTemperature()+"','"+s.getUnitt()+"','"+s.getAc()+"','"+s.getBp()+"','"+s.getPulse()+"','"+s.getBmi()+"','"+s.getFi()+"','"+s.getFe()+"','"+s.getRest()+"',NOW(),'"+s.getNid()+"','"+s.getDocid()+"') on duplicate key update height = '"+s.getHeight()+"',unitheight='"+s.getUnith()+"',weight='"+s.getWeight()+"',weightunit='"+s.getUnitw()+"',temperature='"+s.getTemperature()+"',tunit='"+s.getUnitt()+"',abdominalc='"+s.getAc()+"',bp='"+s.getBp()+"',pulse='"+s.getPulse()+"',bmi='"+s.getBmi()+"',fi='"+s.getFi()+"',fe='"+s.getFe()+"',arest='"+s.getRest()+"',timestamp =NOW(),nid = '"+s.getNid()+"',docid='"+s.getDocid()+"'";
		return template.update(sql);// TODO Auto-generated method stub";
		// TODO Auto-generated method stub
		
	}
	
/*	
public int saveiochart1(Iochart i) {
		
		String sql = "insert into iochart2(pid,admitno,fileno,time,type,amount,typecommence,amtgiv,urine,vomitus,remarks,date) values('"+i.getPid()+"','"+i.getAdmitno()+"','"+i.getFileno()+"','"+i.getTime()+"','"+i.getOraltype()+"','"+i.getOralamt()+"','"+i.getOralcommence()+"','"+i.getAmtgiv()+"','"+i.getUrine()+"','"+i.getVomitus()+"','"+i.getRemarks()+"',curdate()) on duplicate key update time='"+i.getTime()+"',type='"+i.getOraltype()+"',amount='"+i.getOralamt()+"',typecommence='"+i.getOralcommence()+"',amtgiv='"+i.getAmtgiv()+"',urine='"+i.getUrine()+"',vomitus='"+i.getVomitus()+"',remarks='"+i.getRemarks()+"',date= curdate()";
		return template.update(sql);
		// TODO Auto-generated method stub
		
	}
	public int saveiochart(Iochart i) {
		// TODO Auto-generated method stub
		String sql = "insert into iochart(pid,name,age,gender,admdate,fileno,doctord,doctsig,ratef,nursesig,date,admitno) values('"+i.getPid()+"','"+i.getName()+"','"+i.getAge()+"','"+i.getGender()+"','"+i.getAdmdate()+"','"+i.getFileno()+"','"+i.getDoctord()+"','"+i.getDoctsig()+"','"+i.getRatef()+"','"+i.getNursesig()+"',curdate(),'"+i.getAdmitno()+"') on duplicate key update time='"+i.getTime()+"',type='"+i.getOraltype()+"',amount='"+i.getOralamt()+"',typecommence='"+i.getOralcommence()+"',amtgiv='"+i.getAmtgiv()+"',urine='"+i.getUrine()+"',vomitus='"+i.getVomitus()+"',remarks='"+i.getRemarks()+"',date= curdate()";
				return template.update(sql);
	}
	// "on duplicate key update time='"+i.getTime()+"',type='"+i.getOraltype()+"',amount='"+i.getOralamt()+"',typecommence='"+i.getOralcommence()+"',amtgiv='"+i.getAmtgiv()+"',urine='"+i.getUrine()+"',vomitus='"+i.getVomitus()+"',remarks='"+i.getRemarks()+"'date= curdate()";
	
//get patient details on page load for iochart
	public List<Iochart> getPatientdet() {
		// TODO Auto-generated method stub
		return template.query("select pid,pname,(select age from patient where admitpat.pid= patient.pid),(select gender from patient where admitpat.pid= patient.pid),fileno,admdate,CONCAT(wardno,'/',bedno),dname,(select nname from nurseassign where nurseassign.pid=admitpat.pid),admitno from admitpat",new RowMapper<Iochart>(){  
	        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
		       Iochart i = new Iochart();
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

	public List<Iochart> getPatientdet1(String fileno) {
		// TODO Auto-generated method stub
		   
		return template.query("select pid,name,fileno,age,gender,admdate,wardno,doctord,doctsig,ratef,nursesig,admitno,date from iochart where fileno='"+fileno+"'",new RowMapper<Iochart>(){  
	        public Iochart mapRow(ResultSet rs, int row) throws SQLException {   
		       Iochart i = new Iochart();
		       i.setPid(rs.getString(1));
		       i.setName(rs.getString(2));
		       i.setFileno(rs.getString(3));
		       i.setAge(rs.getString(4));
		       i.setGender(rs.getString(5));
		       i.setAdmdate(rs.getString(6));
		       i.setWardno(rs.getString(7));
		       i.setDoctord(rs.getString(8));
		       i.setDoctsig(rs.getString(9));
		       i.setRatef(rs.getString(10));
		       i.setNursesig(rs.getString(11));
		       i.setAdmitno(rs.getString(12));
		       i.setDate(rs.getString(13));
		      System.out.println(rs.getString(2));
		      
		       
		       return i;
	        }
		});
	}

	public List<Iochart> getPatientdet2(String admitno) {
		// TODO Auto-generated method stub
		   
		return template.query("select time,type,amount,typecommence,amtgiv,urine,vomitus,remarks,admitno,date from iochart2 where admitno='"+admitno+"'",new RowMapper<Iochart>(){  
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
		       i.setDate(rs.getString(10));
		      System.out.println(rs.getString(2));
		      
		       
		       return i;
	        }
		});
	}
*/
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
	
	public List<Appointment> getAppsforNrs() {
		
		
			return template.query("select CONCAT(d.fname,' ', d.mname,' ',d.lname) Doctor,ap.pid,CONCAT(p.fname,' ', p.mname,' ',p.lname) Patient,CONCAT(DATE_FORMAT(ap.appointment, '%d-%m-%Y'),' ',ap.time),ap.fileno from appointment ap join patient p on ap.pid=p.pid join doctor d on ap.docid = d.docID  where ap.active = 'on' and STR_TO_DATE(ap.appointment, '%Y-%m-%d')= curdate() order by STR_TO_DATE(appointment, '%Y-%m-%d')desc,time",new RowMapper<Appointment>(){  
	        public Appointment mapRow(ResultSet rs, int row) throws SQLException {   
	        	
		       Appointment p = new Appointment();
		     
		    
		      p.setDname(rs.getString(1));
		      p.setPid(rs.getString(2));
		      p.setPname(rs.getString(3));
		      p.setAppointment(rs.getString(4));
		      p.setFileno(rs.getString(5));
		   
		      return p;
	        }
		});
		
	}
}
