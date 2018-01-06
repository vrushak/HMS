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
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">

<link rel='stylesheet' href='<c:url value="/resources/css/print.css" />' type='text/css' media='print' />
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
  max-width:800px;
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

textarea {
  border-radius: 0px 5px 5px 0px;
  border: 1px solid #cccccc;
  margin: 0;
  width: 225px;
  height: 5px; 
  float: left;
  padding: 0px 15px;
}
#address2{
	 border-radius: 0px 5px 5px 0px;
  border: 1px solid #cccccc;
  margin:0;
  width: 312px;
  height: 50px; 
  float: left;
  padding: 0px 15px;
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

#cont{
  height:120px;
  width :500px;  
  overflow-Y : auto;
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
  
    
  }
  thead,tbody{
  
   
  }

modal-body{
	
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

.textarea{
height : 100px;
width : 500px;
border:1px solid;
overflow  : auto;
border-color:rgb(204, 204, 204);
}
@media print {
   #diagnosed {
overflow : hidden;	
min-height:50px;
height: auto;
width : 500px;
border : none;
}
}

</style>
<script type="text/javascript">
function checkhome(user){
	document.getElementById("hds").style.display = "none";
	 var m = moment().format("DD-MM-YYYY");
	document.getElementById("admdate").value= m;
	
	if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
	
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_DOCTOR]")){
		
		 var url = "/HMS/doctor1" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	
	else if(user.includes("[ROLE_Accounts Admin]")){
		
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		}
	else if(user.includes("[ROLE_NURSE]")){
		
		 var url = "/HMS/nursedesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		
			
		 var element = document.getElementById('prnr');
		 element.setAttribute("href",url)
		 
		 document.getElementById("myInput").style.visibility ="hidden";
	}
	else if(user.includes("[ROLE_CHIEFNURSE]")){
		
		 var url = "/HMS/nursedesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		  var element = document.getElementById('prnr');
		 element.setAttribute("href",url)
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
}

function disp(){

	var x = document.getElementById("pname").value;
	//alert(x)
	if(x == "Select"){
		
		alert("please select the Patient Name ");
		return false;
	}
	else{
	AutoGrowTextArea(document.getElementById("investigation"))
	document.getElementById("close").style.display = "none";
	document.getElementById("hds").style.display = "block";
	//document.getElementById("di").style.display = "none";
	window.print();
	document.getElementById("close").style.display = "block";
	document.getElementById("hds").style.display = "none";
//	document.getElementById("di").style.display = "block";
	}
}
function addname(getval){
	
	
	var myname = getval.getAttribute('data-value'); 	
		//var str = document.getElementById("pname").getAttribute("data-value");
	//	alert(str);

	
		var strSplit = myname.split('=');
//		alert(strSplit[9]);

	//	document.getElementById("pname").value = strSplit[0];

		//document.getElementById("pid").value = strSplit[5];	
		document.getElementById("fileno").value = strSplit[1];
		document.getElementById("admdate").innerHTML = strSplit[4];
		
		document.getElementById("dname").value = strSplit[2];	
		
		document.getElementById("investigation").innerHTML = strSplit[3];
		
		
		

	
}

function goBack() {
    window.history.back();
}

</script>
<script>
function doAjaxPost(fileno,pid) {
	   // get the form values
	   $("#myTable tbody tr").remove();
	  var counter = 1;
	         //  var name = $('#pname').val();
	            //var docid = $('#docid').val();
	             $.ajax({
	        	  
	        	           type: "GET",
	        	   
	        	           url: "/HMS/prescription1/"+fileno+"/"+pid+"",
	        	         
	        	           dataType: "JSON",
	        	           contentType: "application/json; charset=UTF-8",
	        	           
	        	          
	        	           
	        	          
	             
	             success: function(response){
	        	   


      
    $.each(response.list5, function(index, drug) {
 	 
     
      
    	

  	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
  	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
  	
  	//    var m = moment().format('YYYY-MM-DD h:mm a');
  	
  	               var cnt = tableRef.rows.length;
       	     	   var dmc = "dm"+cnt;
       	     	   var dac = "da"+cnt;
       	     	   var dec = "de"+cnt;
       	     	   var dnc = "dn"+cnt;
       	           var baf = "baf"+cnt;

  	  var newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input type='text' class='form-control input-sm'  form ='form1' disabled   id = 'typeofdr' value='"+drug.typeofdr+"' name= 'typeofdr'  required> </td></tr>";
  	  newCell.style.width ='100px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' disabled value='"+drug.drugname+"' type='text' id = 'drugname' name= 'drugname'  required> </td></tr>";
  	  newCell.style.width ='100px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' disabled value='"+drug.strdrug+"' type='text' id = 'strdrug' name= 'strdrug'  required> </td></tr>";
  	  newCell.style.width ='65px';
  	  
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' disabled value='"+drug.dosage+"' type='text' id = 'strdrug' name= 'strdrug'  required> </td></tr>";
  	  newCell.style.width ='65px';
  		 
  	      newCell = rowsAdd.insertCell();
    	  newCell.innerHTML="<tr><td><select disabled form ='form1' class= 'form-control input-sm'   id = '"+dmc+"'  name= 'dm'  ><option value='PRN'>PRN</option><option value='OD'>OD</option><option value='BD'>BD</option><option value='TDS'>TDS</option><option value='QID'>QID</option><option value='OTHERS'>OTHERS</option></select> </td></tr>";
    	  newCell.style.width ='20px';
    	/*  
    	  newCell = rowsAdd.insertCell();
    	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' id = '"+dac+"'  name= 'da'  value='"+drug.da+"'</td></tr>";
    	  newCell.style.width ='120px';
    	  */
    	 
    		 
          	  newCell = rowsAdd.insertCell();
          	  newCell.innerHTML="<tr><td><pre contenteditable='true' class='baf'  id = '"+baf+"' name= 'baf' >"+drug.baf+"</pre></td></tr>";
          	  newCell.style.width ='100px';
          	  
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input  form ='form1' disabled class= 'form-control input-sm'  type='text' value='"+drug.totn+"' id = 'totn' name= 'totn'  required> </td></tr>";
  	  newCell.style.width ='70px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input  form ='form1' disabled class= 'form-control input-sm'  type='text' id = 'nofdays' value='"+drug.nofdays+"'name= 'nofdays'  required> </td></tr>";
  	  newCell.style.width ='70px';
  		 
  	 
  	  
  	 
  		 
  	// document.getElementById(baf).value = drug.baf;
	 document.getElementById(dmc).value = drug.dm;
	// document.getElementById(dac).value = drug.da;
	// document.getElementById(dec).value = drug.de;
	 //document.getElementById(dnc).value = drug.dn;
     	 
	  
    });
    },
    error: function(e){
 	  
 	           alert('Error: ' + e);
 	  
 	           }
 	           });
 	   
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
	<script type="text/javascript">
// Auto-Grow-TextArea script.
// Script copyright (C) 2011 www.cryer.co.uk.
// Script is free to use provided this copyright header is included.
function AutoGrowTextArea(textField)
{
  if (textField.clientHeight < textField.scrollHeight)
  {
    textField.style.height = textField.scrollHeight + "px";
    if (textField.clientHeight < textField.scrollHeight)
    {
      textField.style.height = 
        (textField.scrollHeight * 2 - textField.clientHeight) + "px";
    }
  }
}
</script>
 

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload = "checkhome('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Recommended Tests</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
      <!-- 
      <li class=""><a id="m2" href="">My Appointments</a></li>
        <li class=""><a  id="m3" href="">General Checkup</a></li>
          <li class=""><a id="m4" href="/HMS/discharge.html">Discharge Summary</a></li>
 
       <li class=""><a id="nob" href="/HMS/nursetr/"  onclick=' return visible();' target="_blank">Nurse observations</a></li>
  -->
    </ul>
     <br>
    <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="goBack()"></i>

  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1>
	
	
<font size="5">Recommended Tests</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
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
	<div class="col-xs-1"></div>
	<div class="form-group row" >
	     
	      <div class="col-xs-3">
	      
	      <div class="form-group">
      
           
   Doctor:<input type="text" name="dname" id="dname"  form="forma" class="form-control input-sm"  required>
       
       
	</div>
	      </div>
	      <div class="col-xs-4"></div>
	             <div class="col-xs-3">
	        <div class="form-group">
     
        
    Date:<input type="text" name="admdate" id="admdate"  class="form-control input-sm"  required>
     
     
       
	</div>
	      
	      </div>
	      </div>
	         <div class="col-xs-1"></div>
	<div class="form-group row" >
	  
	      <div class="col-xs-3">
	      
	      <div class="form-group">
            
        Patient Name:<select class="selectpicker form-control" data-size="4" data-live-search="true" name = "pname" id ="pname" onchange="addname(this.options[this.selectedIndex])">
          <option value="Select" selected disabled>Select</option>
        <c:forEach var="p"  items="${list3}">
        <option value="${p.pname}" data-subtext="${p.fileno}" data-value="${p.pname}=${p.fileno}=${p.dname}=${p.tresult}=${p.date1}=${p.pid}">${p.pname}</option>
        </c:forEach>
      </select>
       
	</div>
	      </div>
	       <div class="col-xs-4"></div>
	       <div class="col-xs-3">
	      
	       <div class="form-group">
       
    Fileno:<input type="text" name="fileno" id="fileno"  form="forma" class="form-control input-sm"  required>
       
       
       
	</div>
	      </div>
	      
	
	      
	      </div>
	      <!--
	           <div class="form-group row" >
	    <div class="col-xs-1"></div>
	      <div class="col-xs-4">
	      
	      <div class="form-group" id="">
        
          <p>Diagnosis</p>
          <pre class="textarea" id="diagnosed" name="diagnosed" contenteditable="true">
           
           </pre>
      	</div>
	</div>
	</div>
	        -->
	        
<div class="form-group row" >
  
 
   <div class="col-xs-1"></div>
    <div class="col-xs-8">
  <p><h4>Recommended Tests</h4></p>   
<pre class="tresult" id="investigation" contenteditable="true">
           
           
</pre>
</div>

</div>

<br>
<div class="form-group row" >
  
 
   <div class="col-xs-7"></div>
   <span id="hds">Doctor's Signature ____________</span>

</div>
  

 <button type="" id="bouton-contact" class="bouton-contact"  ></button>
</div>
</div>


</body>
</html>