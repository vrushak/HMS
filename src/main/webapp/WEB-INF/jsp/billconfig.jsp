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

<link rel='stylesheet' href='<c:url value="/resources/css/billconfig.css" />' type='text/css' media='all' />
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

var cuser
function checkhome(user){
	cuser = user;
	if(user.includes("dbfdesk")){
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("bc").disabled = true;
		 document.getElementById("dis").disabled = true;
	}
	else if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		$("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("bc").disabled = true;
		 document.getElementById("dis").disabled = true;
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
		
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("bc").disabled = true;
		 document.getElementById("dis").disabled = true;
		 
	}
	
	else if(user.includes("[ROLE_Accounts Admin]")){
		
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 document.getElementById("bc").disabled = false;
		 document.getElementById("dis").disabled = false;
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("bc").disabled = false;
		 document.getElementById("dis").disabled = false;
	}
}
function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
    
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
function check(feetype,charges,aid){

	  
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	
	//    var m = moment().format('YYYY-MM-DD h:mm a');

	  var newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input type='hidden' value='"+aid+"' form ='form'  name='aid' id='aid'><input  form ='form' class= 'form-control input-sm'  type='text' id = 'feetype' name= 'feetype' value='"+feetype+"' required> </td></tr>";
	  newCell.style.width ='240px';
	
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form ='form' class= 'form-control input-sm'  type='text'  id = 'charges' name= 'charges'value='"+charges+"'  required  ></td></tr>";
	  newCell.style.width ='240px';
	  
	  checkhome(cuser)
	  //newCell = rowsAdd.insertCell();
	  //newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
	  
	

}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/billconfig.html";
	}
}

function display(){ 
	
	
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	

	var row = "tab"+ tableRef.rows.length;
	var markup = "<tr id='"+row+"'><td style='width:240px'><input type='hidden' form ='form' value='"+$.now()+"' name='aid' id='aid'><input form ='form' class= 'form-control input-sm'  type='text' id = 'feetype' name= 'feetype'  required> </td><td width ='240px';><input form ='form' class= 'form-control input-sm' type='text'  id = 'charges' name= 'charges' value='0.00' required  ></td></tr>"
    $('#myTable tbody').append(markup);
	//    var m = moment().format('YYYY-MM-DD h:mm a');

	
	  
	  var elmnt = document.getElementById(row);
	     elmnt.scrollIntoView();
	     $(row).focus(); 
	     
	  checkhome(cuser)
	  
	//  newCell = rowsAdd.insertCell();
	  //newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
	  
	
}
</script>
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload = "checkhome('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Billing Configuration</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
    <br>
    <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e' id="back"  onclick="window.location.href='/HMS/frontdesk';"></i>
    
  </div>
</nav>
  
  <div id="form1" >  
  <form action= "saveBill.html" method="post" id = "form" >
     <h1><button type="button" class="btn btn-warning button1" id="dis" onclick="display()">
	  <span class="fa fa-plus"></span> Add Row</button>
	
	
<font size="5">Billing Configurations</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search by Feetype" onkeyup="myFunction()" style="width:150px"/></span>
	</h1>
   <br>
   	   <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 500px; " id="myTable">
    <thead>
      <tr>
        <th style="width:240px;">Fee Type</th>
        <th style="width:240px;">Charges</th>
        <th style="width:20px;"></th>
        
       
      </tr>
    </thead>
    <tbody class="tbody">

    <tr>
    
    
    </tr>
     
    </tbody>
    </table>
    </div>
    
    
       
 <button type="submit" id="bc" class="bouton-contact" form="form"  >Save</button>
  </form>
   </div>
    

   </div>
 <c:forEach var="p"  items="${model.list1}">
<script>
check('<c:out value="${p.feetype}" />','<c:out value="${p.charges}" />','<c:out value="${p.aid}" />');
</script>
</c:forEach>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>