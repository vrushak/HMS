<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    	 document.getElementById("allocdate").disabled = true;
    	 document.getElementById("allocqret").disabled = true;
     }
     else{
    	 
    	 document.getElementById("expdate").disabled = false;
    	 document.getElementById("allocdate").disabled = false;
    	 document.getElementById("allocqret").disabled = false;
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
	document.getElementById("allocqret").setAttribute("max",str[3]); 
	document.getElementById("pc").value=str[4];
	document.getElementById("expiry").value=str[5];
	document.getElementById("invid").value=str[6];
	disable();
	}
	
function clos(){
	window.location.reload();
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
	disable();
}
var quantity;
function copy(pid,quant){
quantity = quant;
	var strSplit = pid.split(',');


   document.getElementById("pid").value = strSplit[0];
   
   $("#pid").append('<option value="'+strSplit[0]+'"selected="">'+strSplit[0]+'</option>');
   $("#pid").selectpicker("refresh");
   
   $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
   $("#pname").selectpicker("refresh");
   
   document.getElementById("pid1").value = strSplit[0];
   
   document.getElementById("pname").value= strSplit[1];
   
   document.getElementById("pname1").value = strSplit[1];
   
   document.getElementById("ptype").value = strSplit[2];
  
   document.getElementById("quantity").value =strSplit[3];
 
   document.getElementById("pack").value = strSplit[4];
   
   document.getElementById("allodate").value = strSplit[5];
  
   document.getElementById("expdate").value = strSplit[6];
   
   document.getElementById("allocdate").value = strSplit[7];
   
  
   document.getElementById("allocqret").value = strSplit[8];
   document.getElementById("allocqret").setAttribute("max",strSplit[3]);

   
   document.getElementById("invid").style.display='visible';
	
//   document.getElementById("invid1").style.display='visible';
 //  alert();
   document.getElementById("quantity").removeAttribute("max");
   
   document.getElementById("pc").value=strSplit[9];
  
   document.getElementById("expiry").value=strSplit[10];
  
   
   document.getElementById("invid").value =strSplit[12];
	
   document.getElementById("tid").value =strSplit[13];
   
   disable();

 
   $('#myModal').modal('show');

}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/retstocks.html";
	}
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
function caluclate(){
	var res = document.getElementById("allocqret").value;
	
	
	var sum = Number(quantity) - Number(res);
	document.getElementById("quantity").value = sum;
	
}

function validate(){
	var ret = document.getElementById('allocqret').value
	if(ret <= 0){
		alert("No Stocks to return")
	return false;
	}
	else{
		return true;
	}
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
	$('#allocqret').on('change keyup', function() {
		 
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
      <a class="navbar-brand" >Return stocks</a>
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
	  
<font size="5">Return Stocks</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search by Name" onkeyup="myFunction()" style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 970px; " id="myTable">
    <thead>
      <tr>
        <th style="width:100px;">Product ID</th>
        <th style="width:330px;">Product Name</th>
        
        <th style="width:100px;">Returnable Stocks</th>
        <th style="width:100px;">Allocated to</th>
        <th style="width:140px;">Allocation date</th>
        <th style="width:100px;">Expected return date</th>
        <th style="width:100px;">Return </th>
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list2}">
    <tr>
    <td style="width:100px;">${p1.pid}</td>
    <td style="width:330px;">${p1.pname}</td>
 
     <td style="width:100px;">${p1.allocqret}</td>
    <td style="width:100px;">${p1.pack}</td>
     <td style="width:140px;"><fmt:parseDate value="${p1.allodate}" pattern="yyyy-MM-dd" var="myDate"/><fmt:formatDate value="${myDate}" type='date' pattern="dd-MM-yyyy"/></td>
     <td style="width:100px;"><fmt:parseDate value="${p1.expdate}" pattern="yyyy-MM-dd" var="myDate"/><fmt:formatDate value="${myDate}" type='date' pattern="dd-MM-yyyy"/></td>
    <td style="width:100px;"><i class="fa fa-pencil" style="color:#00b300" onclick="copy('${p1.pid},${p1.pname},${p1.ptype},${p1.quantity},${p1.pack},${p1.allodate},${p1.expdate},${p1.allocdate},${p1.allocqret},${p1.pc},${p1.expiry},${p1.requant},${p1.invid},${p1.tid}','${p1.quantity}')"></i></td>
   
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
       <form id="form1" action="retS.html" method="post">  
  
        <h1> Stocks Returns
          <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>    
      
        </h1>
        
       <br>
   
       <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Product Id<span>*</span></p>
             <select class="selectpicker form-control"  disabled  data-size="2" data-live-search="true"  name = "pid1" id ="pid" onchange="addcid()"   required>
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
             <select class="selectpicker form-control"  disabled data-size="2" data-live-search="true" data-width="100%"   name = "pname1" id ="pname" onchange="addcname()"   required>
      <option disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.ptype},${p.quantity},${p.pc},${p.expdate},${p.invid}">${p.pname}</option>
        </c:forEach>
      </select>
   
</div>
  </div>
  <input type="hidden" name="pname" id="pname1">
  <input type="hidden" name="pid" id="pid1" >
  <input type="hidden" name="tid" id="tid" >
   <div class="col-xs-3">
    
	   <div class="form-group">
            <p>Product Type<span>*</span></p>
  <input type="text"  name="ptype" id="ptype"  readonly="readonly"  class="form-control input-sm" >	
  </div>
</div>
	</div>

 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Current Stocks<span>*</span></p>
            <input type="number" name="quantity" readonly="readonly" id="quantity" min="0" class="form-control input-sm" value="0" onkeyup="caluclate()" required>
	
	</div>
  </div>
  
   <div class="col-xs-4">
  <div class="form-group">
            <p>Allocated to<span>*</span></p>
    <input type="text" name="pack" id="pack" class="form-control input-sm"  readonly="readonly"  required>
</div>
  </div>
  
   <div class="col-xs-3">
    
	   <div class="form-group">
            <p>Allocation Date<span>*</span></p>
   <input type="date" max="2999-12-31" name="allodate" id="allodate" class="form-control input-sm"  readonly="readonly"  required >
</div>
	</div>
 </div>
 
 
 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Expected Return Date<span>*</span></p>
          <input type="date" max="2999-12-31" name="expdate" id="expdate" class="form-control  readonly="readonly" input-sm" required >	</div>
  </div>
  
   <div class="col-xs-4">
    <div class="form-group">
            <p>Actual Date of Return<span>*</span></p>
    <input type="date" max="2999-12-31" name="allocdate" id="allocdate" onblur="return validdate(this.id)" class="form-control input-sm" >
</div>
	</div>
	
	     <div class="col-xs-3">
  <div class="form-group">
            <p>Quantity Returned<span></span></p>
          <input type="number" name="allocqret" id="allocqret" min="0" class="form-control input-sm" value="0" onkeyup="caluclate()" required>
	</div>
	
  </div>
	</div>
	
	<div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
       <div class="form-group">
           <p>Product Category<span>*</span></p>
    <input type="text"  name="pc" id="pc" class="form-control input-sm"  readonly="readonly"  required >	
    </div>
           	</div>
  
  <div class="col-xs-4">
    <div class="form-group">
         <p>Expiry Date <span>*</span></p>
         	<input type="date" max="2999-12-31"name="expiry" id="expiry"  readonly="readonly" class="form-control input-sm" required>
  
</div>
	</div>
	<div class="col-xs-3">
    <div class="form-group">
           <p>Inventory Id<span>*</span></p>
          <input type="text"  name="invid" id="invid" class="form-control input-sm" >
</div>
	</div>
  </div>
  
 
   

 
 <button type="submit" class="bouton-contact" id="bouton-contact" onclick="validate()" >Save</button>
       </form>
       </div>
       
       
  
       </div>
   </div>
  <script>
       var x = document.getElementById("allocqret");
       x.addEventListener("change", caluclate);
       x.addEventListener("keyup", caluclate);
       
              
       </script>
       <script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>