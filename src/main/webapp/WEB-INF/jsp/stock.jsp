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

<link rel='stylesheet' href='<c:url value="/resources/css/addstocks.css" />' type='text/css' media='all' />

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
function checkid(str){
	
	
	if (str == "" || str == null){
    	
		
		
		id = 1;
		var str1 = "In-";
	  
		var str3 = id;
		var res = str1.concat(str3);
	
       
		document.getElementById("invid").innerHTML = res;
		document.getElementById("invidh").value = res;
    	//alert(res1);
	}
	else {
		
	
		
		var id = str;
		
		var ida = Number(id) + 1;
	
		var str1 = "In-";
		  
		
		var res = str1.concat(ida);
		
		document.getElementById("invid").innerHTML = res;
		document.getElementById("invidh").value = res;
	//	alert(res1);
	}
}
function checkhome(user){
	var d = new Date()
	document.getElementById("expdate").setAttribute('min',d);
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

function copy(pid){

	var strSplit = pid.split(',');

   document.getElementById("pid").value = strSplit[0];
  
   document.getElementById("pid").setAttribute("readonly", "readonly");
   
   document.getElementById("pname").value=strSplit[1];

   document.getElementById("ptype").value = strSplit[2];
  
   document.getElementById("quantity").value =strSplit[3];
  
   document.getElementById("pack").value = strSplit[4];
   
   document.getElementById("up").value = strSplit[5];
   
   document.getElementById("total").value = strSplit[6];
  
  document.getElementById("reorder").value = strSplit[7];
  
  document.getElementById("expdate").value = strSplit[8];
  
  document.getElementById("pc").value = strSplit[9];
  
  document.getElementById("invid").innerHTML = strSplit[10];
  document.getElementById("invidh").value = strSplit[10];
  
  document.getElementById("csc").innerHTML = "Edit Stock";
  
   $('#myModal').modal('show');
}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/addstocks.html";
	}
}

function clos(){
	window.location.reload();
}

function caluclate(){
	
	var quant = document.getElementById("quantity").value;
	var up = document.getElementById("up").value;
	
	var res = Number (quant) * Number(up);
    document.getElementById("total").value = res;
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
$('#quantity,#up').on('change keyup', function() {
	 
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
      <a class="navbar-brand" >Stock Details</a>
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
	  <button type="button" class="btn btn-warning button1"  data-toggle="modal" data-target="#myModal">
	  <span class="glyphicon glyphicon-plus"></span ><span id="">Add Stocks</span></button>
<font size="5">Stocks Master </font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search by Name" onkeyup="myFunction()" style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 960px; " id="myTable">
    <thead>
      <tr>
        <th style="width:100px;">Product ID</th>
        <th style="width:240px;">Product Name</th>
        <th style="width:100px;">Product Type</th>
         <th style="width:120px;">Expiry Date</th>
        <th style="width:100px;">Quantity</th>
        <th style="width:100px;">Pack</th>
        <th style="width:100px;">UnitPrice</th>
        <th style="width:100px;">Total Value</th>
     
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list1}">
    <tr>
    <td style="width:100px;" ><a href="#" onclick="copy('${p1.pid},${p1.pname},${p1.ptype},${p1.quantity},${p1.pack},${p1.up},${p1.total},${p1.reorder},${p1.expdate},${p1.pc},${p1.invid}')">${p1.pid}</a></td>
    <td style="width:240px;">${p1.pname}</td>
    <td style="width:100px;">${p1.ptype}</td>
    <td style="width:120px;"> ${p1.expdate}</td>
     <td style="width:100px;">${p1.quantity}</td>
    <td style="width:100px;">${p1.pack}</td>
     <td style="width:100px;">${p1.up}</td>
     <td style="width:100px;">${p1.total}</td>
   
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    
   

   
   
	  <!--  
	
    <br>

  -->
<button type="submit" class="bouton-contact"></button>
	
</form>


<div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
       <form id="form1" action="saveS.html" method="post">  
  
        <h1><span id="invid" form="form1" name="invid" style="float:left">Inventory Id</span><span id="csc">Add Stocks</span>
           <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>
        </h1>
        
       <br>
   
       <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Product Id<span>*</span></p>
          <input type="text" name="pid" id="pid" class="form-control input-sm"  required>
          <input type="hidden" id="invidh" form="form1" name="invid">
	</div>
  </div>
  
   <div class="col-xs-4">
  <div class="form-group">
            <p>Product Name<span>*</span></p>
    <input type="text" name="pname" id="pname" class="form-control input-sm"  required>
</div>
  </div>
  
   <div class="col-xs-3">
    
	   <div class="form-group">
            <p>Product Type<span>*</span></p>
    <select class="form-control" name="ptype" id="ptype" required>
            <option disabled selected>Select Product Type</option>
            <option>Returnable</option>
            <option>Consumables</option>
            </select>
</div>
	</div>
 </div>
 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
          <p>Product Category<span>*</span></p>
    <select class="form-control" name="pc" id="pc" required>
            <option disabled selected>Select Product Category</option>
            <option>Medical Equipments</option>
            <option>Drugs</option>
            <option>Furnitures</option>
            </select>
         </div>
  </div>
  
   <div class="col-xs-4">
  <div class="form-group">
     <p>Expiry Date <span>*</span></p>
         	<input type="date"  max="2999-12-31"  name="expdate" id="expdate" class="form-control input-sm" onblur="return validdate(this.id)" required>
  
       </div>
  </div>
  
   <div class="col-xs-3">
    
	   <div class="form-group">
	        <p>Pack<span>*</span></p>
    <input type="text" name="pack" id="pack" class="form-control input-sm"  required>
	   
          </div>
	</div>
 </div>
 
 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
     <p>Quantity<span>*</span></p>
          <input type="number"  min="0" name="quantity" id="quantity" class="form-control input-sm" value="0"  required>
	
           	</div>
  </div>
  
   <div class="col-xs-4">
    <div class="form-group">
        <p>UnitPrice<span>*</span></p>
    <input type="number" name="up" id="up" min="0" value="0" class="form-control input-sm"   required>

</div>
	</div>
		<div class="col-xs-3">
   <p>Total Value<span>*</span></p>
          <input type="number" name="total" id="total" value="0.00"readonly="readonly" class="form-control input-sm"  required>
  
	
  </div>
	</div>
	
	<div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
     <p>Reorder Level<span>*</span></p>
          <input type="number"  min="0" name="reorder" id="reorder" class="form-control input-sm" value="0"  required>
	
           	</div>
  </div>
  </div>
  

  
   

 
 <button type="submit" class="bouton-contact" id="bouton-contact"  >Save</button>
       </form>
       </div>
       </div>
       </div>
       
       <script>
       var x = document.getElementById("quantity");
       x.addEventListener("change", caluclate);
       x.addEventListener("keyup", caluclate);
       var y = document.getElementById("up");
       y.addEventListener("change", caluclate);
       y.addEventListener("keyup", caluclate);
              
       </script>
       
       <c:forEach var="p"  items="${model.list}">
<script>

checkid('<c:out value="${p.invid}" />');
</script>
</c:forEach>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>