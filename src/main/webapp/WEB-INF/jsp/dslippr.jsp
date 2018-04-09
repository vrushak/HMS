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
<title>CMS Wedge </title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">

<link rel='stylesheet' href='<c:url value="/resources/css/drprint.css" />' type='text/css' media='print' />
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>

<style>
.wrapper {
  height : auto;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
}


#form1 h1 {
  font-size: 18px;
  background: #009999 none repeat scroll 0% 0%;
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form1 {
  border-radius: 5px;
  max-width:1000px;
  width:100%;
  margin: 5% auto;
  margin-top :  1cm;
  background-color: #FFFFFF;
  overflow: hidden;
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

h1 {
  text-align:center; 
  color: #666;
  text-shadow: 1px 1px 0px #FFF;
  margin:50px 0px 0px 0px
}


a {
  text-decoration:inherit
}

.textarea{
height : 100px;
width : 800px;
border:1px solid;
overflow  : auto;
border-color:rgb(204, 204, 204);
}

.tds{
	width : 200px;
}

#a{
 margin-left : 140px; 
 }
 #b{
 margin-left : 190px; 
 }
 
 #c{
 margin-left : 70px; 
 }
  #d{
 margin-left : 70px; 
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


#myTable{
margin-left :20px;
}

#myTable th {
    background-color: #009999;
    color: black;
}

.table-fixed{
 
}

   #myTable .tbody{
    height:150px;
    overflow-y:auto;
 }
 #myTable thead,.tbody{
  
    display:block;
  }
  thead,tbody{
  
    display:block;
  }

modal-body{
	background-color: #eaeaea;
	height:auto;
	width: auto;
}  

.button1{
	float : left;
}
.button2{
	float : right;
}

.delete{
	width :50px;
}

#col3{
margin-left: 80px; 
border-style : groove;
border-radius : 10px;
width : 1100px;
}
/* Tablet Landscape */
@media screen and (max-width: 1060px) {
    #primary { width:67%; }
    #secondary { width:30%; margin-left:3%;}  
}
/* Tabled Portrait */
@media screen and (max-width: 768px) {
    #primary { width:100%; }
    #secondary { width:100%; margin:0; border:none; }
}



</style>
<script type="text/javascript">
function checkhome(user){
	document.getElementById("hds").style.display = "none";
	 var m = moment().format("DD-MM-YYYY");
//	document.getElementById("admdate").value= m;
	
	if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 $('#back').hide();
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
	
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 $('#back').hide();
	}
	else if(user.includes("[ROLE_DOCTOR]")){
		
		 var url = "/HMS/doctor1" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 $('#back').hide();
	}

	else if(user.includes("[ROLE_Accounts Admin]")){
		
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 $('#back').hide();
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 $('.prdocs').hide();
	}
}

function addcname(getval){
	var myname = getval.getAttribute('data-value');
	var strSplit = myname.split('=');

	document.getElementById("pid2").value = strSplit[0];
	  
	   
	 //  $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
	  // $("#pname").selectpicker("refresh");
	   
	  
	 //document.getElementById("pname1").disabled = true; 
	// document.getElementById("bouton-contact").disabled = true; 
	 
	   
	 //  document.getElementById("pname").value = strSplit[1];

	   
	  
	   document.getElementById("dname1").value = strSplit[2];
	 
	   document.getElementById("docid").value = strSplit[3];
	  
	   document.getElementById("admdate").value = strSplit[4];

	   
	   document.getElementById("disdate").value = strSplit[5];
	 
	   document.getElementById("admitno").value = strSplit[6];

	   document.getElementById("fileno1").value = strSplit[7];
   
	   document.getElementById("wardno").value = strSplit[8];
	   
	   document.getElementById("age").value = strSplit[9];
	   
	   document.getElementById("gender").value = strSplit[10];
	  
	   document.getElementById("revisit").value =strSplit[11];
	  
	   document.getElementById("ec").value = strSplit[12];
	   
	   document.getElementById("amno").value = strSplit[13];
	  
	   document.getElementById("treatment").innerHTML = strSplit[14].replace('\n', '<br>');
		  // document.getElementById("dissum").value = dissum;
		  
	  document.getElementById("investigation").innerHTML = strSplit[16].replace('\n', '<br>');
		   
      document.getElementById("management").innerHTML = strSplit[17].replace('\n', '<br>');
   
}


function disp(){

	var x = document.getElementById("pname").value;
	//alert(x)
	if(x == "select"){
		
		alert("please select the Patient Name ");
		return false;
	}
	else{
	document.getElementById("hds").style.display = "block";
	document.getElementById("close").style.display = "none";
	document.getElementById("investigation").style.height = "auto";	//document.getElementById("di").style.display = "none";
	window.print();
	document.getElementById("close").style.display = "block";
	document.getElementById("hds").style.display = "none";
	document.getElementById("investigation").style.height = "100px";
//	document.getElementById("di").style.display = "block";
}
}
</script>

	<script type="text/javascript">
	
	$(document).on('keydown', function(e) {
	    if(e.ctrlKey && (e.key == "p" || e.charCode == 16 || e.charCode == 112 || e.keyCode == 80) ){
	       // alert("Please use the Print PDF button above for a better rendering on the document");
	        disp();
	        e.cancelBubble = true;
	        e.preventDefault();

	        e.stopImmediatePropagation();
	    }  
	  
	});
	
	
	
	
	</script>
 

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload = "checkhome('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Print Discharge Slip</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
       <li class="prdocs"><a href="/HMS/prdocs" >Print Documents</a></li>
 <li class="dropdown back" id="back">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Quick Access
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/HMS/staff">Staff Details</a></li>
          <li><a href="/HMS/doctor1">Doctor View</a></li>
          <li><a href="/HMS/nursedesk">Nurse Station</a></li>
          <li><a href="/HMS/frontdesk">Front Desk</a></li>
          <li><a href="/HMS/prdocs" >Print Documents</a></li>
        </ul>
      </li>      
    </ul>
  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1>
	
	
<font size="5">Discharge Slip</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
   <button type="button" id="close" class="btn btn-warning button2" onclick="return disp()">Print</button>    
      
		</h1>
	<div class="form-group row" >
 <div class="col-xs-1"></div>
  <div class="col-xs-3">
    <figure>
       <img src="<c:url value='/Images/logocms.jpg'/>"/>
       </figure>
  </div>
  <div class="col-xs-3"></div>
  <div class="col-xs-5" contenteditable="true" id="dstxt">
   <h4><b>LILAYI FAMILY CLINIC</b></h4>
   <h5>Plot 4014A,Lusaka-Zambia,P.O Box 32680,</h5>
   <h5>Contact: +260 962 151 935</h5>
   <h5>E-mail : lilayifamilyclinic@yahoo.com</h5>

  
  </div>
 
 
</div>	
	
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Patient Name<span></span></p>
             <select class="selectpicker form-control" data-size="6" data-live-search="true"name = "pname" id ="pname" onchange="addcname(this.options[this.selectedIndex])"    required>
          <option value="select" selected disabled>Select</option>
        <c:forEach var="p1"  items="${model.list2}">
        <option data-subtext="${p1.fileno},${p1.admitno}" value="${p.pname}" data-value="${p1.pid}=${p1.pname}=${p1.dname}=${p1.docid}=${p1.admdate}=${p1.disdate}=${p1.admitno}=${p1.fileno}=${p1.wardno}=${p1.age}=${p1.gender}=${p1.revisit}=${p1.ec}=${p1.amno}=${p1.treatment}=${p1.dissum}=${p1.investigation}=${p1.management}">${p1.pname}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  
   <div class="col-xs-3">
  <div class="form-group">
 <p>Patient Id<span></span></p>
  <input type="text" name="pid" id="pid2" form="formd" class="form-control input-sm" readonly="readonly" required>
  </div>
  </div>   
  
  <div class="col-xs-2">
  <div class="form-group">
 <p>Age<span></span></p>
  <input type="text" name="age" id="age" form="formd" class="form-control input-sm" readonly="readonly" required>
  </div>
  </div> 
  
    <div class="col-xs-2">
  <div class="form-group">
<p>Gender<span></span></p>
  <input type="text" name="gender" id="gender" form="formd" class="form-control input-sm"  readonly="readonly" required>
  </div>
</div>
 
</div>

<input type="hidden" name="docid" id="docid" form="formd">

 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
   <div class="form-group">
 <p>Patient File No<span></span></p>
  <input type="text" name="fileno" id="fileno1" form="formd" readonly="readonly" class="form-control input-sm"  >
  </div>
  </div>   
  
 
   <div class="col-xs-4">
   <div class="form-group">
<p>Admission No<span></span></p>
  <input type="text" name="admitno" id="admitno" form="formd" class="form-control input-sm" readonly required>
  </div>
 
 </div>
 
    <div class="col-xs-3">
  <div class="form-group">
<p>Ward No/Bed No<span></span></p>
  <input type="text" name="wardno" id="wardno" form="formd" class="form-control input-sm" readonly required>
  </div>
</div>
 
</div>

   <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
   <div class="form-group">
 <p>Date of Admission<span></span></p>
  <input type="text" name="admdate" id="admdate" form="formd" readonly="readonly" class="form-control input-sm"  >
  </div>
  </div>   
 
   <div class="col-xs-4">
   <div class="form-group">
<p>Date of Discharge<span></span></p>
<div class='input-group date' id='datetimepicker1'>
  <input type="text" name="disdate" id="disdate" form="formd" readonly class="form-control input-sm"  required>
   <span class="input-group-addon"><span class="glyphicon glyphicon-calendar cal"></span></span>
   </div>
   
</div>
 </div>
 
   <div class="col-xs-3">
   <div class="form-group">
 <p>Doctor Name<span></span></p>
  <input type="text" name="dname" id="dname1" form="formd" readonly="readonly" class="form-control input-sm"  >
  </div>
  </div>   
   
 
</div>

 <div class="form-group row" >
   
 
   <div class="col-xs-1"></div>
    <div class="col-xs-8">
    <p>Diagnosis<span></span></p>  
<pre class="textarea" id="treatment" contenteditable="false">
           
           
</pre>
</div>

</div>

<div class="form-group row" >
   
 
   <div class="col-xs-1"></div>
    <div class="col-xs-8">
    <p>Results<span></span></p>  
<pre class="textarea" id="investigation" contenteditable="false">
           
           
</pre>
</div>

</div>

<div class="form-group row" >
   
 
   <div class="col-xs-1"></div>
    <div class="col-xs-8">
    <p>Advice<span></span></p>  
<pre class="textarea" id="management" contenteditable="false">
           
           
</pre>
</div>

</div>
 <div class="form-group row" >
   
<div class="col-xs-1"></div>
    <div class="col-xs-3">
<div class="form-group">
            <p>Revisit<span></span></p>
            <div class='input-group date' id='datetimepicker2'>
            <input type="text" class="form-control input-sm" name="revisit" id="revisit" rows="4" readonly form="formd" >
            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar cal"></span></span>
  </div>
</div>
</div>

  <div class="col-xs-3">
<div class="form-group">
            <p>Emergency Contact<span></span></p>
            <input type="number" class="form-control input-sm" name="ec" id="ec" rows="4" form="formd" readonly>
</div>
</div>


  <div class="col-xs-3">
<div class="form-group">
            <p>Ambulance No<span></span></p>
            <input type="number" maxlength="14" class="form-control input-sm" name="amno" id="amno" rows="4" form="formd" readonly>
</div>
</div>


</div> 

<div class="form-group row" >
  
 
   <div class="col-xs-7"></div>
   <span id="hds">Doctor's Signature ____________</span>

</div>

 <button type="" id="bouton-contact" class="bouton-contact"  ></button>
</div>
</div>


</body>
</html>