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

<link rel='stylesheet' href='<c:url value="/resources/css/treatment.css" />' type='text/css' media='all' />
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


    $("#datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
</script>      
<style type="text/css">
.btn-block{
margin-left : 10px;
 width : 1070px;
}

</style>
<script type="text/javascript">
var userrf;
var userf;
function checkhome1(user){
	userrf = user;
	//alert(user);
	if(user.includes("[ROLE_DOCTOR]")){
		
		 var url = "/HMS/doctor1" ;
			
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 var url2 = "/HMS/myapps" ;
			
		 var element = document.getElementById('m2');
		 element.setAttribute("href",url2)
		 
		 var url3 = "/HMS/diagnose" ;
			
		 var element = document.getElementById('m3');
		 element.setAttribute("href",url3)
		 
		  var url4 = "/HMS/treatment" ;
		
		 var element = document.getElementById('refresh');
		 element.setAttribute("location.href",url4)
		 
		 var url5 = "/HMS/vtreatment" ;
			
		 var element = document.getElementById('formb');
		 element.setAttribute("action",url5)
		 
		 
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 var url2 = "/HMS/myapps" ;
			
		 var element = document.getElementById('m2');
		 element.setAttribute("href",url2)
		 
		 var url3 = "/HMS/diagnose" ;
			
		 var element = document.getElementById('m3');
		 element.setAttribute("href",url3)
		 
		  var url4 = "/HMS/treatment" ;
			
		 var element = document.getElementById('refresh');
		 element.setAttribute("location.href",url4)
		 
		  var url5 = "/HMS/vtreatment" ;
			
		 var element = document.getElementById('formb');
		 element.setAttribute("action",url5)
		 
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
function deleteRow(r,userd) {
	
 /*
   if(userf != userd){
	   alert("You are about to delete the Record entered by Dr "+userf)
	   
   }
 */  
 var i = r.parentNode.parentNode.rowIndex;
   //alert(r.parentNode.parentNode.cells[1].textContents)
	document.getElementById("myTable").deleteRow(i);
    
}
function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1].getElementsByTagName('textarea')[0];
	    if (td) {
	    	 if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
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
      
        if ((charCode == 44))
            return false;
        else
            return true;
    }
    catch (err) {
        alert(err.Description);
    }
}
	var idp,namep,admdatep,datetimep,dailychartp,dnamed,commentsd;
	function check(name,id,admdate,datetime,dailychart,dname,comments,fileno,admitno){
		
		var idp = id.split(',');
        
		var namep = name.split(',');
        var admdatep = admdate.split(',');
        var datetimep = datetime.split(',');
        var dailychartp = dailychart.split(',');
        var dnamed = dname.split(',');
        var commentsd = comments.split(',');
        
        
   	 document.getElementById("flno").innerHTML = fileno;
	 document.getElementById("id").innerHTML = admitno;
	 document.getElementById("fileno").value= fileno;
     document.getElementById("admitno").value= admitno;
  
        
        $("select[name=pname]").val(namep);
 	   $("#pname").selectpicker("refresh");
 	 
 	   document.getElementById("pid").value = id; 
 	   document.getElementById("admdate").value = admdatep; 
       
 	 
    	
    	  for(var x=0; x<datetimep.length; x++) {
    		  
    		  var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
    	    	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
    		  
    	    
    		 
    		  var newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td ><input  form ='forma' class= 'form-control input-sm'  readonly='readonly' type='text' onkeypress='return onlyAlphabets(event,this);' id = 'datetime' name= 'datetime' value='"+datetimep[x]+"' required> </td></tr>";
    		  newCell.style.width ='160px';
    		  
    		 
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' readonly='readonly'  type='text' onkeypress='return onlyAlphabets(event,this);' id = 'dname' name= 'dname' value='"+dnamed[x]+"' required  ></td></tr>";
    		  newCell.style.width ='200px';
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><textarea form ='forma' class= 'form-control input-sm'  rows='1'  id = 'comments'  name= 'comments' onkeypress='' value='"+comments+"'  required>"+comments+"</textarea></td></tr>";
    		  newCell.style.width ='300px';
    		  /*
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='font-size:20px'  onclick= deleteRow(this,'"+encodeURIComponent(dnamed[x])+"')></i></td></tr>";
    		  newCell.style.width ='50px';
              */
    	  }
	}


function addname(getval){
	var cid = getval.getAttribute('data-value');

	var str = cid.split(',');
	var pid;
	 document.getElementById("pid").value=str[0];
	 document.getElementById("admdate").value=str[2];
	 document.getElementById("pidH").value = str[0];
	 document.getElementById("flno").innerHTML = str[4];
	 document.getElementById("id").innerHTML = str[3];
	 document.getElementById("fileno").value= str[4];
     document.getElementById("admitno").value= str[3];
     document.getElementById("admitnoH").value= str[3];		 
	 document.getElementById("bouton-contact").disabled = false;
	 var url = "/HMS/nursetr/" + str[0];
	
	 var element = document.getElementById('nob');
	 element.setAttribute("href",url)
}


function display(userdoc){ 
	

	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	
	//    var m = moment().format('YYYY-MM-DD h:mm a');

	  var newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td ><input  form ='forma'readonly='readonly' class= 'form-control input-sm' onkeypress='return onlyAlphabets(event,this);'  value='"+moment().format('DD/MM/YYYY HH:mm:ss')+"'  type='text' id = 'datetime' name= 'datetime'  required> </td></tr>";
	  newCell.style.width ='160px';
	  
	 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm'  type='text' readonly='readonly' onkeypress='return onlyAlphabets(event,this);'  value='"+userdoc+"' id = 'dname' name= 'dname'  required  ></td></tr>";
	  newCell.style.width ='200px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><textarea form ='forma' class= 'form-control input-sm' rows='1'  id = 'comments' onkeypress='' name= 'comments'  required></textarea></td></tr>";
	  newCell.style.width ='300px'; 
	/*
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='font-size:20px'  onclick = deleteRow(this,'"+encodeURIComponent(userdoc)+"')></i></td></tr>";
	  newCell.style.width ='50px';
*/
	
}
function setline(id){
    var a = document.getElementById('fileno').value;
    
    if(document.getElementById("pname").value == "select"){
		 alert("Please Select a Patient")
		return false;
	}
    
	 var url = "/HMS/linechart2/"+a+"";
	document.getElementById(id).setAttribute('href',url);
	return true;
}


	  function verif(id){
		 
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
		
		
		 if(document.getElementById("pname").value == "select" && id=="bc"){
			 alert("Please Select a Patient Name")
			return false;
		}
		 else if(tableRef.rows.length == 1 && id=="bc"){
			 alert("Empty Table cannot be saved")
			 return false;
		 }
		 else{
			 return true;
		 }
	  }
	    
	function closef(){
	//	alert("/HMS/treatment/"+userrf+"");
		window.location="/HMS/treatment";
	}

	function datasuccess(data){
		
		if(data != "null"){
			
			alert(data)
	window.location = "/HMS/treatment.html";
		}
	}

</script>
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="userf = '<c:out value="${pageContext.request.userPrincipal.name}" />',checkhome1('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Treatment Details</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
      <li class=""><a id="m2" href="">My Appointments</a></li>
        <li class=""><a  id="m3" href="">Clinical Diagnosis</a></li>
          <li class=""><a id="m4" href="/HMS/discharge">Discharge Summary</a></li>
 <!-- 
       <li class=""><a id="nob" href="/HMS/nursetr/"  onclick=' return visible();' target="_blank">Nurse observations</a></li>
    --> 
    </ul>
    <br>
         <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e' id="back"  onclick="window.location.href='/HMS/doctor1';"></i>
  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1><button type="button" id="refresh" class="btn btn-warning button1" onclick="closef()">
	  <span class="fa fa-refresh"></span> Refresh</button>
	
	
<font size="5">In Patient Treatment Records</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search by Doctor Name" onkeyup="myFunction()" style="width:150px"/></span>
	</h1>

<form id="forma" name="forma" action="/HMS/saveTre.html" method="post"></form>
<form id="formb" name="formb" action="" method="get"></form>
<form id="formn" name="formn" action="nursetr/" method="get"></form>

	    <br>
	    <button type="button" class="btn btn-block"style="background-color:#009999;color:#fff" ><span style="float:left">Doctor Observations</span><span id="flno" style="float:right">Fileno</span><span id="id" style="float:right;margin-right:15px;">Admission ID</span></button>
        <br>
	    <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
  <div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control" data-size="4" data-live-search="true" name = "pname" id ="pname" onchange="addname(addname(this.options[this.selectedIndex]))"   >
          <option value="select" data-value="select" selected disabled>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pname}" data-subtext="${p.fileno},${p.admdate}" data-value="${p.pid},${p.pname},${p.admdate},${p.admitno},${p.fileno}">${p.pname}</option>
        </c:forEach>
      </select>
       
	</div>
	<div class="form-group">
            <p>Patient Id<span>*</span></p>
             <input type="text" name="pid" id="pid" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         <input type="hidden" name="pid" id="pidH" readonly="readonly" form="formb" class="form-control input-sm"  required>
	          <input type="hidden" name="admitno" id="admitnoH" readonly="readonly" form="formb" class="form-control input-sm"  required>
	
	         <input type="hidden" name="fileno" id="fileno" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         <input type="hidden" name="admitno" id="admitno" readonly="readonly" form="forma" class="form-control input-sm"  required>
	</div>
	<div class="form-group">
            <p>Date of admission<span>*</span></p>
     <input type="text" name="admdate" id="admdate" readonly="readonly" form="forma" class="form-control input-sm"  required>
       
	</div>

	
	  <button type="button" class="btn btn-warning button1" onclick="display('<c:out value="${pageContext.request.userPrincipal.name}" />')">
	  <span class="glyphicon glyphicon-plus"></span>Add Row</button> 
	
	  <button type="submit" class="btn btn-warning button2" id="bouton-contact" form="formb" disabled>
	  <span class="glyphicon glyphicon-eye-open"></span> View Records</button>
	
      <br><br>
      <button type="submit" id="bc" class="btn btn-warning button1" form="forma" onclick ="return verif(this.id)"  >
	 <span class="fa fa-floppy-o"></span> Save</button>
     
     <a href="#"  id="st" class="btn btn-warning button2" target="_blank" onclick="unsaved = false;return setline(this.id)">
	 <span class="fa fa-thermometer-half"></span> Temperature Chart</a>
	  

  </div>
  <div class="col-xs-4">
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 700px; " id="myTable">
    <thead>
      <tr>
        <th style="width:170px;">Date-Time</th>
        
  
        <th style="width:200px;">Doctor Name</th>
        <th style="width:300px;">Observations</th>
        <th style="width:30px;"><th>
        
       
      </tr>
    </thead>
    <tbody class="tbody">

    <tr>
    
    
    </tr>
     
    </tbody>
    </table>
    </div>
    
    
	  
    </div>
    
    </div>
    <button type="" class="bouton-contact"   ></button>
   </div>
     

   </div>
    <c:forEach var="p"  items="${model.list1}">
    <script>
 checkhome('<c:out value="${p.idc}" />');
 </script>
    </c:forEach>
    
 <c:forEach var="p"  items="${model.list2}">
<script>

check('<c:out value="${p.pname}" />','<c:out value="${p.pid}" />','<c:out value="${p.admdate}" />','<c:out value="${p.datetime}" />','<c:out value="${p.dailychart}" />','<c:out value="${p.dname}" />','<c:out value="${p.comments}" />','<c:out value="${p.fileno}" />','<c:out value="${p.admitno}" />');
</script>
</c:forEach>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>