<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pharmacy</title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">


<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>

<style type="text/css">
.wrapper {
  height : 800px;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
}


#form2 h1 {
  font-size: 18px;
  background: #009999 none repeat scroll 0% 0%;
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form2 {
  border-radius: 5px;
  max-width:1050px;
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



table {
    border-collapse: collapse;
    width: 100%;
    }
th {
    background-color: #009999;
    color: black;
    
}

.table-fixed{
 
}
  tbody{
    height:50px;
    
 }
 
#myTable1 {
    border-collapse: collapse;
    width: 100%;
    }
#myTable1 th {
    background-color: #009999;
    color: black;
    width : 180px;
}

.table-fixed{
 
}
  #myTable1 .tbody1{
    height:200px;
    overflow-y:auto;
 }
 #myTable1 thead,.tbody1{
  
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
margin-left: 25px; 
border-style : groove;
border-radius : 10px;
width : 1000px;
}


.modal.modal-wide .modal-dialog {
  width: 90%;
}
.modal-wide .modal-body {
  overflow-y: auto;
}

.borderless td, .borderless th {
    border: none;
}

fieldset.scheduler-border {
    border: 1px groove #ddd !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
}

    legend.scheduler-border {
        font-size: 1.2em !important;
        font-weight: bold !important;
        text-align: left !important;
        width:auto;
        padding:0 10px;
        border-bottom:none;
    }
/* irrelevant styling */

#tallModal .modal-body p { margin-bottom: 900px }


</style>
<script type="text/javascript">
var cuser;
function checkhome2(user){
	cuser = user;

	     
	
	 if(user.includes("[ROLE_SALESMANAGER]")){
	
		var url = "/HMS/hmspharma1" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
		// document.getElementById("bouton-contact").disabled = true; 
			document.getElementById("mm").style.display = "none"; 
			document.getElementById("sm").style.display = "none"; 
			document.getElementById("or").style.display = "none"; 
			document.getElementById("pe").style.display = "none"; 
		
		
		 
	}
	else if(user.includes("[ROLE_PHARMACIST]")){
	
		 var url = "/HMS/hmspharma" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
		 
	
		
	}
	 
	
	else{
		 var url = "/HMS/hmspharma" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
}


function check(id){
	
	
	if (id == "" || id == null){
		
		id = 1;
		var str1 = "C";
		
		var str2 = "-";
		var m = moment().format("DDMMYYYY-");
		var str4 = id;
		var res = str1.concat(str2);
		var res1 = res.concat(m);
		var res2 = res1.concat(str4);
	  
		document.getElementById("customer").value = res2;
		
	}
	else {
		
		id = Number(id) + 1;
		
        
		var str1 = "c";
		
		var str2 = "-";
		var m = moment().format("DDMMYYYY-");
		var str4 = id;
		var res = str1.concat(str2);
		var res1 = res.concat(m);
		var res2 = res1.concat(str4);
		
		
		document.getElementById("customer").value = res2;
		
	}
}



function update(){

if(document.getElementById("customer2").value == "New"){
    	
    	document.getElementById("form1").reset();
    	location.reload();
} 	
else{
	   var str = document.getElementById("customer2").value;
	   var strSplit = str.split('=');
	   
//	alert(strSplit)   
	    
	   
	     
	     document.getElementById("customer").value = strSplit[0];
	     
	     document.getElementById("name").value=strSplit[1];
	    
	     document.getElementById("medical").value = strSplit[2];
		
	   
		document.getElementById("age").value =strSplit[3];
	//	document.getElementById("sexM").value = strSplit[4];
	
		 if( strSplit[4] == "M"){
		     $('#male').click();
		     
		   }
	   else if(strSplit[4] == "F"){
		     $('#female').click();
		    
		    }
	   else{
		   $('#other').click();
		       
	   }
		
		document.getElementById("phone").value = strSplit[5];
		document.getElementById("address1").value=strSplit[6];
		document.getElementById("mobile").value =strSplit[7];
		document.getElementById("city").value = strSplit[8];
		
		document.getElementById("fax").value = strSplit[9];
		
		document.getElementById("state").value= strSplit[10];
		document.getElementById("email").value = strSplit[11];
		document.getElementById("country").value = strSplit[12];
		document.getElementById("comments").value = strSplit[13];
		document.getElementById("pincode").value = strSplit[14];
		document.getElementById("address2").value=strSplit[16];
	//	alert(strSplit[15]);
		if(strSplit[15] == "active"){
			document.getElementById("active").checked = true;
		}
		else{
			
			document.getElementById("active").checked = false;
		}
//		$('#myModal').modal('show');

		 $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
			  
		     	unsaved = false;
		     });
}
}
function verify(form){
	alert("changes made successfully!");
	document.getElementById(form).submit();
	
}

function onlyAlphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode = 32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
function onlyNos(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/customerho.html";
	}
}
</script>
<script>
function goBack() {
    window.history.back();
}

       function oncheck(){
    	   document.getElementById('active').checked=true;
       }
       </script>
<script type="text/javascript">

$(document).ready(function () {
	$("input").on("keypress", function(e) {
	    if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	
});

</script>
<script>
       function doAjaxPost() {
    	   // get the form values

    	       var cphone = $('#phone').val();
        
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/checkcphone.html",
	          data: "phone=" + cphone,
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        	   
	        	   
	        	    
	       		 document.getElementById("bouton-contact").disabled = false;
	       	
	       		//alert()
	        	    $.each(response, function(index, datec) {
	                   //to print name of employee
	             
	            // alert("j")
	                   
	                   
	                  if(datec.phone != null || datec.phone == " "){
	                	  alert("phone number already exists")
	                	  document.getElementById("bouton-contact").disabled = true;
	                  }
	                  
	                  

	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
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
<body onload="oncheck(),checkhome2('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Customer Master</a>
    </div>
     <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown">Masters
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <li id="mm"><a href="/HMS/manufactureho.html">Manufacturer Master</a></li>
       <li id="sm"><a href="/HMS/supplierho.html">Supplier Master</a></li>
       <li><a href="/HMS/customerho.html">Customer Master</a></li>
       <li><a href="/HMS/productho.html">Product  Master</a></li>
         
        </ul>
      
        <li id="or"><a href="/HMS/orderho.html">Order & Reorder</a></li>
        <li id="pe"><a href="/HMS/purchaseho.html">Purchase Entry</a></li>
        <li><a href="/HMS/saleho.html">Sales</a></li>
        <li><a href="/HMS/stopriceho.html">Product Stocks and Pricing</a></li>
      
      
      </li>
     
    </ul>
   <!-- <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="goBack()"></i> -->

  </div>
</nav>
  <center>
</center>
  <div id="form2" >  
  
     <h1><button type="button" id="refresh" class="btn btn-warning button1" onclick="location.href='/HMS/customerho.html';">
	  <span class="fa fa-refresh"></span> Refresh</button>
	
	
<font size="5">Customer Master</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="submit" id="bouton-contact" form="form1" class="form-control input-sm button2 btn btn-warning" value="Save" /></span>
	</h1>

<form id = "form1" action = "savecustomerho.html" method = "post"></form>


   <br>
	    
	    <div class="container">
 
  

  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Customer Details</a></li>
    <li><a data-toggle="pill" href="#menu1">Contact Details</a></li>
</ul>
</div>
<br>
<div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div id="col3">
      
      <div class="form-group row">
 
<div class="col-xs-4"></div>

  <div class="col-xs-3">
  <div class="form-group">
            <p>Select Customer<span></span></p>
      <select class="selectpicker" data-size="5" data-show-subtext="true" data-live-search="true" name = "" id ="customer2"  onchange = "update()"required>
      <option value="New" selected>New</option>
<c:forEach var="cust"  items="${model.list}">
<option value = "${cust.customer}=${cust.name}=${cust.medical}=${cust.age}=${cust.sex}=${cust.phone}=${cust.address1}=${cust.mobile}=${cust.city}=${cust.fax}=${cust.state}=${cust.email}=${cust.country}=${cust.comments}=${cust.pincode}=${cust.active}=${cust.address2}">${cust.name}</option>
</c:forEach>
      </select>
      
        </div>
      
      </div>
 
   
               
  
      </div>
      <br>
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-5">
	      
	      <div class="form-group">
            <p>Customer Name<span>*</span></p>
         <input type="text" class="form-control" id="name" name="name" form="form1" required>
	</div>
	      </div>
	      
	       <div class="col-xs-5">
	       	       <div class="form-group">
	       	         <p>Customer Type<span>*</span></p>
	       	       
          <input type="text"  class="form-control" id="medical" name="medical" form="form1" required>

       
       
	</div>
	      </div>
	      
	   <input type ="hidden" class="form-control" name = "customer" id ="customer" form = "form1">
        <c:forEach var="custid"  items="${model.list2}">
  <script>
  check('<c:out value="${custid.customer}" />');
  </script>
  </c:forEach>
	      
	      </div>
	      
	         <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-5">
	       <div class="form-group">
     
            <p>Age<span></span></p>
       <input type="text" onkeypress="return onlyNos(event,this);" class="form-control" id="age" name="age" form="form1">
     </div>
	      </div>
	      
	       <div class="col-xs-5">
	      <div class="form-group">
          <div class="btn-group" data-toggle="buttons"><p>Gender <span></span></p>
       <label class="btn btn-default"><input class="form-control input-sm" form="form1" style="width: 0px;" id="male" value="M" type="radio" name="sex" />M</label>
 		<label class="btn btn-default"><input class="form-control input-sm" form="form1" style="width: 0px;" id="female" value="F" type="radio" name="sex" />F</label>
 	<label class="btn btn-default"><input class="form-control input-sm" type="radio" form="form1" value="O" id="other" name="sex" />Other</label> 
 	</div>
     </div>
	      </div>
	      
	       
	      </div>
	      
	           
	      	         <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-5">
	       <div class="form-group">
     
            <p>Email<span></span></p>
       <input type="email" class="form-control" form="form1" id="email" name="email" >
       </div>
	      </div>
	      
	       <div class="col-xs-5">
	      <div class="form-group">
          <p>Comments<span></span></p>
        <input type="text" class="form-control" form="form1" id ="comments" name="comments" >
        
     </div>
	      </div>
	      
	       
	      </div>
	      </div>
	      
	       
	     </div>
   
      <div id="menu1" class="tab-pane fade">
      
        <div id="col3">
        <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	        
	       <div class="form-group">
	    <p>Phone<span></span></p>
         <input type="text" class="form-control" onkeypress="return onlyNos(event,this);" onfocusout= "doAjaxPost()" id="phone" name="phone" form="form1">
	
	</div>
	      </div>
	       <div class="col-xs-4">
	        
	       <div class="form-group">
          <p>Mobile<span></span></p>
      <input type="text" onkeypress="return onlyNos(event,this);" class="form-control" id="mobile" name="mobile" form="form1" >
       
	</div>
	      </div>
	      <div class="col-xs-3">
	     <div class="form-group">
  <p>Email<span></span></p>
 <input type="email" form="form1" class="form-control" id="email" name="email" >
</div></div>
	  
	      
	      
	     
	     
	     </div>
	       <div class="form-group row" >
	     <div class="col-xs-1"></div>
	     <div class="col-xs-3">
	     <div class="form-group">
  <p>Address1<span></span></p>
 <input type="text" class="form-control"  form="form1" id="address1" name="address1" >
</div></div>
	  
	        
	      <div class="col-xs-4">
	      
	      <div class="form-group">
            <p>Address2<span></span></p>
         <input type="text" class="form-control"  id="address2" name="address2"  form="form1">
	</div>
	      </div>
	      
	       <div class="col-xs-3">
	         <p>Fax<span></span></p>
	       <div class="form-group">
      
        <input type="text" onkeypress="return onlyNos(event,this);" class="form-control" id="fax" name="fax" form="form1" >
	</div>
	      </div>
	      
	  
	      
	      </div>
        
	      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	     <div class="col-xs-3">
	     <div class="form-group">
  <p>Country<span></span></p>
 <input type="text"  onkeypress="return onlyAlphabets(event,this);" form="form1" class="form-control" id="country" name="country" >
</div></div>
	  
	        
	      <div class="col-xs-4">
	      
	      <div class="form-group">
            <p>State<span></span></p>
         <input type="text"  onkeypress="return onlyAlphabets(event,this);" class="form-control" form="form1"id="state" name="state" form="form1" >
	</div>
	      </div>
	      
	       <div class="col-xs-3">
	         <p>City<span></span></p>
	       <div class="form-group">
      <input type="text"  onkeypress="return onlyAlphabets(event,this);" class="form-control" id="city" name="city" form="form1" >
       
	</div>
	      </div>
	      </div>
	  
	      
	      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	     
	         <div class="col-xs-3">
	        <div class="form-group">
	     <p>Pincode<span></span></p>
	        <input type="text" onkeypress="return onlyNos(event,this);" class="form-control" id="pincode" name="pincode" form="form1" >
      
          </div>
	        </div>
	        
	        
	         <div class="col-xs-3">
	        <div class="form-group">
	         <br>
	       Active: <input type="checkbox" id="active" name="active" value="active" form="form1"  >
       </div>
	        </div>
	        
	 
	      
	      
	      </div>
         
      </div>
      </div>
    </div>
	    
    
        
    <button type="" class="bouton-contact"  ></button>
   </div>
 
    <!--  -->
  
  <c:forEach var="custid"  items="${model.list2}">
  <script>
  check('<c:out value="${custid.customer}" />');
  </script>
  </c:forEach>
	      
  <script >
datasuccess('<%=request.getParameter("message")%>')
</script>
       
</body>
</html>