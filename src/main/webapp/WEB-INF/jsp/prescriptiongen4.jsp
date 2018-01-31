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
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.js"></script>

<style>
.wrapper {
  height : auto;
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

#myTable1 th {
    background-color: #009999;
    color: black;
}

.table-fixed{
 
}

   #myTable1 .tbody{
    height:150px;
    overflow-y:auto;
 }
 #myTable1 thead,.tbody{
  
    
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

#myTable thead,tbody{
  
    
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

.ui-dialog-title {
        float:none !important;
        display: block;
        text-align: center;
        color : #fff;
    }
#result.ui-dialog-content{
 
 overflow :auto;   
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
<script type="text/javascript">
var userb;

function checkhome(user){
	
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	if(tableRef.rows.length == 0){
		display();
	}
	document.getElementById("hds").style.display = "none";
	userb = user; 
	var m = moment().format("DD-MM-YYYY");
	document.getElementById("date").value= m;
	
	if(user.includes("[ROLE_FDESK]")){
		
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
	else if(user.includes("[ROLE_ASSISTANT]")){
		
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 document.getElementById("bc").disabled = true;
	}

	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	disbut()
}

function disbut(){
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
		 
		
		if(tableRef.rows.length == "0"){
			document.getElementById("bc").disabled = true;
		}
		else{
			document.getElementById("bc").disabled = false;	
		}
		
		if(userb == "[ROLE_ASSISTANT]" || userb == "[ROLE_CASHIER]"){
			document.getElementById("bc").disabled = true;
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

var c = document.getElementsByClassName("baf");
for(var i=0;i<c.length;i++){
	AutoGrowTextArea(c[i])
}

var d = document.getElementsByClassName("drname");
for(var i=0;i<d.length;i++){
	AutoGrowTextArea(d[i])
}

var e = document.getElementsByClassName("strdrg");
for(var i=0;i<e.length;i++){
	AutoGrowTextArea(e[i])
}

var f = document.getElementsByClassName("name");
for(var i=0;i<e.length;i++){
	AutoGrowTextArea(f[i])
}
	
	document.getElementById("close").style.display = "none";
	//document.getElementById("di").style.display = "none";
	document.getElementById("hds").style.display = "block";
	document.getElementById("opener3").style.display = "none";

	
	window.print();
	document.getElementById("close").style.display = "block";
	document.getElementById("hds").style.display = "none";
	document.getElementById("opener3").style.display = "block";

	}
//	document.getElementById("di").style.display = "block";
}

function addname(getval){
	
	
	var myname = getval.getAttribute('data-value'); 	
		//var str = document.getElementById("pname").getAttribute("data-value");
	//	alert(str);
		
		
	
		var strSplit = myname.split('=');
//		alert(strSplit[9]);

		document.getElementById("pid").value = strSplit[0];
		document.getElementById("pname").value = strSplit[1];
		document.getElementById("docid").value = strSplit[2];	
		document.getElementById("dname").value = strSplit[3];	
		
		document.getElementById("fileno").value = strSplit[4];
		document.getElementById("admitno").value = strSplit[5];
		document.getElementById("age").value = strSplit[6];
	
		//document.getElementById("dname").value = strSplit[3];
		
		

	
}

function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
    disbut();
    
}
function checkbox(){
	var chk1 = document.getElementsByName("dm");
	
	
	
	for(var i=0;i<chk1.length;i++){
		if(chk1[i].checked == false){
			chk1[i].value="off";
		}
		
	}
	var chk2 = document.getElementsByName("da");
	for(var i=0;i<chk2.length;i++){
		if(chk2[i].checked == false){
			chk2[i].value="off";
		}
		
	}
	var chk3 = document.getElementsByName("de");
	for(var i=0;i<chk3.length;i++){
		if(chk3[i].checked == false){
			chk3[i].value="off";
		}
		
	}
	var chk4 = document.getElementsByName("dn");
	for(var i=0;i<chk4.length;i++){
		if(chk4[i].checked == false){
			chk4[i].value="off";
		}
		
	}
	
alert(document.getElementsByName("dm").length)
alert(document.getElementsByName("da").length)
alert(document.getElementsByName("de").length)
alert(document.getElementsByName("dn").length)

document.getElementById("form1").submit();
}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/ipdpr.html";
	}
}


function display(){ 
	
	
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
  	
	//    var m = moment().format('YYYY-MM-DD h:mm a');

	  var newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<input type='text'  form ='form1'  class= 'form-control input-sm' value=' ' id = 'typeofdr' name= 'typeofdr'  required>";
	  newCell.style.width ='100px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value=' '  type='text' id = '"+tableRef.rows.length+"' name= 'drugname'  required> </td></tr>";
	  newCell.style.width ='100px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value=' ' type='text' id = 'strdrug' name= 'strdrug'  required> </td></tr>";
	  newCell.style.width ='100px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm baf' value=' ' type='text' id = 'dosage' name= 'dosage'  required> </td></tr>";
	  newCell.style.width ='50px';
		 
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><select  form ='form1' class= 'form-control input-sm baf'   id = 'dm'  name= 'dm'  ><option value='PRN'>PRN</option><option value='OD'>OD</option><option value='BD'>BD</option><option value='TDS'>TDS</option><option value='QID'>QID</option><option value='OTHERS'>OTHERS</option></select> </td></tr>";
	  newCell.style.width ='20px';
	  /*
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='NA' type='text' id = 'da' name= 'da' required > </td></tr>";
	  newCell.style.width ='120px';
	  
*/	  
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><textarea  form ='form1' class= 'form-control input-sm baf'  id = 'baf' name= 'baf' onfocus='AutoGrowTextArea(this)' >NA</textarea></td></tr>";
	  newCell.style.width ='100px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm baf' value=' ' type='text' id = 'totn' name= 'totn'  required> </td></tr>";
	  newCell.style.width ='70px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm baf' value=' ' type='text' id = 'nofdays' name= 'nofdays'  required> </td></tr>";
	  newCell.style.width ='50px';
		 
	
	 

	  
	 
		 

	disbut();
}
var addpe;
function addp(){
	if(document.getElementById("drugn").value == "select"){
		alert("Drug Name is not selected")
		return false;
	}
	else{
	document.getElementById(addpe).value = document.getElementById("drugn").value;
	  $('select[name=drugn]').val("select");
	   $('#drugn').selectpicker('refresh');
	   
	$('#myModal2').modal('hide');
	}
}

</script>
<script>
function doAjaxPost(fileno) {
	   // get the form values
	   $("#myTable1 .tbody1 tr").remove();
	   
	  var counter = 1;
	         //  var name = $('#pname').val();
	    var pid = $('#pid').val();
	             $.ajax({
	        	  
	        	           type: "GET",
	        	   
	        	           url: "/HMS/prescription1/"+fileno+"/"+pid+"",
	        	           async: false,
	        	           dataType: "JSON",
	        	           contentType: "application/json; charset=UTF-8",
	        	           
	        	          
	        	           
	        	          
	             
	             success: function(response){
	        	   


      
    $.each(response.list5, function(index, drug) {
 	 
     
      
    	

  	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
  	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
  	
  	//    var m = moment().format('YYYY-MM-DD h:mm a');
  	
  	               var cnt = tableRef.rows.length;
       	     	   var dmc = "dm"+cnt;
       	     	   var dac = "da"+cnt;
       	     	   var dec = "de"+cnt;
       	     	   var dnc = "dn"+cnt;
       	     	   var baf = "baf"+cnt;

  	  var newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input type='text' class='form-control input-sm'  form ='form1'   id = 'typeofdr' value='"+drug.typeofdr+"' name= 'typeofdr'  required> </td></tr>";
  	  newCell.style.width ='100px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  value='"+drug.drugname+"' type='text' id = 'drugname' name= 'drugname'  required> </td></tr>";
  	  newCell.style.width ='100px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  value='"+drug.strdrug+"' type='text' id = 'strdrug' name= 'strdrug'  required> </td></tr>";
  	  newCell.style.width ='65px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  value='"+drug.dosage+"' type='text' id = 'dosage' name= 'dosage'  required> </td></tr>";
  	  newCell.style.width ='65px';
  		 
  	  
  	 newCell = rowsAdd.insertCell();
     newCell.innerHTML="<tr><td><select  form ='form1' class= 'form-control input-sm'   id = '"+dmc+"'  name= 'dm'  ><option value='PRN'>PRN</option><option value='OD'>OD</option><option value='BD'>BD</option><option value='TDS'>TDS</option><option value='QID'>QID</option><option value='OTHERS'>OTHERS</option></select> </td></tr>";
     newCell.style.width ='20px';
    	/*  
     newCell = rowsAdd.insertCell();
     newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' id = '"+dac+"'  name= 'da'  value='"+drug.da+"'</td></tr>";
     newCell.style.width ='120px';
    	  */
     newCell = rowsAdd.insertCell();
     newCell.innerHTML="<tr><td><input type='text' form ='form1' class= 'form-control input-sm'  id = '"+baf+"' name= 'baf' value='"+drug.baf+"'></td></tr>";
     newCell.style.width ='100px';
     
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input  form ='form1'  class= 'form-control input-sm'  type='text' value='"+drug.totn+"' id = 'totn' name= 'totn'  required> </td></tr>";
  	  newCell.style.width ='70px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><input  form ='form1'  class= 'form-control input-sm'  type='text' id = 'nofdays' value='"+drug.nofdays+"'name= 'nofdays'  required> </td></tr>";
  	  newCell.style.width ='70px';
  	
  	
  	  
  	 
  //	 document.getElementById(baf).value = drug.baf;
	 document.getElementById(dmc).value = drug.dm;
	// document.getElementById(dac).value = drug.da;
	// document.getElementById(dec).value = drug.de;
	// document.getElementById(dnc).value = drug.dn;
	  
    });
    },
    error: function(e){
 	  
 	           alert('Error: ' + e);
 	  
 	           }
 	           });
 	   
 	           }
	        	   
	        	           






</script>

<script>
function doAjaxPost2() {
	   // get the form values
	//  
	

	if(document.getElementById("pname").value == "Select"){
		alert("Please select the patient name")
		return false;
		
	}
 
	/*
	if(tableRef.rows.length == 1){
		 $('#myTable .tbody tr').each(function(){
			 if($(this).closest('tr').find('input').length > 0){
			alert()
				 // there is a button
				}
		 });
		display();
	}
	*/
		
	
	  var counter = 1;
	          var fileno = $('#fileno').val();
	          $("#myTable .tbody tr").remove();	         
	            //var docid = $('#docid').val();
	             $.ajax({
	        	  
	        	           type: "GET",
	        	   
	        	           url: "/HMS/ipdpr1/"+fileno+"",
	        	           async: false,
	        	           dataType: "JSON",
	        	           contentType: "application/json; charset=UTF-8",
	        	           
	        	          
	        	           
	        	          
	             
	             success: function(response){
	            	 

if(response.length == 0){
	$("#myTable .tbody tr").remove();
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	
	if(tableRef.rows.length == 1){
		display();
	}
	alert("No Records exists for this Patient file number")
}
      
    $.each(response, function(index, drug) {
 	
    	
    document.getElementById("dname").value = drug.dname;
   //  document.getElementById("diagnosed").value = drug.diagnosed;
      

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
  	  newCell.innerHTML="<tr><td><textarea class='form-control input-sm name'  form ='form1'    id = 'typeofdr' oninput ='AutoGrowTextArea(this)'  name= 'typeofdr'  required>"+drug.typeofdr+"</textarea></td></tr>";
  	  newCell.style.width ='100px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><textarea  form ='form1' class= 'form-control input-sm drname' oninput ='AutoGrowTextArea(this)'  id = '"+tableRef.rows.length+"' name= 'drugname'  required>"+drug.drugname+"</textarea></td></tr>";
  	  newCell.style.width ='100px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><textarea  form ='form1' class= 'form-control input-sm strdrg' oninput='AutoGrowTextArea(this)' id = 'strdrug' name= 'strdrug'  required>"+drug.strdrug+"</textarea></td></tr>";
  	  newCell.style.width ='65px';
  	  
  	  newCell = rowsAdd.insertCell();
 	  newCell.innerHTML="<tr><td><textarea  form ='form1' class= 'form-control input-sm' oninput='AutoGrowTextArea(this)' id = 'dosage' name= 'dosage'  required>"+drug.dosage+"</textarea></td></tr>";
 	  newCell.style.width ='65px';
  		 
 	 newCell = rowsAdd.insertCell();
     newCell.innerHTML="<tr><td><select  form ='form1' class= 'form-control input-sm'   id = '"+dmc+"'  name= 'dm'  ><option value='PRN'>PRN</option><option value='OD'>OD</option><option value='BD'>BD</option><option value='TDS'>TDS</option><option value='QID'>QID</option><option value='OTHERS'>OTHERS</option></select> </td></tr>";
     newCell.style.width ='20px';
    	  /*
     newCell = rowsAdd.insertCell();
     newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' id = '"+dac+"'  name= 'da'  value='"+drug.da+"'</td></tr>";
     newCell.style.width ='120px';
    	  */
     newCell = rowsAdd.insertCell();
     newCell.innerHTML="<tr><td><textarea form ='form1' class= 'form-control input-sm baf'  id = 'baf' name= 'baf' oninput='AutoGrowTextArea(this)'>"+drug.baf+"</textarea></td></tr>";
     newCell.style.width ='100px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><textarea  form ='form1' class= 'form-control input-sm'  type='text' id = 'totn' oninput='AutoGrowTextArea(this)'  name= 'totn'  required>"+drug.totn+"</textarea></td></tr>";
  	  newCell.style.width ='70px';
  		 
  	  newCell = rowsAdd.insertCell();
  	  newCell.innerHTML="<tr><td><textarea  form ='form1'  class= 'form-control input-sm' id = 'nofdays' oninput='AutoGrowTextArea(this)' name= 'nofdays'  required>"+drug.nofdays+"</textarea></td></tr>";
  	  newCell.style.width ='70px';
  		 
  	 
  	  
  	 /*
  		 
  	 if(drug.dm == "on"){
		   document.getElementById(dmc).checked = true;
		
	   }
     	if(drug.da == "on"){
		   document.getElementById(dac).checked = true;
		
	   }
       if(drug.de == "on"){
		   document.getElementById(dec).checked = true;
		
	   }
     	 if(drug.dn == "on"){
		   document.getElementById(dnc).checked = true;
		
	   }
     	 */
     	 
     	// document.getElementById(baf).value = drug.baf;
    	 document.getElementById(dmc).value = drug.dm;
    	
	  
    });
    },
    error: function(e){
 	  
 	           alert('Error: ' + e);
 	  
 	           }
 	           });
	           
 	   unsaved = false;
 	disbut()
 	           }
	        	   
	        	           






</script>

	<script type="text/javascript">
	/*
	$(document).on('keydown', function(e) {
	    if(e.ctrlKey && (e.key == "p" || e.charCode == 16 || e.charCode == 112 || e.keyCode == 80) ){
	       // alert("Please use the Print PDF button above for a better rendering on the document");
	        disp();
	        e.cancelBubble = true;
	        e.preventDefault();

	        e.stopImmediatePropagation();
	    }  
	  
	});
	
	
	
	*/
	</script>
<script>
  $( function() {
	
    $( "#result" ).dialog({
      
    	dialogClass: 'result',
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( "#opener" ).on( "click", function() {
    	var isOpen = $( "#result" ).dialog( "isOpen" );
      if(isOpen == true){
    	  
    	  $( "#result" ).dialog( "open" );
      }
      else{
    	if(document.getElementById("pname").value =="Select"){
    	alert("Please select Patient Name")
    	return false;
    	}
    	else{
    	doAjaxPost(document.getElementById("fileno").value),
    	 $( "#result" ).dialog( "open" );
    	}
    	}
    
    });
    
    $(document).on('click','.ui-dialog-titlebar-close',function(){
    	
   	 $('#result').dialog('close');
   	});
    
    $('#result').dialog({height: 500, width:800 });
    $(".ui-dialog").find(".ui-widget-header").css("background", "#009999","text-align","center");
    
  });
  </script>
 <script>
  $( function() {
	  $( "#myModal2" ).dialog({
	      
	    	dialogClass: 'myModal',
	      autoOpen: false,
	      show: {
	        effect: "blind",
	        duration: 1000
	      },
	      hide: {
	        effect: "explode",
	        duration: 1000
	      }
	    });
	 
	    $('.tbody').on( 'click','tr td:nth-child(2)', function() {
	    	
	    	// var x=this.cells;
	    	    
 	        //var id = $(this).closest("tr").find('td:eq(1)').attr('value');
           //  var string = x[1].innerHTML;
      
 	      // console.log(this.getElementsByTagName('input')[0].value);
 	     addpe = this.getElementsByTagName('input')[0].id;
 	 
	    	var isOpen = $( "#myModal2" ).dialog( "isOpen" );
	        
	    	if(isOpen == true){
	    	  
	    	  $( "#myModal2" ).dialog( "open" );
	      }
	      else{
	    	
	    
	    	 $( "#myModal2" ).dialog( "open" );
	      }
	    
	    });
	    $('#myModal2').dialog({height: 300, width:300 });
	    $(".ui-dialog").find(".ui-widget-header").css("background", "#009999","text-align","center");
	    
	    
	 
  $( "#opener4" ).on( "click", function() {
	  
	  var isOpen = $( "#myModal2" ).dialog( "isOpen" );
      
  	if(isOpen == true){
  	  
  	  $( "#myModal2" ).dialog( "open" );
    }
    else{
  	
  
  	 $( "#myModal2" ).dialog( "open" );
    }
  
	  
  });
     $(document).on('click','.ui-dialog-titlebar-close',function(){
    	 
    	 $('#myModal2').dialog('close');
    	
	});
     
  });
  </script>
  


</head>

<sec:authentication property="principal.authorities" var="username" />

<body onload = "checkhome('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >IPD Prescription</a>
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
     <ul class="nav navbar-nav navbar-right">
      <li><a href="/HMS/prdocs"><span class="fa fa-arrow-left"></span>Back</a></li>
      
    </ul>
  </div>
</nav>
  <center>
</center>
  <div id="form2" >  
  
     <h1>
	
  <button type="submit" id="bc" form="form1" class="btn btn-warning button1" onclick="" >Save</button>    	
<font size="5">IPD Prescription</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
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
	   <form id="form1" action="saveipdp.html" method="post"></form>  
	      <div class="col-xs-3">
	      
	      <div class="form-group">
      
           
   Doctor:<input type="text" name="dname" id="dname"  form="form1" class="form-control input-sm"  required>
       
       
	</div>
	      </div>
	      <div class="col-xs-4"></div>
	             <div class="col-xs-3">
	        <div class="form-group">
     
        
          Date:<input type="text" name="date" id="date"  form="form1" class="form-control input-sm"  required>
     
     
       
	</div>
	      
	      </div>
	      </div>
	         <div class="col-xs-1"></div>
	<div class="form-group row" >
	  
	      <div class="col-xs-3">
	      
	      <div class="form-group">
            
        Patient Name:<select class="selectpicker form-control" data-size="4" data-live-search="true" form="form1" name = "pname" id ="pname" onchange="addname(this.options[this.selectedIndex])">
          <option value="Select" selected disabled>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pname}" data-subtext="${p.fileno}" data-value="${p.pid}=${p.pname}=${p.docid}=${p.dname}=${p.fileno}=${p.admitno}=${p.age}=${p.cause}">${p.pname}</option>
        </c:forEach>
      </select>
       
	</div>
	      </div>
	       <div class="col-xs-4"></div>
	       <div class="col-xs-3">
	      
	       <div class="form-group">
       
    Age:<input type="text" name="age" id="age" class="form-control input-sm"  required>
       
       
       
	</div>
	      </div>
	      
	
	      
	      </div>
	      <div class="form-group row" >
	    <div class="col-xs-1"></div>
	      <div class="col-xs-5">
	      
	      <div class="form-group">
      <!--  
           
    Diagnosis:<input type="text" name="diagnosed" id="diagnosed"  form="form1" class="form-control input-sm"  required>
       
     -->  
	</div>
	</div>
	</div>
	  <input type="hidden" name="fileno" id="fileno" form="form1" class="form-control input-sm"  required>
	  <input type="hidden" name="admitno" id="admitno" form="form1"  class="form-control input-sm"  required>
	  
	  <input type="hidden" name="docid" id="docid" form="form1"  class="form-control input-sm"  required>
	  <input type="hidden" name="pid" id="pid"  form="form1" class="form-control input-sm"  required>    
	      
	          <div class="table-responsive" id="pr4">
	      
	     
	     	    
  <table class="table table-striped table-bordered table-fixed table-hover table-condensed"  id="myTable">
    <thead>
          <tr>
        <th style="">Category of Drug</th>
        <th style="">Name of Drug</th>
        <th style="">Strength of Drug</th>
        <th style="">Dosage</th>
        <th  style="" >Frequency</th>
        
        <th  style="">Remarks</th>
        <th> Number of Quantity dispensed</th>
        <th >No. of Days</th>
      </tr>
    </thead>
    <tbody class="tbody">

   
    </tbody>
    <!-- 
     <tr>
		    <td id="plus"><i class='fa fa-plus' style='font-size:20px; color : #ff9900;'  onclick="display()"></i></td>
		  </tr>
		  
		   -->
		    
    </table>
	
	   
</div>
<div class="form-group row" >
  
 
   <div class="col-xs-1"></div>
     <div class="col-xs-2">
   <div class="form-group">
    <button id="opener3" class="btn btn-warning button1" onclick="display()">Add Row</button>
  
   </div>
   </div>
   
    <div class="col-xs-2">
   <div class="form-group">
    <button id="opener" class="btn btn-warning button1" >OPD Prescription</button>
  
   </div>
   </div>
   
   <div class="col-xs-2">
   <div class="form-group">
    <button id="opener2" class="btn btn-warning button1" onclick="return doAjaxPost2()">Previous Records</button>
  
   </div>
   </div>
       
         <div class="col-xs-2">
   <div class="form-group">
    <button id="opener4" class="btn btn-warning button1" >Show Available Drugs</button>
  
   </div>
   </div>
  
 </div>
 
  <div class="col-xs-7"></div>
   <span id="hds">Doctor's Signature ____________</span>

 <button type="" id="bouton-contact" class="bouton-contact"  ></button>
</div>
</div>
<div id="result"  title="OPD Prescription">

	      
	     
	     <div class="table-responsive">
	     	    
  <table class="table table-striped table-bordered table-fixed table-hover table-condensed"  id="myTable1">
    <thead>
   <tr>
        <th style="">Category of Drug</th>
        <th style="">Name of Drug</th>
        <th style="">Strength of Drug</th>
        <th style="">Dosage</th>
        <th  style="" >Frequency</th>
        
        <th  style="">Remarks</th>
        <th> Number of Quantity dispensed</th>
        <th >No. of Days</th>
      </tr>
    </thead>
    <tbody class="tbody1">

   
    </tbody>
    </table>
    </div>

  
    </div>

 <!-- Pharmacy products load -->
       
 <div id="myModal2"  title="Pharmacy Products">
   <div class="form-group row" >
        <div class="col-xs-8">
        <p>Drug Name<span></span></p>
       <div class="form-group">
      
       <select class="selectpicker form-control input-sm" data-size="5" data-live-search="true" name = "drugn" id ="drugn" onchange=""   >
          <option value="select" disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list4}">
        <option data-subtext="${p.pstock1}" value="${p.drugn}">${p.drugn}</option>
        </c:forEach>
      </select></div>
      </div>
       <div class="col-xs-2">
       <br><br>
      <button type="button" class="btn btn-warning" onclick="return addp()">ADD</button></div>
  
      </div>
  </div>
    

</body>

<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</html>