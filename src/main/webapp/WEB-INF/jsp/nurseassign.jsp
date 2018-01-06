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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<style type="text/css">

.wrapper {
  height : auto;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
}

table {
    border-collapse: collapse;
    width: 100%;
    }
th {
    background-color: #009999;
    color: white;
    width : 320px;
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



.button1{
	float : left;
}
.button2{
	float : right;
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


#saveNr h1 {
  font-size: 18px;
  background: #009999 none repeat scroll 0% 0%;
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#saveNr {
  border-radius: 5px;
  max-width:700px;
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

</style>
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
	else if(user.includes("[ROLE_CHIEFNURSE]")){
		
		 var url = "/HMS/nursedesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	
	else if(user.includes("[ROLE_NURSE]")){
		
		 var url = "/HMS/nursedesk" ;
			
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
	

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/nurseassign.html";
	}
}


function clos(){
	window.location.reload();
}

function copy(pid){

	var strSplit = pid.split(',');
	   
	   $("#pid1").append('<option value="'+strSplit[0]+'"selected="">'+strSplit[0]+'</option>');
	   $("#pid1").selectpicker("refresh");
	 
	   $("#pname1").append('<option value="'+strSplit[1]+'" selected="">'+strSplit[1]+'</option>');
	   $("#pname1").selectpicker("refresh");
	   
	  
           
	  
	   $("#nid1").append('<option value="'+strSplit[2]+'" selected="">'+strSplit[2]+'</option>');
	   $("#nid1").selectpicker("refresh");
	
	   $("#nname1").append('<option value="'+strSplit[2]+'"selected="">'+strSplit[3]+'</option>');
	   $("#nname1").selectpicker("refresh");

	 
	 
  
   document.getElementById("pid").value = strSplit[0];
   document.getElementById("pname").value = strSplit[1];
   document.getElementById("nid").value = strSplit[2];
   document.getElementById("nname").value = strSplit[3];
   document.getElementById("wardno").value = strSplit[4];
   document.getElementById("admitno").value = strSplit[5];
   document.getElementById("fileno").value = strSplit[6];
   
document.getElementById("pname1").disabled = true;
document.getElementById("pid1").disabled = true;
document.getElementById("wardno").disabled = true;
document.getElementById("nid1").disabled = true;
document.getElementById("nname1").disabled = true;
document.getElementById("bc").disabled = true;
document.getElementById("ch").innerHTML = "View Nurse";

   $('#myModal').modal('show');
   
   
  
}

function addcname(){

	var strc = "/"
	 var res5 = $('select[name=pname1]').val();
	  $('select[name=pid1]').val(res5);
	   $('#pid1').selectpicker('refresh');
	   var str = res5.split(',');
	   var strca = str[2].concat(strc);
	   document.getElementById("pid").value = str[0] ;
	   document.getElementById("pname").value = str[1];
	   
	   document.getElementById("fileno").value = str[4];
	   document.getElementById("admitno").value = str[5];
	document.getElementById("wardno").value = strca.concat(str[3]);
	
}
function addcid(){
	
	
	var strcq = "/";
	var res4 = $('select[name=pid1]').val();
	$('select[name=pname1]').val(res4);
	   $('#pname1').selectpicker('refresh');
	   var str1 = res4.split(',');
	   var strca2 = str1[2].concat(strcq);
	   document.getElementById("wardno").value = strca2.concat(str1[3]);
	   document.getElementById("pid").value = str1[0] ;
	   document.getElementById("pname").value = str1[1];
	   document.getElementById("fileno").value = str1[4];
	   document.getElementById("admitno").value = str1[5];
	
}
function addnname(){
	
	var strc = "";
	 var res5 = $('select[name=nname1]').val();
	
 	   $('select[name=nid1]').val(res5);
	   $('#nid1').selectpicker('refresh');
	   var str = res5.split(',');
	   document.getElementById("nid").value = str[0] ;
	   document.getElementById("nname").value = str[1];
}





function addnid(){
	
	
	var strc = "";
	 var res5 = $('select[name=nid1]').val();
 	   $('select[name=nname1]').val(res5);
	   $('#nname1').selectpicker('refresh');
	   var str = res5.split(',');
	   document.getElementById("nid").value = str[0] ;
	   document.getElementById("nname").value = str[1];
	   
	 
}

function validmess(){
	
	var nid = document.getElementById("nid1").value;
	var nname = document.getElementById("nname1").value;
	var pid = document.getElementById("pid1").value;
	var pname = document.getElementById("pname1").value;
	
	if(nid == "select"){
		alert("Please Select the Nurse Id ")
		return false;
	}
	else if(nname == "select"){
		alert("Please Select the Nurse Name ")
		return false;
	}
	else if(pname == "select"){
		alert("Please Select the Patient Name ")
		return false;
	}
	else if(pid == "select"){
		alert("Please Select the Patient Id")
		return false;
	}
	else{
		return true;
	}
}
</script>

</head>

<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Nurse Assignment</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
    <br>
         <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="window.location.href='/HMS/nursedesk';"></i>
  </div>
</nav>
  <center>
</center>
  <form id="form1" action="" method="">  
  
    
	  <h1>
	  <button type="button" class="btn btn-warning button1" data-toggle="modal" data-target="#myModal">
	  <span class="glyphicon glyphicon-plus"></span>Assign Nurse</button>
<font size="5">Nurse Assignment List</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Name or Id" onkeyup="myFunction()" style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 960px; " id="myTable">
    <thead>
      <tr>
        <th class="">Patient ID</th>
        <th class="">Patient Name</th>
        <th class="">Nurse Name</th>
        
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list3}">
    <tr>
    <td width="320px;"><a href="#" onclick="copy('${p1.pid},${p1.pname},${p1.nid},${p1.nname},${p1.wardno},${p1.admitno},${p1.fileno}')">${p1.pid}</a></td>
    <td width="320px;">${p1.pname}</td>
    <td width="320px;">${p1.nname}</td>
  
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
     <button type="" class="bouton-contact" onclick="" ></button>
     </form>
     
<div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
       <form id="saveNr" action="saveNr.html" method="post">  
  
        <h1>  <button class="btn btn-warning button1" id="bc" onclick="return validmess()" type="submit" form="saveNr" >Save</button> 
       <span id ="ch">Assign Nurse</span> 
        <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button> 
        </h1>
        
       <br>
   
       <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
  <div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control" data-size="5" data-live-search="true" name = "pname1" id ="pname1" onchange="addcname()"   required>
          <option value="select" selected disabled>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.wardno},${p.bedno},${p.fileno},${p.discharge}">${p.pname}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  <div class="col-xs-1"></div>
      <div class="col-xs-4">
  <div class="form-group">
            <p>Nurse Name<span>*</span></p>
           <select class="selectpicker form-control" data-size="5" data-width="100%" data-live-search="true"  name = "nname1" id ="nname1" onchange="addnname()"   required>
      <option value="select" selected disabled>Select</option>
        <c:forEach var="n"  items="${model.list2}">
        <option value="${n.nid},${n.combine}">${n.combine}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  </div>
  
     <div class="form-group row" >
      <div class="col-xs-1"></div>
   <div class="col-xs-4">
  <div class="form-group">
            <p>Patient Id<span>*</span></p>
         <select class="selectpicker form-control" data-size="5" data-live-search="true" name = "pid1" id ="pid1" onchange="addcid()"   required>
          <option value="select" selected disabled>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.wardno},${p.bedno},${p.fileno},${p.discharge}">${p.pid}</option>
        </c:forEach>
      </select>
   
</div>
  </div>
  <div class="col-xs-1"></div>
      <div class="col-xs-4">
  <div class="form-group">
            <p>Nurse Id<span>*</span></p>
             <select class="selectpicker form-control" data-size="5" data-live-search="true" name = "nid1" id ="nid1" onchange="addnid()"   required>
          <option value="select" selected disabled>Select</option>
        <c:forEach var="n"  items="${model.list2}">
        <option value="${n.nid},${n.combine}">${n.nid}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  
  
 </div>
 
  <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
  <div class="form-group">
            <p>Wardno/BedNo<span>*</span></p>
           <input type="text" class="form-control input-sm" readonly="readonly" form="saveNr" name="wardno" id="wardno">
       
	</div>
  </div>
 <div class="col-xs-1"></div> 
   <div class="col-xs-4">
  <div class="form-group">
            <p>Admitno<span>*</span></p>
           <input type="text" class="form-control input-sm" form="saveNr" readonly="readonly" name="admitno" id="admitno">
       
	</div>
  </div>
  </div>
  <input type="hidden" name="pname" id="pname" form="saveNr">
  <input type ="hidden" name="pid" id="pid" form="saveNr" >
  <input type="hidden" name="nname" id="nname" form="saveNr">
  <input type ="hidden" name="nid" id="nid" form="saveNr">
   <input type ="hidden" name="fileno" id="fileno" form="saveNr">
  
  <button type="" class="bouton-contact" onclick="" ></button>
 </form>
 </div>
 </div>
 
 
 

   </div>
 <script>

function filterTable(event) {

	var filter = event.target.value.toUpperCase();
    var rows = document.querySelector("#myTable tbody").rows;
    
    for (var i = 0; i < rows.length; i++) {
        var firstCol = rows[i].cells[0].textContent.toUpperCase();
        var secondCol = rows[i].cells[1].textContent.toUpperCase();
       // var thirdCol = rows[i].cells[2].textContent.toUpperCase();
        if (firstCol.indexOf(filter) > -1 || secondCol.indexOf(filter) > -1) {
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