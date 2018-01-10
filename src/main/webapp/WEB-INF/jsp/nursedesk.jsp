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


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/google.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<style type="text/css">

.wrapper {
	width : 1350px;
	background : #eee;
	height: 700px;
	font-family: 'Open Sans', 'Droid Sans';
}
input[type="button"]{
 font-family: "Verdana","sans-serif";
}
#well{
	background : #009999;
	
}
.buttonimg{
    width:auto;
    height:auto;
}
.button2{
float : right;
}

.rightspace{
margin-right:30px;
margin-top: 2px;
}
.left{
margin-left:10px;
}

</style>
<script>
function chkuser(user){
	if(user.includes("[ROLE_NURSE]")){
		 document.getElementById("anurse").style.display = "none";
		 $("#nurseback").hide();
	}
	else if(user.includes("[ROLE_CHIEFNURSE]")){
		
		 var url = "/HMS/nursedesk" ;
		 $("#nurseback").hide();
			
		// var element = document.getElementById('ho');
	//	 element.setAttribute("href",url)
	}
	else{
		document.getElementById("anurse").style.display = "block";
		
		}
}
function myconfirm()
{
 var r = confirm("Do you want to Logout?");
 if(r== true)
 {
 window.location="/HMS/logout";
 }
 else
 {
   return false;
 }
}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/nursedesk.html";
	}
}
</script> 
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="chkuser('<c:out value="${username}" />')">
<div class= "wrapper">
<br>
<font color="#228B22" class="left" >Welcome : ${pageContext.request.userPrincipal.name}</font>  <i style="font-size:20px; align: right;color : #228B22" class="fa fa-cog" ></i> 
<i class='fa fa-sign-out button2 rightspace' style='font-size:20px;color : #228B22'  onclick="return myconfirm()"></i>
<i class='fa fa-arrow-left button2 rightspace' id="nurseback" style='font-size:20px;color : #228B22'  onclick="window.location.href='/HMS/home';"></i>
<div class="well well-lg" id="well"> <center><h4><font color="white">CMS Wedge</font></h4></center></div>

  
 <div class ="container" >
 <div class="row text-center">
 
  <div class="col-xs-2" id="anurse">
      <figure>
       <img src="<c:url value='/Images/Assign nurse.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/nurseassign.html';"  value="Assign Nurse"></figcaption>
      </figure>
    </div>
 
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Patient Care.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='nurseact/${pageContext.request.userPrincipal.name}'" value="Patient Care"></figcaption>
      </figure>
    </div>
    
     <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Vitals.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='vitals'" value="Check Vitals"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/input output.jpg'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='iochart'" value="IO Chart"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Hour Chart.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='hourchart'" value="Hour Chart"></figcaption>
      </figure>
    </div>
    
      <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/drug chart icon.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='drugchart'" value="Drug Chart"></figcaption>
      </figure>
    </div>

 </div>
 <br>
 <div class="row text-center">
 
  <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/opd1.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='opdchart'" value="OPD Other Procedures"></figcaption>
      </figure>
    </div>
    
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Print Prescription.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/labprint'" value="Print Lab Tests"></figcaption>
      </figure>
    </div> 
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Lab Tests Icon.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/labup';" value="Lab Tests"></figcaption>
      </figure>
    </div>
    </div>
 <br>


 </div>
 <br>
 
</div>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>