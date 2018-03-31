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

<link rel='stylesheet' href='<c:url value="/resources/css/iochart.css" />' type='text/css' media='all' />
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>

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
  max-width:1300px;
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


.btn-block{
 width : 1250px;
}

 

#myTable1 th {
    background-color: #009999;
    color: white;
   
}

.table-fixed{
 
}
  #myTable1 .tbody1{
    height:150px;
    overflow-y:scroll;
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

#myTable1 {
    border-collapse: collapse;
    width: 100%;
     margin-left : -90px;
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

function disbut(){

	if(document.getElementById("pname").value == "Select"){
		document.getElementById("pr").disabled = true;
	}
	else{
		document.getElementById("pr").disabled = false;	
	}
	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	 
	
	if(tableRef.rows.length == "0" ){
		document.getElementById("bouton-contact").disabled = true;
	//	document.getElementById("hiderow").style.display = "none";
	}
	else{
		document.getElementById("bouton-contact").disabled = false;	
	//	document.getElementById("hiderow").style.display = "block";
	}
	
	if(document.getElementById("doctord").value == " "){
		
		document.getElementById("bouton-contact").disabled = true;
	}
	else{
		
		document.getElementById("bouton-contact").disabled = false;
	}
	
}


function deleteRow(r) {
	 
	   var i = r.parentNode.parentNode.rowIndex;
	  
	   document.getElementById("myTable1").deleteRow(i);
	  //   totalIt();
	  disbut();
	    unsaved = true;
	}
	
	function disrows(user,col){
		/*
		if(user.includes("[ROLE_DOCTOR]") ){
		 var i = document.getElementsByClassName(col);
		 for(var x=0;x<i.length;i++){
			  i[x].disabled = true;
		 }
		}
		*/
	        if(user.includes("[ROLE_NURSE]")){
			 var i = document.getElementsByClassName(col);
			 for(var x=0;x<i.length;i++){
				  i[x].disabled = true;
			 }
	    }
		
	}
function checkhome(user){
	document.getElementById("curdate").value = new Date();
	if(user.includes("dbfdesk")){
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();	
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		$("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		// document.getElementById("hiderow").style.display = "none";
	}
     else if(user.includes("[ROLE_DOCTOR]")){
		
		var url = "/HMS/doctor1" ;
		$("#back").hide();
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		// document.getElementById("hiderow").style.display = "none";
	}
	
	else if(user.includes("[ROLE_NURSE]")){
			 var url = "/HMS/nursedesk" ;
			 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 user1a = user;
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
		/*
		 if(bac.includes("dochome")){
			 $("#back").attr("href","/HMS/doctor1")
			 $("#tit").text("Back to Doctor Home")
		 }
		 else{
			 $("#back").attr("href","/HMS/nursedesk") 
			 $("#tit").text("Back to Nurse Desk")
		 }
		 */
	}
}

/*
function checkhome(){
	
	
	if(user.includes("D-")){
		 var url = "/HMS/doctor1" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 var url2 = "/HMS/myapps/"+user+"" ;
			
		 var element = document.getElementById('m2');
		 element.setAttribute("href",url2)
		 
		 var url3 = "/HMS/prescription/"+user+"" ;
			
		 var element = document.getElementById('m3');
		 element.setAttribute("href",url3)
		 
		  var url4 = "/HMS/treatment/"+user+"" ;
		
		 var element = document.getElementById('refresh');
		 element.setAttribute("location.href",url4)
		 
		 var url5 = "/HMS/vtreatment/"+user+"" ;
			
		 var element = document.getElementById('formb');
		 element.setAttribute("action",url5)
		 
		 
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 var url2 = "/HMS/myapps/"+user+"" ;
			
		 var element = document.getElementById('m2');
		 element.setAttribute("href",url2)
		 
		 var url3 = "/HMS/prescription/"+user+"" ;
			
		 var element = document.getElementById('m3');
		 element.setAttribute("href",url3)
		 
		  var url4 = "/HMS/treatment/"+user+"" ;
			
		 var element = document.getElementById('refresh');
		 element.setAttribute("location.href",url4)
		 
		  var url5 = "/HMS/vtreatment/"+user+"" ;
			
		 var element = document.getElementById('formb');
		 element.setAttribute("action",url5)
		 
	}
}
*/
function visible(){
	 var pid = document.getElementById("pid").value ;
	 if(pid == "" || pid == null){
	 alert("Please select the patient!!");
	 return false;
	 }
	 else{
		 return true;
	 }
	
}


function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
	
	var idp,namep,admdatep,datetimep,dailychartp,dnamed,commentsd;
	function check(idpa){
	//	alert(idpa);
		var idpaa = idpa.split('=.=');
        /*
		
        
  */
        
   
    //   alert(idpaa[0],idpaa[1],idpaa[2]);
 	 
       var namep = idpaa[0].split(',');
     
       var admdatep = idpaa[1].split(',');
       var datetimep = idpaa[2].split(',');
       var dailychartp = idpaa[3].split(',');
       var dnamed = idpaa[4].split(',');
       var commentsd = idpaa[5].split(',');
       var remarks = idpaa[6].split(',');
       var remarks1 = idpaa[7].split(',');
       var doctord = idpaa[8].split(',');
       var doctsig = idpaa[9].split(',');
       var rateflow = idpaa[10].split(',');
       var nursesig = idpaa[11].split(',');
   	
       
      // for (var x=0; x<namep.length;x++){
    
    		  
    		  var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
    	    	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
    		  
    	    
    	    	var newCell = rowsAdd.insertCell();
    	  	  newCell.innerHTML="<tr><td><input  form ='forma' class= 'form-control input-sm'  type='text' value='"+idpaa[0]+"' id = 'time' name= 'time'  required> </td></tr>";
    	  	  newCell.style.width ='87';
    		  newCell.style.border='groove';
    	  	  
    	  	  newCell = rowsAdd.insertCell();
    	  	  newCell.innerHTML="<tr><td><input form ='forma'  class= 'form-control input-sm' value='"+idpaa[1]+"' id = 'oraltype'  name= 'oraltype' required></td></tr>";
    	  	  newCell.style.width ='89px';
    		  newCell.style.border='groove';
    	  	  
    	  	  newCell = rowsAdd.insertCell();
    	  	  newCell.innerHTML="<tr><td ><input form ='forma' class= 'form-control input-sm'  type='text' value='"+idpaa[2]+"'  id = 'oralamt' name= 'oralamt'  required  ></td></tr>";
    	  	  newCell.style.width ='105px';
    		  newCell.style.border='groove';
    		  
    	  	  
    	  	  newCell = rowsAdd.insertCell();
    	  	  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' value='"+idpaa[3]+"' id = 'oralcommence'  name= 'oralcommence'  required></td></tr>";
    		  newCell.style.width ='111px';
    		  newCell.style.border='groove';
    	  	  
    	  	  
    	  	  newCell = rowsAdd.insertCell();
    	  	  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' value='"+idpaa[4]+"' id = 'amtgiv'  name= 'amtgiv'  required></td></tr>";
    		  newCell.style.width ='86px';
    		  newCell.style.border='groove';
    	  	  
    	  	  newCell = rowsAdd.insertCell();
    	  	  newCell.innerHTML="<tr><td><input  form ='forma' class= 'form-control input-sm' value='"+idpaa[5]+"' type='text' id = 'urine' name= 'urine'  required> </td></tr>";
    	  	  newCell.style.width ='81px';
    		  newCell.style.border='groove';
    		  
    	  	  
    	  	  newCell = rowsAdd.insertCell();
    	  	  newCell.innerHTML="<tr><td><input form ='forma'  class= 'form-control input-sm' value='"+idpaa[6]+"'  id = 'vomitus'  name= 'vomitus' required></td></tr>";
    	  	 newCell.style.width ='133px';
   		  newCell.style.border='groove';
    	  	  
    	  	  newCell = rowsAdd.insertCell();
    	  	  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' value='"+idpaa[7]+"' type='text'  id = 'remarks' name= 'remarks'  required  ></td></tr>";
    		  newCell.style.width ='91px'; 
    		  newCell.style.border='groove';
    	  	  
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td><input form ='forma'  class= 'form-control input-sm' id = 'doctsig'  name= 'doctsig' value='"+idpaa[8]+"' required></td></tr>";
    		  newCell.style.width ='85px';
    		  newCell.style.border='groove';
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td ><input form ='forma' class= 'form-control input-sm'  type='text'  id = 'doctord' name= 'doctord' value='"+idpaa[9]+"' required  ></td></tr>";
    		  newCell.style.width ='90px';
    		  newCell.style.border='groove';
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' id = 'ratef'  name= 'ratef' value='"+idpaa[10]+"'  required></td></tr>";
    		  newCell.style.width ='68px';
    		  newCell.style.border='groove';
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm'  type='text'  id = 'doctrmks' name= 'doctrmks' value='"+idpaa[11]+"' required  ></td></tr>";
    		  newCell.style.width ='92px'; 
    		  newCell.style.border='groove';
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
    		  newCell.style.width ='70px';
    		  newCell.style.border='groove';
    	  	 

    	  	
    		  
    		

    	  
 //  }	

	}
var user1a,user2a,user2c;
function display(user1,user2){ 
	user1a = user1;
	user2c = user2;
	if(document.getElementById("date").value != moment().format("DD-MM-YYYY") && document.getElementById("date").value !="select"){
		alert("You are about to edit the records entered on "+document.getElementById("date").value +". Please click on clear table and click on plus sign to add new records for current date" )
		       return false;		
	}
	
    var nursegig;
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	  
	var counter = "doctsig" +  tableRef.rows.length;

if(user1 == "[ROLE_NURSE]" ||user1 == "[ROLE_CHIEFNURSE]" ){
	nursesig = user2;
	user2 = document.getElementById("doctsig1").value;
	
}
else{
	nursesig = "NA";
}
	
	//    var m = moment().format('YYYY-MM-DD h:mm a');
 var rowa = "taba"+ tableRef.rows.length;    
	  var markup = "<tr id='"+rowa+"'><td style='width:87px;'><input type='hidden' name='aid1' id='aid1' value= "+$.now()+"  form='forma'><input  form ='forma' value='"+new Date(new Date().getTime()).toLocaleTimeString()+"' class= 'form-control input-sm'   readonly = 'readonly' type='text' id = 'time' name= 'time' ></td><td style='width:89px'><input form ='forma'  class= 'form-control input-sm' id = 'oraltype' value=' ' name= 'oraltype' ></td><td style='width:105px'><input form ='forma' onkeypress='return onlyNos(event,this);' class= 'form-control input-sm' value=' ' type='text'  id = 'oralamt' name= 'oralamt'></td><td style='width:111px;'><input form ='forma' class= 'form-control input-sm'  value=' ' id = 'oralcommence'  name= 'oralcommence' ></td><td style='width:86px'><input form ='forma' class= 'form-control input-sm' onkeypress='return onlyNos(event,this);' value=' ' id = 'amtgiv'  name= 'amtgiv'  ></td><td style='width:71px'><input  form ='forma' class= 'form-control input-sm' onkeypress='return onlyNos(event,this);' value=' '  type='text' id = 'urine' name= 'urine'></td><td style='width:133px;'><input form ='forma'  class= 'form-control input-sm' onkeypress='return onlyNos(event,this);' value=' ' id = 'vomitus'  name= 'vomitus' ></td><td style='width:91px;'><input form ='forma' class= 'form-control input-sm' value=' ' type='text'  id = 'remarks' name= 'remarks'></td><td style='width:91px;'><input form ='forma' class= 'form-control input-sm' value='"+nursesig+"' type='text'  id = 'nsign' name= 'nsign'></td><td style='width:90px;'><input form ='forma' class= 'form-control input-sm dcotsig'  type='text' value='"+user2+"'  id = '"+counter+"' name= 'doctsig'  required  ></td><td style='width:85px;'><input form ='forma'  class= 'form-control input-sm doctord' value=' ' id = 'doctord' oninput='disbut()' name= 'doctord' required></td><td style='width:68px'><input form ='forma' class= 'form-control input-sm ratef' value=' ' id = 'ratef'  name= 'ratef'  required></td><td style='width:92px'><input form ='forma' class= 'form-control input-sm doctrmks'  value=' ' type='text'  id = 'doctrmks' name= 'doctrmks'  required  ></td><td style='width:70px'><i class='fa fa-trash-o' style='font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
	  $('#myTable1 .tbody1').append(markup);
	  var elmnt = document.getElementById(rowa);
	     elmnt.scrollIntoView();
	     $(rowa).focus(); 
		
	  
disbut();	


if(user1.includes("[ROLE_NURSE]")){

	
	   var x = document.getElementsByName("doctord");
	    for(var i = 0;i<x.length;i++){
	    	
	    	x[i].setAttribute("readonly","readonly");
	    }
	   var x = document.getElementsByName("doctsig");
	    for(var i = 0;i<x.length;i++){
	    	
	    	x[i].setAttribute("readonly","readonly");
	    }
	
	   var x = document.getElementsByName("ratef");
	    for(var i = 0;i<x.length;i++){
	    	
	    	x[i].setAttribute("readonly","readonly");
	    }
	   var x = document.getElementsByName("doctrmks");
	    for(var i = 0;i<x.length;i++){
	    	
	    	x[i].setAttribute("readonly","readonly");
	    }
	   
 
	}

}
	  
function totalIt(column,totcolumn) {
    
	
	 
	   total=0;
	
	    var price = document.getElementsByName(column);
	    
	   
	    
		  for (var i=0;i<price.length;i++) {
		     
		   var sum =  price[i].value ;
		    
		    total += Number(sum) ;isNaN(sum)?0:sum;
		  }
		  document.getElementById("subtotal").value= total.toFixed(2);  //isNaN(total)?"0.00":total.toFixed(2);    
		  document.getElementById("total").value = total.toFixed(2);
		   
	  		
}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
	    window.location = "/HMS/iochart"
	}
	
}

function crtab(userr,usern){
	user2a = userr;
	user2b = usern;
	user2c = usern;

	if(document.getElementById("date").value == "select"){
	
		doAjaxPost1(moment().format('DD-MM-YYYY')) 
	}
	else{
//		doAjaxPost1(document.getElementById("date").value)
	}
	 
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	   if(tableRef.rows.length == 0){
		 
		   display(userr,usern)
	   }
	   else{
		   
	   }
	  
}
	    
function addname(getval){
	
	
	var myname = getval.getAttribute('data-value'); 	
		//var str = document.getElementById("pname").getAttribute("data-value");
	//	alert(str);
		
	
		var strSplit = myname.split('=');
		
//		alert(strSplit[9]);
		document.getElementById("name").value = strSplit[0];
		document.getElementById("pid").value = strSplit[1];
		document.getElementById("age").value = strSplit[2];	
		document.getElementById("gender").value = strSplit[3];
		document.getElementById("fileno").value = strSplit[4];	
		document.getElementById("admdate").value = strSplit[5];	
		document.getElementById("wardno").value = strSplit[6];	
//		document.getElementById("doctsig").value = strSplit[7];	
		document.getElementById("nursesig").value = strSplit[8];
		document.getElementById("admitno").value = strSplit[9];
		
		document.getElementById("id").innerHTML = strSplit[1];
		document.getElementById("nm").innerHTML = strSplit[0];
		document.getElementById("flno").innerHTML = strSplit[4];
		
	disbut();
	unsaved = false;
	
	
}
function cleartab1(){
	$("#myTable1 .tbody1 tr").remove();
	
	$("#date").val('select');
	$("#date").selectpicker("refresh");
	
	disbut()
}
function dateck(){
	if(document.getElementById('date').value != moment().format('DD-MM-YYYY') &&  document.getElementById('date').value !="select" ){
	    alert("Cannot save records for previous dates")
		return false;
	}
	
	else{
		return true;
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
</script>

<script type="text/javascript">
var user2a;
       function doAjaxPost(user2) {
    	   // get the form values

    	      //  var name = $('#pname').val();
           
    	   var admitno = $('#admitno').val();
    user2a = user2;
   	
    $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/iochart1.html",
	           data: "admitno=" + admitno,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        //	   alert(response);
	        	   $.each(response.list5, function(index, datec) {
	                   //to print name of employee
	             
	                   if ($("#date option[value='"+encodeURIComponent(datec.date)+"']").length == 0){
	               
	                	   $("#date").append('<option value="'+datec.date+'">'+datec.date+'</option>');
	                   
	                   $("#date").selectpicker("refresh");
	                   }

	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
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

       function doAjaxPost1(id) {
    	   // get the form values

    	  
           	 
    	   //  var name = $('#pname').val();
          // var str = id.split(",");
    	   var admitno = $('#admitno').val();
    	   if(admitno.length == "0"){
    		   admitno = id;
    	   }

    	  // var date = $('#date').val();
   
    	  
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/iochart2/"+admitno+"/"+id+"",
	           async: false,
	         //  data: "admitno=" + admitno,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        	   if(response.list5.length != 0){
	       	    	
	      	    	 $("#myTable1 .tbody1 tr").remove();
	      	     }
	       	   $.each(response.list5, function(index, datec) {
	                   //to print name of employee
	              //     $("#date").append('<option value="'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'">'+datec.date+'</option>');
	               //    $("#date").selectpicker("refresh");
	        		
		                   if ($("#date option[value='"+encodeURIComponent(datec.date)+"']").length == 0){
		               
		                	   $("#date").append('<option value="'+datec.date+'" selected="">'+datec.date+'</option>');
		                   
		                   $("#date").selectpicker("refresh");
		                   }
		                   
		                   else if(id != document.getElementById("date").value){
		                	   $('select[name=daten]').val(id);
		                	   $('#date').selectpicker('refresh');
		                   }
		                   else{
		                	   
		                   }
		       
		                   if(user2a == "[ROLE_NURSE]" ||user2a == "[ROLE_CHIEFNURSE]" ){
		                		if(datec.nursesig == "NA"){
		                	   datec.nursesig = user2c;
		                		}
		                	
		                		
		                	}
		                	else{
		                		nursesig = "NA";
		                	}
		         
		                 
	                   var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	       	    	var rowsAdd = tableRef.insertRow();  
	       		  
	       	    	var counter = "doctsig" +  tableRef.rows.length;
	       	    
	       	      var newCell = rowsAdd.insertCell();
	       	  	  newCell.innerHTML="<tr><td><input type='hidden' name='aid1' id='aid1' form='forma' value='"+datec.aid1+"'><input readonly = 'readonly' form ='forma' class= 'form-control input-sm'  type='text' value='"+datec.time+"' id = 'time' name= 'time'></td></tr>";
	       	  	  newCell.style.width ='87px';
	       		  newCell.style.border='groove';
	       	  	  
	       	  	  newCell = rowsAdd.insertCell();
	       	  	  newCell.innerHTML="<tr><td><input form ='forma'  class= 'form-control input-sm' value='"+datec.oraltype+"' id = 'oraltype'  name= 'oraltype' ></td></tr>";
	       	  	  newCell.style.width ='89px';
	       		  newCell.style.border='groove';
	       	  	  
	       	  	  newCell = rowsAdd.insertCell();
	       	  	  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm' onkeypress='return onlyNos(event,this);' type='text' value='"+datec.oralamt+"'  id = 'oralamt' name= 'oralamt'></td></tr>";
	       	  	  newCell.style.width ='105px';
	       		  newCell.style.border='groove';
	       		  
	       	  	  
	       	  	  newCell = rowsAdd.insertCell();
	       	  	  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm' value='"+datec.oralcommence+"' id = 'oralcommence'  name= 'oralcommence' ></td></tr>";
	       		  newCell.style.width ='111px';
	       		  newCell.style.border='groove';
	       	  	  
	       	  	  
	       	  	  newCell = rowsAdd.insertCell();
	       	  	  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm' onkeypress='return onlyNos(event,this);' value='"+datec.amtgiv+"' id = 'amtgiv'  name= 'amtgiv' ></td></tr>";
	       		  newCell.style.width ='86px';
	       		  newCell.style.border='groove';
	       	  	  
	       	  	  newCell = rowsAdd.insertCell();
	       	  	  newCell.innerHTML="<tr><td><input  form ='forma' onkeypress='return onlyNos(event,this);' class= 'form-control input-sm' value='"+datec.urine+"' type='text' id = 'urine' name= 'urine'></td></tr>";
	       	  	  newCell.style.width ='81px';
	       		  newCell.style.border='groove';
	       		  
	       	  	  
	       	  	  newCell = rowsAdd.insertCell();
	       	  	  newCell.innerHTML="<tr><td><input form ='forma' onkeypress='return onlyNos(event,this);' class= 'form-control input-sm' value='"+datec.vomitus+"'  id = 'vomitus'  name= 'vomitus' ></td></tr>";
	       	  	 newCell.style.width ='133px';
	      		  newCell.style.border='groove';
	       	  	  
	       	  	  newCell = rowsAdd.insertCell();
	       	  	  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm' value='"+datec.remarks+"' type='text'  id = 'remarks' name= 'remarks'    ></td></tr>";
	       		  newCell.style.width ='91px'; 
	       		  newCell.style.border='groove';
	       	  	 
	       		 
	       	  	  newCell = rowsAdd.insertCell();
	       	  	  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm' value='"+datec.nursesig+"' type='text'  id = 'nsign' name= 'nsign'    ></td></tr>";
	       		  newCell.style.width ='91px'; 
	       		  newCell.style.border='groove';
	       	  	  
	       		  
	       		  newCell = rowsAdd.insertCell();
	       		  newCell.innerHTML="<tr><td><input form ='forma'  class= 'form-control input-sm doctsig' id = '"+counter+"'  name= 'doctsig' value='"+datec.doctsig+"' required></td></tr>";
	       		  newCell.style.width ='85px';
	       		  newCell.style.border='groove';
	       		  
	       		  newCell = rowsAdd.insertCell();
	       		  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm doctord'  type='text'  id = 'doctord' name= 'doctord' value='"+datec.doctord+"' required  ></td></tr>";
	       		  newCell.style.width ='90px';
	       		  newCell.style.border='groove';
	       		  
	       		  newCell = rowsAdd.insertCell();
	       		  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm ratef' id = 'ratef'  name= 'ratef' value='"+datec.ratef+"'  required></td></tr>";
	       		  newCell.style.width ='68px';
	       		  newCell.style.border='groove';
	       		  
	       		  newCell = rowsAdd.insertCell();
	       		  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm doctrmks'  type='text'  id = 'doctrmks' name= 'doctrmks' value='"+datec.doctrmks+"' required  ></td></tr>";
	       		  newCell.style.width ='92px'; 
	       		  newCell.style.border='groove';
	       		  
	       		  newCell = rowsAdd.insertCell();
	       		  newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
	       		  newCell.style.width ='70px';
	       		  newCell.style.border='groove';
	       		  
	       		if(user2a.includes("[ROLE_NURSE]")){

	       			
	       		   var x = document.getElementsByName("doctord");
	       		    for(var i = 0;i<x.length;i++){
	       		    	
	       		    	x[i].setAttribute("readonly","readonly");
	       		    }
	       		   var x = document.getElementsByName("doctsig");
	       		    for(var i = 0;i<x.length;i++){
	       		    	
	       		    	x[i].setAttribute("readonly","readonly");
	       		    }
	       		
	       		   var x = document.getElementsByName("ratef");
	       		    for(var i = 0;i<x.length;i++){
	       		    	
	       		    	x[i].setAttribute("readonly","readonly");
	       		    }
	       		   var x = document.getElementsByName("doctrmks");
	       		    for(var i = 0;i<x.length;i++){
	       		    	
	       		    	x[i].setAttribute("readonly","readonly");
	       		    }
	       		   
	       	 
	       		}
	       		  
	       		  disbut();
	       	unsaved = false;
	               }),    
	        	 
	        	   $.each(response.list7, function(index, datec) {
	                   //to print name of employee
	                  
	                   if(datec.amttot == undefined){
	                	  
	                	  document.getElementById("a").innerHTML = "0.00";
	 	                  document.getElementById("b").innerHTML = "0.00";
	 	                  document.getElementById("c").innerHTML = "0.00";
	 	                  document.getElementById("d").innerHTML = "0.00";
	                   }
	                   else{
	                  document.getElementById("a").innerHTML = datec.amttot;
	                  document.getElementById("b").innerHTML = datec.amtgivtot;
	                  document.getElementById("c").innerHTML = datec.urinetot;
	                  document.getElementById("d").innerHTML = datec.vomitustot;
	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	                   }
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
       jQuery().ready(function() {
       $('#oralamt').keyup(function(){
    	    var val = $(this).val();
    	    if(isNaN(val)){
    	         val = val.replace(/[^0-9\.]/g,'');
    	         if(val.split('.').length>2) 
    	             val =val.replace(/\.+$/,"");
    	    }
    	    $(this).val(val); 
    	});
       });
       
       function goBack() {
    	    window.history.back();
    	}
       </script>

</head>

<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />'),disbut()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Input Output Chart</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
      <li class="dropdown back" id="back">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Quick Access
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/HMS/staff">Staff Details</a></li>
          <li><a href="/HMS/doctor1">Doctor View</a></li>
          <li><a href="/HMS/nursedesk">Nurse Station</a></li>
          <li><a href="/HMS/frontdesk">Front Desk</a></li>
        </ul>
      </li>
      
      <!-- 
      <li class=""><a id="m2" href="">My Appointments</a></li>
        <li class=""><a  id="m3" href="">General Checkup</a></li>
          <li class=""><a id="m4" href="/HMS/discharge.html">Discharge Summary</a></li>
 
       <li class=""><a id="nob" href="/HMS/nursetr/"  onclick=' return visible();' target="_blank">Nurse observations</a></li>
  -->
    </ul>
   <ul class="nav navbar-nav navbar-right">
    </ul>
  </div>
</nav>
  <center>
</center>

  <div id="form1" >  
  
     <h1> <button type="submit" id="bouton-contact" onclick="return dateck()" class="btn btn-warning button1" form="forma" >Save</button>
   
	
	
<font size="5">Input-Output Chart</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
		<button type="button" id="pr" class="form-control input-sm button2 btn btn-warning"  onclick="doAjaxPost('<c:out value="${username}" />')">Previous Records</button></span>
	</h1>

<form id="forma" name="forma" action="/HMS/saveIo.html" method="post"></form>


   <br>
   <div class="container" style="width:auto;height:auto">
 <button type="button" style="background:#81BDA4",  class="btn btn-primary btn-block"><span id="pi" style="float:left">Patient Information</span><span id="flno" style="float:right">Fileno</span><span id="id" style="float:right;margin-right:15px;">Id</span><span style="float:right;margin-right:25px;" id="nm">Name</span></button>
 <br>
  </div>  
	    
	    <div class="container">
 
  

  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Patient Details</a></li>
    <li><a data-toggle="pill" onclick="crtab('<c:out value="${username}" />','<c:out value="${pageContext.request.userPrincipal.name}" />')" href="#menu1">IO CHART</a></li>
   
    <li class="pull-right"><button type="button" id="refresh" class="btn btn-primary button2" onclick="location.reload(true);">
	  <span class="fa fa-refresh"></span> Refresh</button></li>
</ul>


</div>
<br>
<div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div id="col3">
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	      
	      <div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control" data-size="4" data-live-search="true" name = "pname" id ="pname" onchange="addname(this.options[this.selectedIndex])">
          <option value="Select" selected disabled>Select</option>
        <c:forEach var="p"  items="${model.list3}">
        <option value="${p.name}" data-subtext="${p.fileno},${p.admdate}"  data-value="${p.name}=${p.pid}=${p.age}=${p.gender}=${p.fileno}=${p.admdate}=${p.wardno}=${p.doctsig}=${p.nursesig}=${p.admitno}">${p.name}</option>
        </c:forEach>
      </select>
       
	</div>
	      </div>
	      
	       <div class="col-xs-4">
	      
	       <div class="form-group">
         <p>Registration Id<span>*</span></p>
     <input type="text" name="pid" id="pid"  form="forma" class="form-control input-sm" readonly required>
       
       
       
	</div>
	      </div>
	      
	       <div class="col-xs-3">
	        <div class="form-group">
     
        <p>Admit No<span>*</span></p>
             <input type="text" name="admitno" id="admitno"  form="forma" class="form-control input-sm" readonly required>
             <input type="hidden" name="fileno" id="fileno" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         <input type="hidden" name="name" id="name" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         <input type="hidden" name="" id="" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         
     
       
	</div>
	      
	      </div>
	      
	      </div>
	      
	         <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	       <div class="form-group">
     
            <p>Age<span>*</span></p>
     <input type="text" name="age" id="age"  form="forma" class="form-control input-sm" readonly required>
     </div>
	      </div>
	      
	       <div class="col-xs-4">
	      <div class="form-group">
          <p>Gender<span>*</span></p>
     <input type="text" name="gender" id="gender"  form="forma" class="form-control input-sm" readonly  required>
       
     </div>
	      </div>
	      
	       <div class="col-xs-3">
	      <div class="form-group">
            <p>Admission Date<span>*</span></p>
     <input type="text"  name="admdate" id="admdate"  form="forma" class="form-control input-sm" readonly required>
       
	</div>
	      </div>
	      
	      </div>
	      
	            <div class="form-group row" >
	    	     <div class="col-xs-1"></div>
	          <div class="col-xs-3">
  
  <div class="form-group">
     
           <p>Current Date<span>*</span></p>
     <input type="text" name="curdate" id="curdate"  form="forma" class="form-control input-sm" readonly required>
       
     </div>
 </div>
	      <div class="col-xs-4">
	       <div class="form-group">
     
          <p>WardNo/BedNo<span>*</span></p>
     <input type="text" name="wardno" id="wardno"  form="forma" class="form-control input-sm" readonly required>
     </div>
	      </div>
	    <!--   
	       <div class="col-xs-7">
	        <div class="form-group">
     
          <p>Doctor Orders<span>*</span></p>
     <input type="text" name="doctord" id="doctord"  form="forma" class="form-control input-sm"  required>
     </div>
	      </div>
	      
	       <div class="col-xs-3">
	      
	      </div>
	      
	      </div>
	      
	        <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	       <div class="form-group">
     
          <p>Doctor Signature<span>*</span></p>
     <input type="text" name="doctsig" id="doctsig"  form="forma" class="form-control input-sm"  required>
     </div>
	      </div>
	      
	       <div class="col-xs-4">
	        <div class="form-group">
     
          <p>Rate Of Flow<span>*</span></p>
     <input type="text" name="ratef" id="ratef"  form="forma" class="form-control input-sm"  required>
     </div>
	      </div>
	      --> 
	       <div class="col-xs-3">
	       <div class="form-group">
     
          <p>Nurse Assigned<span></span></p>
     <input type="text" name="nursesig" id="nursesig"  form="forma" class="form-control input-sm" readonly value="NA">
     </div>
	      </div>
	      
	      </div>
	     </div>
    </div>
      <div id="menu1" class="tab-pane fade">
      
      
            <div class="form-group row" >
	     <div class="col-xs-4"></div>
	       <div class="col-xs-3">
	        <div class="form-group">
	          
             <select class="selectpicker form-control select" data-size="4" date-width = "200px;" data-live-search="true" name = "daten" id ="date" onchange="doAjaxPost1(this.value);this.selectedindex = -1">
          <option value="select" selected disabled>Select date to fetch records</option>
         
        
      </select>
      </div>
	        </div>
	      </div>
	      
      
            <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      
	      
	        <div class="col-xs-8">
	     <div class="form-group">
	     
	     	    
    <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 1250px; " id="myTable1">
    <thead>
      <tr>
        <th style="width:300px; " rowspan="3">Time</th>
        <th  colspan="4"><center>IN-PUT</center></th>
        <th  colspan="4"><center>OUT-PUT</center></th>
       <th style="width:200px;" colspan="6"><center>DOCTOR</center></th>
        
           
      </tr>
      
       <tr style="width:120px;" rowspan="14">
       <th colspan="2"><center>Oral</center></th>
        <th colspan="2"><center>I.V</center></th>
        <th>Urine</th>
        <th> Vomitus/Aspirate Others</th>
        <th>Nurse Remarks</th>
        <th>Nurse Sign</th>
        <th></th>
        <th></th>
        <th></th>
        <th></th> 
        <th></th>
        <th style="width:30px;"></th>
   
                
       </tr>
       
       <tr style="width:200px;" rowspan="14">
       <th style="width: 300px;">Type</th>
       <th  style="width: 300px;">Amount</th>
       <th>Type Commenced</th>
       <th>Amount Given</th>
       <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th>Treating Doctor</th>
      <th>Doctor's Orders</th>
      <th>Rate of flow</th>
      <th>Doctor's Remarks</th>
       <th>Delete</th>
     <th rowspan="3" style="width:30px;"> </th>
      
       </tr>
        
   
    <tbody class="tbody1">

   
    </tbody>
     <tr>
     <th>
    TOTAL<span id="a">0.00</span><span id="b">0.00</span><span id="c">0.00</span><span id="d">0.00</span></th>
  </tr>
     
     <tr id="hiderow">
		    <td><i class='fa fa-plus' id="icon"  style='font-size:20px; color : #ff9900;'  onclick="return display('<c:out value="${username}" />','<c:out value="${pageContext.request.userPrincipal.name}" />')"></i> 
		<a href="#" class='button2' id="bouton-contact" style='color : #ff9900;'  onclick="cleartab1()"><b>Clear Table</b></a>    
		 </td>
		  </tr>
	
    </table>
	      </div>
	      
	      </div>
	      </div>
      </div>
    </div>



    <button type="" id="" class="bouton-contact"  ></button>
   </div>
     

   </div>
 

<script>

datasuccess('<%=request.getParameter("message")%>')
</script>
<script>

//var bac = '<c:out value='${model.bac}'/>';

</script>

 
 
</body>
</html>