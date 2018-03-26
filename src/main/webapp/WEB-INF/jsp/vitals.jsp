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
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>

<script type="text/javascript">

var adminusr;
function chkuser(user){
	
	adminusr = user;
	
	if(user.includes("[ROLE_ASSISTANT]")){
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();	
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("myInput").style.visibility ="hidden";
	}
	
	else if(user.includes("[ROLE_NURSE]")){
		
		 var url = "/HMS/nursedesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("myInput").style.visibility ="hidden";
	}
	else if(user.includes("[ROLE_DOCTOR]")){
		
		 var url = "/HMS/doctor1" ;
		 $("#back").hide();
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("myInput").style.visibility ="hidden";
		// document.getElementById("bouton-contact").disabled = true;
	}
	else if(user.includes("[ROLE_CHIEFNURSE]")){
		
		 var url = "/HMS/nursedesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("myInput").style.visibility ="hidden";
		 
		 if(bac.includes("dochome")){
			 $("#back").attr("href","/HMS/doctor1")
			 $("#tit").text("Back to Doctor Home")
		 }
		 else{
			 $("#back").attr("href","/HMS/nursedesk") 
			 $("#tit").text("Back to Nurse Desk")
		 }

	}
}

function checkhome(user,usernam){

	
	
	
	document.getElementById("nid").value = user;
	document.getElementById("nname").value = usernam;
}


function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
	
function check(id){
	//alert(id);
}


function addcid(getval){
	var myname = getval.getAttribute('data-value'); 
	var str = myname.split(',');
	
	//var res4 = $('select[name=pid1]').val();
	  
	   
	   $('select[name=pid1]').val(str[1]);
	   $('#pid1').selectpicker('refresh');

	
	//document.getElementById("pname").value=str;
	document.getElementById("pid").value =str[0];
	//document.getElementById("pid2").value =str[];
	document.getElementById("fileno").value = str[2];
	
	if(adminusr.includes("[ROLE_ADMIN]")){
		document.getElementById("docid").value = admnme;
		document.getElementById("dname").value = admnme;
		document.getElementById("nid").value = admnme;
		document.getElementById("nname").value = admnme;
	}
	else{
	document.getElementById("docid").value =str[3];
	document.getElementById("dname").value = str[4];
	}
	
	checkprvs()
	
	
	disable();
}

function clos(){
	window.location.reload();
}


function checkprvs(){
	if (document.getElementById("pid1").value =="select"){
		document.getElementById("btn2").disabled = true;
	}
	else{
		document.getElementById("btn2").disabled = false;
	}
	
	
}
function addcname(){
	var cid = document.getElementById("pname").value; 
	var str = cid.split(',');
	
	 var res5 = $('select[name=pname1]').val();
 	   $('select[name=pid1]').val(res5);
	   $('#pid').selectpicker('refresh');
	   
	document.getElementById("pid").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	
	
}

function copy(pid){

	var strSplit = pid.split(',');

  // document.getElementById("pid").value = strSplit[0];
   
   $("#pid1").append('<option value="'+strSplit[0]+'"selected="">'+strSplit[0]+'</option>');
   $("#pid1").selectpicker("refresh");
   document.getElementById("pid1").disabled = true;
   
    document.getElementById("fileno").value = strSplit[1];
   document.getElementById("height").value = strSplit[2];
   document.getElementById("unith").value = strSplit[3];
   document.getElementById("weightw").value = strSplit[4];
   document.getElementById("unitw").value = strSplit[5];
   document.getElementById("temperature").value = strSplit[6];
   document.getElementById("unitt").value = strSplit[7];
   document.getElementById("ac").value = strSplit[8];
   document.getElementById("bp").value = strSplit[9];
   document.getElementById("bmi").value = strSplit[10];
   document.getElementById("fi").value = strSplit[11];
   document.getElementById("fe").value = strSplit[12];
   document.getElementById("rest").value = strSplit[13];
   document.getElementById("pulse").value = strSplit[14];
   
  
   document.getElementById("myInput").style.visibility ="visible";
 
   $('#myModal').modal('hide');  
   

}
function getInputDateFormat(date) {
	 return date.toISOString().split('T')[0];
	}
	
function validDate() {
//	alert(document.getElemetById("pid1").value);

	 var today = new Date();
	 var maxDate = new Date();
	 maxDate.setDate(maxDate.getDate() + 7);

	 document.getElementsByName("appointment")[0].setAttribute('min', getInputDateFormat(today));
	 document.getElementsByName("appointment")[0].setAttribute('max', getInputDateFormat(maxDate));
	}
function calculateBmi() {
	var weight = document.getElementById("weightw").value;
	var height = document.getElementById("height").value;
	
	if(weight > 0 && height > 0){	
		
		if(document.getElementById("unitw").value == "pounds"){
			weight = weight/0.0022046;
		}
		else if(document.getElementById("unith").value == "feet"){
		
			height = 	height/0.032808;
		}
		else if(document.getElementById("unith").value == "inches"){
			height = height/0.39370;
		}
		else if(document.getElementById("unith").value == "meters"){
			height = height/0.01;
		}
		else{
		//	alert("please select the correct unit");
		}
		  var BMI = Math.round(weight / Math.pow(height, 2) * 10000);

		var finalBmi = Math.round(BMI * 100) / 100
	document.getElementById("bmi").value = finalBmi;
	}
	
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
      
        if ((charCode == 44))
            return false;
        else
            return true;
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
        var parts = e.srcElement.value.split('.');
     
        if (charCode > 31 && charCode !=46 && (charCode < 48 || charCode > 57)) {
        
            return false;
        }
        else if(parts.length >1 && charCode == 46){
        	return false;
        }
        else{
        return true;
        }
    }
    catch (err) {
        alert(err.Description);
    }
}

function onlyNos1(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        var parts = e.srcElement.value.split('/');

        if (charCode > 31 && charCode !=47 && (charCode < 48 || charCode > 57)) {
        
            return false;
        }
        else if(parts.length >1 && charCode == 47){
        	return false;
        }
        else{
        return true;
        }
    }
    catch (err) {
        alert(err.Description);
    }
}
function displaymodal(){
	  $('#myModal').modal('show');
	
}

function validmess(){
	var a = document.getElementById("pid1").value;
	if(a.length == 0){
		alert("Please Select Patient Name")
		return false;
	}
	else{
		return true;
	}
	
}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/vitals.html";
	}
}

function goBack() {
    window.history.back();
}

</script>

      <script type="text/javascript">
       function doAjaxPost(user) {
    	   // get the form values
    	   
    	         //  var name = $('#pname').val();
    	            var fileno = $('#fileno').val();
    	            if(document.getElementById("pid1").value == "select"){
    	            	alert("Please select patient name")
    	            	return false;
    	            }
    	            
    	           $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/getvtdetails/"+user+"/"+fileno+"",
    	        	         
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           
    	        	           success: function(response){
    	        		 
    	        	        	   $.each(response.list1, function(index, datec) {
    	        	                   //to print name of employee
    	        	             
    	        	        		   $('select[name=pid1]').val(datec.pname);
	                                   $('#pid1').selectpicker('refresh');
    	        	        		   document.getElementById("pid1").disabled = true;

   	        	        		        document.getElementById("pid").value = datec.pid;
    	        	        		    document.getElementById("fileno").value = datec.fileno;
    	        	        		   document.getElementById("height").value = datec.height;
    	        	        	       document.getElementById("unith").value = datec.unith;
    	        	        	       
    	        	        		   document.getElementById("weightw").value = datec.weight;
    	        	        		   document.getElementById("unitw").value = datec.unitw;
    	        	        		   
    	        	        		   document.getElementById("temperature").value = datec.temperature;
    	        	        		   document.getElementById("unitt").value = datec.unitt;
    	        	        		   document.getElementById("ac").value =datec.ac;
    	        	        		   document.getElementById("bp").value =datec.bp;
    	        	        		   document.getElementById("bmi").value = datec.bmi;
    	        	        		   document.getElementById("fi").value = datec.fi;
    	        	        		   document.getElementById("fe").value = datec.fe;
    	        	        		   document.getElementById("rest").value = datec.rest;
    	        	        		   document.getElementById("pulse").value = datec.pulse;
    	        	        		   
    	        	        	
    	        	        		   if(datec.docid.length == 0 || datec.docid == "null"){
    	        	        			   datec.docid = "NA";
    	        	        			   datec.dname = "NA";
    	        	        			   
    	        	        		   }
    	        	        		   
    	        	        		   
    	        	        		   if(datec.nid.length == 0 || datec.nid == "null"){
    	        	        			  
    	        	        			   datec.nid = "NA";
    	        	        			   datec.nname ="NA";
    	        	        		   }
    	        	        		   
    	        	        		   if(adminusr.includes("[ROLE_ADMIN]")){
    	        	        				document.getElementById("docid").value = datec.docid;
    	        	        				document.getElementById("dname").value = datec.docid;
    	        	        				document.getElementById("nid").value = datec.docid;
    	    	        	        		document.getElementById("nname").value = datec.docid;
    	        	        			}
    	        	        			else{
    	        	        				
    	        	        				document.getElementById("docid").value = datec.docid;
    	    	        	        	    document.getElementById("dname").value = datec.dname;
    	    	        	        	    document.getElementById("nid").value = datec.nid;
    	    	        	        		document.getElementById("nname").value = datec.nname;
    	        	        			}
    	        	        		  
    	        	        		   
    	        	        		 
    	        	        		   document.getElementById("myInput").style.visibility ="visible";
    	        	        /*		
    	        	        		 $("#unith").append('<option value="'+datec.unith+'"selected="">'+datec.unith+'</option>');
  	        	        		   $("#unith").selectpicker("refresh");
  	        	        		   
  	        	        		   $("#unitw").append('<option value="'+datec.unitw+'"selected="">'+datec.unitw+'</option>');
	        	        		   $("#unitw").selectpicker("refresh");
	        	        		   
	        	        		   $("#unitt").append('<option value="'+datec.unitt+'"selected="">'+datec.unitt+'</option>');
   	        	        		   $("#unitt").selectpicker("refresh");
   	        	        	*/	
   	        	        		   document.getElementById("btn2").disabled = true;
	        	        		   
    	        	        		  
    	        	        		   $('#myModal').modal('hide');  
    	        	               });    
    	        	        	   
    	        	        	   
    	        	        	 
    	        	           },
    	        	           error: function(e){
    	        	        	  
    	        	        	           alert('Error: ' + e);
    	        	        	  
    	        	        	           }
    	        	        	           });
    	        	        	   unsaved = false;
    	        	        	           }

       </script>
<script type="text/javascript">

$(document).ready(function () {

	
	 
	
		 $('input[type="time"][value="now"]').each(function(){    
		   var d = new Date(),        
		       h = d.getHours(),
		       m = d.getMinutes();
		   if(h < 10) h = '0' + h; 
		   if(m < 10) m = '0' + m; 
		   $(this).attr({
		     'value': h + ':' + m
		   });
		 });
		
		 $("#time").on("focusout",function(e){

		 var today = new Date().toISOString().split('T')[0];
		
		 if(today == document.getElementById("appointment").value){
		 var d = new Date(),        
		     h = d.getHours(),
		     m = d.getMinutes();
		 if(h < 10) h = '0' + h; 
		 if(m < 10) m = '0' + m; 
		 var time = h + ':' + m;
		 
		     var currentTime = new Date();
		     var userTime = $("#time").val().split(":"); 
		     if(currentTime.getHours() > parseInt(userTime[0])){
		   	 alert("Cannot create appointments for past dates")
		   	 $( "#time" ).val(time);
		         $(this).focus();                
		     }
		     if(currentTime.getHours() <= parseInt(userTime[0])){
		         if(currentTime.getMinutes() > parseInt(userTime[1])){
		       	 alert("Cannot create appointments for past dates");
		       	 $( "#time" ).val(time);
		         $(this).focus();
		         }
		     }}
		 });

});
</script>
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
  background-color: #FFFFFF;
  overflow: hidden;
}
#form3 h1 {
  font-size: 18px;
  background: #009999 none repeat scroll 0% 0%;
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form3 {
  border-radius: 5px;
  max-width:500px;
  width:100%;
  margin: 5% auto;
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
  height: 50px; 
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
    height:300px;
    overflow-y:auto;
 }
  thead,tbody{
  
    display:block;
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
</head>
<sec:authentication property="principal.authorities" var="username" />

<body onload = "chkuser('<c:out value="${username}" />',admnme='<c:out value="${pageContext.request.userPrincipal.name}" />'),checkprvs()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Vital Details</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
 <ul class="nav navbar-nav navbar-right">
  <li><a href="#" id="back" ><span class="glyphicon glyphicon-user"></span><span id="tit">Back</span></a></li>
    </ul>
      </div>
</nav>
  <center>
</center>
   <form id="form2" action="getvtdetails.html" method="get">  </form>
  <form id="form1" action="/HMS/savevit.html" method="post">  
  
    
	  <h1>
	  <button type="button" id="btn2" class="btn btn-warning button1" onclick="doAjaxPost('<c:out value="${pageContext.request.userPrincipal.name}" />')">
	  <span class="glyphicon glyphicon-eye"></span>Previous Vitals</button>
<font size="5">Patient Vital Details</font><span class="button2">
		<input type="button" id="myInput" class="btn btn-warning button2" value="Refresh" onclick="window.location='/HMS/vitals'" style="width:150px"/></span>
	</h1>

	    
	 
	 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control" data-live-search="true" name = "pid1" id ="pid1" onchange="addcid((this.options[this.selectedIndex]))"  >
          <option selected disabled value="select">Select</option>
        <c:forEach var="p"  items="${model.list3}">
        <option value="${p.pname}" data-subtext="${p.fileno},${p.appointment}" data-value="${p.pid},${p.pname},${p.fileno},${p.docid},${p.dname}">${p.pname}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
   <input type="hidden" name="fileno" id="pid2" form="form2">
   
 
  <div class="col-xs-4">
  <div class="form-group">
            <p>Patient Id<span>*</span></p>
           <input type ="text" class="form-control" name="pid" id="pid" form="form1" required>
	</div>
  </div>
   <div class="col-xs-3">
  <div class="form-group">
            <p>Patient File No<span>*</span></p>
           <input type="text" class="form-control" name="fileno" id="fileno" required>
	</div>
  </div>
  </div>
  
   <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Height<span></span></p>
             <input type="text" class="form-control" onkeypress='return onlyNos(event,this);'  oninput="calculateBmi()" value="0" name="height" id="height" >
	</div>
  </div>
  
        <div class="col-xs-2">
  <div class="form-group">
            <p> Unit<span></span></p>
            
             <select class="form-control" onchange="calculateBmi()" name="unith" id="unith" >
             <option value="" selected disabled>Select Unit</option>
             <option value="feet">feet</option>
             <option value="inches">inches</option>
             <option value="cm">cm</option>
              <option value="meters">meters</option>
             </select>
	</div>
  </div>
  
   <div class="col-xs-3">
  <div class="form-group">
            <p>Weight<span></span></p>
           <input type="text" class="form-control" onkeypress='return onlyNos(event,this);'  oninput="calculateBmi()"value="0" name="weight" id="weightw" >
	</div>
  </div>
   <div class="col-xs-2">
  <div class="form-group">
            <p> Unit<span></span></p>
         <select class="form-control" onchange="calculateBmi()" name="unitw" id="unitw" >
             <option value="" selected disabled>Select Unit</option>
              <option value="kilogram">kilogram</option>
             <option value="pounds">pounds</option>
             
             </select>
	</div>
  </div>
  </div>
  
  <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Temperature<span></span></p>
             <input type="text" class="form-control" onkeypress='return onlyNos(event,this);'  name="temperature" id="temperature" >
	</div>
  </div>
  
        <div class="col-xs-2">
  <div class="form-group">
            <p>Unit<span></span></p>
            
             <select class="form-control" name="unitt" id="unitt">
             <option value="" selected disabled>Select Unit</option>
             <option value="celsius">celsius</option>
             <option value="fahrenheit">fahrenheit</option>
           
             </select>
	</div>
  </div>
  
   <div class="col-xs-5">
  <div class="form-group">
            <p>Abdominal Circumference<span></span></p>
           <input type="text" onkeypress='return onlyNos(event,this);' class="form-control"  name="ac" id="ac">
	</div>
  </div>
   
  </div>
  <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-2">
  <div class="form-group">
            <p>Blood Pressure<span></span></p>
             <input type="text" class="form-control" size="2" onkeypress='return onlyNos1(event,this);' name="bp" id="bp" value="">
	</div>
  </div>
  
        <div class="col-xs-1">
  <div class="form-group">
           
            <p>Pulse<span></span></p>
             <input type="number" class="form-control" min="0" name="pulse" id="pulse" value="72">
           
	</div>
  </div>
  
     <div class="col-xs-2">
  <div class="form-group">
           
            <p>Body Mass Index<span></span></p>
             <input type="text" class="form-control" onkeypress="return onlyAlphabets(event,this);" readonly="readonly" name="bmi" id="bmi" value="">
           
	</div>
  </div>
  
  
   <div class="col-xs-5">
  <div class="form-group">
            <p>Chest Circumference<span></span></p>
           <input type="text" class="" size="14" onkeypress='return onlyNos(event,this);' placeholder="Full Inspiration" name="fi" id="fi">
            <input type="text" class="" size="14" onkeypress='return onlyNos(event,this);' placeholder="Full Expiration" name="fe" id="fe">
             <input type="text" class="" size="10" onkeypress='return onlyNos(event,this);' placeholder="At Rest" name="rest" id="rest">
	</div>
  </div>
  </div>
  
   <div class="form-group row" >
      <div class="col-xs-1"></div>
        <div class="col-xs-4">
  <div class="form-group">
            <p>Nurse Signature<span></span></p>
           <input type="text" class="form-control input-sm"  name="nname" id="nname" value="NA">
            <input type="hidden" class="form-control input-sm"  name="nid" id="nid">
           
      </div>
        </div>
        
              <div class="col-xs-1"></div>
           <div class="col-xs-4">
  <div class="form-group">
            <p>Doctor Signature<span></span></p>
           <input type="text" class="form-control input-sm"  name="dname" id="dname" value="NA">
            <input type="hidden" class="form-control input-sm"  name="docid" id="docid">
           
      </div>
        </div>
  </div>
   
  
	 <button type="submit" onclick ="return validmess()" class="bouton-contact" id="bouton-contact" >Save</button>
     </form>
     
     <div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
   
       <form id="form3" action="" method="">  
  
        <h1><span id="ch"> View Vital Records </span>
      <!--  <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>  --> 
        </h1>
        
       <br>
       <div class="container" >
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed " style="width: 450px; " id="myTable">
    <thead>
      <tr>
        <th style="width:200px">File No</th> 
        <th style="width:200px">Recorded Time</th>
        <th style="width:50px">View</th>
        
       
      </tr>
    </thead>
    <tbody class="tbody">
     
   
<c:forEach var="p1"  items="${model.list1}">
 <tr>
      <td style="width:200px">${p1.fileno}</td> 
      <td style="width:200px">${p1.time}</td>
      <td style="width:50px"><i class="fa fa-eye" style="color:#00b300" onclick="copy('${p1.pid},${p1.fileno},${p1.height},${p1.unith},${p1.weight},${p1.unitw},${p1.temperature},${p1.unitt},${p1.ac},${p1.bp},${p1.bmi},${p1.fi},${p1.fe},${p1.rest},${p1.pulse}')"></i></td></td>
      </tr>
</c:forEach>    
    
   
     
    </tbody>
     
    </table>
  
    </div>
     
 

 
 <button type="" class="bouton-contact" onclick="" ></button>
       </form>
       </div>
       
       
  
       </div>
   </div>
   
    <c:forEach var="p1"  items="${model.list4}">
     <script>
        checkhome('<c:out value="${p1.nid}" />','<c:out value="${p1.nname}" />')
      </script>
     </c:forEach>

 <c:forEach var="p"  items="${model.list1}">
<script>
displaymodal();
</script>
</c:forEach>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
<script>
var bac = '<c:out value='${model.bac}'/>';
</script>
</body>
</html>