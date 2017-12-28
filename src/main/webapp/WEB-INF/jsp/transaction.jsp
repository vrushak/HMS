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
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel='stylesheet' href='<c:url value="/resources/css/transaction.css" />' type='text/css' media='all' />

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

function checkhome(user){
	if(user.includes("dbfdesk")){
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
	
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_Accounts Admin]")){
		
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
}

function clos(){
	window.location.reload();
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
function disable(){
	var res = document.getElementById("ptype").value;
     if(res=="Consumables"){
    	 
    	 document.getElementById("expdate").disabled = true;
    	
     }
     else{
    	 
    	 document.getElementById("expdate").disabled = false;
    	
     }
  	
}
function addcid(){
	var cid = document.getElementById("pid").value; 
	var str = cid.split(',');
	
	var res4 = $('select[name=pid1]').val();
	  
	   
	   $('select[name=pname1]').val(res4);
	   $('#pname').selectpicker('refresh');

	
	document.getElementById("pname").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	document.getElementById("ptype").value=str[2];
	document.getElementById("quantity").setAttribute("max",str[3]); 

	document.getElementById("pc").value=str[4];
	document.getElementById("expiry").value=str[5];
	document.getElementById("invid").value=str[6];
	document.getElementById("csd").value=str[3];
	disable();
	}
function addcname(cname){
	var cid = document.getElementById("pname").value; 
	var str = cid.split(',');
	
	
	 var res5 = $('select[name=pname1]').val();
 	   $('select[name=pid1]').val(res5);
	   $('#pid').selectpicker('refresh');
	   
	document.getElementById("pid").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	document.getElementById("ptype").value=str[2];	
	document.getElementById("quantity").setAttribute("max",str[3]);
	document.getElementById("pc").value=str[4];
	document.getElementById("expiry").value=str[5];
	document.getElementById("invid").value=str[6];
	document.getElementById("csd").value=str[3];
	disable();
}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/getStocks.html";
	}
}
function copy(pid){

	var strSplit = pid.split(',');


   document.getElementById("pid").value = strSplit[0];
   
	   $("#pid").append('<option value="'+strSplit[0]+'"selected="">'+strSplit[0]+'</option>');
	   $("#pid").selectpicker("refresh");
   
	   document.getElementById("pid").disabled = true;
   $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
   $("#pname").selectpicker("refresh");
   document.getElementById("pname").disabled = true;
   document.getElementById("pid1").value = strSplit[0];
   
   document.getElementById("pname").value= strSplit[1];
   
   document.getElementById("pname1").value = strSplit[1];
   
   document.getElementById("ptype").value = strSplit[2];
   document.getElementById("ptype").disabled = true;
   document.getElementById("quantity").value =strSplit[3];
  
   document.getElementById("pack").value = strSplit[4];
   
   document.getElementById("allodate").value = strSplit[5];
  
   document.getElementById("expdate").value = strSplit[6];
   
   
   document.getElementById("pid1").value = strSplit[0];
   
   document.getElementById("bouton-contact").disabled = true;
   
   

 
  
   document.getElementById("pc").value=strSplit[9];
  
   document.getElementById("expiry").value=strSplit[10];
	
   document.getElementById("quantity").removeAttribute("max");
   
   document.getElementById("invid").value = strSplit[11];
   document.getElementById("csd").value = strSplit[12];
   document.getElementById('bouton-contact').style.visibility = "hidden";
   disable();

 
   $('#myModal').modal('show');

}
function display(){
	
	
	
	$('#myModal').modal('show');
}
function check1(id,name,type,quantity){
	document.getElementById("pid").value = id;
	document.getElementById("pname").value = name;
	document.getElementById("ptype").value = type;
	var input = document.getElementById("quantity");
	input.setAttribute("max",quantity); // set a new value;
	disable();
	
}

function validdate(id){
	
	var va	='Valid? '+ !!document.getElementById(id).value;

	if(va == 'Valid? false'){
		alert("invalid date")
		return false;
	}
	else{
		return true;
	}
	}

$(document).ready(function(){
	$('#quantity').on('change keyup', function() {
		 
		  var sanitized = $(this).val().replace(/[^0-9]/g, '-');
		  $(this).val(sanitized);
		});
		

	});
</script>
</head>
<sec:authentication property="principal.authorities" var="username" />

<body onload="checkhome('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Issue Stocks</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
           <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown">Inventory
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <li> <a href="/HMS/hospital.html">Hospital Inventory</a></li>
       <li> <a href="/HMS/addstocks.html">Add Stocks </a></li>
       <li><a href="/HMS/getStocks.html"> Issue Stocks</a></li>
       <li><a href="/HMS/retstocks.html"> Return Stocks</a></li>
     
        </ul>
      </li>
  <li><a href="/HMS/reorder.html" target="_blank">Check Reorder Level</a></li>
      
    </ul>
  </div>
</nav>
  <center>
</center>
  <form id="form" action="" method="">  
  
    
	  <h1>
	  <button type="button" class="btn btn-warning button1" onclick="display()">
	  <span class="glyphicon glyphicon-plus"></span>Issue</button>
<font size="5">Stocks Issued</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search by Name" onkeyup="myFunction()" style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 970px; " id="myTable">
    <thead>
      <tr>
        <th style="width:100px;">Product ID</th>
        <th style="width:320px;">Product Name</th>
        <th style="width:200px;">Product Type</th>
        
        <th style="width:100px;">Quantity Allocated</th>
        <th style="width:140px;">Allocated to</th>
        <th style="width:100px;">View More</th>
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list2}">
    <tr>
    <td style="width:100px;">${p1.pid}</td>
    <td style="width:320px;">${p1.pname}</td>
    <td style="width:200px;">${p1.ptype}</td>
   
    <td style="width:100px;">${p1.quantity}</td>
    <td style="width:140px;">${p1.pack}</td>
    <td style="width:100px;"><i class="fa fa-eye" style="color:#00b300" onclick="copy('${p1.pid},${p1.pname},${p1.ptype},${p1.quantity},${p1.pack},${p1.allodate},${p1.expdate},${p1.allocdate},${p1.allocqret},${p1.pc},${p1.expiry},${p1.invid},${p1.csd}')"></i></td>
   
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
     <button type="submit" class="bouton-contact" onclick="" ></button>
     </form>
     
     <div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
       <form id="form1" action="saveT.html" method="post">  
  
        <h1><button type="submit" id="bouton-contact"  class="btn btn-warning button1" onclick="validate()" >Save</button> Issue of Stocks
        <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>  
        </h1>
        
       <br>
   
       <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Product Id<span>*</span></p>
             <select class="selectpicker form-control" data-size="4" data-live-search="true"  name = "pid1" id ="pid" onchange="addcid()"   required>
          <option disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.ptype},${p.quantity},${p.pc},${p.expdate},${p.invid}">${p.pid}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  
   <div class="col-xs-4">
  <div class="form-group">
            <p>Product Name<span>*</span></p>
             <select class="selectpicker form-control" data-size="4" data-live-search="true" data-width="100%"   name = "pname1" id ="pname" onchange="addcname()"   required>
      <option disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.ptype},${p.quantity},${p.pc},${p.expdate},${p.invid}">${p.pname}</option>
        </c:forEach>
      </select>
   
</div>
  </div>
  <input type="hidden" name="pname" id="pname1">
  <input type="hidden" name="pid" id="pid1" >
   <div class="col-xs-3">
    
	   <div class="form-group">
            <p>Product Type<span>*</span></p>
  <input type="text" name="ptype" id="ptype" class="form-control input-sm" readonly="readonly" >	
  </div>
</div>
	</div>

 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Quantity Allocated<span>*</span></p>
          <input type="number" name="quantity" id="quantity" min="0" placeholder='0'  class="form-control input-sm"  onkeyup="caluclate()" required>
	</div>
  </div>
  
   <div class="col-xs-4">
  <div class="form-group">
            <p>Allocated To<span>*</span></p>
    <input type="text" name="pack" id="pack" class="form-control input-sm"  required>
</div>
  </div>
  
   <div class="col-xs-3">
    
	   <div class="form-group">
            <p>Allocation Date<span>*</span></p>
   <input type="date" max="2999-12-31" name="allodate" id="allodate"  onblur="return validdate(this.id)" class="form-control input-sm" required >
</div>
	</div>
 </div>
 
 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Expected Return Date<span>*</span></p>
          <input type="date" max="2999-12-31" name="expdate" id="expdate" onblur="return validdate(this.id)" class="form-control input-sm" required >	</div>
  </div>
  
   <div class="col-xs-4">
    <div class="form-group">
           <p>Product Category<span>*</span></p>
    <input type="text" readonly="readonly" name="pc" id="pc" class="form-control input-sm" required >	
 
</div>
	</div>
	
	     <div class="col-xs-3">
  <div class="form-group">
     <p>Expiry Date <span>*</span></p>
         	<input type="text" readonly="readonly" max="2999-12-31"name="expiry" id="expiry" class="form-control input-sm" required>
  
      	</div>
	
  </div>
	</div>
	
	<div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
       <div class="form-group">
       <p>Inventory Id</span>*</p>
          <input type="text"  name="invid" id="invid" class="form-control input-sm" required readonly="readonly">
        </div>
           	</div>
  
  <div class="col-xs-4">
    <div class="form-group">
       <div class="form-group">
       <p>Current Stocks</span>*</p>
          <input type="text"  name="" id="csd" class="form-control input-sm" required >
        </div>
</div>
	</div>
	<div class="col-xs-3">
    <div class="form-group">
          
</div>
	</div>
  </div>
  
 
   

 
 <button type="" class="bouton-contact" ></button>
       </form>
       </div>
       
       
  
       </div>
   </div>
 <script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>