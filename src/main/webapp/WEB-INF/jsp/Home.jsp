<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMS Wedge</title>
<meta charset="utf-8">
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

</script>
</head>
<body>
<div class= "wrapper">
<br>
<font  color="#228B22" class="left" >Welcome : ${pageContext.request.userPrincipal.name}</font>  <i style="font-size:20px; align: right;color : #228B22" class="fa fa-cog" ></i> 
<i class='fa fa-sign-out button2 rightspace' style='font-size:20px;color : #228B22'  onclick="return myconfirm()"></i>
<div class="well well-lg" id="well"> <center><h4><font color="white">CMS Wedge</font></h4></center></div>

  
 <div class ="container" >
 <div class="row text-center">
 
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Staff Details.jpg'/>"/><br><br>
      <figcaption><input type="button"onclick="location.href='/HMS/staff';" value="Staff Details"></figcaption>
      </figure>
    </div>
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Doctorvisits.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/doctor1';" value="Doctor View"></figcaption>
      </figure>
    </div>
    
     <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Nurse station.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/nursedesk';" value="Nurse Station"></figcaption>
      </figure>
    </div>
  <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/front desk.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/frontdesk';" value="Front Desk"></figcaption>
      </figure>
    </div>
     <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/pharmacy product.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/hmspharma';" value="Pharmacy"></figcaption>
      </figure>
    </div>
    <!-- 
     <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/labicon.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='';" value="Lab Details"></figcaption>
      </figure>
    </div>
    --> 
 </div>
 <br>
<div class="row text-center">
 
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Chief nurse.jpg'/>"/><br><br>
      <figcaption><input type="button"onclick="location.href='/HMS/updateur';" value="Nurse Role Management"></figcaption>
      </figure>
    </div>
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/logo2.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/loadas';" value="Assistant Role Management"></figcaption>
      </figure>
    </div>
    </div>
 </div>
 <br>
 
</div>
</body>
</html>