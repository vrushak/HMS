<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMS Wedge</title>

<link rel='stylesheet' href='<c:url value="/resources/css/myapps.css" />' type='text/css' media='all' />

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-confirm.min.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-confirm.min.js"></script>
<style type="text/css">
div.jconfirm-title-c {
    background-color: #009999;
    font-size : 10px;
    color:white;
    
    }
.jconfirm-buttons button{
color : orange;
}


</style>
<style type="text/css">

.tab-pane{
width : auto;
border-style : groove;
border-radius : 10px;
height : 400px;
overflow-y : auto;

}

#menu4{
width : 820px;
border-style : groove;
border-radius : 10px;
height : 300px;
}
.btn btn{

 padding: 15px 15px;
   
        /* All browsers since IE 5.5+ */

    max-width:170px;
    cursor: default;
}
.btn-block{
 width : 1050px;
}

.remove{

}
table.beta .tbody2{
    
    height:300px;
    overflow-y :auto;
}


table.beta .thead2 th{
	background-color: #009999;
    color: white;
}
  
  #mc1{
height : 300px;

} 
  
 
</style>
<script type="text/javascript">
var adminusr;
var admnme;

function checkid(str){
	
	 
	if (str == "" || str == null){
    	
		
		
		id = 1;
		var str1 = "Fileno-";
	  
		var str3 = id;
		var res = str1.concat(str3);
	

		document.getElementById("fileno").value = res;
		
		
    	//alert(res1);
	}
	else {
		
	
		
		var id = str;
		
		var ida = Number(id) + 1;
	
		var str1 = "Fileno-";
		  
		
		var res = str1.concat(ida);
		
		document.getElementById("fileno").value = res;
		 
	//	alert(res1);
	}
}
function checkhome(user){
	document.getElementById("bc").style.display = "none";
	
adminusr = user;
//document.getElementById("adr").style.visibility ="hidden";
if(adminusr.includes("[ROLE_ADMIN]")){
		document.getElementById("docid").value = admnme;
		document.getElementById("dname").value = admnme;
	  $("#nap").hide();
	}
    	
		if(user.includes("[ROLE_DOCTOR]") ){
		 var url = "/HMS/doctor1" ;
		 $("#back").hide();
	  $('#dname').val(admnme)		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
	
	}

	else{
		
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		
	}
}

var patonid;
function checkpatid(str){

	if (str == "" || str == null){
    	
		
		
		id = 1;
		var str1 = "P-";
	    var m = moment().format("DDMMYYYY-");
	    
		var str3 = id;
		var res = str1.concat(m);
		var res1 = res.concat(str3);
	    
		
		 patonid = res1;
		 
    	//alert(res1);
	}
	else {
		
	
		
		var id = str;
		
		var ida = Number(id) + 1;
	
		var str1 = "P-";
		var m = moment().format("DDMMYYYY-");
		var str3 = ida;
		var res = str1.concat(m);
		var res1 = res.concat(str3);
		 
		
		patonid = res1;
	//	alert(res1);
	
	    
		
	}
}
function hide(user){
	
	
		if (user.includes("[ROLE_DOCTOR]")){
			document.getElementById("dh").style.display="none";
			var no = document.getElementsByClassName("trunk");
			for(var i=0;i<no.length;i++){
				no[i].style.display="none";
				
			}
			
			document.getElementById("myTable").setAttribute("style","border:0;"); 
		  document.getElementById("formab").style.width ='760px'; 
		}
		
		
	else{
		document.getElementById("dh").style.display="visible";
		document.getElementById("tr").style.display="visible";	
		document.getElementById("myTable").setAttribute("style","border:0;");
	}
	}
	
function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    tda = tr[i].getElementsByTagName("td")[2];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } 
	      else if(tda.innerHTML.toUpperCase().indexOf(filter) > -1){
	    	  tr[i].style.display = "";
	      }
	      else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}

function disp(){
	
	$('#myModal').modal('show');
}
var id1;
function check(id,name,spec){
	
	id1 = id;
	
	  
	document.getElementById("docid").value = id;
	document.getElementById("dname").value = name;
	//document.getElementById("specialization").value = Id;
	           
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
	document.getElementById("cause").value = str[2];
	
	
}
function rem(remdata){
//	alert(remdata);
	  $(remdata).remove();
}

function callevent(e){
	addpe = e;
	  $('#myModal2').modal('show');
}
var sav;
function copyval2(name){
	
	var a = $("#fileno").val();
	var b = $("#pname1").val();
	var c = $("#pid1").val();
	var d = document.getElementById("pname").value;
	var e = $('#docid').val();
	if(name == "menucd" && d =="Select"){
		alert("Please select Patient Name")
		return false;
	
	}
	else if(name == "menucd" && d !="Select"){
	
		  var url = "/HMS/diagnosegc?location="+a+"&location1="+b+"&location2="+c+"&&location3="+e+"&&location4="+sav+"";
		    var element = document.getElementById(name);
			element.setAttribute("href",url);
		
			
			return true;
	}
	
	else{
		
	}
	
}


var tabid;
function copyval1(id,name,fileno,docid,val){
	
	  var url = "/HMS/diagnosegc?location="+fileno+"&location1="+name+"&location2="+id+"&&location3="+docid+"";
	console.log(url)
	  $(val).attr("href",url);
	}
function copyval(tabi){
	tabid = tabi;
	var a = $("#fileno").val();
	var b = $("#pname1").val();
	var c = $("#pid1").val();
	var d = document.getElementById("pname").value;
	
	if(tabi == "menu4a" && d =="Select"){
		alert("Please select Patient Name")
		return false;
	}
	var url = "/HMS/labup2?location="+a+"&location1="+b+"&location2="+c+"";
    var element = document.getElementById(tabi);
	element.setAttribute("href",url);
	
	if(tabi == "menu4"){
	//	document.getElementById("adr").style.visibility ="visible";
		var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
		if(tableRef.rows.length == 0){
			display()
		}
	}
	else{
	//	document.getElementById("adr").style.visibility ="hidden";
		document.getElementById("addButton").style.visibility = "visible";
		//document.getElementById("print").style.visibility = "hidden";
	}
	
	if(tabi == "home1"){
		document.getElementById("addButton").style.visibility = "hidden";
		document.getElementById("showdrugs").style.visibility = "hidden";
	//	document.getElementById("print").style.visibility = "hidden";
	}
	else if(tabi == "menu3a"){
		document.getElementById("addButton").style.visibility = "hidden";
		document.getElementById("showdrugs").style.visibility = "hidden";
	//	document.getElementById("print").style.visibility = "hidden";
	}
	else if(tabi == "menu4"){
		document.getElementById("addButton").style.visibility = "hidden";	
		document.getElementById("showdrugs").style.visibility = "visible";
	//	document.getElementById("print").style.visibility = "visible";
	}
	else{
		document.getElementById("addButton").style.visibility = "visible";	
		document.getElementById("showdrugs").style.visibility = "hidden";
	//	document.getElementById("print").style.visibility = "hidden";
	}

	
} 

function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable1").deleteRow(i);
    disbut();
    
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
     //   alert(charCode);
        if ((charCode == 44)){
        	
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

	
function addcid(getval){
	var myname = getval.getAttribute('data-value'); 	

	//var cid = document.getElementById("pid").value; 
	var str = myname.split(',');

//	var res4 = $('select[name=pid1]').val();
	  
	  
	   $('select[name=pname1]').val(str[1]);
	   $('#pname').selectpicker('refresh');

	
	//document.getElementById("pname").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	$('#phno').val(str[2])
	
	disable();
}

function clos(){
	window.location.reload();
}

function addcname(getval){
	
	var myname = getval.getAttribute('data-value'); 	
//	var cid = document.getElementById("pname").value; 
	var str = myname.split(',');
	
	// var res5 = $('select[name=pname1]').val();
 	   $('select[name=pid1]').val(str[0]);
	   $('#pid').selectpicker('refresh');
	   
//	document.getElementById("pid").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	$('#phno').val(str[2])
}


function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/myapps.html";
	}
}


function validmess(){
	var a = document.getElementById("pname").value;
	var b = document.getElementById("pid").value;
	var c = document.getElementById("docid").value;

	if(a.length == 0){
	 alert("Please select the Patient Name")
	 return false;
	}
	else if(b.length == 0){
		 alert("Please select the Patient Id")
		 return false;
		}
	else if(c.length == 0){
		 alert("Please select the Doctor Name")
		 return false;
	}
	
	else if(a.length == 0 && b.length == 0 && c.length == 0){
		alert("Please fill all the mandatory fields")
		return false;
	}
	
	else{
		return true;
	}
}

function myconfirm()
{
	
var r = confirm("Do you want to Cancel Appointment?");
 if(r== true)
 {
	 $("#sms").attr('form','formdel')
	 $("#phno").attr('form','formdel')
 return true;
 }
 else
 {
	 $("#sms").attr('form','form1')
	 $("#phno").attr('form','form1')
   return false;
 }
}
function getInputDateFormat(date) {
	 return date.toISOString().split('T')[0];
	}
	
function validDate() {
	 var today = new Date();
	 var maxDate = new Date();
	 maxDate.setDate(maxDate.getDate() + 7);

	 document.getElementsByName("appointment")[0].setAttribute('min', getInputDateFormat(today));
	 document.getElementsByName("appointment")[0].setAttribute('max', getInputDateFormat(maxDate));
	}




function copy(pid){

	$("#pat").next("span").andSelf().hide();
	var strSplit = pid.split('==');


   document.getElementById("pid").value = strSplit[0];
   
   $("#pid").append('<option value="'+strSplit[0]+'"selected="">'+strSplit[0]+'</option>');
   $("#pid").selectpicker("refresh");
   
   $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
   $("#pname").selectpicker("refresh");

   
  

   document.getElementById("pid1").value = strSplit[0];

   
   document.getElementById("pname1").value = strSplit[1];
   
   document.getElementById("ch").innerHTML = "View Appointment";
  
   $("#docid").val(strSplit[2]);
   $("#dname").val(strSplit[3]);
   
   document.getElementById("appointment").value = strSplit[4].split(" ")[0];
   
   document.getElementById("time").value = strSplit[4].split(" ")[1];
   
   document.getElementById("fileno").value = strSplit[5];
   document.getElementById("bouton-contact").disabled = false;
   document.getElementById("pid").disabled = true;
   document.getElementById("pname").disabled = true;
 
   document.getElementById("filenod").value = strSplit[5];
    document.getElementById("bc").style.display = "block";
   
	
    if(strSplit[8].includes("on")){
    	$("#sms").prop("checked",true)
    }else{
    	$("#sms").prop("checked",false)
    }
	 
		var date = new Date(document.getElementById("appointment").value);
		var date1 = new Date()
	var longformat = date*1;
	var longformat1 = date1*1;

 if(moment(document.getElementById("appointment").value).format("DD-MM-YYYY") ==   moment().format("DD-MM-YYYY"))  {

	if(document.getElementById("time").value >=  moment().format("HH:mm A")){
	 document.getElementById("bouton-contact").disabled = false;
	document.getElementById("bc").disabled = false;
 }
	else{
		 document.getElementById("bouton-contact").disabled = true;
			document.getElementById("bc").disabled = true;
	}
 }
 else if(longformat < longformat1){

	 document.getElementById("bouton-contact").disabled = true;
	 document.getElementById("bc").disabled = true;
 }
 else if(longformat >=  longformat1)  {
	
	 document.getElementById("bouton-contact").disabled = false;
		document.getElementById("bc").disabled = false;
	 }
 else{
	 
 }
 

 if(strSplit[6] == "off"){
	 document.getElementById("bouton-contact").disabled = true;
	 document.getElementById("bc").disabled = true;
 }

 $("#phno").val(strSplit[7])
   $('#myModal').modal('show');

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
	    
	     var dt = new Date();
	 	 var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
	 	 
	 	 var currenttime  = dt.getHours() + ":" + dt.getMinutes();
	 	
	 	 
if($("#time").val() < currenttime)
	 	{
	 	 //	 alert("Appointments can be scheduled only for future time")
		   	 //$( "#time" ).val(currenttime);
		      //   $(this).focus();         
	 	}
		/*   
		     if(currentTime.getHours() > parseInt(userTime[0]) || (currentTime.getMinutes()>parseInt(userTime[1]))){
		   	 alert("Appointments can be scheduled only for future time")
		   	 $( "#time" ).val(time);
		         $(this).focus();                
		     }
		     
		  */   
		     
		     /*
		     if(currentTime.getHours() <= parseInt(userTime[0])){
		         if(currentTime.getMinutes() > parseInt(userTime[1])){
		       	 alert("Cannot create appointments for future dates");
		       	 $( "#time" ).val(time);
		         $(this).focus();
		         }
		     }
		 */    
		 }
		 });

});
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

</script>
     

<script type="text/javascript">
$(document).ready(function(){
	$('#form1').draggable();
	$('.modal-content').resizable({
	    //alsoResize: ".modal-dialog",
	    minHeight: 300,
	    minWidth: 400
	});
	$('#myModal1 .modal-dialog').draggable();

	$('#myModal1').on('show.bs.modal', function () {
	    $(this).find('.modal-body').css({
	    	'max-height':'100%'
	    });
	});

	$('#mc1').resizable({
	    //alsoResize: ".modal-dialog",
	   
	    minWidth: 100
	});
	$('#myModal2 .modal-dialog').draggable();

	$('#myModal2').on('show.bs.modal', function () {
	    $(this).find('.modal-body').css({
	    	'max-height':'100%'
	    });
	});
});

</script>
<script>
function removeAll(id,pn,moba){
	
	$('#pid').find('[value='+id+']').remove();
	$('#pid').selectpicker('refresh');
	  
	$('#pname').find('[value='+pn+']').remove();
	$('#pname').selectpicker('refresh');  
	
	   $('select[name=pname1]').val('select');
	   $('#pname').selectpicker('refresh');

	   $('select[name=pid1]').val('select');
	   $('#pid').selectpicker('refresh');
    $('#phno').val('NA')
}
function prompt(val){
	var ida,namea,moba;
	if(val.checked == false){
		removeAll(ida,namea,moba)
		return false;
		
	}
	
	
$.confirm({
    title: 'New Patient Registration',
    content: '' +
    '<div class="form-group">' +
    
    '<label>Enter Patient Id</label>' +
    '<input type="text"  class="id form-control" value ='+patonid+' required />' +
    '<label>Enter Patient Name</label>' +
    '<input type="text"  class="name form-control" required />' +
    '<label>Enter Mobile Number</label>' +
    '<input type="text" class="mobile form-control" onkeypress="return onlyNos(event,this);" required />' +
    '</div>' ,
 
    buttons: {
        formSubmit: {
            text: 'Add',
            btnClass: 'btn-blue',
            action: function () {
               namea = this.$content.find('.name').val();
                if(!namea){
                    $.alert('Please provide a valid name');
                    return false;
                }
                ida = this.$content.find('.id').val();
                if(!ida){
                    $.alert('Please provide a valid id');
                    return false;
                } 
                moba = this.$content.find('.mobile').val();
                if(!moba){
                    $.alert('Please provide a valid mobile');
                    return false;
                }
              
                if ($("#pid option[value='"+patonid+"']").length == 0){
 	              
             	   $("#pid").append('<option value="'+ida+'" data-value="'+ida+','+namea+','+moba+'" selected="">'+ida+'</option>');
                   $("#pid").selectpicker("refresh");
                   
                   $("#pname").append('<option value="'+namea+'" data-value="'+ida+','+namea+','+moba+'" selected="">'+namea+'</option>');
                   $("#pname").selectpicker("refresh");
                 }
                $('#pid1').val(ida);
                $('#pname1').val(namea);
                $('#phno').val(moba);

               
            }
        },
        cancel: function (){
        	
            //close
            $(val).attr("checked",false);
            if(namea == null){
           	 namea=0;
            }
            if(namea.length > 0 && moba.length > 0 ){
         	   removeAll(ida,namea,moba)   
            }
        },
    }


});
}
</script>

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />',admnme='<c:out value="${pageContext.request.userPrincipal.name}" />'),hide('<c:out value="${username}" />',validDate())">

<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >My Appointments</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id ="ho" href="">Home</a></li>
      <li class=""><a  id="m3" href="/HMS/diagnose">Clinical Diagnosis</a></li>
      <li class=""><a id="m2" href="/HMS/treatment">Patient Treatment Records</a></li>
      <li class=""><a id="m4" href="/HMS/discharge">Discharge Summary</a></li>        
         </ul>
             <ul class="nav navbar-nav navbar-right">
  <li><a href="/HMS/doctor1" id="back" ><span class="glyphicon glyphicon-user"></span><span id="tit">Back to Doctor Home </span></a></li>
    </ul>   <!--      
      <ul class="nav navbar-nav navbar-right">
       <li style ="color:#ff9900;"><span class="glyphicon glyphicon-log-in"></span> Welcome : ${pageContext.request.userPrincipal.name}</li>
      </ul>
      -->
  </div>
</nav>
  <center>
</center>
 <form id="formab" action="" method="post">  
  <h1>
	  <button type="button" id="nap" class="btn btn-warning button1" data-toggle="modal" data-target="#myModal">
	  <span class="glyphicon glyphicon-plus"></span>New Appointment</button><font size="5">My Appointments</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Patient Name or Id"  style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed gamma" style="width: 1000px; " id="myTable">
    <thead class="thgamma">
      <tr>
        <th style="width:240px;">Patient Id</th>
        <th style="width:240px;">Patient Name</th>
        <th style="width:240px;" id="dh">Doctor Name</th>
        <th style="width:240px;" class="">Appointments</th>
       
      </tr>
    </thead>
    <tbody class="tbgamma">
   
    <c:forEach var="p1"  items="${model.list1}">
    <tr>
    <td width="240px;" ><a href="" target="_self" onclick="copyval1('${p1.pid}','${p1.pname}','${p1.fileno}','${p1.docid}',this)" >${p1.pid}</a></td>
    <td width="240px;"><a href="#"  onclick="copy('${p1.pid}==${p1.pname}==${p1.docid}==${p1.dname}==${p1.appointment}==${p1.fileno}==${p1.ac}==${p1.pas}==${p1.sms}')">${p1.pname}</a></td>
    <td width="240px;" class="trunk">${p1.dname}</td>
    <td width="240px;">${p1.appointment}</td>

    
  
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    <button type="" class="bouton-contact"></button>
     </form>



 
 <div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
      <form id="formdel" action="/HMS/cancelapp/doc" method="get"> </form>
       <form id="form1" action="saveApp.html" method="post">  
  
        <h1><button type="submit" id="bouton-contact" onclick=" return validmess()" class="btn btn-warning button1" >Save</button> 
       <span id="ch"> New Appointment </span>
        <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button> 
        </h1>
        
       <br>
   
       <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
  <div class="form-group">
            <p>Patient Id<span>*</span></p>
             <select class="selectpicker form-control" data-size="10" data-live-search="true" name = "pid1" id ="pid" onchange="addcid(this.options[this.selectedIndex])"   required>
          <option value="" selected disabled>Select</option>
        <c:forEach var="p"  items="${model.list2}">
        <option value="${p.pid}" data-value="${p.pid},${p.combine},${p.mobile}">${p.pid}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  <div class="col-xs-2"></div>
   <div class="col-xs-4">
  <div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control" data-size="10" data-width="100%" data-live-search="true"  name = "pname1" id ="pname" onchange="addcname(this.options[this.selectedIndex])"  >
      <option value="" selected disabled>Select</option>
        <c:forEach var="p"  items="${model.list2}">
        <option value="${p.combine}" data-value="${p.pid},${p.combine},${p.mobile}">${p.combine}</option>
        </c:forEach>
      </select>
   
</div>
  </div>
  <input type="hidden" form="form1" name="pname" id="pname1">
  <input type ="hidden" form="form1" name="pid" id="pid1" >
    <input type ="hidden" form="formdel" name="fileno" id="filenod" >
 </div>
 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
  <div class="form-group">
               <p>Doctor Name<span>*</span></p>
         <input type="text"  form="form1" id="dname" name="dname" readonly class="form-control input-sm" required>
         <input type="hidden"  form="form1" id="docid" name="docid" class="form-control input-sm" required>
    
    </div>
  </div>
  <div class="col-xs-2"></div>
   <div class="col-xs-2">
  <div class="form-group">
  
  <p>Appointment Date<span>*</span></p>

    <input type="date"  form="form1" id="appointment" name="appointment" class="form-control input-sm" required>
    
           
   </div>
</div>

<div class="col-xs-2">
  <div class="form-group">
  
  <p>Time<span>*</span></p>

    <input type="time"  form="form1" id="time" value="now" name="time" class="form-control input-sm" required>
    
           
   </div>
</div>
  </div>
  
   
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <p>Patient File No<span>*</span></p>

    <input type="text" form="form1" id="fileno" value=""readonly="readonly" name="fileno" class="form-control input-sm" required>
    <input type="hidden" name="flag" form="form1" value="doc">
 
   <!--   <input type="checkbox" name="sms" id="sms" form="form1">SMS Alerts -->      
     <input type="checkbox" name="pat" id="pat" form="form1" onchange="return prompt(this)"><span>New Patient</span> 
 </div>
 
 <div class="col-xs-2"></div>
  <div class="col-xs-4">
       <p>Mobile No<span></span>*</p>
     <input type="text" name="phno" id="phno" class="form-control input-sm" form="form1" readonly value="NA"><br>
  <button type="submit" id="bc" form="formdel" onclick=" return myconfirm()" class="btn btn-warning button1" >Cancel Appointment</button> 
           
 </div>
 </div>
 <br><br><br>

  
  
 

 
 <button type="" id="" class="bouton-contact" disabled ></button>
       </form>
       </div>
       
       
  
       </div>
        
       </div>          
       
     
     
 <c:forEach var="p"  items="${model.list1}">
<script>
//check('<c:out value="${p.docid}" />','<c:out value="${p.dname}" />','<c:out value="${p.specialization}" />');
check('<c:out value="${p.docid}" />','<c:out value="${p.dname}" />');
//checkhome('<c:out value="${p.docid}" />','<c:out value="${p.idc}" />');

</script>
</c:forEach>

<c:forEach var="p"  items="${model.list15}">
<script>

$('#docid').val('<c:out value="${p.docID}" />')

</script>
</c:forEach>
</body>
<c:forEach var="p"  items="${model.list}">
<script>
checkid('<c:out value="${p.fileno}" />');
</script>
</c:forEach>
 <c:forEach var="p"  items="${model.list8}">
<script>
checkpatid('<c:out value="${p.pid}" />');
</script>
</c:forEach>
<script>

function filterTable(event) {

	var filter = event.target.value.toUpperCase();
    var rows = document.querySelector("#myTable tbody").rows;
    
    for (var i = 0; i < rows.length; i++) {
        var firstCol = rows[i].cells[0].textContent.toUpperCase();
        var secondCol = rows[i].cells[1].textContent.toUpperCase();
        var thirdCol = rows[i].cells[2].textContent.toUpperCase();
        if (firstCol.indexOf(filter) > -1 || secondCol.indexOf(filter) > -1 || thirdCol.indexOf(filter) > -1) {
            rows[i].style.display = "";
        } else {
            rows[i].style.display = "none";
        }      
    }
}

document.querySelector('#myInp').addEventListener('input', filterTable, false);
</script>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</html>