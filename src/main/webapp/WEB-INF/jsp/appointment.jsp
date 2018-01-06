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

<link rel='stylesheet' href='<c:url value="/resources/css/appointment.css" />' type='text/css' media='all' />

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
$(document).ready(function(){
    $('.selectpicker').selectpicker({
        required: 'true',
        
    });
});
function checkhome(user){
	document.getElementById("bc").style.display = "none";
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

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/cappointment.html";
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
	
}

function copy(pid){

	var strSplit = pid.split(',');


   document.getElementById("pid").value = strSplit[0];
   
   $("#pid").append('<option value="'+strSplit[0]+'"selected="">'+strSplit[0]+'</option>');
   $("#pid").selectpicker("refresh");
   
   $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
   $("#pname").selectpicker("refresh");
  // alert($("#docid option[value='"+encodeURIComponent(strSplit[2])+"']").length)
  // if ($("#docid option[value='"+encodeURIComponent(strSplit[2])+"']").length == 0){
	
  // $("#docid").append('<option value="'+strSplit[2]+'"selected="">'+strSplit[3]+'</option>');
  // $("#docid").selectpicker("refresh");
   //}
   
   $('select[name=docid]').val(strSplit[2]);
   $('#docid').selectpicker('refresh');

   document.getElementById("pid1").value = strSplit[0];

   
   document.getElementById("pname1").value = strSplit[1];
   
   document.getElementById("ch").innerHTML = "View Appointment";
  
   document.getElementById("appointment").value = strSplit[4];
   
   document.getElementById("time").value = strSplit[5];
   
   document.getElementById("fileno").value = strSplit[6];
   document.getElementById("bouton-contact").disabled = false;
   document.getElementById("pid").disabled = true;
   document.getElementById("pname").disabled = true;
   document.getElementById("docid").disabled = false;
   document.getElementById("filenod").value = strSplit[6];
    document.getElementById("bc").style.display = "block";
   
	
 if(moment(document.getElementById("appointment").value).format("DD-MM-YYYY") ==  moment().format("DD-MM-YYYY")){
	
	if(document.getElementById("time").value >=  moment().format("HH:mm")){
	
	 document.getElementById("bouton-contact").disabled = false;
	document.getElementById("bc").disabled = false;
 }
	else{
		 document.getElementById("bouton-contact").disabled = true;
			document.getElementById("bc").disabled = true;
	}
 }
 else if(moment(document.getElementById("appointment").value).format("DD-MM-YYYY") <  moment().format("DD-MM-YYYY")){
	 document.getElementById("bouton-contact").disabled = true;
	 document.getElementById("bc").disabled = true;
 }
 else{
	 
 }

 if(strSplit[7] == "off"){
	 document.getElementById("bouton-contact").disabled = true;
	 document.getElementById("bc").disabled = true;
 }
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
		     if(currentTime.getHours() > parseInt(userTime[0]) || (currentTime.getMinutes()>parseInt(userTime[1]))){
		   	 alert("Appointments can be scheduled only for future time")
		   	 $( "#time" ).val(time);
		         $(this).focus();                
		     }
		     
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

</script>

</head>

<sec:authentication property="principal.authorities" var="username" />

<body onload = "checkhome('<c:out value="${username}" />'),validDate()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Appointment Details</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
    <br>
    <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="window.location.href='/HMS/frontdesk';"></i>
    
  </div>
</nav>
  <center>
</center>
  <form id="form2" action="" method="">  
  
    
	  <h1>
	  <button type="button" class="btn btn-warning button1" data-toggle="modal" data-target="#myModal">
	  <span class="glyphicon glyphicon-plus"></span>New Appointment</button>
<font size="5"> Appointment History</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Patient Name or Id"  style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 960px; " id="myTable">
    <thead>
      <tr>
        <th width="240px;">Patient ID</th>
        <th  width="240px;">Patient Name</th>
        <th width="240px;">Doctor Name</th>
        <th  width="220px;">Appointment Date & Time</th>
        <th  width="20px;"></th>
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list3}">
    <tr>
    <td width="240px;"><a href="#"  onclick="copy('${p1.pid},${p1.pname},${p1.docid},${p1.dname},${p1.appointment},${p1.time},${p1.fileno},${p1.active}')">${p1.pid}</a></td>
    <td width="240px;">${p1.pname}</td>
    <td width="240px;">${p1.dname}</td>
    <td width="220px;">${p1.combine}</td>
    
 </tr>
    </c:forEach>
    </tbody>
    </table>
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
      <form id="formdel" action="cancelapp.html" method="post"> </form>
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
        <option value="${p.pid}" data-value="${p.pid},${p.combine}">${p.pid}</option>
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
        <option value="${p.combine}" data-value="${p.pid},${p.combine}">${p.combine}</option>
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
    <select class="selectpicker form-control" form="form1" data-size="5" data-width="100%" data-live-search="true" name="docid" id="docid"  >
           <option value="" disabled selected>Select Doctor</option>
            <c:forEach var="d"  items="${model.list1}">
        <option data-subtext="${d.docID }" value="${d.docID }">${d.combine}</option>
        </c:forEach>
            </select></div>
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
    
           
 </div>
 
 <div class="col-xs-2"></div>
  <div class="col-xs-4">
       <p><span></span></p>

    <button type="submit" id="bc" form="formdel" onclick=" return myconfirm()" class="btn btn-warning button1" >Cancel Appointment</button> 
           
 </div>
 </div>
 <br><br><br>

  
  
 

 
 <button type="" id="" class="bouton-contact" disabled ></button>
       </form>
       </div>
       
       
  
       </div>
   </div>
 <c:forEach var="p"  items="${model.list}">
<script>
checkid('<c:out value="${p.fileno}" />');
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