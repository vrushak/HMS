package ERPHO;
import org.springframework.orm.hibernate3.HibernateTemplate;



import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.util.List;

import org.apache.taglibs.standard.tag.common.core.NullAttributeException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;  
import org.springframework.jdbc.core.JdbcTemplate;  
import org.springframework.jdbc.core.RowMapper;  
import java.util.*;  
import ERPHO.Customer;
import ERPHO.Manufacture;
import ERPHO.Product;
import ERPHO.Purchase;
import ERPHO.Supply;
import ERPHO.Sale;
import ERPHO.Spdiscount;
import ERPHO.TaxB;
import ERPHO.custDisc;

import ERPHO.Order;

public class controllerDao {
	
	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  
	
	public List<Manufacture> getM() {
		return template.query("select max(mid) from manufacture",new RowMapper<Manufacture>(){  
	        public Manufacture mapRow(ResultSet rs, int row) throws SQLException {   
		       Manufacture p = new Manufacture();
		     System.out.println("man" +rs.getInt(1));
		      p.setMid(rs.getInt(1));
		      return p;
	        }
		});
	}
	//save manufacture
	public int save(Manufacture m){  
		System.out.println("Manufacture is"+ m.getMid());
			String sql = "insert into manufacture(name,type,address1,address2,city,state,country,pincode,phone,mobile,fax,email,comment,active,mid) values('"+m.getName()+"','"+m.getMedical()+"','"+m.getAddress1()+"','"+m.getAddress2()+"','"+m.getCity()+"','"+m.getState()+"','"+m.getCountry()+"','"+m.getPincode()+"','"+m.getPhone()+"','"+m.getMobile()+"','"+m.getFax()+"','"+m.getEmail()+"','"+m.getComments()+"','"+m.getActive()+"','"+m.getMid()+"') on duplicate key update name='"+m.getName()+"',type='"+m.getMedical()+"',address1 ='"+m.getAddress1()+"',address2='"+m.getAddress2()+"',city='"+m.getCity()+"',state='"+m.getState()+"',country='"+m.getCountry()+"',pincode='"+m.getPincode()+"',phone='"+m.getPhone()+"',mobile='"+m.getMobile()+"',fax='"+m.getFax()+"',email='"+m.getEmail()+"',comment='"+m.getComments()+"',active='"+m.getActive()+"'" ; 
		    return template.update(sql); 
			
		}
		
	
	// save supply master
	public int saves(Supply s){ 
		
			String sql = "insert into supply(name,type,address1,address2,city,state,country,pincode,phone,mobile,fax,email,poc,pc,website,manufacturers,comment,active,sid) values('"+s.getName()+"','"+s.getMedical()+"','"+s.getAddress1()+"','"+s.getAddress2()+"','"+s.getCity()+"','"+s.getState()+"','"+s.getCountry()+"','"+s.getPincode()+"','"+s.getPhone()+"','"+s.getMobile()+"','"+s.getFax()+"','"+s.getEmail()+"','"+s.getPoc()+"','"+s.getPc()+"','"+s.getWebsite()+"','"+s.getManufacturers()+"','"+s.getComments()+"','"+s.getActive()+"','"+s.getSid()+"') on duplicate key update name='"+s.getName()+"',type='"+s.getMedical()+"',address1 ='"+s.getAddress1()+"',address2='"+s.getAddress2()+"',city='"+s.getCity()+"',state='"+s.getState()+"',country='"+s.getCountry()+"',pincode='"+s.getPincode()+"',phone='"+s.getPhone()+"',mobile='"+s.getMobile()+"',fax='"+s.getFax()+"',email='"+s.getEmail()+"',poc='"+s.getPoc()+"',pc='"+s.getPc()+"',website='"+s.getWebsite()+"',manufacturers='"+s.getManufacturers()+"',comment='"+s.getComments()+"',active='"+s.getActive()+"'";
		    return template.update(sql);
			
	}  
	
	
	
	//To display manufacture list in supplier masters 
	public List<Manufacture> getManufacturename(){  
	    return template.query("select distinct name,type,address1,address2,city,state,country,pincode,phone,mobile,fax,email,comment,mid,active from manufacture order by name",new RowMapper<Manufacture>(){  
	        public Manufacture mapRow(ResultSet rs, int row) throws SQLException {  
	            Manufacture man=new Manufacture();  
	          
	            man.setName(rs.getString(1));
	            man.setMedical(rs.getString(2));
	            man.setAddress1(rs.getString(3));
	            man.setAddress2(rs.getString(4));
	            man.setCity(rs.getString(5));
	            man.setState(rs.getString(6));
	            man.setCountry(rs.getString(7));
	            man.setPincode(rs.getString(8));
	            man.setPhone(rs.getString(9));
	            man.setMobile(rs.getString(10));
	            man.setFax(rs.getString(11));
	            man.setEmail(rs.getString(12));
	            man.setComments(rs.getString(13));
	            man.setMid(rs.getInt(14));
	            man.setActive(rs.getString(15));
	            System.out.println(rs.getString(15));
	              return man;  
	        }  
	    });  
}
	public List<Manufacture> getManufacturename1(){  
	    return template.query("select distinct name,type,address1,address2,city,state,country,pincode,phone,mobile,fax,email,comment,active,mid from manufacture where active='on' order by name ",new RowMapper<Manufacture>(){  
	        public Manufacture mapRow(ResultSet rs, int row) throws SQLException {  
	            Manufacture man=new Manufacture();  
	          
	            man.setName(rs.getString(1));
	            man.setMedical(rs.getString(2));
	            man.setAddress1(rs.getString(3));
	            man.setAddress2(rs.getString(4));
	            man.setCity(rs.getString(5));
	            man.setState(rs.getString(6));
	            man.setCountry(rs.getString(7));
	            man.setPincode(rs.getString(8));
	            man.setPhone(rs.getString(9));
	            man.setMobile(rs.getString(10));
	            man.setFax(rs.getString(11));
	            man.setEmail(rs.getString(12));
	            man.setComments(rs.getString(13));
	            man.setActive(rs.getString(14));
	            man.setMid(rs.getInt(15));
	            System.out.println(rs.getString(1));
	              return man;  
	        }  
	    });  
}
	public List<Manufacture> getcheckmname1(String name){
		//System.out.println("name:" +p.getName());
		return template.query("select name from manufacture where name = '"+name+"'",new RowMapper<Manufacture>(){  
	        public Manufacture mapRow(ResultSet rs, int row) throws SQLException {  
	        	Manufacture m=new Manufacture();  
	          System.out.println("name" +rs.getString(1));
	           m.setName(rs.getString(1));
	           
	          return m;
		
	}
		 }); 
	}
	//to display supplier list in supply
	public List<Supply> getS() {
		return template.query("select max(sid) from supply",new RowMapper<Supply>(){  
	        public Supply mapRow(ResultSet rs, int row) throws SQLException {   
		       Supply p = new Supply();
		     System.out.println(rs.getString(1));
		      p.setSid(rs.getInt(1));
		      return p;
	        }
		});
	}	
	public List<Supply> getSupplyname() {
		return template.query("select name,type,address1,address2,city,state,country,pincode,phone,mobile,fax,email,poc,pc,website,manufacturers,comment,active,sid from supply where active='on' order by name",new RowMapper<Supply>(){  
	        public Supply mapRow(ResultSet rs, int row) throws SQLException {  
	            Supply supp = new Supply();  
	            supp.setName(rs.getString(1));
	            supp.setMedical(rs.getString(2));
	            supp.setAddress1(rs.getString(3));
	            supp.setAddress2(rs.getString(4));
	            supp.setCity(rs.getString(5));
	            supp.setState(rs.getString(6));
	            supp.setCountry(rs.getString(7));
	            supp.setPincode(rs.getString(8));
	            supp.setPhone(rs.getString(9));
	            supp.setMobile(rs.getString(10));
	            supp.setFax(rs.getString(11));
	            supp.setEmail(rs.getString(12));
	            supp.setPoc(rs.getString(13));
	            supp.setPc(rs.getString(14));
	            supp.setWebsite(rs.getString(15));
	            supp.setManufacturers(rs.getString(16));
	            supp.setComments(rs.getString(17));
	            supp.setActive(rs.getString(18));
	            supp.setSid(rs.getInt(19));
	        System.out.println(rs.getString(1));
		return supp;
	}
		}); 
	}
	
	public List<Supply> getSupplyname1() {
		return template.query("select name,type,address1,address2,city,state,country,pincode,phone,mobile,fax,email,poc,pc,website,manufacturers,comment,active,sid from supply order by name ",new RowMapper<Supply>(){  
	        public Supply mapRow(ResultSet rs, int row) throws SQLException {  
	            Supply supp = new Supply();  
	            supp.setName(rs.getString(1));
	            supp.setMedical(rs.getString(2));
	            supp.setAddress1(rs.getString(3));
	            supp.setAddress2(rs.getString(4));
	            supp.setCity(rs.getString(5));
	            supp.setState(rs.getString(6));
	            supp.setCountry(rs.getString(7));
	            supp.setPincode(rs.getString(8));
	            supp.setPhone(rs.getString(9));
	            supp.setMobile(rs.getString(10));
	            supp.setFax(rs.getString(11));
	            supp.setEmail(rs.getString(12));
	            supp.setPoc(rs.getString(13));
	            supp.setPc(rs.getString(14));
	            supp.setWebsite(rs.getString(15));
	            supp.setManufacturers(rs.getString(16));
	            supp.setComments(rs.getString(17));
	            supp.setActive(rs.getString(18));
	            supp.setSid(rs.getInt(19));
		return supp;
	}
		}); 
	}
	public List<Supply> getchecksname1(String name){
		//System.out.println("name:" +p.getName());
		return template.query("select name from supply where name = '"+name+"'",new RowMapper<Supply>(){  
	        public Supply mapRow(ResultSet rs, int row) throws SQLException {  
	        	Supply s=new Supply();  
	          System.out.println("name" +rs.getString(1));
	           s.setName(rs.getString(1));
	           
	          return s;
		
	}
		 }); 
	}
	// save customer
	public int savec(Customer c){  
	    String sql = "insert into customer(customer,name,type,age,sex,phone,address1,address2,mobile,city,fax,state,email,country,comment,pincode,active,date) values('"+c.getCustomer()+"','"+c.getName()+"','"+c.getMedical()+"','"+c.getAge()+"','"+c.getSex()+"','"+c.getPhone()+"','"+c.getAddress1()+"','"+c.getAddress2()+"','"+c.getMobile()+"','"+c.getCity()+"','"+c.getFax()+"','"+c.getState()+"','"+c.getEmail()+"','"+c.getCountry()+"','"+c.getComments()+"','"+c.getPincode()+"','"+c.getActive()+"',curdate()) on duplicate key update name = '"+c.getName()+"',type = '"+c.getMedical()+"',age='"+c.getAge()+"',sex ='"+c.getSex()+"',phone='"+c.getPhone()+"',address1 = '"+c.getAddress1()+"',address2 = '"+c.getAddress2()+"',mobile = '"+c.getMobile()+"',city = '"+c.getCity()+"',fax = '"+c.getFax()+"',state='"+c.getState()+"',email='"+c.getEmail()+"',country='"+c.getCountry()+"',comment='"+c.getComments()+"',pincode='"+c.getPincode()+"',active='"+c.getActive()+"',date=curdate()"; 
	    return template.update(sql);  
	}  
	
	//update customer
    public int updatec(Customer c) {
		
    	String sql = "update customer set name = '"+c.getName()+"' ,type ='"+c.getMedical()+"', age='"+c.getAge()+"' ,sex = '"+c.getSex()+"', phone = '"+c.getPhone()+"', address1 = '"+c.getAddress1()+"', address2 = '"+c.getAddress2()+"', mobile='"+c.getMobile()+"', city= '"+c.getCity()+"', fax = '"+c.getFax()+"', state = '"+c.getState()+"', email='"+c.getEmail()+"', country='"+c.getCountry()+"', comment='"+c.getComments()+"' ,pincode = '"+c.getPincode()+"', active = '"+c.getActive()+"' where customer = '"+c.getCustomer()+"'";
	    return template.update(sql);	
	}
    
    //getCustomer datails
    public List<Customer> getCustomername() {
		return template.query("select customer,name,phone,age,sex,type from customer where active = 'active' order by name",new RowMapper<Customer>(){  
	        public Customer mapRow(ResultSet rs, int row) throws SQLException {   
		       Customer c = new Customer();
		       System.out.println(rs.getString(1));
		      c.setCustomer(rs.getString(1));
		      c.setName(rs.getString(2));
		      c.setPhone(rs.getString(3));
		      c.setAge(rs.getString(4));
		      c.setSex(rs.getString(5));
		      c.setMedical(rs.getString(6));
		      System.out.println(rs.getString(6));
		   return c;
	        }
		});
	}
	public List<Customer> getCustomername1() {
		return template.query("select customer,name,type,age,sex,phone,address1,address2,mobile,city,fax,state,email,country,comment,pincode,active from customer order by name ",new RowMapper<Customer>(){  
	        public Customer mapRow(ResultSet rs, int row) throws SQLException {   
		       Customer c = new Customer();
		      c.setCustomer(rs.getString(1));
		      c.setName(rs.getString(2));
		      
		      c.setMedical(rs.getString(3));
		      c.setAge(rs.getString(4));
		      c.setSex(rs.getString(5));
		      c.setPhone(rs.getString(6));
		      c.setAddress1(rs.getString(7));
		      c.setAddress2(rs.getString(8));
		      c.setMobile(rs.getString(9));
		      c.setCity(rs.getString(10));
		      c.setFax(rs.getString(11));
		      c.setState(rs.getString(12));
		      c.setEmail(rs.getString(13));
		      c.setCountry(rs.getString(14));
		      c.setComments(rs.getString(15));
		      c.setPincode(rs.getString(16));
		      c.setActive(rs.getString(17));
		   return c;
	        }
		});
	}
	public List<Customer> getCustomerId() {
		return template.query("select  max(CAST(SUBSTRING_INDEX(customer,'-',-1) as decimal)) from customer where date = curdate()",new RowMapper<Customer>(){  
	        public Customer mapRow(ResultSet rs, int row) throws SQLException {   
		       Customer c = new Customer();
		       System.out.println(rs.getString(1));
		      c.setCustomer(rs.getString(1));
		     
		   return c;
	        }
		});
	}
	public List<Customer> getcheckcphone(String phone){
		//System.out.println("name:" +p.getName());
		return template.query("select phone from customer where phone = '"+phone+"'",new RowMapper<Customer>(){  
	        public Customer mapRow(ResultSet rs, int row) throws SQLException {  
	        	Customer c=new Customer();  
	          System.out.println("phone" +rs.getString(1));
	           c.setPhone(rs.getString(1));
	           
	          return c;
		
	}
		 }); 
	}
	//save product
	public int savep(Product p){  
		System.out.println(p.getProduct());
		String sql = "insert into product(name,descr,pc,prc,manufacturer,composition,sp,bc,mc,rl,rq,doc,dsc,supplier,active,date,pid,dps,dsp) values('"+p.getName()+"','"+p.getDescr()+"','"+p.getPc()+"','"+p.getPrc()+"','"+p.getManufacturer()+"','"+p.getComposition()+"','"+p.getSp()+"','"+p.getBc()+"','"+p.getMc()+"','"+p.getRl()+"','"+p.getRq()+"','"+p.getDoc()+"','"+p.getDsc()+"','"+p.getSupplier()+"','"+p.getActive()+"',curdate(),'"+p.getProduct()+"','"+p.getDps()+"','"+p.getDsp()+"') on duplicate key update name = '"+p.getName()+"', descr = '"+p.getDescr()+"',pc='"+p.getPc()+"',prc = '"+p.getPrc()+"',manufacturer = '"+p.getManufacturer()+"',composition = '"+p.getComposition()+"',sp = '"+p.getSp()+"',bc = '"+p.getBc()+"',mc = '"+p.getMc()+"',rl='"+p.getRl()+"',rq='"+p.getRq()+"',doc = '"+p.getDoc()+"',dsc='"+p.getDsc()+"',supplier='"+p.getSupplier()+"',active='"+p.getActive()+"',dps='"+p.getDps()+"',dsp='"+p.getDsp()+"'"; 
	    return template.update(sql);  
	}  
	
	//to display products on product master on page load
	public List<Product> getP() {
		return template.query("select max(pid) from product",new RowMapper<Product>(){  
	        public Product mapRow(ResultSet rs, int row) throws SQLException {   
		      Product p = new Product();
		     System.out.println(rs.getString(1));
		      p.setProduct(rs.getInt(1));
		      return p;
	        }
		});
	}	
	
	
	public List<Product> search(){
		//System.out.println("name:" +p.getName());
		return template.query("select name,descr,pc,prc,manufacturer,composition,sp,bc,mc,rl,rq,doc,dsc,supplier,(select sum(quantity) from purchase where purchase.productName = product.name ) from product where active =  'active' order by name",new RowMapper<Product>(){  
	        public Product mapRow(ResultSet rs, int row) throws SQLException {  
	            Product s=new Product();  
	      //      System.out.println(rs.getString(2));
	            s.setName(rs.getString(1));
	            s.setDescr(rs.getString(2));
	            s.setPc(rs.getString(3));
	            s.setPrc(rs.getString(4));
	            s.setManufacturer(rs.getString(5));
	            s.setComposition(rs.getString(6));
	            s.setSp(rs.getString(7));
	            s.setBc(rs.getString(8));
	            s.setMc(rs.getString(9));
	            s.setRl(rs.getString(10));
	            s.setRq(rs.getString(11));
	            s.setDoc(rs.getString(12));
	            s.setDsc(rs.getString(13));
	            s.setSupplier(rs.getString(14));
	            s.setStocks(rs.getString(15));
	            return s;
		
	}
		 }); 
	}
	public List<Product> search1(){
		//System.out.println("name:" +p.getName());
		return template.query("select name,descr,pc,prc,manufacturer,composition,sp,bc,mc,rl,rq,doc,dsc,supplier,(select sum(currentstock) from productstock where product.name = productstock.name group by name),active,pid,dps,dsp from product order by name",new RowMapper<Product>(){  
	        public Product mapRow(ResultSet rs, int row) throws SQLException {  
	            Product s=new Product();  
	      //      System.out.println(rs.getString(2));
	            s.setName(rs.getString(1));
	            s.setDescr(rs.getString(2));
	            s.setPc(rs.getString(3));
	            s.setPrc(rs.getString(4));
	            s.setManufacturer(rs.getString(5));
	            s.setComposition(rs.getString(6));
	            s.setSp(rs.getString(7));
	            s.setBc(rs.getString(8));
	            s.setMc(rs.getString(9));
	            s.setRl(rs.getString(10));
	            s.setRq(rs.getString(11));
	            s.setDoc(rs.getString(12));
	            s.setDsc(rs.getString(13));
	            s.setSupplier(rs.getString(14));
	            s.setStocks(rs.getString(15));
	            s.setActive(rs.getString(16));
	            s.setProduct(rs.getInt(17));
	            s.setDps(rs.getString(18));
	            s.setDsp(rs.getString(19));
	            return s;
		
	}
		 }); 
	}

	
	
	public List<Purchase> search3(){
		//System.out.println("name:" +p.getName());
		return template.query("select name,prc from product where active =  'active'",new RowMapper<Purchase>(){  
	        public Purchase mapRow(ResultSet rs, int row) throws SQLException {  
	            Purchase s=new Purchase();  
	      //      System.out.println(rs.getString(2));
	            s.setProductName(rs.getString(1));
	            s.setEan(rs.getString(2));
	          return s;
		
	}
		 }); 
	}
	
	public List<Product> getcheckpcode(String code){
		//System.out.println("name:" +p.getName());
		return template.query("select prc from product where prc = '"+code+"'",new RowMapper<Product>(){  
	        public Product mapRow(ResultSet rs, int row) throws SQLException {  
	            Product s=new Product();  
	          System.out.println("prc" +rs.getString(1));
	           s.setPrc(rs.getString(1));
	           
	          return s;
		
	}
		 }); 
	}
	public List<Product> getcheckpname(String name){
		//System.out.println("name:" +p.getName());
		return template.query("select name from product where name = '"+name+"'",new RowMapper<Product>(){  
	        public Product mapRow(ResultSet rs, int row) throws SQLException {  
	            Product s=new Product();  
	          System.out.println("name" +rs.getString(1));
	           s.setName(rs.getString(1));
	           
	          return s;
		
	}
		 }); 
	}
	//,(select Batch from purchase where purchase.ean = product.prc),(select expDate from purchase where purchase.ean=product.prc),(select unit from purchase where purchase.ean=product.prc),(select unitprice from purchase where purchase.ean=product.prc),(select quantity from purchase where purchase.ean=product.prc),(select total from purchase where purchase.ean=product.prc)
	public List<Product> searchProduct(){
		//System.out.println("name:" +p.getName());
		return template.query("select name,supplier,bc,rq,prc,(select sum(currentstock) from productstock where productstock.name = product.name),dps from product order by name ",new RowMapper<Product>(){  
	        public Product mapRow(ResultSet rs, int row) throws SQLException {  
	        	  Product s=new Product();  
	    	      //      System.out.println(rs.getString(2));
	    	            s.setName(rs.getString(1));
	    	            s.setSupplier(rs.getString(2));
	    	            s.setBc(rs.getString(3));
	    	            s.setRq(rs.getString(4));
	    	            s.setPrc(rs.getString(5));
	    	            s.setStocks(rs.getString(6));
	    	            s.setDps(rs.getString(7));
	            return s;
		
	}
		 }); 
	}
	
	public List<Product> Reorder(){
	    return template.query("select pr.name,pr.prc,ps.currentstock,pr.dps from product pr left outer join  productstock ps on pr.name = ps.name where ps.currentstock <= pr.rq",new RowMapper<Product>(){  
	        public Product mapRow(ResultSet rs, int row) throws SQLException {  
	        	  Product s=new Product();  
	    	      //      System.out.println(rs.getString(2));
	    	            s.setName(rs.getString(1));
	    	            s.setPrc(rs.getString(2));
	    	            s.setStocks(rs.getString(3));
	    	            s.setDps(rs.getString(4));
	            return s;
		
	}
		 }); 
	}
	// to display the products which are below re-order-level
	public List<Product> searchRq(){
		//System.out.println("name:" +p.getName());
		return template.query("select name,supplier,bc,rq from product where rq in (select quantity from  purchase) and name not in (select productName from orderho) and active ='on';",new RowMapper<Product>(){  
	        public Product mapRow(ResultSet rs, int row) throws SQLException {  
	            Product s=new Product();  
	      //      System.out.println(rs.getString(2));
	            s.setName(rs.getString(1));
	            s.setSupplier(rs.getString(2));
	            s.setBc(rs.getString(3));
	            s.setRq(rs.getString(4));
	            return s;
		
	}
		 }); 
	}
	public List<Purchase> getCurrentstks() {
		return template.query("select productName,quantity from purchase",new RowMapper<Purchase>(){  
	        public Purchase mapRow(ResultSet rs, int row) throws SQLException {   
		      Purchase p = new Purchase();
		      p.setProductName(rs.getString(1));
		      p.setQuantity(rs.getString(2));
		   return p;
	        }
		});
	}
	public List<Order> getorderId() {
		return template.query("select max(CAST(SUBSTRING_INDEX(orderid,'-',-1) as decimal)) from orderho where SUBSTRING_INDEX(orderDate,' ',1) = DATE_FORMAT(curdate(),'%d-%m-%Y')",new RowMapper<Order>(){  
	        public Order mapRow(ResultSet rs, int row) throws SQLException {  
	            Order ord = new Order();
	            System.out.println(rs.getString(1));
	         ord.setOrderid(rs.getString(1));
	            
		return ord;
		}
		}); 
	}

	public List<Order> getorderDetails() {
		return template.query("select distinct orderid  from orderho ",new RowMapper<Order>(){  
	        public Order mapRow(ResultSet rs, int row) throws SQLException {  
	            Order ord = new Order();  
	         ord.setOrderid(rs.getString(1));
	            
		return ord;
		}
		}); 
	}
	
	//to display the active order details distinct orderid,orderDate,delivery,author,productName,Supplier,unit,quantity,stock,unitprice,total,ean
	
	public List<Order> getorderDetails1(String string) {
		return template.query("select distinct orderid,orderDate,author,Supplier,ean,productName,unit,quantity,stock,count from orderho where orderid = '"+string+"' order by orderid,productName",new RowMapper<Order>(){  
	        public Order mapRow(ResultSet rs, int row) throws SQLException {  
	            Order ord = new Order();  
	            System.out.println(rs.getString(1));
	            ord.setOrderid(rs.getString(1));
	            ord.setOrderDate(rs.getString(2));
	          
	            ord.setAuthor(rs.getString(3));
	            ord.setSupplier(rs.getString(4));
	            ord.setEan(rs.getString(5));
	            ord.setProductName(rs.getString(6));
	          
	            ord.setUnit(rs.getString(7));
	            ord.setQuantity(rs.getString(8));
	            ord.setStks(rs.getString(9));
	            ord.setCount(rs.getString(10));
	           
	            System.out.println("sd" +rs.getString(10));
	          return ord;
		}
		}); 
	}
	//save order //
	public int  saveo(Order o,String name,String pack, String quantity, String stock,String ean) {
		
 		String sql = "insert into orderho(orderid,orderDate,author,productName,Supplier,unit,quantity,count,active,stock,ean) values('"+o.getOrderid()+"','"+o.getOrderDate()+"','"+o.getAuthor()+"','"+name+"','"+o.getSupplier()+"','"+pack+"','"+quantity+"','"+o.getCount()+"','"+o.getActive()+"','"+stock+"','"+ean+"') on duplicate key update orderid = '"+o.getOrderid()+"',orderDate = '"+o.getOrderDate()+"',Supplier = '"+o.getSupplier()+"',author = '"+o.getAuthor()+"',productName='"+name+"',unit='"+pack+"',quantity='"+quantity+"',count='"+o.getCount()+"',active='"+o.getActive()+"',stock ='"+stock+"',ean = '"+ean+"'"; 
	    return template.update(sql);
		}
	
	public void updateActive(String name) {
		// TODO Auto-generated method stub
		
	}
	
	//auto generate invoice id
	
	public List<Sale> getinvId() {
		return template.query("select max(CAST(SUBSTRING_INDEX(invoice,'-',-1) as decimal)) from saleho where invoiceDate = curdate()	",new RowMapper<Sale>(){  
	        public Sale mapRow(ResultSet rs, int row) throws SQLException {  
	            Sale s = new Sale();  
	            System.out.println(rs.getString(1));
	            s.setInvoice(rs.getString(1));
	            return s;
		}
		}); 
	}
	
	
	public List<Sale> getinvId1() {
		return template.query("select distinct(invoice) from saleho",new RowMapper<Sale>(){  
	        public Sale mapRow(ResultSet rs, int row) throws SQLException {  
	            Sale s = new Sale();  
	            System.out.println(rs.getString(1));
	            s.setInvoice(rs.getString(1));
	            return s;
		}
		}); 
	}
	
	
	//list products in sale screen
	public List<Purchase> getProducts() {
		return template.query("select ean,productName,Batch,expDate,unit,unitprice,quantity,total from purchase order by productName",new RowMapper<Purchase>(){  
	        public Purchase mapRow(ResultSet rs, int row) throws SQLException {   
		          Purchase p =new Purchase();
			      p.setEan(rs.getString(1));
			      p.setProductName(rs.getString(2));
				  p.setBatch(rs.getString(3));
			      p.setExpDate(rs.getString(4));
			      p.setUnit(rs.getString(5));
			      p.setUnitPrice(rs.getString(6));
	              p.setQuantity(rs.getString(7));
	           
	            
		   return p;
	}
		});
}
	//sales save 
	
	public int savess(Sale s,String name,String batch,String expdate,String unit, String up, String qty1, String stk1, String price1, String mpack,String mdesc,String sudesc,String ean ) {
		String sql = "insert into saleho(invoice,invoiceDate,author,cdiscount,custId,custName,custPhone,gender,age,ean,pname,batch,expDate,stock,unit,quantity,unitprice,total,titems,subt,discount,tax,gtotal,spack,spsize,sudesc,fileno) values('"+s.getInvoice()+"','"+s.getInvoiceDate()+"','"+s.getAuthor()+"','"+s.getCdiscount()+"','"+s.getCustId()+"','"+s.getCustName()+"','"+s.getCustPhone()+"','"+s.getGender()+"','"+s.getAge()+"','"+ean+"','"+name+"','"+batch+"','"+expdate+"','"+stk1+"','"+unit+"','"+qty1+"','"+up+"','"+price1+"','"+s.getTitems()+"','"+s.getSubt()+"','"+s.getDiscount()+"','"+s.getTax()+"','"+s.getGtotal()+"','"+mpack+"','"+mdesc+"','"+sudesc+"','"+s.getFileno()+"')"; 
	    return template.update(sql);
	}
	
	//TAX display in sale screen
	
	public List<TaxB> getTax() {
		return template.query("select * from tax_ho where active = 'on'",new RowMapper<TaxB>(){  
	        public TaxB mapRow(ResultSet rs, int row) throws SQLException {
	        	TaxB t = new TaxB();
	        	t.setTaxName(rs.getString(1));
	        	t.setPercentage(rs.getString(2));
	        	t.setDesc(rs.getString(3));
	        	t.setActive((rs.getString(4)));
	        	
		return t;
	        }
		});
	}
	//special discounts
	public List<Spdiscount> getSpdis() {
		return template.query("select * from spdiscountho where active = 'on'",new RowMapper<Spdiscount>(){  
	        public Spdiscount mapRow(ResultSet rs, int row) throws SQLException {
	        	Spdiscount p = new Spdiscount();
	        	p.setSpType(rs.getString(1));
	        	p.setSpDtype(rs.getString(2));
	        	p.setSpStdate(rs.getString(3));
	        	p.setSpendate(rs.getString(4));
	        	p.setSpact(rs.getString(5));
	        	p.setSpDvalue(rs.getString(6));
	        	
	        
		return p;
	        }
		});
}
	
	//display customer discounts
	public List<custDisc> getCustDis() {
		return template.query("select * from custdischo",new RowMapper<custDisc>(){  
	        public custDisc mapRow(ResultSet rs, int row) throws SQLException {
	        	custDisc d = new custDisc();
	        	d.setCustType(rs.getString(1));
	        	d.setDiscType(rs.getString(2));
	        	d.setDiscValue(rs.getString(3));
	        
	        	
	        
		return d;
	        }
		});
}
 // to list branch orderid which have been ordered.
	public List<Distribute> getBranchProducts() {
		return template.query("select branchid from distribute where branchid not in (select branchid from  distributep)",new RowMapper<Distribute>(){  
	        public Distribute mapRow(ResultSet rs, int row) throws SQLException {
	        	Distribute d = new Distribute();
	        	d.setBranchid(rs.getString(1));
	        	
	        	/*d.setProductName(rs.getString(1));
	        	d.setBatch(rs.getString(2));
	        	d.setExpdate(rs.getString(3));
	        	d.setUnit(rs.getString(4));
	        	d.setUnitprice(rs.getString(5));
	        	d.setAllocationqty(rs.getString(6));
	        	d.setReqqty(rs.getString(7));
	*/
	        return d;
	        }
		});
	}

	public int saved(Distribute d) {
	String sql = "insert into distributep (branchid,allocationid,allocationdate,productName,batch,expdate,unit,unitprice,allocationqty,reqqty,edate) values('"+d.getBranchid()+"','"+d.getAllocationid()+"','"+d.getAllocationDate()+"','"+d.getProductName()+"','"+d.getBatch()+"','"+d.getExpdate()+"','"+d.getUnit()+"','"+d.getUnitprice()+"','"+d.getAllocationqty()+"','"+d.getReqqty()+"',curdate()) ";
	return template.update(sql);
	}

	public List<Distribute> getAllocation() {
		
		return template.query("select right(max(allocationid),1) from distributep where allocationdate = curdate()	",new RowMapper<Distribute>(){  
	        public Distribute mapRow(ResultSet rs, int row) throws SQLException {  
	            Distribute d = new Distribute();  
	            System.out.println(rs.getString(1));
	            d.setAllocationid(rs.getString(1));
	            return d;
		}
		}); 
	}

	public List<Distribute> getBrdetails(Distribute d) {
		return template.query("select branchid,productName,unit,reqqty from distribute where branchid = '"+d.getBranchid()+"'",new RowMapper<Distribute>(){  
	        public Distribute mapRow(ResultSet rs, int row) throws SQLException {
	        	Distribute d = new Distribute();
	        	d.setBranchid(rs.getString(1));
	        	d.setProductName(rs.getString(2));
	        	d.setUnit(rs.getString(3));
	        	d.setReqqty(rs.getString(4));
	        	System.out.println(rs.getString(1));
	        return d;
	        }
		});
	}

	
	public int savequotation(quotation s,String name,String unit,String up, String qty1, String stk1, String price1) {
		String sql = "insert into quotation(quotation,quotationdate,author,cdiscount,custId,custName,custPhone,gender,age,ean,pname,unit,unitprice,quantity,free,stock,total,titems,subt,discount,tax,gtotal,status) values('"+s.getQuotation()+"','"+s.getQuotationDate()+"','"+s.getAuthor()+"','"+s.getCdiscount()+"','"+s.getCustId()+"','"+s.getCustName()+"','"+s.getCustPhone()+"','"+s.getGender()+"','"+s.getAge()+"','"+s.getEan()+"','"+name+"','"+s.getUnit()+"','"+up+"','"+qty1+"','"+s.getFree()+"','"+stk1+"','"+price1+"','"+s.getTitems()+"','"+s.getSubt()+"','"+s.getDiscount()+"','"+s.getTax()+"','"+s.getGtotal()+"','active') on duplicate key update quotationdate = '"+s.getQuotationDate()+"',author='"+s.getAuthor()+"',cdiscount = '"+s.getCdiscount()+"',custId='"+s.getCustId()+"',custName='"+s.getCustName()+"',custPhone='"+s.getCustPhone()+"',gender='"+s.getGender()+"',age='"+s.getAge()+"',ean='"+s.getEan()+"',pname='"+name+"',unit='"+unit+"',unitprice='"+up+"',quantity='"+qty1+"',free='NA',stock='"+stk1+"',total='"+price1+"',titems='"+s.getTitems()+"',subt='"+s.getSubt()+"',discount='"+s.getDiscount()+"',tax='"+s.getTax()+"',gtotal='"+s.getGtotal()+"' "; 
	    return template.update(sql);
	}
//get quotationid,customer on page load ;
	public List<ERPHO.quotation> getquotation() {
		return template.query("select custId,quotation from quotation",new RowMapper<quotation>(){  
	        public quotation mapRow(ResultSet rs, int row) throws SQLException {
	        	quotation q = new quotation();
	        	q.setCustId(rs.getString(1));
	        	q.setQuotation(rs.getString(2));
	        	  return q;
	        }
		});
	
	}

	 //get corresponding quotations for each customer
	public List<ERPHO.quotation> proformacust(quotation q) {
		return template.query("select custId,quotation from quotation where custId = '"+q.getCustId()+"'",new RowMapper<quotation>(){  
	        public quotation mapRow(ResultSet rs, int row) throws SQLException {
	        	quotation q = new quotation();
	        	System.out.println(rs.getString(1));
	        	q.setCustId(rs.getString(1));
	        	q.setQuotation(rs.getString(2));
	        	  return q;
	        }
		});
	
		
	}
   //get quotationid based on date
	public List<ERPHO.quotation> getquotationid() {
		return template.query("select right(max(quotation),1) from quotation where quotationdate = curdate()",new RowMapper<quotation>(){  
	        public quotation mapRow(ResultSet rs, int row) throws SQLException {
	        	quotation q = new quotation();
	        	
	        	System.out.println(rs.getString(1));
	        	q.setQuotation(rs.getString(1));
	        
	        	  return q;
	        }
		});
	}
	
	
	public List<ERPHO.quotation> updproforma(quotation q) {
		return template.query("select quotation,quotationdate,author,cdiscount,custId,custName,custPhone,gender,age,ean,pname,unit,unitprice,quantity,free,stock,total,titems,subt,discount,tax,gtotal from quotation where quotation='"+q.getQuotation()+"'",new RowMapper<quotation>(){  
	        public quotation mapRow(ResultSet rs, int row) throws SQLException {
	        	quotation q = new quotation();
	        	q.setQuotation(rs.getString(1));
	        	q.setQuotationDate(rs.getString(2));
	        	q.setAuthor(rs.getString(3));
	        	q.setCdiscount(rs.getString(4));
	        	q.setCustId(rs.getString(5));
	        	q.setCustName(rs.getString(6));
	        	q.setCustPhone(rs.getString(7));
	        	q.setGender(rs.getString(8));
	        	q.setAge(rs.getString(9));
	        	q.setEan(rs.getString(10));
	        	q.setPname(rs.getString(11));
	        	q.setUnit(rs.getString(12));
	        	q.setUnitprice(rs.getString(13));
	        	q.setQuantity(rs.getString(14));
	        	q.setFree(rs.getString(15));
	        	q.setStock(rs.getString(16));
	        	q.setTotal(rs.getString(17));
	        	q.setTitems(rs.getString(18));
	        	q.setSubt(rs.getString(19));
	        	q.setDiscount(rs.getString(20));
	        	q.setTax(rs.getString(21));
	        	System.out.println(rs.getString(22));
	        	q.setGtotal(rs.getString(22));
	        	  return q;
	        }
		});
		
	}
	//get history
	public List<ERPHO.quotation> updhistory() {
		return template.query("select quotation,quotationdate,custName,subt,discount,tax,gtotal,status from quotation",new RowMapper<quotation>(){  
	        public quotation mapRow(ResultSet rs, int row) throws SQLException {
	        	quotation q = new quotation();
	        	q.setQuotation(rs.getString(1));
	        	q.setQuotationDate(rs.getString(2));
	        	
	        	q.setCustName(rs.getString(3));
	        	
	        	q.setSubt(rs.getString(4));
	        	q.setDiscount(rs.getString(5));
	        	q.setTax(rs.getString(6));
	        	
	        	q.setGtotal(rs.getString(7));
	        	q.setStatus(rs.getString(8));
	        	  return q;
	        }
		});
		
	}
// update status as mark complete or cancelled
	public int updatestat(quotation s) {
		String sql = "update quotation set status = '"+s.getStatus()+"' where quotation='"+s.getQuotation()+"' ";
	    return template.update(sql);	
	}
	
	//get orderid and supplier

	public List<Order> getOrderid() {
		return template.query("select distinct name from supply ",new RowMapper<Order>(){  
	        public Order mapRow(ResultSet rs, int row) throws SQLException {
	        	Order o = new Order();
	        //	o.setOrderid(rs.getString(1));
	        	o.setSupplier(rs.getString(1));
	        return o;
	        }
		});
	}

	public List<Order> getOrdersupplier(Order o) {
		return template.query("select orderid from orderho",new RowMapper<Order>(){  
	        public Order mapRow(ResultSet rs, int row) throws SQLException {
	        	Order o = new Order();
	        	o.setOrderid(rs.getString(1));
	        return o;
	        }
		});
	}
	
	public List<Purchase> getAllocationid() {
		return template.query("select max(CAST(SUBSTRING_INDEX(allocationid,'-',-1) as decimal)) from purchase",new RowMapper<Purchase>(){  
	        public Purchase mapRow(ResultSet rs, int row) throws SQLException {
	        	Purchase o = new Purchase();
	        //	o.setOrderid(rs.getString(1));
	        	o.setAllocationid(rs.getString(1));
	        return o;
	        }
		});
	}

	public List<Purchase> getAllocationid1a() {
		return template.query("select distinct allocationid from purchase order by CAST(SUBSTRING_INDEX(allocationid,'-',-1) as decimal) desc",new RowMapper<Purchase>(){  
	        public Purchase mapRow(ResultSet rs, int row) throws SQLException {
	        	Purchase o = new Purchase();
	        //	o.setOrderid(rs.getString(1));
	        	o.setAllocationid(rs.getString(1));
	        return o;
	        }
		});
	}
	public List<Purchase> getsupplyorder(String s) {
		
		return template.query("select name,prc from product where supplier like '%"+s+"%' and active =  'active' ",new RowMapper<Purchase>(){  
	        public Purchase mapRow(ResultSet rs, int row) throws SQLException {
	        	Purchase o = new Purchase();
	        System.out.println("inj"+rs.getString(1));
	        	
	        	o.setProductName(rs.getString(1));
	            o.setEan(rs.getString(2));
	           System.out.println(rs.getString(1));
	        	
	        return o;
	        }
		});
	}

	public int savepurchase(Purchase p, String name, String batch, String expdate, String quantity,String unitprice, String discount, String free,String total,String ean1,String mpack, String mdesc,String sudesc ) {
		
		//discount is total purschase price
		String sql = "insert into purchase(allocationid,receiveddate,updatepricing,supplier,supplierInvoice,productName,Batch,expDate,mpack,mdesc,sudesc,quantity,discount,unitPrice,free,total,grandTotal,ean) values('"+p.getAllocationid()+"','"+p.getReceiveddate()+"','"+p.getUpdatepricing()+"','"+p.getSupplier()+"','"+p.getOrderDate()+"','"+name+"','"+batch+"','"+expdate+"','"+mpack+"','"+mdesc+"','"+sudesc+"','"+quantity+"','"+discount+"','"+unitprice+"','"+free+"','"+total+"','"+p.getGrandTotal()+"','"+ean1+"') on duplicate key update expDate='"+expdate+"',mpack='"+mpack+"',mdesc ='"+mdesc+"',sudesc = '"+sudesc+"',quantity= quantity + "+quantity+",discount='"+discount+"',unitPrice= unitPrice + "+unitprice+", free= free + "+free+",total='"+total+"',grandTotal='"+p.getGrandTotal()+"' ";
		return template.update(sql);
	}
	
	public int updateean(String name){
		String sql = "update productprice set code =(select prc from product where name='"+name+"') where name='"+name+"'";
		return template.update(sql);
	}
	public int saveproductpriceho(Purchase p,String name, String batch,String unitprice,String sp) {
		String sql = "insert into productprice(name,batch,cp,sp) values('"+name+"','"+batch+"','"+unitprice+"','"+sp+"')";
		return template.update(sql);
	}
	
	
	public int updatecatho(String name) {
		String sql = "update purchase set category = (select pc from product where name='"+name+"') where productName='"+name+"'";
		return template.update(sql);
		
	
		// TODO Auto-generated method stub
		
	}
	// save product stocks
	
	public int saveproductstockho(String ean1,String name, String batch,String expdate,String mpack,String mpsize,String cp,String prqty,String prprice,String qty,String sudesc,String stkpr,String markup,String sp,String spdesc,String spsize,String stksp,String sellqty,String sunits,String tprice) {
		System.out.println(qty);
		//mpack='"+mpack+"'
		String sql = "insert into productstock(code,name,batch,expdate,mpack,mpsize,cp,prqty,prprice,currentstock,sudesc,stkpr,markup,sp,spdesc,spsize,stksp,sellqty,sunits,tprice) values('"+ean1+"','"+name+"','"+batch+"','"+expdate+"','"+mpack+"','"+mpsize+"','"+cp+"','"+prqty+"','"+prprice+"','"+qty+"','"+sudesc+"','"+stkpr+"','"+markup+"','"+sp+"','"+spdesc+"','"+spsize+"','"+stksp+"','"+sellqty+"','"+sunits+"','"+tprice+"') on duplicate key update expdate = '"+expdate+"',mpsize='"+mpsize+"',cp='"+cp+"',prqty= '"+prqty+"',prprice='"+prprice+"',currentstock='"+qty+"',sudesc='"+sudesc+"',stkpr='"+stkpr+"',markup='"+markup+"',sp='"+sp+"',spdesc='"+spdesc+"',spsize='"+spsize+"',stksp='"+stksp+"',sellqty='"+sellqty+"',sunits='"+sunits+"',tprice='"+tprice+"'";
		return template.update(sql);
	}
	
	public int saveproductstockho1(String ean1,String name, String batch,String expdate,String mpack,String mpsize,String cp,String prqty,String prprice,String qty,String sudesc,String stkpr,String markup,String sp,String spdesc,String spsize,String stksp,String sellqty,String sunits,String tprice) {
		System.out.println(qty);
		String sql = "insert into productstock(code,name,batch,expdate,mpack,mpsize,cp,prqty,prprice,currentstock,sudesc,stkpr,markup,sp,spdesc,spsize,stksp,sellqty,sunits,tprice) values('"+ean1+"','"+name+"','"+batch+"','"+expdate+"','"+mpack+"','"+mpsize+"','"+cp+"','"+prqty+"','"+prprice+"','"+qty+"','"+sudesc+"','"+stkpr+"','"+markup+"','"+sp+"','"+spdesc+"','"+spsize+"','"+stksp+"','"+sellqty+"','"+sunits+"','"+tprice+"') on duplicate key update expdate = '"+expdate+"',mpsize='"+mpsize+"',cp='"+cp+"',prqty= '"+prqty+"',prprice='"+prprice+"',currentstock='"+qty+"',sudesc='"+sudesc+"',stkpr='"+stkpr+"',markup='"+markup+"',sp='"+sp+"',spdesc='"+spdesc+"',spsize='"+spsize+"',stksp='"+stksp+"',sellqty='"+sellqty+"',sunits='"+sunits+"',tprice='"+tprice+"'";
		return template.update(sql);
	}
	
	public int updatecatho2(String name) {
		String sql = "update productstock set category = (select pc from product where name='"+name+"') where name='"+name+"'";
		return template.update(sql);
}
	
	
	public int updatecatho1(String name) {
		String sql = "update productprice set category = (select pc from product where name='"+name+"') where name='"+name+"'";
		return template.update(sql);
		
	
		// TODO Auto-generated method stub
		
	}
	
	//product price load
	
	public List<Productprice> getInfoSearch() {
		return template.query("select code,name,batch,cp,(select pc from product where prc=code),rmp,wmp,((cp*(rmp/100))+cp) as rbsp,((cp*(wmp/100))+cp) as wbsp,sp from productprice",new RowMapper<Productprice>(){  
	        public Productprice mapRow(ResultSet rs, int row) throws SQLException {
	        	Productprice p = new Productprice();
	        	p.setCode(rs.getString(1));
	        	p.setName(rs.getString(2));
	        	p.setBatch(rs.getString(3));
	        	p.setCp(rs.getString(4));
	        	p.setCategory(rs.getString(5));
	        	p.setRmp(rs.getString(6));
	        	p.setWmp(rs.getString(7));
	        	p.setRbsp(rs.getString(8));
	        	p.setWbsp(rs.getString(9));
	            p.setSp(rs.getString(10));
		return p;
	        }
		});
}
	public List<Product> getInfoSearch1() {
		return template.query("select distinct pc from product",new RowMapper<Product>(){  
	        public Product mapRow(ResultSet rs, int row) throws SQLException {
	        	Product p = new Product();
	            p.setPc(rs.getString(1));
	        
		return p;
	        }
		});
}	
	public List<Productprice> getproSearch(Productprice ps) {
		if(ps.getCategory().equalsIgnoreCase("All"))
		{ 
			if(ps.getCode()!=null && ps.getCode()!=""){
				System.out.println("code1"+ps.getCategory());
				final String var = ps.getName();
				final String var1 = ps.getCategory();
				final int var2 = ps.getRecords();
				final String var3 = ps.getCode();
		       System.out.println(ps.getCode());
		       System.out.println(ps.getRecords());
			return template.query("select code,name,batch,cp,category,rmp,wmp,((cp*(rmp/100))+cp) as rbsp,((cp*(wmp/100))+cp) as wbsp,sp from productprice where code like '%"+ps.getCode()+"%' limit "+ps.getRecords()+"",new RowMapper<Productprice>(){  
			   public Productprice mapRow(ResultSet rs, int row) throws SQLException {
		        	Productprice p = new Productprice();
		        	System.out.println(rs.getString(1));
		        	System.out.println(rs.getString(2));
		            p.setCode(rs.getString(1));
		        	p.setName(rs.getString(2));
		        	p.setBatch(rs.getString(3));
		        	p.setCp(rs.getString(4));
		        	p.setCategory(rs.getString(5));
		        	p.setRmp(rs.getString(6));
		        	p.setWmp(rs.getString(7));
		        	p.setRbsp(rs.getString(8));
		        	p.setWbsp(rs.getString(9));
		        	p.setSp(rs.getString(10));
		            p.setName1(var);
		            p.setCategory1(var1);
		            p.setRecords(var2);
		            p.setCode1(var3);
		            
		            System.out.println(rs.getString(1));
		        	System.out.println(rs.getString(2));
			return p;
			   }
			});
			}
			
			else{
				
			System.out.println("code1"+ps.getCategory());
			final String var = ps.getName();
			final String var1 = ps.getCategory();
			final int var2 = ps.getRecords();
			final String var3 = ps.getCode();
	
		return template.query("select code,name,batch,cp,category,rmp,wmp,((cp*(rmp/100))+cp) as rbsp,((cp*(wmp/100))+cp) as wbsp,sp from productprice  where name like '%"+ps.getName()+"%' limit "+ps.getRecords()+"",new RowMapper<Productprice>(){  
		   public Productprice mapRow(ResultSet rs, int row) throws SQLException {
	        	Productprice p = new Productprice();
	        	 p.setCode(rs.getString(1));
		        	p.setName(rs.getString(2));
		        	p.setBatch(rs.getString(3));
		        	p.setCp(rs.getString(4));
		        	p.setCategory(rs.getString(5));
		        	p.setRmp(rs.getString(6));
		        	p.setWmp(rs.getString(7));
		        	p.setRbsp(rs.getString(8));
		        	p.setWbsp(rs.getString(9));
		        	p.setSp(rs.getString(10));
		            p.setName1(var);
		            p.setCategory1(var1);
		            p.setRecords(var2);
		            p.setCode1(var3);
		return p;
		   }
		});
		}
	}
		   else{
			   if(ps.getCode1()!=null && ps.getCode1()!= ""){
				   System.out.println("code2");
				   final String var = ps.getName();
					final String var1 = ps.getCategory();
					final int var2 = ps.getRecords();
					final String var3 = ps.getCode();
				    return template.query("select code,name,batch,cp,category,rmp,wmp,((cp*(rmp/100))+cp) as rbsp,((cp*(wmp/100))+cp) as wbsp,sp from productprice where ean like '%"+ps.getCode()+"%' and category ='"+ps.getCategory()+"' limit "+ps.getRecords()+"",new RowMapper<Productprice>(){  
					   public Productprice mapRow(ResultSet rs, int row) throws SQLException {
				        	Productprice p = new Productprice();
				        	System.out.println("code4");
				        	    p.setCode(rs.getString(1));
					        	p.setName(rs.getString(2));
					        	p.setBatch(rs.getString(3));
					        	p.setCp(rs.getString(4));
					        	p.setCategory(rs.getString(5));
					        	p.setRmp(rs.getString(6));
					        	p.setWmp(rs.getString(7));
					        	p.setRbsp(rs.getString(8));
					        	p.setWbsp(rs.getString(9));
					        	p.setSp(rs.getString(10));
					            p.setName1(var);
					            p.setCategory1(var1);
					            p.setRecords(var2);
					            p.setCode1(var3);
					return p; 
				  
			   }
		       
			});
			   }
			   
			   else{
				   System.out.println("code2");
				   final String var = ps.getName();
					final String var1 = ps.getCategory();
					final int var2 = ps.getRecords();
					final String var3 = ps.getCode();
			       return template.query("select code,name,batch,cp,category,rmp,wmp,((cp*(rmp/100))+cp) as rbsp,((cp*(wmp/100))+cp) as wbsp,sp from productprice where name like '%"+ps.getName()+"%' and category ='"+ps.getCategory()+"' limit "+ps.getRecords()+"",new RowMapper<Productprice>(){  
				   public Productprice mapRow(ResultSet rs, int row) throws SQLException {
						Productprice p = new Productprice();
			        	System.out.println("code4");
			        	 p.setCode(rs.getString(1));
				        	p.setName(rs.getString(2));
				        	p.setBatch(rs.getString(3));
				        	p.setCp(rs.getString(4));
				        	p.setCategory(rs.getString(5));
				        	p.setRmp(rs.getString(6));
				        	p.setWmp(rs.getString(7));
				        	p.setRbsp(rs.getString(8));
				        	p.setWbsp(rs.getString(9));
				        	p.setSp(rs.getString(10));
				            p.setName1(var);
				            p.setCategory1(var1);
				            p.setRecords(var2);
				            p.setCode1(var3);
				return p; 
			  }
	       });
		  }
		 }
	    }
	
	public int saveprPr(Productprice ps) {
		// TODO Auto-generated method stub
		String sql = "update productprice set rmp ='"+ps.getRmp()+"', cp='"+ps.getCp()+"',sp='"+ps.getSp()+"'  where name='"+ps.getName()+"' and batch ='"+ps.getBatch()+"'  ";	   
		return template.update(sql);
	      }

	//product stocks
	
	public List<Productstock> getstockSearch(Productstock ps) {
		if(ps.getCategory().equalsIgnoreCase("All") )
		{
			if( ps.getBatch()!=null && ps.getBatch()!=""){
				System.out.println("code1"+ps.getExpDate());
				final String var3 = ps.getCode();
				final String var4 = ps.getName();
				final String var5 = ps.getCategory();
				final String var6 = ps.getExpDate();
				final String var7 = ps.getToDate();
				final int var8 = ps.getRecords();
				final String var9 = ps.getBatch();
				System.out.println(ps.getRecords());
			 return template.query("select p.code,p.name,p.batch,p.expdate,p.category,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice from productstock p where p.batch like '%"+ps.getBatch()+"%' and p.expdate between '"+ps.getExpDate()+"' and '"+ps.getToDate()+"'limit "+ps.getRecords()+"",new RowMapper<Productstock>(){  
			   public Productstock mapRow(ResultSet rs, int row) throws SQLException {
		        	Productstock p = new Productstock();
		        	System.out.println("Batch"+rs.getString(1));
		        	p.setCode(rs.getString(1));
		        	p.setName(rs.getString(2));
		        	p.setBatch(rs.getString(3));
		            p.setExpDate(rs.getString(4));
		            p.setCategory(rs.getString(5));
		            p.setMpack(rs.getString(6));
		            p.setMpsize(rs.getString(7));
		            p.setCp(rs.getString(8));
		            p.setPrqty(rs.getString(9));
		            p.setPrprice(rs.getString(10));
		            p.setQuantity(rs.getString(11));
		            p.setSudesc(rs.getString(12));
		            p.setStkpr(rs.getString(13));
		            p.setMarkup(rs.getString(14));
		            p.setSp(rs.getString(15));
		            p.setSpdesc(rs.getString(16));
		            p.setSpsize(rs.getString(17));
		            p.setStksp(rs.getString(18));
		            p.setSellqty(rs.getString(19));
		            p.setSunits(rs.getString(20));
		            p.setTprice(rs.getString(21));
		        
			return p;
			   }
			});
			}
			else if(ps.getName()!=null && ps.getName()!=""){
			
				final String var3 = ps.getCode();
				final String var4 = ps.getName();
				final String var5 = ps.getCategory();
				final String var6 = ps.getExpDate();
				final String var7 = ps.getToDate();
				final int var8 = ps.getRecords();
				final String var9 = ps.getBatch();
				
			 return template.query("select p.code,p.name,p.batch,p.expdate,p.category,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice from productstock p where p.name like '%"+ps.getName()+"%'  and (p.expdate between '"+ps.getExpDate()+"' and '"+ps.getToDate()+"' ) limit "+ps.getRecords()+" ",new RowMapper<Productstock>(){  
			   public Productstock mapRow(ResultSet rs, int row) throws SQLException {
		        	Productstock p = new Productstock();
		        	System.out.println("Name"+rs.getString(1));
		        	p.setCode(rs.getString(1));
		        	p.setName(rs.getString(2));
		        	p.setBatch(rs.getString(3));
		            p.setExpDate(rs.getString(4));
		            p.setCategory(rs.getString(5));
		            p.setMpack(rs.getString(6));
		            p.setMpsize(rs.getString(7));
		            p.setCp(rs.getString(8));
		            p.setPrqty(rs.getString(9));
		            p.setPrprice(rs.getString(10));
		            p.setQuantity(rs.getString(11));
		            p.setSudesc(rs.getString(12));
		            p.setStkpr(rs.getString(13));
		            p.setMarkup(rs.getString(14));
		            p.setSp(rs.getString(15));
		            p.setSpdesc(rs.getString(16));
		            p.setSpsize(rs.getString(17));
		            p.setStksp(rs.getString(18));
		            p.setSellqty(rs.getString(19));
		            p.setSunits(rs.getString(20));
		            p.setTprice(rs.getString(21));
		        
			return p;
			   }
			});
			}
		
			else if(ps.getCode()!=null && ps.getCode()!=""){
				
			 return template.query("select p.code,p.name,p.batch,p.expdate,p.category,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice from productstock p where p.code like '%"+ps.getCode()+"%' and (p.expdate between '"+ps.getExpDate()+"' and '"+ps.getToDate()+"' ) limit "+ps.getRecords()+"",new RowMapper<Productstock>(){  
				 public Productstock mapRow(ResultSet rs, int row) throws SQLException {
			        	Productstock p = new Productstock();
		        	
		        	p.setCode(rs.getString(1));
		        	p.setName(rs.getString(2));
		        	p.setBatch(rs.getString(3));
		            p.setExpDate(rs.getString(4));
		            p.setCategory(rs.getString(5));
		            p.setMpack(rs.getString(6));
		            p.setMpsize(rs.getString(7));
		            p.setCp(rs.getString(8));
		            p.setPrqty(rs.getString(9));
		            p.setPrprice(rs.getString(10));
		            p.setQuantity(rs.getString(11));
		            p.setSudesc(rs.getString(12));
		            p.setStkpr(rs.getString(13));
		            p.setMarkup(rs.getString(14));
		            p.setSp(rs.getString(15));
		            p.setSpdesc(rs.getString(16));
		            p.setSpsize(rs.getString(17));
		            p.setStksp(rs.getString(18));
		            p.setSellqty(rs.getString(19));
		            p.setSunits(rs.getString(20));
		            p.setTprice(rs.getString(21));
		        
			return p;
			   }
			});
			}
			else{
				
				return template.query("select p.code,p.name,p.batch,p.expdate,p.category,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice from productstock p where (p.expdate between STR_TO_DATE('"+ps.getExpDate()+"', '%Y-%m-%d') and STR_TO_DATE('"+ps.getToDate()+"', '%Y-%m-%d')) limit "+ps.getRecords()+"",new RowMapper<Productstock>(){  
					 public Productstock mapRow(ResultSet rs, int row) throws SQLException {
				        	Productstock p = new Productstock();
			        
			        	p.setCode(rs.getString(1));
			        	p.setName(rs.getString(2));
			        	p.setBatch(rs.getString(3));
			            p.setExpDate(rs.getString(4));
			            p.setCategory(rs.getString(5));
			            p.setMpack(rs.getString(6));
			            p.setMpsize(rs.getString(7));
			            p.setCp(rs.getString(8));
			            p.setPrqty(rs.getString(9));
			            p.setPrprice(rs.getString(10));
			            p.setQuantity(rs.getString(11));
			            p.setSudesc(rs.getString(12));
			            p.setStkpr(rs.getString(13));
			            p.setMarkup(rs.getString(14));
			            p.setSp(rs.getString(15));
			            p.setSpdesc(rs.getString(16));
			            p.setSpsize(rs.getString(17));
			            p.setStksp(rs.getString(18));
			            p.setSellqty(rs.getString(19));
			            p.setSunits(rs.getString(20));
			            p.setTprice(rs.getString(21));
			            
			            System.out.println(rs.getString(4));
			        
				return p;
				   }
				});
				
		
			}
	}
		
		else{
			
			if( ps.getBatch()!=null && ps.getBatch()!=""){
				
				final String var3 = ps.getCode();
				final String var4 = ps.getName();
				final String var5 = ps.getCategory();
				final String var6 = ps.getExpDate();
				final String var7 = ps.getToDate();
				final int var8 = ps.getRecords();
				final String var9 = ps.getBatch();
				
			 return template.query("select p.code,p.name,p.batch,p.expdate,p.category,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice from productstock p where p.batch like '%"+ps.getBatch()+"%' and p.category = '"+ps.getCategory()+"' and (p.expdate between '"+ps.getExpDate()+"' and '"+ps.getToDate()+"' ) limit "+ps.getRecords()+"",new RowMapper<Productstock>(){  
				 public Productstock mapRow(ResultSet rs, int row) throws SQLException {
			        	Productstock p = new Productstock();
		        	System.out.println(rs.getString(1));
		        	p.setCode(rs.getString(1));
		        	p.setName(rs.getString(2));
		        	p.setBatch(rs.getString(3));
		            p.setExpDate(rs.getString(4));
		            p.setCategory(rs.getString(5));
		            p.setMpack(rs.getString(6));
		            p.setMpsize(rs.getString(7));
		            p.setCp(rs.getString(8));
		            p.setPrqty(rs.getString(9));
		            p.setPrprice(rs.getString(10));
		            p.setQuantity(rs.getString(11));
		            p.setSudesc(rs.getString(12));
		            p.setStkpr(rs.getString(13));
		            p.setMarkup(rs.getString(14));
		            p.setSp(rs.getString(15));
		            p.setSpdesc(rs.getString(16));
		            p.setSpsize(rs.getString(17));
		            p.setStksp(rs.getString(18));
		            p.setSellqty(rs.getString(19));
		            p.setSunits(rs.getString(20));
		            p.setTprice(rs.getString(21));
		        
			return p;
			   }
			});
			}
			else if(ps.getName()!=null && ps.getName()!=""){
				
				final String var3 = ps.getCode();
				final String var4 = ps.getName();
				final String var5 = ps.getCategory();
				final String var6 = ps.getExpDate();
				final String var7 = ps.getToDate();
				final int var8 = ps.getRecords();
				final String var9 = ps.getBatch();
				
			 return template.query("select p.code,p.name,p.batch,p.expdate,p.category,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice from productstock p where p.name like '%"+ps.getName()+"%' and p.category = '"+ps.getCategory()+"' and (p.expdate between '"+ps.getExpDate()+"' and '"+ps.getToDate()+"') limit "+ps.getRecords()+" ",new RowMapper<Productstock>(){  
				 public Productstock mapRow(ResultSet rs, int row) throws SQLException {
			        	Productstock p = new Productstock();
		        	System.out.println(rs.getString(1));
		        	p.setCode(rs.getString(1));
		        	p.setName(rs.getString(2));
		        	p.setBatch(rs.getString(3));
		            p.setExpDate(rs.getString(4));
		            p.setCategory(rs.getString(5));
		            p.setMpack(rs.getString(6));
		            p.setMpsize(rs.getString(7));
		            p.setCp(rs.getString(8));
		            p.setPrqty(rs.getString(9));
		            p.setPrprice(rs.getString(10));
		            p.setQuantity(rs.getString(11));
		            p.setSudesc(rs.getString(12));
		            p.setStkpr(rs.getString(13));
		            p.setMarkup(rs.getString(14));
		            p.setSp(rs.getString(15));
		            p.setSpdesc(rs.getString(16));
		            p.setSpsize(rs.getString(17));
		            p.setStksp(rs.getString(18));
		            p.setSellqty(rs.getString(19));
		            p.setSunits(rs.getString(20));
		            p.setTprice(rs.getString(21));
		        
			return p;
			   }
			});
			}
		
			else if(ps.getCode()!=null && ps.getCode()!=""){
				
			
				
			 return template.query("select p.code,p.name,p.batch,p.expdate,p.category,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice from productstock p where p.code like '%"+ps.getCode()+"%' and p.category = '"+ps.getCategory()+"'and (p.expdate between '"+ps.getExpDate()+"' and '"+ps.getToDate()+"') limit "+ps.getRecords()+"",new RowMapper<Productstock>(){  
				 public Productstock mapRow(ResultSet rs, int row) throws SQLException {
			        	Productstock p = new Productstock();
		        	System.out.println("insd code" +rs.getString(1));
		        	p.setCode(rs.getString(1));
		        	p.setName(rs.getString(2));
		        	p.setBatch(rs.getString(3));
		            p.setExpDate(rs.getString(4));
		            p.setCategory(rs.getString(5));
		            p.setMpack(rs.getString(6));
		            p.setMpsize(rs.getString(7));
		            p.setCp(rs.getString(8));
		            p.setPrqty(rs.getString(9));
		            p.setPrprice(rs.getString(10));
		            p.setQuantity(rs.getString(11));
		            p.setSudesc(rs.getString(12));
		            p.setStkpr(rs.getString(13));
		            p.setMarkup(rs.getString(14));
		            p.setSp(rs.getString(15));
		            p.setSpdesc(rs.getString(16));
		            p.setSpsize(rs.getString(17));
		            p.setStksp(rs.getString(18));
		            p.setSellqty(rs.getString(19));
		            p.setSunits(rs.getString(20));
		            p.setTprice(rs.getString(21));
		        
			return p;
			   }
			});
			}
			
			else{
				
				return template.query("select p.code,p.name,p.batch,p.expdate,p.category,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice from productstock p where p.category = '"+ps.getCategory()+"' and (p.expdate between STR_TO_DATE('"+ps.getExpDate()+"', '%Y-%m-%d')  and STR_TO_DATE('"+ps.getToDate()+"', '%Y-%m-%d')) limit "+ps.getRecords()+"",new RowMapper<Productstock>(){  
					 public Productstock mapRow(ResultSet rs, int row) throws SQLException {
				        	Productstock p = new Productstock();
			        
			        	p.setCode(rs.getString(1));
			        	p.setName(rs.getString(2));
			        	p.setBatch(rs.getString(3));
			            p.setExpDate(rs.getString(4));
			            p.setCategory(rs.getString(5));
			            p.setMpack(rs.getString(6));
			            p.setMpsize(rs.getString(7));
			            p.setCp(rs.getString(8));
			            p.setPrqty(rs.getString(9));
			            p.setPrprice(rs.getString(10));
			            p.setQuantity(rs.getString(11));
			            p.setSudesc(rs.getString(12));
			            p.setStkpr(rs.getString(13));
			            p.setMarkup(rs.getString(14));
			            p.setSp(rs.getString(15));
			            p.setSpdesc(rs.getString(16));
			            p.setSpsize(rs.getString(17));
			            p.setStksp(rs.getString(18));
			            p.setSellqty(rs.getString(19));
			            p.setSunits(rs.getString(20));
			            p.setTprice(rs.getString(21));
			        
				return p;
				   }
				});
				
		
			}
			
		}
			
		
	
	}
	
	
	public List<Productstock> getInfoStkSearch() {
		return template.query("select p.code,p.name,p.batch,p.expdate,p.category,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice from productstock p order by p.name ",new RowMapper<Productstock>(){  
			public Productstock mapRow(ResultSet rs, int row) throws SQLException {
	        	Productstock p = new Productstock();
	        	p.setCode(rs.getString(1));
	        	p.setName(rs.getString(2));
	        	p.setBatch(rs.getString(3));
	            p.setExpDate(rs.getString(4));
	            p.setCategory(rs.getString(5));
	            p.setMpack(rs.getString(6));
	            p.setMpsize(rs.getString(7));
	            p.setCp(rs.getString(8));
	            p.setPrqty(rs.getString(9));
	            p.setPrprice(rs.getString(10));
	            p.setQuantity(rs.getString(11));
	            p.setSudesc(rs.getString(12));
	            p.setStkpr(rs.getString(13));
	            p.setMarkup(rs.getString(14));
	            p.setSp(rs.getString(15));
	            p.setSpdesc(rs.getString(16));
	            p.setSpsize(rs.getString(17));
	            p.setStksp(rs.getString(18));
	            p.setSellqty(rs.getString(19));
	            p.setSunits(rs.getString(20));
	            p.setTprice(rs.getString(21));
	        
		return p;
	        }
		});
}
	  public int saveprStks(Productstock ps) {
			// TODO Auto-generated method stub
		    	  System.out.println("Batch" +ps.getBatch());
			String sql = "update productstock set currentstock ='"+ps.getCstock()+"',expdate='"+ps.getExpDate()+"' where code='"+ps.getCode()+"' and name='"+ps.getName()+"' and batch='"+ps.getBatch()+"' ";	   
			return template.update(sql);
		      }

/*
	      public int saveprStks(Productstock ps) {
		// TODO Auto-generated method stub
	    	  System.out.println("Batch" +ps.getBatch());
		String sql = "update productstock set currentstock ='"+ps.getCstock()+"',expdate='"+ps.getExpDate()+"' where code='"+ps.getCode()+"' and name='"+ps.getName()+"' and batch='"+ps.getBatch()+"' ";	   
		return template.update(sql);
	      }
*/
		public List<Sale> getsaleInv(String invoice) {
			
			return template.query("select s.invoice,s.invoiceDate,s.author,s.cdiscount,s.custId,s.custName,s.custPhone,s.gender,s.age,s.ean,s.pname,s.batch,s.expDate,s.unit,s.unitprice,s.quantity,s.free,ps.currentstock,s.total,s.titems,s.subt,s.discount,s.tax,s.gtotal,s.spack,s.spsize,s.sudesc,s.fileno from saleho s join productstock ps on s.pname = ps.name and  s.batch = ps.batch  where invoice ='"+invoice+"' and ps.batch = s.batch",new RowMapper<Sale>(){  
		        public Sale mapRow(ResultSet rs, int row) throws SQLException {
		        	Sale s= new Sale();
		        
		        	s.setInvoice(rs.getString(1));
		        	s.setInvoiceDate(rs.getString(2));
		        	s.setAuthor(rs.getString(3));
		        	s.setCdiscount(rs.getString(4));
		        	s.setCustId(rs.getString(5));
		        	s.setCustName(rs.getString(6));
		        	s.setCustPhone(rs.getString(7));
		        	s.setGender(rs.getString(8));
		        	s.setAge(rs.getString(9));
		        	s.setEan(rs.getString(10));
		        	s.setPname(rs.getString(11));
		        	s.setBatch(rs.getString(12));
		        	s.setExpDate(rs.getString(13));
		        	s.setUnit(rs.getString(14));
		        	s.setUnitprice(rs.getString(15));
		        	s.setQuantity(rs.getString(16));
		        	s.setFree(rs.getString(17));
		        	s.setStock(rs.getString(18));
		        	s.setTotal(rs.getString(19));
		        	s.setTitems(rs.getString(20));
		        	s.setSubt(rs.getString(21));
		        	s.setDiscount(rs.getString(22));
		        	s.setTax(rs.getString(23));
		        	s.setGtotal(rs.getString(24));
		        	s.setSdesc(rs.getString(25));
		        	s.setSpsize(rs.getString(26));
		        	s.setSudesc(rs.getString(27)) ;
		        	s.setFileno(rs.getString(28));
			// TODO Auto-generated method stubinvoice,invoiceDate,author,cdiscount,custId,custName,custPhone,gender,age,ean,pname,batch,expDate,unit,unitprice,quantity,free,stock,total,titems,subt,discount,tax,gtotal
		            return s;
		        }
			});
		
		}
		
		//print purchase
		
	public List<Purchase> getPrpur(String invoice) {
			
			return template.query("select s.allocationid,s.receiveddate,s.productName,s.Batch,s.expDate,s.quantity,s.unitprice,s.discount,s.total,s.ean,s.grandTotal,s.supplierInvoice,s.mpack,s.mdesc,s.sudesc,s.free,s.supplier from purchase s where allocationid ='"+invoice+"'",new RowMapper<Purchase>(){  
		        public Purchase mapRow(ResultSet rs, int row) throws SQLException {
		        	Purchase s= new Purchase();
		        
		        	s.setAllocationid(rs.getString(1));
		        	s.setReceiveddate(rs.getString(2));
		        	s.setProductName(rs.getString(3));
		        	s.setBatch1(rs.getString(4));
		        	s.setExpDate(rs.getString(5));
		        	s.setQuantity(rs.getString(6));
		        	s.setUnitPrice(rs.getString(7));
		        	s.setDiscount(rs.getString(8));
		        	s.setTotal(rs.getString(9));
		        	s.setEan(rs.getString(10));
		        	s.setGrandTotal(rs.getString(11));
		        	s.setSupplier(rs.getString(12));
		        	s.setMpack(rs.getString(13));
		        	s.setMdesc(rs.getString(14));
		        	s.setSudesc(rs.getString(15));
		        	s.setTaxes(rs.getString(16));
		        	s.setSinvoice(rs.getString(17));
			// TODO Auto-generated method stubinvoice,invoiceDate,author,cdiscount,custId,custName,custPhone,gender,age,ean,pname,batch,expDate,unit,unitprice,quantity,free,stock,total,titems,subt,discount,tax,gtotal
		            return s;
		        }
			});
		
		}
		//select pr.Batch,pr.expDate,unit,unitprice,(select sum(currentstock) from productstock where productstock.batch=purchase.Batch),total,(select sum(sp) from productprice where productprice.batch=purchase.Batch) from purchase where productName='"+user3+"' and quantity > 0
		public List<Sale> getinvprods(String user3) {
			return template.query("select pr.Batch,ps.expDate,ps.spdesc,ps.spsize,ps.currentstock,ps.sudesc,ps.sp,ps.cp,ps.sellqty,ps.sunits from purchase pr left outer join productstock ps on pr.productName = ps.name  where ps.name = '"+user3+"' and ps.currentstock <> 0 and ps.expdate >= curdate() and pr.batch = ps.batch and pr.mpack = ps.mpack",new RowMapper<Sale>(){
		        public Sale mapRow(ResultSet rs, int row) throws SQLException {  
		            Sale s=new Sale();  
		      //      System.out.println(rs.getString(2));
		            
		            s.setBatch(rs.getString(1));
		            s.setExpDate(rs.getString(2));
		            s.setSdesc(rs.getString(3));
		            s.setSpsize(rs.getString(4));
		            s.setQuantity(rs.getString(5));
		            s.setSudesc(rs.getString(6));
		            s.setUnitprice(rs.getString(7));
		            s.setFree(rs.getString(8));
		            s.setStock(rs.getString(9));
		            s.setUnit(rs.getString(10));
		          return s;
			
		}
			 }); 
		}
		
		
		public List<Sale> getinvprods1(String user3) {
			return template.query("select Batch,expDate,unit,unitprice,quantity,total from purchase where productName='"+user3+"' and quantity > 0",new RowMapper<Sale>(){
		        public Sale mapRow(ResultSet rs, int row) throws SQLException {  
		            Sale s=new Sale();  
		      //      System.out.println(rs.getString(2));
		            
		            s.setBatch(rs.getString(1));
		            s.setExpDate(rs.getString(2));
		            s.setUnit(rs.getString(3));
		            s.setUnitprice(rs.getString(4));
		            s.setQuantity(rs.getString(5));
		            s.setTotal(rs.getString(6));
		          return s;
			
		}
			 }); 
		}
		
		public int update(String name, String stk,String batch) {
			// TODO Auto-generated method stub
	       String sql = "update productstock set currentstock = currentstock - '"+stk+"' where name='"+name+"' and batch='"+batch+"'";	
	       return template.update(sql);
		}
		
	/*
	public List<Distribute> getBranchProductsDetails() {
		return template.query("select branchid,productName,unit,quantity from distribute",new RowMapper<Distribute>(){  
	        public Distribute mapRow(ResultSet rs, int row) throws SQLException {
	        	Distribute d = new Distribute();
	        	d.setBranchid(rs.getString(1));
	        	d.setAllocationid(rs.getString(2));
	        	/*d.setProductName(rs.getString(1));
	        	d.setBatch(rs.getString(2));
	        	d.setExpdate(rs.getString(3));
	        	d.setUnit(rs.getString(4));
	        	d.setUnitprice(rs.getString(5));
	        	d.setAllocationqty(rs.getString(6));
	        	d.setReqqty(rs.getString(7));
	
	        return d;
	        }
		});
	}

	*/
		public int deletepr(String orderid,String drug) {
			
			String sql = "delete from orderho where orderid = '"+orderid+"' and ean like '%"+drug+"%'";
			return template.update(sql);
		}
		
		//display sales reports
		
public List<Sale> getsaleReports(String frdate,String edate) {
			
			return template.query("select s.invoice,s.invoiceDate,s.custName,s.discount,s.tax,s.gtotal from saleho s where s.invoicedate between '"+frdate+"' and '"+edate+"'",new RowMapper<Sale>(){  
		        public Sale mapRow(ResultSet rs, int row) throws SQLException {
		        	Sale s= new Sale();
		        
		        	s.setInvoice(rs.getString(1));
		        	s.setInvoiceDate(rs.getString(2));
		            s.setCustName(rs.getString(3));
		        	s.setDiscount(rs.getString(4));
		        	s.setTax(rs.getString(5));
		        	s.setGtotal(rs.getString(6));
		        
		       
			// TODO Auto-generated method stubinvoice,invoiceDate,author,cdiscount,custId,custName,custPhone,gender,age,ean,pname,batch,expDate,unit,unitprice,quantity,free,stock,total,titems,subt,discount,tax,gtotal
		            return s;
		        }
			});
		
		}

public List<Productstock> getBatdet(String batch) {
	return template.query("select p.batch,p.expdate,p.mpsize,p.cp from productstock p where p.batch = '"+batch+"'",new RowMapper<Productstock>(){  
		public Productstock mapRow(ResultSet rs, int row) throws SQLException {
        	Productstock p = new Productstock();
        
        	p.setBatch(rs.getString(1));
            p.setExpDate(rs.getString(2));
            p.setMpsize(rs.getString(3));
            p.setCp(rs.getString(4));
         
      
	return p;
        }
	});
}

}
