<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMS Wedge</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/google.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>

<style type="text/css">
.wrapper {
	width : 1350px;
	background : #eee;
	height: 700px;
	font-family: 'Open Sans', 'Droid Sans';
	
}
input[type="button"]{
 font-family: "Verdana","sans-serif";
}
#well{
	background : #009999;
	
}
.buttonimg{
    width:auto;
    height:auto;
}
.button2{
	float : right;
}

.button1{
	float : left;
}

.rightspace{
margin-right:30px;
margin-top: 2px;
}
.left{
margin-left:10px;
}

form h1 {
  font-size: 18px;
  background: #009999 none repeat scroll 0% 0%;
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

form {
  border-radius: 5px;
  max-width:1000px;
  width:100%;
  margin: 5% auto;
  background-color: #FFFFFF;
  overflow: hidden;
}

.bouton-contact{
  background-color: #81BDA4;
  color: #FFF;
  text-align: center;
  width: 100%;
  border:0;
  padding: 17px 25px;
  border-radius: 0px 0px 5px 5px;
  cursor: pointer;
  margin-top: 40px;
  font-size: 18px;
}

p span {
  color: #F00;
}

p {
  margin: 0px;
  font-weight: 500;
  line-height: 2;
  color:#333;
}

</style>
<script type="text/javascript">
function checkhome(user){
	//document.getElementById("bc").style.display = "none";

	if(user.includes("dbfdesk")){
		 var url = "/HMS/frontdesk" ;
			
	//	 var element = document.getElementById('ho');
	//	 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		
	//	 var element = document.getElementById('ho');
	//	 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
	
		 var url = "/HMS/frontdesk" ;
		 $('#sp').empty();
			
	//	 var element = document.getElementById('ho');
	//	 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_Accounts Admin]")){
		
		 var url = "/HMS/frontdesk" ;
		 $('#sp').empty();
	//	 var element = document.getElementById('ho');
	//	 element.setAttribute("href",url)
		 
		 
	}
	else{
		 var url = "/HMS/home" ;
			
	//	 var element = document.getElementById('ho');
	//	 element.setAttribute("href",url)
	}
}
function check(str){
	
	
	if (str == "" || str == null){
    	
		
		
		id = 1;
		var str1 = "P-";
	    var m = moment().format("DDMMYYYY-");
	   
		var str3 = id;
		var res = str1.concat(m);
		var res1 = res.concat(str3);
		document.getElementById("pid").value = res1;
		document.getElementById("regdate").value = n;

		
    	//alert(res1);
	}
	else {
		
	
		
		var id = str;
		
		var ida = Number(id) + 1;
	
		var str1 = "P-";
		var m = moment().format("DDMMYYYY-");
		 var n = moment().format("YYYY-MM-DD");
		var str3 = ida;
		var res = str1.concat(m);
		var res1 = res.concat(str3);
		document.getElementById("pid").value = res1;
		document.getElementById("regdate").value = n;
	
	//	alert(res1);
	}
}


function clos(){
	window.location.reload();
}

function myconfirm()
{
 var r = confirm("Do you want to Logout?");
 if(r== true)
 {
 window.location="/HMS/logout";
 }
 else
 {
   return false;
 }
}
</script>
 <script type="text/javascript">
       function doAjaxPost() {
    	   // get the form values
    	   
    	         //  var name = $('#pname').val();
    	         
    	           $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/patientid",
    	        	        
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           
    	        	           success: function(response){
    	        	        	  
    	        	        	   $.each(response, function(index, datec) {
    	        	                  //to print name of employee
    	        	                   if (datec.pid == "" || datec.pid == null){
    	        	                   	
    	        	               		
    	        	               		
    	        	               		id = 1;
    	        	               		var str1 = "P-";
    	        	               	    var m = moment().format("DDMMYYYY-");
    	        	               	   
    	        	               		var str3 = id;
    	        	               		var res = str1.concat(m);
    	        	               		var res1 = res.concat(str3);
    	        	               		document.getElementById("pid").value = res1;
    	        	               		

    	        	               		
    	        	                   	//alert(res1);
    	        	               	}
    	        	               	else {
    	        	               		
    	        	             
    	        	               		
    	        	               		var id = datec.pid;
    	        	               		
    	        	               		var ida = Number(id) + 1;
    	        	               	
    	        	               		var str1 = "P-";
    	        	               		var m = moment().format("DDMMYYYY-");
    	        	               		
    	        	               		var str3 = ida;
    	        	               		var res = str1.concat(m);
    	        	               		var res1 = res.concat(str3);
    	        	               		
    	        	               		document.getElementById("pid").value = res1;
    	        	               	
    	        	               	//	alert(res1);
    	        	               	}
    	        	                  var n = moment().format("YYYY-MM-DD");
    	        	                  document.getElementById("regdate").value = n;
    	        	                  $('#myModal').modal('show');
    	        	               });    
    	        	           },
    	        	           error: function(e){
    	        	        	  
    	        	        	           alert('Error: ' + e);
    	        	        	  
    	        	        	           }
    	        	        	           });
    	        	        	   
    	        	        	           }

       </script>

</head>
  <sec:authentication property="principal.authorities" var="username" />
<body onload = "checkhome('<c:out value="${username}" />')" >
<div class= "wrapper">
<br>
<font color="#228B22" class="left" >Welcome : ${pageContext.request.userPrincipal.name}  </font>   <i style="font-size:20px; align: right;color : #228B22" class="fa fa-cog" ></i> 

<i class='fa fa-sign-out button2 rightspace' style='font-size:20px;color : #228B22'  onclick="return myconfirm()"></i>
<span id='sp'><i class="fa fa-arrow-left button2 rightspace" id="arr" style="font-size:20px;color : #228B22" onclick="window.location.href='/HMS/home';"></i></span>
<div class="well well-lg" id="well"> <center><h4><font color="white">CMS Wedge</font></h4></center></div>

 <div class ="container" >
 <div class="row text-center">
 
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/patient Registrations.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/patient.html';" value="Patient Registration"></figcaption>
      </figure>
    </div>
  
    
   
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Hospital inventory.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/hospital.html';"  value="Hospital Inventory"></figcaption>
      </figure>
    </div>  
 
 
 <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Bill Generate.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/billgen.html';"  value="Generate Bill"></figcaption>
      </figure>
    </div>
    
     
   <!--   
   
    -->
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/appointment.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/cappointment.html';" value="Appointments"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Admission.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/admitpat.html';"value="Admissions"></figcaption>
      </figure>
    </div>
    
      <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Summary.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/discharge.html';" value="View Summary"></figcaption>
      </figure>
    </div>
    </div>
 <br>
 <div class="row text-center">
 
 
    
    <!--  
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Doctorvisits.png'/>"/><br><br>
      <figcaption><input type="button"  onclick="location.href='/HMS/prescription.html';" value="Doctor Activity"></figcaption>
      </figure>
    </div>
    -->
  
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Bill Configuration.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/billconfig.html';" value="Bill Configuration"></figcaption>
      </figure>
    </div>
 
  <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/emergency.png'/>"/><br><br>
      <figcaption><input type="button"  onclick="doAjaxPost()" value="Emergency Care"></figcaption>
      </figure>
    </div>
 
 
 <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Print Prescription.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/prdocs'" value="Print Documents"></figcaption>
      </figure>
    </div>
    <!-- 
 <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/pharmacy product.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/hmspharma';" value="Pharmacy"></figcaption>
      </figure>
    </div>   
    
   -->  
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Lab Tests Icon.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/labup';" value="Lab Tests"></figcaption>
      </figure>
    </div>
   </div>
   
   
   <br>
   
    <div class="row text-center">
    

</div>
 </div>
 <br>
   
 

</div>

<div class="modal fade" id="myModal" role="dialog">
 <form id="form1" action="saveP.html" method="post">  
  
        <h1>
         <button id="bouton-contact" type="submit" class="btn btn-warning button1" >
	  <span class="fa fa-save"></span> Save Patient</button>
     <font size="5">Emergency Care</font>
         <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>    
       </h1>
       <br>
       
          <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  
   <div class="form-group">
    
            <p>First Name <span>*</span></p>
         	<input type="text" name="fname" id="fname" class="form-control input-sm"  required>
	
	</div>
 
  </div>
  
   <div class="col-xs-4">
    <div class="form-group">
            <p>Middle Name <span></span></p>
         	<input type="text" name="mname" id="mname" class="form-control input-sm"   >
</div>
    </div>
  
   <div class="col-xs-3">
  <div class="form-group">
            <p>Last Name <span>*</span></p>
     <input type="text" name="lname" id="lname" class="form-control input-sm"  required>

	</div>
  </div>
       <input type="hidden" name="pid" id="pid">
       <input type="hidden" name="regdate" id="regdate">
       <input type="hidden" name="pofvisit" id="pofvisit" value="Emergency">
       
 
</div>
   <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  
   <div class="form-group">
    
            <p>NRC No or Passport No <span></span></p>
         	<input type="text" name="ssn" id="ssn" class="form-control input-sm"  >
	
	</div>
 
  </div>
  
   <div class="col-xs-4">
    <div class="form-group">
            <p>Mobile Phone <span>*</span></p>
         	<input type="text" name="mobile" id="mobile" class="form-control input-sm" required>
</div>
    </div>
  
   <div class="col-xs-3">
  <div class="form-group">
            <p>Address <span></span></p>
     <input type="text" name="address1" id="address1" class="form-control input-sm"  >

	</div>
  </div>
       
 
</div>
   <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  
   <div class="form-group">
    
            <p>Country <span></span></p>
         	
         	<input type="text" class="form-control input-sm" name="country" id="country">
	
	</div>
 
  </div>
  
   <div class="col-xs-4">
    <div class="form-group">
            <p>Province <span></span></p>
         	    	<input type="text" class="form-control input-sm" name="state" id="state">
</div>
    </div>
  
   <div class="col-xs-3">
  <div class="form-group">
            <p>City<span></span></p>
    	    	<input type="text" class="form-control input-sm" name="city" id="city">
	</div>
  </div>
       
 
</div>
   <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  
   <div class="form-group">
    
            <p>PO Box <span></span></p>
         	<input type="text" name="pcode" id="pcode" class="form-control input-sm" >
	
	</div>
 
  </div>
  
  
       
 
</div>
       <button type="" class="bouton-contact"></button>
       </form>
</div>
 
</body>
</html>