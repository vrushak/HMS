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
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.js"></script>
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
  margin: auto;
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
	width : 2350px;
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



#myTable {
    border-collapse: collapse;
    width: 100%;
    margin-left : -50px;
    }
#myTable .thead1 th {
    background-color: #009999;
    color: white;
   
}

  #myTable .tbody2{
    height:100px;
    overflow-y:scroll;
 }
 #myTable thead,.tbody2{
  
    display:block;
  }
 
     
 
#myTable1 {
    border-collapse: collapse;
    width: 100%;
    margin-left : -50px;
    }
#myTable1 th {
    background-color: #009999;
    color: white;
   
}

.table-fixed{
 
}
  #myTable1 .tbody1{
    height:100px;
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
.button3{
	margin-left :1000px ;
}

.delete{
	width :50px;
}


#col3{
margin-left: 150px; 
border-style : groove;
border-radius : 10px;
width : 1000px;
}

#myTable .thead2 th{
background-color:#B8B8B8;
}
.success td{
background-color:#ff9900 !important; 

} /* Orange */

</style>


<script type="text/javascript">
 

function deleteRow(r) {
	 
	   var i = r.parentNode.parentNode.rowIndex;
	  
	   document.getElementById("myTable1").deleteRow(i);
	  //   totalIt();
	    
	}
	
	
function disbut(){
	
	document.getElementById("curdate").value = new Date();
	//alert();
	if(document.getElementById("pname").value == "Select"){
		document.getElementById("pr").disabled = true;
	}
	else{
		document.getElementById("pr").disabled = false;	
	}
	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	 
	
	if(tableRef.rows.length == "0"){
		document.getElementById("bouton-contact").disabled = true;
		document.getElementById("bc").disabled = true;
	}
	else{
		document.getElementById("bouton-contact").disabled = false;	
		document.getElementById("bc").disabled = false;
	}
	
}

function checkhome(user){
	
	document.getElementById("nursec").style.visibility = "hidden";
	
	 if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
	}
	
	else if(user.includes("[ROLE_DOCTOR]")){
		
		var url = "/HMS/doctor1" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 
		 
	//	 document.getElementById("edit").style.display = "none";
		//  document.getElementById("myTable1").style.width ='1160px'; 
		
		 document.getElementById("nursec").style.visibility = "hidden";
		 document.getElementById("bc").style.visibility = "hidden";
	}
	else if(user.includes("[ROLE_NURSE]")){
		
		 var url = "/HMS/nursedesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("nursec").style.visibility = "hidden";
		 document.getElementById("bouton-contact").style.visibility = "hidden";

	}
	else if(user.includes("[ROLE_CHIEFNURSE]")){
		
		 var url = "/HMS/nursedesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 document.getElementById("nursec").style.visibility = "hidden";
		 document.getElementById("bouton-contact").style.visibility = "hidden";
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
		}
}
function checkb(a,b,c){
	
	if(document.getElementById(a).checked == true){
   
		document.getElementById(b).value=c;
	}
	else{
		document.getElementById(b).value= " ";	
	}
	
	if(document.getElementById(a).checked == false){
		
		document.getElementById(a).value = "off";
		   
	}
	
}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
	    window.location = "/HMS/drugchart"
	}
	
}
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


	function checkchkbox(a,b){
		
		if(document.getElementById(a).checked) {
		    document.getElementById(b).disabled = true;
		}
	}
	
	
var flagt;
	function display(user1,user2)
	{ 
		
		if(document.getElementById("date").value != moment().format("DD-MM-YYYY") && document.getElementById("date").value !="select"){
			alert("You are about to edit the records entered on "+document.getElementById("date").value +". Please click on clear table and click on plus sign to add new records for current date" )
          
			return false;		
		}
		
		
		 var m = moment().format("DD-MM-YYYY h:mm:ss a");
		    

		var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
		var rowsAdd = tableRef.insertRow(); 
		
		var i = tableRef.rows.length;
		
		
//		var time ="time"+i;
	 //   var ora ="oraltype"+i;
		

		  var newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td><input type='hidden' name='aid1' form='forma' id='aid1'  value= "+$.now()+"><input  form ='forma' style='width:100%;  border:groove;' class= 'form-control input-sm' value = '"+m+"' readonly='readonly' type='text' id = 'time' name= 'time' required  ></td></tr>";
		  newCell.style.width ='140px';
		  newCell.style.border='groove'
		  
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td><input form ='forma'  class= 'form-control input-sm drugn' style='width:100%;  border:groove;'  value= '' id = '"+i+"'  name= 'oraltype' required></td></tr>";
		  newCell.style.width ='270px';
		  newCell.style.border='groove'
	     
		 
		 
		 
		  newCell= rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm' style='width:100%;  border:groove;' onkeypress=''  value=' ' type='text'  id = 'oralamt' name= 'oralamt' required ></td></tr>";
		  newCell.style.width ='100px';
		  newCell.style.border='groove';
		
		  
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm' value=' 'onkeypress='return onlyNos(event,this);' id = 'oralcommence'  name= 'oralcommence' required></td></tr>";
		  newCell.style.width ='80px';
		  newCell.style.border='groove';
		
		  
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm' value= ' ' onkeypress='return onlyNos(event,this);' id = 'amtgiv'  name= 'amtgiv' required ></td></tr>";
		  newCell.style.width ='80px';
		  newCell.style.border='groove';
		 
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td><input  form ='forma' class= 'form-control input-sm' value=' ' type='text' id = 'urine' name= 'urine' required ></td></tr>";
		  newCell.style.width ='130px';
		  newCell.style.border='groove';
		  
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td><input form ='forma' class= 'form-control input-sm' value='"+user2+"' type='text'  id = 'doctord' name= 'doctord' required ></td></tr>";
		  newCell.style.width='150px';
		  newCell.style.border='groove';

		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td><input form ='forma' value = ' ' class= 'form-control input-sm'  type='text'  id = 'discontinue' name= 'discontinue' ></td></tr>";
		  newCell.style.width='150px';
		  newCell.style.border='groove';
		  
		//  if(user1.includes("[ROLE_NURSE]")){
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td><i class='fa fa-pencil Addbtn' id='"+i+"' style='font-size:20px'   onclick=display12('"+user1+"','"+user2+"',this.id)></i></td></tr>";
	      newCell.style.width='80px';
		  newCell.style.border='groove';
		  //}
		disbut();
		 
			       

	} 
     
	var t0a;
	var t1a;
	var t2a;
	var t3a;
	var t4a;
	var t5a;
	var t6a;
	var t7a;
	var t8a;
   
	   
	
	
	function display12(user1,user2,i){
		
		$("#myTable .thead3 tr").remove();
		$("#myTable .tbody2 tr").remove();
		
		//document.getElementById("nursec").style.visibility = "visible";
		i = Number(i) - 1;
		
		t0a = document.getElementsByName("aid1")[i].value;
	    t1a = document.getElementsByName("time")[i].value;

	    t2a = document.getElementsByName("oraltype")[i].value;
		t3a = document.getElementsByName("oralamt")[i].value;
		t4a = document.getElementsByName("oralcommence")[i].value;
		t5a = document.getElementsByName("amtgiv")[i].value;
		t6a = document.getElementsByName("urine")[i].value;
		t7a = document.getElementsByName("doctord")[i].value;
		t8a = document.getElementsByName("discontinue")[i].value;
		
		

		display1(user1,user2)
	}
	
	function display1(user1,user2)
	{
         
		 var m = moment().format("DD-MM-YYYY h:mm:ss a");
		 
		//document.getElementById("nursec").style.visibility = "visible";
		
		var tableRef = document.getElementsByClassName('thead3')[0];
	   

		
		
		   if(tableRef.rows.length == "0"){
			
		
				var rowsAdd = tableRef.insertRow();  	
		
	          var newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input type='hidden' name='aid1'  id='aid1'  value= "+$.now()+"><input  style='width:100%;  border:groove;' class= 'form-control input-sm' value = '"+m+"'readonly type='hidden' id = 'time1' name= 'time'  ></td></tr>";
			  newCell.style.width ='150px';
			  newCell.style.border='groove'
			  
			  
			
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input class= 'form-control input-sm' style='width:100%;  border:groove;' value= ' ' id = 'oraltype1'  name= 'oraltype' readonly='readonly' ></td></tr>";
			  newCell.style.width ='300px';
			  newCell.style.border='groove'
		     
			 
			 
			 
			  newCell= rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input readonly='readonly'  class= 'form-control input-sm' style='width:100%;border:groove;' onkeypress='return onlyNos(event,this);'  value=' ' type='text'  id = 'oralamt1' name= 'oralamt'  ></td></tr>";
			  newCell.style.width ='100px';
			  newCell.style.border='groove';
			
			  
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input  class= 'form-control input-sm' readonly='readonly' style='width:100%;  border:groove;' value=' 'onkeypress='return onlyNos(event,this);' id = 'oralcommence1'  name= 'oralcommence'></td></tr>";
			  newCell.style.width ='100px';
			  newCell.style.border='groove';
			
			  
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input readonly='readonly' class= 'form-control input-sm' style='width:100%;  border:groove;' value= ' ' onkeypress='return onlyNos(event,this);' id = 'amtgiv1'  name= 'amtgiv' ></td></tr>";
			  newCell.style.width ='100px';
			  newCell.style.border='groove';
			 
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input  readonly='readonly' class= 'form-control input-sm' style='width:100%;  border:groove;' value=' ' type='text' id = 'urine1' name= 'urine'  ></td></tr>";
			  newCell.style.width ='150px';
			  newCell.style.border='groove';
			  
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input readonly='readonly' class= 'form-control input-sm' style='width:100%;  border:groove;' value='"+user2+"' type='text'  id = 'doctord1' name= 'doctord'  ></td></tr>";
			  newCell.style.width='150px';
			  newCell.style.border='groove';

			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input readonly='readonly' class= 'form-control input-sm'style='width:100%;  border:groove;'  type='text' value= ' ' id = 'discontinue1' name= 'discontinue'  ></td></tr>";
			  newCell.style.width='150px';
			  newCell.style.border='groove';
			  
			  document.getElementById("time1").value = t1a;
			  document.getElementById("oraltype1").value = t2a;
			  document.getElementById("oralamt1").value = t3a;
			  document.getElementById("oralcommence1").value = t4a;
			  document.getElementById("amtgiv1").value = t5a;
			  document.getElementById("urine1").value = t6a;
			  document.getElementById("doctord1").value = t7a;
			  document.getElementById("discontinue1").value = t8a;
			 
			document.getElementById("nursec").style.visibility = "visible";
		

		}

		var tableRef = document.getElementById('myTable').getElementsByClassName('tbody2')[0];
		var rowsAdd = tableRef.insertRow(); 
		var i = tableRef.rows.length;
		var nursesign ="nursesig"+i;
		var vomitus ="vomitus"+i;
		var vomitushid ="vomitushid"+i;
		var rowsAdd = tableRef.insertRow();  	
		
		document.getElementById("bouton-contact").setAttribute("form","formbc");
		document.getElementById("pid").setAttribute("form","formbc");
		document.getElementById("admitno").setAttribute("form","formbc");
		document.getElementById("fileno").setAttribute("form","formbc");

		//if(t1a == "undefined" && t2a == "undefined" && t3a == "undefined" && t4a == "undefined" && t5a == "undefined" && t6a == "undefined" && t7a == "undefined" && t8a == "undefined" ){
			console.log(t1a);
		
			if(t1a == undefined){
				t1a =  document.getElementById("time1").value;
				//	t2a = document.getElementById("oraltype1").value;
				//	t3a = document.getElementById("oralamt1").value;
				//	t4a = document.getElementById("oralcommence1").value;
				//	t5a =  document.getElementById("amtgiv1").value;
				//	t6a = document.getElementById("urine1").value;
					t7a = document.getElementById("doctord1").value;
					t8a = document.getElementById("discontinue1").value;
				
			}
	
		     var newCell = rowsAdd.insertCell();
		      newCell.innerHTML="<tr><td><input type='hidden' name='aid1' form='formbc' id='aid1'  value= '"+$.now()+"'><input  form ='formbc'  value = '"+m+"' type='hidden' id = 'time' name= 'time'  ><input form ='formbc' type='hidden' value ='"+t2a+"' id = 'oraltype'  name= 'oraltype' ><input form ='formbc' value='"+t3a+"' type='hidden'  id = 'oralamt' name= 'oralamt'  ><input type='hidden' form ='formbc'  value='"+t4a+"' id = 'oralcommence'  name= 'oralcommence'><input form ='formbc' type='hidden'  value= '"+t5a+"' id = 'amtgiv'  name= 'amtgiv' ><input  form ='formbc' value='"+t6a+"' type='hidden' id = 'urine' name= 'urine'  ><input form ='formbc'  value='"+t7a+"' type='hidden'  id = 'doctord' name= 'doctord'  ><input form ='formbc' type='hidden'  id = 'discontinue' name= 'discontinue' value='"+decodeURI(t8a)+"' ><input form ='formbc' style='width:100%;  border:groove;' class= 'form-control input-sm' value= '"+m+"' type='text' readonly='readonly' id = 'ratef' required name= 'ratef' ></td></tr>";
			  newCell.style.width='150px';
			  newCell.style.border='groove';
			 
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input form ='formbc'style='width:100%;  border:groove;' type='checkbox' class= '' value= 'active' id = '"+vomitus+"' name= 'vomitus' onclick = checkb(this.id,'"+nursesign+"','"+user2+"') ><input type='hidden' name='vomitus' form='formbc' value='off'></td></tr>";
			  newCell.style.width='300px';
			  newCell.style.border='groove';
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input form ='formbc'style='width:100%;  border:groove;' class= 'form-control input-sm' value = ' ' type='text'  id = '"+nursesign+"' name= 'nursesig' required ></td></tr>";
			  newCell.style.width='100px';
			  newCell.style.border='groove';
			  
			
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input form ='formbc' style='width:100%;  border:groove;' class= 'form-control input-sm' value= ' ' type='text'  id = 'doctrmks' name= 'doctrmks' ></td></tr>";
			  newCell.style.width='630px';
			  newCell.style.border='groove';
			
		
		if(user1.includes("[ROLE_NURSE]")){

		
		   var x = document.getElementsByName("time");
		    for(var i = 0;i<x.length;i++){
		    	
		    	x[i].setAttribute("readonly","readonly");
		    }
		   var x = document.getElementsByName("oraltype");
		    for(var i = 0;i<x.length;i++){
		    	
		    	x[i].setAttribute("readonly","readonly");
		    }
		
		   var x = document.getElementsByName("oralamt");
		    for(var i = 0;i<x.length;i++){
		    	
		    	x[i].setAttribute("readonly","readonly");
		    }
		   var x = document.getElementsByName("oralcommence");
		    for(var i = 0;i<x.length;i++){
		    	
		    	x[i].setAttribute("readonly","readonly");
		    }
		   var x = document.getElementsByName("amtgiv");
		    for(var i = 0;i<x.length;i++){
		    	
		    	x[i].setAttribute("readonly","readonly");
		    }
		   var x = document.getElementsByName("urine");
		    for(var i = 0;i<x.length;i++){
		    	
		    	x[i].setAttribute("readonly","readonly");
		    }
		   var x = document.getElementsByName("doctord");
		    for(var i = 0;i<x.length;i++){
		    	
		    	x[i].setAttribute("readonly","readonly");
		    }
	   
		}
		
		else if(user1.includes("[ROLE_DOCTOR]")){
			 var x = document.getElementsByName("vomitus");
			    for(var i = 0;i<x.length;i++){
			    	
			    	x[i].setAttribute("readonly","readonly");
			    }
			   var x = document.getElementsByName("nursesig");
			    for(var i = 0;i<x.length;i++){
			    	
			    	x[i].setAttribute("readonly","readonly");
			    }
			
			   var x = document.getElementsByName("doctrmks");
			    for(var i = 0;i<x.length;i++){
			    	
			    	x[i].setAttribute("readonly","readonly");
			    }
			  
			
		}
		else{
			
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
        
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
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

function cleartab1(){
	$("#myTable1 .tbody1 tr").remove();
	$("#date").val('select');
	$("#date").selectpicker("refresh");
	
}



var dord;
function addname(getval){
	//alert(myname);
	
		
	var myname = getval.getAttribute('data-value'); 	
	//var str = document.getElementById("pname").getAttribute("data-value");
//	alert(str);
	
	

	var strSplit = myname.split(',');

	document.getElementById("name").value = strSplit[0];
	document.getElementById("pid").value = strSplit[1];
	document.getElementById("age").value = strSplit[2];	
	document.getElementById("gender").value = strSplit[3];
	document.getElementById("fileno").value = strSplit[4];	
	document.getElementById("admdate").value = strSplit[5];	
	document.getElementById("wardno").value = strSplit[6];	
	//alert(strSplit[7]);
	document.getElementById("doctsig").value = strSplit[7];	
	//document.getElementById("nursesig").value = strSplit[8];
	document.getElementById("admitno").value = strSplit[9];
	
	 disbut();
	 dord = strSplit[7];
	 
	 $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
         
     	unsaved = true;
     });
}

function crtab(userr,usern){
	

	user2a = userr;
	user2b = usern;
	
	
	if(document.getElementById("date").value == "select" || document.getElementById("oraltype").value.length == 0) {
		doAjaxPost1(moment().format('DD-MM-YYYY')) 
	
	}
	
	
	else{
		
	
		doAjaxPost1(document.getElementById("date").value)
		
	}
	 
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	

	   if(tableRef.rows.length == 0){
		 
		   display(userr,usern)
	   }
	  
	  
	   else{
		  
	   }
	   unsaved = false;
}

function hide(){
	document.getElementById("curdate").value = new Date();
	document.getElementById("myInput").style.visibility = "hidden";
}
var chdate,chuser2b,chuser2a;

function d1a(i,user2a,aid,time,doct,disc,ratef,vomitus,nursesig,doctrmks,user2b){
	 var m = moment().format("DD-MM-YYYY h:mm a");
	
	$("#myTable .thead3 tr").remove();
	$("#myTable .tbody2 tr").remove();
	
	//t1a = document.getElementsByName("time")[i].value;

  i = Number(i) - 1;
    t2a = document.getElementsByName("oraltype")[i].value;
    
	t3a = document.getElementsByName("oralamt")[i].value;
	t4a = document.getElementsByName("oralcommence")[i].value;
	t5a = document.getElementsByName("amtgiv")[i].value;
	t6a = document.getElementsByName("urine")[i].value;
//	t7a = document.getElementsByName("doctord")[i].value;
//	t8a = document.getElementsByName("discontinue")[i].value;
	
	/*
	document.getElementById("bouton-contact").setAttribute("form","formbc");
	document.getElementById("pid").setAttribute("form","formbc");
	document.getElementById("admitno").setAttribute("form","formbc");
	document.getElementById("fileno").setAttribute("form","formbc");
	*/ 
	var m = moment().format("DD-MM-YYYY");
	    
		//document.getElementById("nursec").style.visibility = "visible";
		
		var tableRef = document.getElementsByClassName('thead3')[0];
		
			
		   if(tableRef.rows.length == "0"){
			   var rowsAdd = tableRef.insertRow();  

			 
					
		
	          var newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input type='hidden' name='aid1'  id='aid1'  value= "+aid+"><input  style='width:100%;  border:groove;' class= 'form-control input-sm' value = '"+time+"' type='text' id = 'time1' name= 'time'  ></td></tr>";
			  newCell.style.width ='150px';
			  newCell.style.border='groove'
			  
			  
			
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input type='text'   class= 'form-control input-sm' style='width:100%;  border:groove;' value= '"+decodeURI(t2a)+"' id = 'oraltype1'  name= 'oraltype' ></td></tr>";
			  newCell.style.width ='300px';
			  newCell.style.border='groove'
		     
			 
			 
			 
			  newCell= rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input  class= 'form-control input-sm' style='width:100%;  border:groove;' onkeypress='return onlyNos(event,this);'  value='"+decodeURI(t3a)+"' type='text'  id = 'oralamt1' name= 'oralamt'  ></td></tr>";
			  newCell.style.width ='100px';
			  newCell.style.border='groove';
			
			  
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input type='text'  class= 'form-control input-sm' style='width:100%;  border:groove;' value='"+t4a+"' onkeypress='return onlyNos(event,this);' id = 'oralcommence1'  name= 'oralcommence'></td></tr>";
			  newCell.style.width ='100px';
			  newCell.style.border='groove';
			
			  
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input type='text'  class= 'form-control input-sm' style='width:100%;  border:groove;' value= '"+t5a+"' onkeypress='return onlyNos(event,this);' id = 'amtgiv1'  name= 'amtgiv' ></td></tr>";
			  newCell.style.width ='100px';
			  newCell.style.border='groove';
			 
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input  class= 'form-control input-sm' style='width:100%;  border:groove;' value='"+t6a+"' type='text' id = 'urine1' name= 'urine'  ></td></tr>";
			  newCell.style.width ='150px';
			  newCell.style.border='groove';
			  
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input class= 'form-control input-sm' style='width:100%;  border:groove;' value='"+doct+"' type='text'  id = 'doctord1' name= 'doctord'  ></td></tr>";
			  newCell.style.width='150px';
			  newCell.style.border='groove';

			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input  class= 'form-control input-sm'style='width:100%;  border:groove;'  type='text'  id = 'discontinue1' name= 'discontinue' value='"+decodeURI(disc)+"' ></td></tr>";
			  newCell.style.width='150px';
			  newCell.style.border='groove';
			  
			  
			  
			document.getElementById("nursec").style.visibility = "visible";
		

		   }
		 
	//var ratef = ratef.split(",");
	//var vomitusq = vomitus.split(",");
	//var nursesigq = nursesig.split(",");
	//var doctrmksq = doctrmks.split(","); 
	
	doAjaxPost2(t2a,time,user2b,decodeURI(user2a))
	
	
}

</script>
<script type="text/javascript">
var user2a;
var user2b;


       function doAjaxPost(user2,user4) {
    	   // get the form values
user2a = user2; 
user2b = user4;    	
    	   //  var name = $('#pname').val();
           
    	   var admitno = $('#admitno').val();
    
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/drugchart1.html",
	           data: "admitno=" + admitno,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	       	  
	        	   $.each(response.list5, function(index, datec) {
	        		   
	        	   
	                   //to print name of employee
	                
	                 //  $("#date").append('<option value="'+datec.date+','+user2+','+user4+'">'+datec.date+'</option>');
	                   
	                  // $("#date").selectpicker("refresh");
	                 
	        		   if ($("#date option[value="+datec.date+"]").length == 0){
	    	               
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
       $("#myTable1 .tbody1 tr").remove();
    	      //  var name = $('#pname').val();

           var str = id.split(",");

    	   var admitno = $('#admitno').val();

    	   if(admitno.length == "0"){
    		   admitno = id;
    		   
    	   }
    	   
    	   var date = $('#date').val();
    	   
    	   var countr = 0;
    
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/drugchart2/"+admitno+"/"+id+"",
	         //  data: "admitno=" + admitno,
	         async: false,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	     	 if(response.list6.length == 0){
	     		 display(user2a,user2b)
	     	 }
	        	   $.each(response.list6, function(index, datec) {
	        		   
	            if ($("#date option[value="+datec.date+"]").length == 0){
		 		               
		               	   $("#date").append('<option value="'+datec.date+'" selected="">'+datec.date+'</option>');
		                  
		                  $("#date").selectpicker("refresh");
		         
	            }
	            else if(id != document.getElementById("date").value){
             	   $('select[name=daten]').val(id);
             	   $('#date').selectpicker('refresh');
                }
                else{
             	   
                }
                        	 	               
	 	               var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	 	
	 	   	var rowsAdd = tableRef.insertRow(tableRef.rows.length); 
	 			var i = tableRef.rows.length;
	 			
	 			var newCell = rowsAdd.insertCell();
	 			  newCell.innerHTML="<tr><td><input type='hidden' name='aid1' form='forma' id='aid1'  value= "+datec.aid1+"><input readonly='readonly'  form ='forma' style='width:100%;  border:groove;' class= 'form-control input-sm' value = '"+datec.time+"' type='text' id = 'time' name= 'time'  ></td></tr>";
	 			  newCell.style.width ='140px';
	 			  newCell.style.border='groove'
	 			  
	 			  
	 			  newCell = rowsAdd.insertCell();
	 			  newCell.innerHTML="<tr><td><input form ='forma' type='text' readonly='readonly' class= 'form-control input-sm' style='width:100%;  border:groove;' value ='"+datec.oraltype+"' id = '"+i+"'  name= 'oraltype' ></td></tr>";
	 			  newCell.style.width ='270px';
	 			  newCell.style.border='groove'
	 		     
	 			 
	 			 
	 			 
	 			  newCell= rowsAdd.insertCell();
	 			  newCell.innerHTML="<tr><td><input form ='forma'  class= 'form-control input-sm' style='width:100%;  border:groove;' onkeypress=''  value='"+datec.oralamt+"' type='text'  id = 'oralamt' name= 'oralamt'  ></td></tr>";
	 			  newCell.style.width ='100px';
	 			  newCell.style.border='groove';
	 			
	 			  
	 			  
	 			  newCell = rowsAdd.insertCell();
	 			  newCell.innerHTML="<tr><td><input type='text' form ='forma' class= 'form-control input-sm' value='"+datec.oralcommence+"' onkeypress='return onlyNos(event,this);' id = 'oralcommence'  name= 'oralcommence'></td></tr>";
	 			  newCell.style.width ='80px';
	 			  newCell.style.border='groove';
	 			
	 			  
	 			  
	 			  newCell = rowsAdd.insertCell();
	 			  newCell.innerHTML="<tr><td><input form ='forma' type='text' class= 'form-control input-sm' value= '"+datec.amtgiv+"' onkeypress='return onlyNos(event,this);' id = 'amtgiv'  name= 'amtgiv' ></td></tr>";
	 			  newCell.style.width ='80px';
	 			  newCell.style.border='groove';
	 			 
	 			  
	 			  newCell = rowsAdd.insertCell();
	 			  newCell.innerHTML="<tr><td><input  form ='forma' class= 'form-control input-sm' value='"+datec.urine+"' type='text' id = 'urine' name= 'urine'  ></td></tr>";
	 			  newCell.style.width ='130px';
	 			  newCell.style.border='groove';
	 			  
	 			  
	 			  newCell = rowsAdd.insertCell();
	 			  newCell.innerHTML="<tr><td><input form ='forma'  class= 'form-control input-sm' value='"+datec.doctord+"' type='text'  id = 'doctord' name= 'doctord'  ></td></tr>";
	 			  newCell.style.width='150px';
	 			  newCell.style.border='groove';

	 			  newCell = rowsAdd.insertCell();
	 			  newCell.innerHTML="<tr><td><input form ='forma'  class= 'form-control input-sm'  type='text'  id = 'discontinue' name= 'discontinue' value='"+datec.discontinue+"' ></td></tr>";
	 			  newCell.style.width='150px';
	 			  newCell.style.border='groove';
	 			
	 			  newCell = rowsAdd.insertCell();
	 			  newCell.innerHTML="<tr><td><i class='fa fa-pencil addBtn' style='font-size:20px' id='"+i+"'></i></td></tr>"
	 		      newCell.style.width='80px';
	 			  newCell.style.border='groove';
	 			
	 			/*
	 			  onclick = d1a(this.id,'"+encodeURIComponent(user2a)+"','"+datec.aid1+"','"+datec.time+"','"+encodeURIComponent(datec.doctord)+"','"+encodeURIComponent(datec.discontinue)+"','"+encodeURIComponent(datec.ratef)+"','"+encodeURIComponent(datec.vomitus)+"','"+ encodeURIComponent(datec.nursesig)+"','"+encodeURIComponent(datec.doctrmks)+"','"+encodeURIComponent(user2b)+"')
	 			  newCell = rowsAdd.insertCell();
	 			  newCell.innerHTML="<tr><td><input type='checkbox' class='addBtn' style='font-size:20px' id='"+i+"' onclick = d2a(this.id)</td></tr>"
	 		      newCell.style.width='80px';
	 			  newCell.style.border='groove';
	 			*/
	 			  unsaved = false;
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



       function doAjaxPost2(drug,date,user2b,user2a) {
    	   // get the form values
    	
   	 var m = moment().format("DD-MM-YYYY h:mm a");
    	   //  var name = $('#pname').val();
       
    	   var admitno = $('#admitno').val();
    	  
     	  if(drug.length == "0" || drug == "%20" || drug == 0 || drug == " " ){
     		  
     	
     		drug = admitno;  
     		document.getElementById("nursec").style.visibility = "hidden";
    		 
     	  }
     	  else{
     		 document.getElementById("nursec").style.visibility = "visible";
    		     	  
     	  }

 
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/drugchart3/"+admitno+"/"+decodeURI(drug)+"/"+date+"",
	         
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        	   document.getElementById("nursec").style.visibility = "visible";
	       		
	        	   $.each(response.list8, function(index, datec) {
	        		 
	        	       var tableRef = document.getElementById('myTable').getElementsByClassName('tbody2')[0];
	        	   	
		var i = tableRef.rows.length;
		var nursesign ="nursesig"+i;
		var vomitus ="vomitus"+i;
		var vomitushid ="vomitushid"+i;
		//for(var x = 0;x<ratef.length;x++){
			
			var rowsAdd = tableRef.insertRow(tableRef.rows.length); 

			
	     
			    /*
			document.getElementById("bouton-contact").setAttribute("form","formbc");
			document.getElementById("pid").setAttribute("form","formbc");
			document.getElementById("admitno").setAttribute("form","formbc");
			document.getElementById("fileno").setAttribute("form","formbc");
		*/
		
if(datec.ratef == undefined){
	datec.ratef = m;
}
		
			      var newCell = rowsAdd.insertCell();
			      newCell.innerHTML="<tr><td><input type='hidden' name='aid1' form='formbc' id='aid1'  value= '"+datec.aid1+"'><input  form ='formbc'  value = '"+datec.time+"' type='hidden' id = 'time' name= 'time'  ><input form ='formbc' type='hidden' value ='"+datec.oraltype+"' id = 'oraltype'  name= 'oraltype' ><input form ='formbc' value='"+datec.oralamt+"' type='hidden'  id = 'oralamt' name= 'oralamt'  ><input type='hidden' form ='formbc'  value='"+datec.oralcommence+"' id = 'oralcommence'  name= 'oralcommence'><input form ='formbc' type='hidden'  value= '"+datec.amtgiv+"' id = 'amtgiv'  name= 'amtgiv' ><input  form ='formbc' value='"+datec.urine+"' type='hidden' id = 'urine' name= 'urine'  ><input form ='formbc'  value='"+datec.doctord+"' type='hidden'  id = 'doctord' name= 'doctord'  ><input form ='formbc' type='hidden'  id = 'discontinue' name= 'discontinue' value='"+datec.discontinue+"' ><input form ='formbc' style='width:100%;  border:groove;' class= 'form-control input-sm' value='"+datec.ratef+"' type='text' readonly='readonly'  id = 'ratef' required name= 'ratef' ></td></tr>";
				  newCell.style.width='150px';
				  newCell.style.border='groove';
				
				  newCell = rowsAdd.insertCell();
				  newCell.innerHTML="<tr><td><input form ='formbc' style='width:100%;  border:groove;' type='checkbox' class= '' value= 'active' id = '"+vomitus+"' name= 'vomitus' onclick = checkb(this.id,'"+nursesign+"','"+user2b+"') ><input type='hidden' name='vomitus' value='off' form='formbc'></td></tr>";
				  newCell.style.width='300px';
				  newCell.style.border='groove';
				  
				  newCell = rowsAdd.insertCell();
				  newCell.innerHTML="<tr><td><input form ='formbc' style='width:100%;  border:groove;' class= 'form-control input-sm' value = '"+datec.nursesig+"' type='text'  id = '"+nursesign+"' name= 'nursesig' required  ></td></tr>";
				  newCell.style.width='100px';
				  newCell.style.border='groove';
				  
				
				  newCell = rowsAdd.insertCell();
				  newCell.innerHTML="<tr><td><input form ='formbc' style='width:100%;  border:groove;' class= 'form-control input-sm' value= '"+datec.doctrmks+"' type='text'  id = 'doctrmks' name= 'doctrmks' ></td></tr>";
				  newCell.style.width='630px';
				  newCell.style.border='groove';
		//}
		

			var x = document.getElementById(nursesign).value;
	   	    var y = document.getElementById(vomitus).value;
	   	
			    if(x != " " && x!= "null" & x != "undefined" && x.length != "0"){
			    	
			    	document.getElementById(vomitus).checked = true;
			    }
			
	   
	   		if(user2a.includes("[ROLE_NURSE]")){
	         document.getElementById("bouton-contact").disabled = false;
	     	document.getElementById("bc").disabled = false;
	   		   var x = document.getElementsByName("time");
	   		    for(var i = 0;i<x.length;i++){
	   		    	
	   		    	x[i].setAttribute("readonly","readonly");
	   		    }
	   		   var x = document.getElementsByName("oraltype");
	   		    for(var i = 0;i<x.length;i++){
	   		    	
	   		    	x[i].setAttribute("readonly","readonly");
	   		    }
	   		
	   		   var x = document.getElementsByName("oralamt");
	   		    for(var i = 0;i<x.length;i++){
	   		    	
	   		    	x[i].setAttribute("readonly","readonly");
	   		    }
	   		   var x = document.getElementsByName("oralcommence");
	   		    for(var i = 0;i<x.length;i++){
	   		    	
	   		    	x[i].setAttribute("readonly","readonly");
	   		    }
	   		   var x = document.getElementsByName("amtgiv");
	   		    for(var i = 0;i<x.length;i++){
	   		    	
	   		    	x[i].setAttribute("readonly","readonly");
	   		    }
	   		   var x = document.getElementsByName("urine");
	   		    for(var i = 0;i<x.length;i++){
	   		    	
	   		    	x[i].setAttribute("readonly","readonly");
	   		    }
	   		   var x = document.getElementsByName("doctord");
	   		    for(var i = 0;i<x.length;i++){
	   		    	
	   		    	x[i].setAttribute("readonly","readonly");
	   		    }
	   	    
	   		}
	   		else if(user2a.includes("[ROLE_DOCTOR]")){
	   			
	   		 var x = document.getElementsByName("vomitus");
	   		    for(var i = 0;i<x.length;i++){
	   		    	
	   		    	x[i].setAttribute("readonly","readonly");
	   		    }
	   		   var x = document.getElementsByName("nursesig");
	   		    for(var i = 0;i<x.length;i++){
	   		    	
	   		    	x[i].setAttribute("readonly","readonly");
	   		    }
	   		
	   		   var x = document.getElementsByName("doctrmks");
	   		    for(var i = 0;i<x.length;i++){
	   		    	
	   		    	x[i].setAttribute("readonly","readonly");
	   		    }
	   		  
	   		
	   	}
	   		else{
	   			
	   		}
		
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	           
	        	           });
    	 unsaved = false;
    	/*
    	 var str = document.getElementById("nursec").style.visibility;
    	 if(str == "hidden"){
    		 document.getElementById("nursec").style.visibility = "visible";
    		 
    	 }
    	 else{
    		 document.getElementById("nursec").style.visibility = "hidden";
    	 }
    	 
 		*/
	    	        	   
    	        	        }
 </script>
 <script>
 var formid
 function doAjaxPostSave(id) {
	 //alert(id)
	
	 if(id == "formbc"){
	

		//	document.getElementById("bc").setAttribute("form","formbc");
			document.getElementById("pid").setAttribute("form","formbc");
			document.getElementById("admitno").setAttribute("form","formbc");
			document.getElementById("fileno").setAttribute("form","formbc");
			document.getElementById("extflag").value = "nurse";
			document.getElementById("extflag").setAttribute("form","formbc");
			
			
		
			
	 }
	
	 if(document.getElementById("pname").value == "Select"){
		 alert("Please select patient name")
		 return false;
	 }
	 var name = document.getElementsByName("oraltype");
	
	 for(var x = 0;x<name.length;x++){
	
		if(name[x].value == " "){
			 alert("Please fill the drug name")
			 return false;
		 }
		
	 }
	 
	/*
	 if(document.getElementById('date').value != moment().format('DD-MM-YYYY')  &&  document.getElementById('date').value !="select"){
		 alert("Cannot save records for previous date")
		 return false;
	 }
	*/
	 
	 
    	   // get the form values
  	/*
           var name = $('#name').val();
           var admitno = $('#admitno').val();
           var pid = $('#pid').val();
           var fileno = $('#fileno').val();
           
           var aid1 = $('#aid1').val();
           var time = $('#time').val();
           
           var oraltype = $('#oraltype').val();
           var oralamt = $('#oralamt').val();
           var oralcommence = $('#name').val();
           var amtgiv = $('#amtgiv').val();
           var urine = $('#urine').val();
           var doctord = $('#doctord').val();
           var discontinue = $('#discontinue').val();
         alert(fileno)
    	
         //   var value = "{'admitno': '"+admitno+"', 'name':'"+name+"', 'fileno': '"+fileno+"', 'pid': '"+pid+"', 'aid1': '"+aid1+"', 'time': '"+time+"', 'oraltype': '"+oraltype+"', 'oralamt': '"+oralamt+"', 'oralcommence':'"+oralcommence+"', 'amtgiv':'"+amtgiv+"', 'urine':'"+urine+"', 'doctord':'"+doctord+"', 'discontinue':'"+discontinue+"' }",
    //alert(value)
    	//   console.log( {name:name,admitno:admitno,fileno:fileno,pid:pid,aid1:aid1,time:time,oraltype:oraltype,oralamt:oralamt,oralcommence:oralcommence,amtgiv:amtgiv,urine:urine,doctord:doctord,discontinue:discontinue})
    //	 console.log("fileno=" + fileno), 
    */	 
   // var fora = document.getElementById(id);
   
    //var form = fora.getAttribute("form");
    	
    	$.ajax({
         	  
    		 type: $('#'+id).attr('method'),
    	     url :  $('#'+id).attr('action'),
    	     async : false,
    	    data: $('#'+id).serialize(),
    	    // dataType: "JSON",
	          // contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        	if(response.toString() == "success")   
	           {
	       	  alert("Data Saved Successfully")
	           }
	       	  unsaved = false;
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
    	
    	 $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
             
    	       	unsaved = false;
    	       });

    	
    	        	        }


      

       
       
       </script>
       <script type="text/javascript">
       
       
       $(function () {
    	    $(document).on('click','#myTable1 .tbody1 tr', function () {
    	    	$('.success').removeClass('success');
    	        $(this).addClass('success');
    	        
    	        var x=this.cells;
    	    
    	        //var id = $(this).closest("tr").find('td:eq(1)').attr('value');
                var string = x[1].innerHTML;
             
    	       console.log(x[1].getElementsByTagName('input')[0].value);
    	     
    	       var y = this.rowIndex;
    	      
    	      if(x[1].getElementsByTagName('input')[0].value != " " && x[2].getElementsByTagName('input')[0].value !=" " && x[3].getElementsByTagName('input')[0].value != " " && x[4].getElementsByTagName('input')[0].value != " " && x[5].getElementsByTagName('input')[0].value != " " && x[6].getElementsByTagName('input')[0].value != " " && x[7].getElementsByTagName('input')[0].value != " "){
    	       // d1a(i,user2a,aid,time,doct,disc,ratef,vomitus,nursesig,doctrmks,user2b)
            
    	       d1a(y,decodeURI(user2a),decodeURI(x[0].getElementsByTagName('input')[0].value),decodeURI(x[0].getElementsByTagName('input')[1].value),decodeURI(x[6].getElementsByTagName('input')[0].value),decodeURI(x[7].getElementsByTagName('input')[0].value),"nullval","nullval","nullval","nullval",decodeURI(user2b))
    	       // doAjaxPost2(decodeURI(x[1].getElementsByTagName('input')[0].value),decodeURI(x[0].getElementsByTagName('input')[1].value),decodeURI(user2b),decodeURI(user2a))
    	      }
    	    
    	    });
    	    $(document).on("keypress",':input',function(e) {
    	    	
    	    
    	        if (e.which === 32 && !this.value.length)
    	            e.preventDefault();
    	    });
    	    $(document).on("input",':input',function(e) {
    	    	
        	    
    	        if (e.which === 32 && !this.value.length)
    	            e.preventDefault();
    	    });
    	});
       </script>
       <script>
$(function () {
	
    });

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
	 
	  $('.tbody1').on( 'click','tr td:nth-child(2)', function() {
	    	var isOpen = $( "#result" ).dialog( "isOpen" );
	    	 addpe = this.getElementsByTagName('input')[0].id;
	      if(isOpen == true){
	    	  
	    	  $( "#result" ).dialog( "open" );
	      }
	      else{
	    	
	    
	    	 $( "#result" ).dialog( "open" );
	      }
	    
	    });
	    $('#result').dialog({height: 300, width:300 });
	    $(".ui-dialog").find(".ui-widget-header").css("background", "#009999","text-align","center");
	    
	    $( "#opener" ).on( "click", function() {
		  	  
		  	  var isOpen = $( "#result" ).dialog( "isOpen" );
		        
		    	if(isOpen == true){
		    	  
		    	  $( "#result" ).dialog( "open" );
		      }
		      else{
		    	
		    
		    	 $( "#result" ).dialog( "open" );
		      }
		    
		  	  
		    });  
	  });
  </script>
  <script>
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

  function goBack() {
	    window.history.back();
	}
  
  </script>
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />'),disbut(),hide()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Drug Chart</a>
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
  
     <h1><!-- <button type="button" onclick="doAjaxPostSave(this.id)" id="bouton-contact" class="btn btn-warning button1" form="forma" >Save</button>-->
	<button type="button" id="pr" class="btn btn-warning button2"  onclick="doAjaxPost('<c:out value="${username}" />','<c:out value="${pageContext.request.userPrincipal.name}" />')">Previous Records</button>
	
<font size="5">Drug Chart</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
		</span>
	</h1>

<br>

<div class="container">
 
  

  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Patient Details</a></li>
    <li><a data-toggle="pill" onclick="crtab('<c:out value="${username}" />','<c:out value="${pageContext.request.userPrincipal.name}" />')" href="#menu1">Drug Chart</a></li>
    <li class="pull-right"><button type="button" id="refresh" class="btn btn-primary button2" onclick="location.href='';">
	  <span class="fa fa-refresh"></span> Refresh</button></li>
	  <li class="pull-right" id="ph"><button type="button" id="opener" class="btn btn-primary button2" >
	   Show Available Drugs</button></li>  
</ul>
</div>
 <div class="tab-content">
    <div id="home" class="tab-pane fade in active">

      <form id="forma" name="forma" action="/HMS/saveDr.html" method="post"></form>
      <form id="formbc" name="formbc" action="/HMS/saveDr.html" method="post"></form>


	    <br>
	    
	    <div id="col3">
	    <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
  <div class="form-group">
            <p>Patient Name<span>*</span></p>
        <select class="selectpicker form-control" data-size="4" data-live-search="true" name = "pname" id ="pname" onchange="addname(this.options[this.selectedIndex])">
     
          <option value='Select' selected disabled>Select</option>
      <c:forEach var="p"  items="${model.list3}">
        <option value="${p.name}" data-subtext="${p.fileno},${p.admdate}" data-value="${p.name},${p.pid},${p.age},${p.gender},${p.fileno},${p.admdate},${p.wardno},${p.doctsig},${p.nursesig},${p.admitno}">${p.name}</option>
        </c:forEach>
      </select>
       
	</div>
	

	<!--  
	  <button type="button" class="btn btn-warning button1" onclick="display()">
	  <span class="glyphicon glyphicon-plus"></span>Add Row</button> 
	
	  <button type="submit" class="btn btn-warning button2" id="formab" form="formb" disabled>
	  <span class="glyphicon glyphicon-eye-open"></span> View Records</button>
	
      <br><br>
      <button type="submit" class="btn btn-warning button1" form="forma"  >
	 <span class="fa fa-floppy-o"></span> Save</button>
     
	  -->

  </div>
  
  <div class="col-xs-4">
  
  <div class="form-group">
         <p>Registration Id<span>*</span></p>
     <input type="text" name="pid" id="pid"  form="forma" class="form-control input-sm"  required>
       
       
       
	</div>
  

    
    
	  
    </div>
    
      <div class="col-xs-3">
     <div class="form-group">
     
          <p>Admit No<span>*</span></p>
             <input type="text" name="admitno" id="admitno"  form="forma" class="form-control input-sm"  required>
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
     <input type="text" name="age" id="age"  form="forma" class="form-control input-sm"  required>
     </div>
 </div>
 
   <div class="col-xs-4">
  
  <div class="form-group">
          <p>Gender<span>*</span></p>
     <input type="text" name="gender" id="gender"  form="forma" class="form-control input-sm"  required>
       
     </div>
 </div>
 
 <div class="col-xs-3">
  
  <div class="form-group">
  
          <p>Admission Date<span>*</span></p>
     <input type="text" name="admdate" id="admdate"  form="forma" class="form-control input-sm" required>
       
          
     </div>
 </div>
	      
	      </div>
	
	   <div class="form-group row" >
	     <div class="col-xs-1"></div>
	          <div class="col-xs-3">
  
  <div class="form-group">
     
           <p>Current Date<span>*</span></p>
     <input type="text" name="curdate" id="curdate"  form="forma" class="form-control input-sm"  required>
       
     </div>
 </div>
 
    
 
      <div class="col-xs-4">
  
  <div class="form-group">
     
          <p>WardNo/BedNo<span>*</span></p>
     <input type="text" name="wardno" id="wardno"  form="forma" class="form-control input-sm"  required>
     </div>
 </div>
 
   <div class="col-xs-3">
  
  <div class="form-group">
     
          <p>Doctor<span>*</span></p>
     <input type="text" name="doctsig" id="doctsig"  form="forma" class="form-control input-sm"  required>
     <input type="hidden" name="extflag" id="extflag" form="forma" value="doct" >
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
	          
             <select class="selectpicker form-control" data-size="4" data-live-search="true" name = "daten" id ="date" onchange="doAjaxPost1(this.value);this.selectedindex = -1">
           <option value="select" selected disabled>Select date to fetch records</option>
         
      </select>
      </div>
	        </div>
	      </div>
    	        <div class="form-group row" >
	    
	      
	    <div class="container">
	        <div class="col-xs-9">
	     <div class="form-group">
	     
	     	    
  <table class="table table-bordered " data-click-to-select="true" data-single-select="true" style="width: 1200px; align: center;" id="myTable1">
    <thead>
      <tr>
        <th style="width:140px;">Date Comm.</th>
        <th style="width:270px;">Drug Name</th>
        <th style="width:100px;">Dosage</th>
        <th style="width:80px;">Frequency</th>
        <th style="width:80px;">#Days</th>
        <th style="width:130px;">Route Of Administration</th>
        <th style="width:150px;">Ordered By</th>
        <th style="width:150px;">Discontinue</th>
        <th id="edit" style="width:80px;">Administer</th>
        <th style="width:20px;">      </th>
        <!--  
        <th  rowspan='2' style="width:100px;">Time</th>
        <th   rowspan='2' style="width:150px;">Administered (yes/no)</th>
        <th  rowspan='2' style="width:200px;">Assigned Nurse</th>
        <th  rowspan='2' style="width:150px;">Remarks</th>
        <th  rowspan='2' style="width:50px;">Delete</th>
        
        -->
      </tr>

      
    </thead>
    <tbody class="tbody1">

   
    </tbody>
       <tr id="hiderow">
		    <td><i class='fa fa-plus' style='font-size:20px; color : #ff9900;'  onclick="return display('<c:out value="${username}" />','<c:out value="${pageContext.request.userPrincipal.name}" />')"></i><a href="#" class='button3'  style='color : #ff9900;'  onclick="cleartab1()"><b>Clear Table</b></a><a href="#" class='button2' id="bouton-contact" style='color : #ff9900;'  onclick="return doAjaxPostSave('forma')"><b>Save</b></a></td>
		  </tr>
		  
    </table>
   
	      </div>
	      
	      </div>
	      </div>
	      </div>  
	      
	      
	         <div class="form-group row" >
	    
	      
	    <div class="container" id="nursec">
	        <div class="col-xs-9">
	     <div class="form-group">
	     
	     	    
  <table class="table table-bordered table-fixed table-hover table-condensed" style="width: 1200px; align: center;" id="myTable">
    <thead class="thead1">
      <tr>
        <th style="width:150px;">Date Comm.</th>
        <th style="width:300px;">Drug Name</th>
        <th style="width:100px;">Dosage</th>
        <th style="width:100px;">Frequency</th>
        <th style="width:100px;">#Days</th>
        <th style="width:150px;">Route Of Administration</th>
        <th style="width:150px;">Ordered By</th>
        <th style="width:150px;">Discontinue</th>
     </tr>
     </thead>
     
     <thead class="thead3" id="myrow">
     
     
      </thead>
      <thead class="thead2">
      <tr>
        <th style="width:150px;">Time</th>
        <th style="width:300px;">Administered</th>
        <th style="width:100px;">Assigned Nurse</th>
        <th style="width:630px;">Remarks</th>
        <th style="width:20px;"> </th>
      </tr>
  </thead>
  
    <tbody class="tbody2">
    
    </tbody>
       <tr id="hiderow">
		    <td><i class='fa fa-plus' style='font-size:20px; color : #ff9900;'  onclick="display1('<c:out value="${username}" />','<c:out value="${pageContext.request.userPrincipal.name}" />')"></i><a href="#" id="bc" class='button2' style='color : #ff9900;'  onclick="doAjaxPostSave('formbc')"><b>Save</b></a></td>
		  </tr>
		  
    </table>
   
	      </div>
	      
	      </div>
	      </div>
	      </div> 
	      
	      
	      </div>
    
  </div>

	      
	      
    <button type="" class="bouton-contact"  form="" ></button>
   </div>
     

   </div>
  <div id="result"  title="Pharmacy Products">
   <div class="form-group row" >
        <div class="col-xs-8">
        <p>Drug Name<span></span></p>
       <div class="form-group">
      
       <select class="selectpicker form-control input-sm" data-size="4" data-live-search="true" name = "drugn" id ="drugn" onchange=""   >
          <option value="select" disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list4}">
        <option data-subtext="Stocks -${p.pstock1}"value="${p.drugn}">${p.drugn}</option>
        </c:forEach>
      </select></div>
      </div>
      
       <div class="col-xs-2">
       <br><br>
      <button type="button" class="btn btn-warning" onclick="return addp()">ADD</button></div>
      </div>
  </div>
    

</body>
</html>
