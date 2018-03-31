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

<link rel='stylesheet' href='<c:url value="/resources/css/admitpat.css" />' type='text/css' media='all' />
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-editable-select.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-editable-select.min.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-editable-select.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-editable-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>





<script type="text/javascript">

function checkid(str){
	
	 
	if (str == "" || str == null){
    	
		
		
		id = 1;
		var str1 = "AD-";
	  
		var str3 = id;
		var res = str1.concat(str3);
	

		document.getElementById("admitno").value = res;
    	//alert(res1);
	}
	else {
		
	
		
		var id = str;
		
		var ida = Number(id) + 1;
	
		var str1 = "AD-";
		  
		
		var res = str1.concat(ida);
		
		document.getElementById("admitno").value = res;
	//	alert(res1);
	}
}
function checkhome(user){

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


	else if(user.includes("A-")){
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_Accounts Admin]")){
		 $("#back").hide();
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
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
	
function check(){
	//document.getElementById("admdate").value  = new Date();
}



function addcname(getval){
	
	
	var myname = getval.getAttribute('data-value'); 	
	
//	var cid = document.getElementById("pname").value; 
	var str = myname.split(',');
	
	// var res5 = $('select[name=pname1]').attr("data-value");
	
 	   $('select[name=pid1]').val(str[0]);
	   $('#pid').selectpicker('refresh');
	   
	//document.getElementById("pid").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	//document.getElementById("cause").value = str[2];
	document.getElementById("fileno").value = str[2];
	
}


function copy(pid){

	document.getElementById("ch").innerHTML = "Admission";
	
	var strSplit = pid.split('=');


  // document.getElementById("pid").value = strSplit[0];
   
   $("#pid").append('<option value="'+strSplit[0]+'"selected="">'+strSplit[0]+'</option>');
   $("#pid").selectpicker("refresh");
   
   $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
   $("#pname").selectpicker("refresh");
   
 //  alert($("#pname option[value='"+encodeURIComponent(strSplit[1])+"']").length)
 
    
	   
	   $('select[name=dname1]').val(strSplit[2]);
	   $('#dname1').selectpicker('refresh');
	   
	   
   document.getElementById("pid1").value = strSplit[0];
   
 //  document.getElementById("pname").value= strSplit[1];
   
   document.getElementById("pname1").value = strSplit[1];
   
   document.getElementById("wardno").value = strSplit[3];
   
   document.getElementById("bedno").value = strSplit[4];
  
   document.getElementById("admitno").value = strSplit[5];
   
   document.getElementById("cause").value = strSplit[6];
   
   document.getElementById("docid").value = strSplit[7];
   document.getElementById("dname").value = strSplit[2];
   
   document.getElementById("admdate").value = strSplit[8];
   
   document.getElementById("fileno").value = strSplit[9];
   
   document.getElementById("bc").disabled = false;
   document.getElementById("pid").disabled = true;
   document.getElementById("pname").disabled = true;
   document.getElementById("dname1").disabled = false;
   
 
   $('#myModal').modal('show');

}

function clos(){
	window.location.reload();
}

function setdocid(getval){
	var myname = getval.getAttribute('data-value'); 
//	var dname = document.getElementById("dname1").value;
	var dn = myname.split(',');
	document.getElementById("dname").value = dn[0];
	document.getElementById("docid").value = dn[1];
}

function validmess(){
	var a = document.getElementById("pname").value;
	var b = document.getElementById("pid").value;
	var c = document.getElementById("dname1").value;

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

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/admitpat.html";
	}
}
</script>
<script type="text/javascript">
$(document).ready(function () {

	
	$('#datetimepicker').datetimepicker(
	  
	);
	$('#editable-select').editableSelect();

});


</script>

</head>
<sec:authentication property="principal.authorities" var="username" />

<body onload="check(),checkhome('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Admission</a>
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
      <br>
    
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
	  <span class="glyphicon glyphicon-plus"></span>New Admission</button>
<font size="5">In Patients</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Name" style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 1150px; " id="myTable">
    <thead class="thead">
      <tr>
        <th width="200px;">Patient Name</th>
        <th width="200px;">Doctor Name</th>
        <th width="200px;">WardNo</th>
        <th width="200px;">BedNo</th>
        <th width="200px;">Reason For Admission</th>
        <th width="180px;">Print Admit Card</th>
        <th width="20px;"></th>
        
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list3}">
    <tr>
    <td width="200px;"><a href="#" onclick="copy('${p1.pid}=${p1.pname}=${p1.dname}=${p1.wardno}=${p1.bedno}=${p1.discharge}=${p1.cause}=${p1.docid }=${p1.admdate}=${p1.fileno}')" >${p1.pname}</a></td>
    <td width="200px;">${p1.dname}</td>
    <td width="200px;">${p1.wardno}</td>
    <td width="200px;">${p1.bedno}</td>
    <td width="200px;">${p1.cause}</td>
    <td width="180px;"><a href="/HMS/adpdf?location=${p1.fileno}" target="_blank">Print</a></td>
    
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
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
       <form id="form1" action="saveAdm.html" method="post">  
  
        <h1> <button type="submit" id="bc" onclick=" return validmess()" class="btn btn-warning button1">Save</button>
 <span id="ch">New Admission</span>
         <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>    
         </h1>
        
       <br>
 <!--  <select id="editable-select">
	<option>Alfa Romeo</option>
	<option>Audi</option>
	<option>BMW</option>
	<option>Citroen</option>
</select>
   
    -->    <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control pn" data-size="5" data-live-search="true"name = "pname1" id ="pname" onchange="addcname(this.options[this.selectedIndex])" required>
       <option value="" selected disabled>Please select</option>
        <c:forEach var="p"  items="${model.list2}">
        <option value="${p.pname}" data-subtext="${p.fileno}" data-value="${p.pid},${p.pname},${p.fileno}">${p.pname}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  
   <div class="col-xs-4">
  <div class="form-group">
            <p>Patient Id<span>*</span></p>
             <select class="selectpicker form-control pi" data-size="5" data-width="100%"  data-live-search="true"  name = "pid1" id ="pid"  required>
     <option value="" selected disabled>Please select</option>
        <c:forEach var="p"  items="${model.list2}">
        <option value="${p.pid}" data-value="${p.pid},${p.pname},${p.fileno}">${p.pid}</option>
        </c:forEach>
      </select>
   
</div>
  </div>
  <input type="hidden" name="pname" id="pname1">
  <input type="hidden" name="pid" id="pid1" >
  
     <div class="col-xs-3">
  <div class="form-group">
            <p>Doctor Reference<span>*</span></p>
             <select class="selectpicker form-control"  data-size="5" data-width="100%" data-live-search="true"  name = "dname1" id ="dname1" onchange="setdocid(this.options[this.selectedIndex])" required>
    <option value="" selected disabled>Please select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.combine}" data-value="${p.combine},${p.docID}">${p.combine}</option>
        </c:forEach>
      </select>
   
</div>
  </div>
  <input type ="hidden" name="dname" id="dname">
   <input type ="hidden" name="docid" id="docid">
 </div>
 
    <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
       
  <div class="form-group">
  <p>Admission Date<span>*</span></p>
   <div class='input-group date' id='datetimepicker1'>
   
   <input type='text' name="admdate" id="admdate" class="form-control input-sm" required />
   <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
   </div>
    </div>
  </div>
  
   <div class="col-xs-4">
  <div class="form-group">
            <p>Ward No<span>*</span></p>
         <input type="text" name="wardno" id="wardno" class="form-control input-sm"  required>
   
</div>
  </div>
  
     <div class="col-xs-3">
  <div class="form-group">
            <p>Bed No<span>*</span></p>
          <input type="text" name="bedno" id="bedno" class="form-control input-sm"  required>
   
</div>
  </div>
   
 </div>
   
  <div class="form-group row" >
        <div class="col-xs-1"></div>
  
   <div class="col-xs-3">
  <div class="form-group">
            <p>Admission Id<span></span></p>
         <input type="text" name="admitno" id="admitno" readonly="readonly" class="form-control input-sm" required>
</div>
  </div>
  
     <div class="col-xs-4">
  <div class="form-group">
            <p>Reason For Admission<span>*</span></p>
<input type="text" name="cause" id="cause" class="form-control input-sm" required>
   
</div>
  </div>
  
  <div class="col-xs-3">
         <p>Patient File No<span>*</span></p>
<input type="text" name="fileno" id="fileno" class="form-control input-sm" readonly required>
   
  </div>
   
 </div>
 
 
 
<script type="text/javascript">
   
$(function () {
	
$('#datetimepicker1').datetimepicker({
	 
	defaultDate: new Date(),
	useCurrent: false,
	format: "dd-mm-yyyy  hh:ii",
    autoclose: true,
    todayBtn: true
   
	
});

});
   
</script>  

  
  
 

 
 <button type="" id="" class="bouton-contact" disabled ></button>
       </form>
       </div>
       
       
  
       </div>
   </div>
 <c:forEach var="p"  items="${model.list}">
<script>

checkid('<c:out value="${p.admitno}" />');
</script>
</c:forEach>
</body>
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