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

<link rel='stylesheet' href='<c:url value="/resources/css/prescription.css" />' type='text/css' media='all' />
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.min.js"></script>







<script type="text/javascript">
var adminusr;
var admnme;
function checkhome(user){
	
		if(user.includes("[ROLE_DOCTOR]")){
			var url = "/HMS/doctor1" ;
			 
		 var element = document.getElementById('ho');
			 element.setAttribute("href",url); 
			 
			 $("#back").hide();
		}
		else if(user.includes("[ROLE_NURSE]")){
			 var url = "/HMS/nursedesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 user1a = user;
		 $("#back").hide();
	}
	else if(user.includes("[ROLE_CHIEFNURSE]")){
		
		 var url = "/HMS/nursedesk" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 $("#back").hide();
	}
		
	else{
		
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		
	}
}

</script>

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />')" >

<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Patients History </a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href ="">Home</a></li>
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
    <br>
      <!-- 
    <ul class="nav navbar-nav navbar-right">
       <li style ="color:#ff9900;"><span class="glyphicon glyphicon-log-in">Welcome : ${pageContext.request.userPrincipal.name}</span></li>
      </ul> 
       -->
  </div>
</nav>
  <center>
</center>
 <form id="form2">  
  <h1>
	<!--   <button type="button" class="btn btn-warning button1" onclick="doAjaxPost2()">
	  <span class="glyphicon glyphicon-plus"></span>General Checkup</button> -->
<font size="5">Patient History</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Patient Name or Id"  style="width:150px"/></span>
	</h1>

	    <br>
<div class="col-lg-12" style="height:400px; overflow:auto">	  
 <div class="table-responsive">          
  <table class="table table-striped table-bordered table-hover table-condensed" id="myTable">
 <thead>
      <tr>
        <th>Patient Id</th>
        <th>Patient Name</th>
        <th>Date</th>
        <th>Doctor Name</th>
        <th>Fileno</th>
      </tr>
  </thead>
    <tbody>
    <c:forEach var="p1"  items="${model.list3}">
    <tr>
    <td><!--<a href="${p1.date1}">-->${p1.ppid}</a></td>
    <td>${p1.pname}</td>
    <td>${p1.datetime}</td>
    <td>${p1.dname}</td>
    <td>${p1.fileno}</td>
 
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div></div>
    <button  class="bouton-contact" disabled></button>
     </form>




</div>


        

       

        
        
        
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
