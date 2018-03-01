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


<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>


<style type="text/css">
.wrapper {
  height : 700px;
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
  margin: 0 auto;
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



.tds{
	width : 200px;
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




.modal-body{
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



</style>

<script type="text/javascript">

var cuser
function checkhome(){
	$("#fgr").hide();
}

function show(val){
	
	if(val.checked == true){
	
		$('#fgr').show();
	}
	else{
		$('#fgr').hide();
	}
	
}
function postdata(uri,forma){
if($('#companyName').val().length == 0){
	alert("Please fill the Company Name")
	return false;
}	

	var url;
	if(uri == 'genlic'){
	
	 url = "/HMS/genlic?location="+$('#companyName').val()+"&location1="+$('#emailId').val()+"";
	}
	else{
          if($("#lckey1").val().length == 0){
        	  alert("Please enter the key")
        	  return false;
          }	
		 url = "/HMS/sablic?location2="+$('#lid').val()+"&location3="+$('#lckey1').val()+"";
	}
	var get = "POST";
	  doAjaxPostNew(get,url,"application/json; charset=UTF-8");
}

function copyval(id,ky,name,em){

	$('#lid').val(id);
	$('#lckey').val(ky);
	$('#companyName').val(name);
	$('#emailId').val(em);
	valid()
}

function valid(){
	if($('#companyName').val().length> 0){
		$('#companyName').attr("readonly","readonly");
	}
	if($('#emailId').val().length> 0){
		$('#emailId').attr("readonly","readonly");
	}
}


function validateEmail(emailField){
        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

        if (reg.test(emailField.value) == false) 
        {
            alert('Invalid Email Address');
            return false;
        }

        return true;

}

function openmd1(value){
	if(value.includes("false")){
alert("License expired! Please share the license key with techwedge consulatnts");		
	}
	else if(value.includes("failed")){
alert("No Network connected!")		
	}
	else{
		
	}

}
</script>
<script>
function doAjaxPostNew(met,uri,ctype) {
    
    $.ajax({
    	       type: "POST",
	           url: uri,
	           async : false,
	           dataType: "text",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
   	         if(uri.includes("genlic")){
   	        	 $("#lckey").val(response.toString())	
      	          valid()	 
   	         } 
   	         else{
   	        	 alert("Data saved successfully")
   	         }
	        
	         },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
	        	   unsaved = false;
   
	        	  }


</script>
<script type="text/javascript">
/*
$(document).ready(function() {
	$("#form").validate({
		  rules: {
		    emailId: {
		      required: true,
		      email: true
		    }
		  },
		  messages: {
	    	  emailId: {
	              required: "Please fill out this field",
	              
	            },
	            errorElement: "span",
	            errorClass: "help-inline",
		  }
		});	
	
});*/
</script>
</head>

<body onload="checkhome()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Licence</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="/HMS/login">Login</a></li>
    </ul>
  
    
  </div>
</nav>
  
  <div id="form1" >  
  <form action= "genlic.html" method="post" id = "form" ></form>
    <form action= "sablic.html" method="post" id = "form1" ></form>
     <h1><font size="5">Licence</font>
	</h1>
   <br>
   	   <div class="container">
      <div class="form-group row" >
        <div class="col-xs-1"></div>
          <div class="col-xs-2">
       <div class="form-group">
               <p>Company Name<span>*</span></p>
               <input type="text" name="companyName" id="companyName" form="form" class="form-control input-sm" required>
                 
     </div> 
     </div>
       <div class="col-xs-2">
      <div class="form-group">
               <p>Email Id<span>*</span></p>
                   <input type="email" name="emailId" id="emailId" form="form" onfocusout="validateEmail(this);" class="form-control input-sm" required >
     </div> 
     </div>
     
       <div class="col-xs-2">
      <div class="form-group">
               <p>Key<span>*</span></p>
                   <input type="text" readonly name="lckey" id="lckey" form="form" class="form-control input-sm" required>
     </div> 
     </div>
   
       </div>
             <div class="col-xs-2"></div>
        <button class="btn btn-warning btn-sm" onclick="return postdata('genlic','form')">Generate Key</button>
       </div>
           <div class="form-group row" >
            <div class="col-xs-1"></div>
            <input type="checkbox" id ="ch1" onclick="show(this)" > Licence Activation
           
           
           </div> 
           <div class="form-group row" id="fgr" >
            <div class="col-xs-2"></div>
            <div class="col-xs-4">
            <div class="form-group" >
               <p>Licence Key<span>*</span></p>
                   <input type="text" name="lckey" id="lckey1" form="form1" class="form-control input-sm" required>
                   <input type="hidden" name="lid" id="lid" form="form1" value='1'>   
                  
                 </div></div> 
                 
                <div class="col-xs-2">
            <br> <button class="btn btn-warning btn-sm" onclick="return postdata('sublic','form1')">Apply</button>
                 </div></div>    
                  <button class="bouton-contact" ></button>
           
           </div> 
   </div>
    

<c:forEach var="p"  items="${model.list}">
<script>
copyval('<c:out value="${p.lid}" />','<c:out value="${p.lckey}" />','<c:out value="${p.companyName}" />','<c:out value="${p.emailId}" />')
</script>

</c:forEach>
<script>

openmd1('<c:out value='${model.result}'/>')
</script>

</body>
</html>