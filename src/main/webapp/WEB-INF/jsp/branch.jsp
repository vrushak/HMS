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


<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-confirm.min.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-confirm.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>


<style type="text/css">
div.jconfirm-title-c {
    background-color: #009999;
    font-size :1px;
    color:white;
    }
.jconfirm-buttons button{
color : orange;
}

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
  max-width:1000px;
  width:100%;
  margin: 5% auto;
  background-color: #FFFFFF;
  overflow: hidden;
}
#form1a h1 {
  font-size: 18px;
  background: #009999 none repeat scroll 0% 0%;
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form1a {
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

th {
    background-color: #009999;
    color: white;
    
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
$(document).ready(function(){
    $('.selectpicker').selectpicker({
        required: 'true',
        
    });
});
function checkhome(user){
	document.getElementById("bc").style.display = "none";
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
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
	
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_Accounts Admin]")){
		
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
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
	alert(id);
}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/branch.html";
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

function copy(pid){

	var str = pid.split("==");
	
$('#id').val(str[0]);
$('#name').val(str[1]);
$('#address').val(str[2]);
$('#hide1').show();
$('#cr').val("edit");  

   $('#myModal').modal('show');

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
	 
 return true;
 }
 else
 { 
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

function hide(){
	$('#hide1').hide()
}

</script>

<script>

</script>
</head>



<body onload="hide()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Branch Details</a>
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
    </ul>
     <ul class="nav navbar-nav navbar-right">
    </ul>
  </div>
</nav>
  <center>
</center>
  <form id="form2" action="" method="">  
  
    
	  <h1>
	  <button type="button" class="btn btn-warning button1" data-toggle="modal" data-target="#myModal">
	  <span class="glyphicon glyphicon-plus"></span>New Branch</button>
<font size="5"> Current Branches</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Branch Name or Id"  style="width:150px"/></span>
	</h1>

	    <br>

	    <div class="table-responsive" style="overflow : auto;">
	    <div class="col-lg-12">
   <table class="table table-striped table-bordered table-hover table-condensed"  id="myTable">
    <thead>
      <tr>
        <th>Branch ID</th>
        <th>Branch Name</th>
        <th>Branch Address</th>
       
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list2}">
    <tr>
    <td><a href="#"  onclick="copy('${p1.id}==${p1.name}==${p1.address}')">${p1.id}</a></td>
    <td>${p1.name}</td>
    <td>${p1.address}</td>
  
  
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    </div>
     <button type="" class="bouton-contact" disabled ></button>
     </form>
     
     <div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
      <form id="formdel" action="/HMS/cancelapp/fds" method="get"> </form>
       <form id="form1" action="/HMS/saveBranch" method="post"> </form>
       <div id="form1a">
  
        <h1><button type="submit" form="form1" id="bouton-contact" class="btn btn-warning button1" >Save</button> 
       <span id="ch"> New Appointment </span>
        <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button> 
        </h1>
        
       <br>
   
       <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
  <div class="form-group">
            <p>Branch Name<span>*</span></p>
          <input type="text" class="form-control input-sm" form="form1" id = "name" name="name">
	</div>
  </div>
  <div class="col-xs-2"></div>
   <div class="col-xs-4">
  <div class="form-group">
     <p>Branch Address<span>*</span></p>
     <input type="text" class="form-control input-sm" form="form1" id = "address" name="address">
</div>
  </div>
  
 </div>
 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
  <div class="form-group" id="hide1">
<p>Branch ID<span>*</span></p>
     <input type="number" readonly class="form-control input-sm" form="form1" id = "id" name="id" value="0">
 </div>
  </div>
  
  <div class="col-xs-2"></div>
   <div class="col-xs-2">
  <div class="form-group">
  <input type="hidden" name="cr" id="cr" form="form1" value="create">
  
           
   </div>
</div>

<div class="col-xs-2">
  <div class="form-group">
  
  
 </div>
</div>
  </div>
  
   
 
 
 

  
  
 

 
 <button type="" id="" class="bouton-contact" disabled ></button>
   </div> 
       </div>
       
       
  
       </div>
   </div>
 <c:forEach var="p"  items="${model.list}">
<script>
checkid('<c:out value="${p.fileno}" />');
</script>
</c:forEach>
 <c:forEach var="p"  items="${model.list4}">
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
</body>
</html>