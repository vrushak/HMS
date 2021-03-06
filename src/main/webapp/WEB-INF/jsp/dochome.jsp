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
	height: 800px;
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
<script type="text/javascript">
function checkhome(user){
	
	if(user.includes("[ROLE_DOCTOR]")){
		
		 var url = "/HMS/doctor1" ;
			
		// var element = document.getElementById('ho');
		// element.setAttribute("href",url)
		 $("#hided").remove();
		 $("#hidedd").remove();
		 $("#hdf").remove();
		$("#back").hide();
	}
	
	else{
		 var url = "/HMS/home" ;
			
	//	 var element = document.getElementById('ho');
	//	 element.setAttribute("href",url)
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
window.location = "/HMS/doctor1.html";
	}
}

</script>
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload = "checkhome('<c:out value="${username}" />')">
<div class= "wrapper">
<br>
<font color="#228B22" class="left" >Welcome : ${pageContext.request.userPrincipal.name}</font>  <i style="font-size:20px; align: right;color : #228B22" class="fa fa-cog" ></i> 
<i class='fa fa-sign-out button2 rightspace' style='font-size:20px;color : #228B22'  onclick="return myconfirm()"></i>
<a href="/HMS/home" id="back" class='button2 rightspace' ><span class="glyphicon glyphicon-user"></span><span id="tit">Back to Home</span></a>

<div class="well well-lg" id="well"> <center><h4><font color="white">CMS Wedge</font></h4></center></div>

 <div class ="container" >
 <div class="row text-center">
   <c:forEach var="p"  items="${list1}">
   
   </c:forEach>
   <div class="col-xs-2">
      <figure>
       <c:forEach var="p"  items="${list1}">
   
       <img src="<c:url value='/Images/Doctor Appointment.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='myapps'" value="Appointments"></figcaption>
       </c:forEach>
      </figure>
    </div>
 
  <div class="col-xs-2">
      <figure>
     
       <img src="<c:url value='/Images/GCH.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/diagnose'" value="Clinical Diagnosis"></figcaption>
     
      </figure>
    </div> 
   
          <div class="col-xs-2">
      <figure>
     
       <img src="<c:url value='/Images/dd.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/cdiagnose'" value="Dental Diagnosis"></figcaption>
     
      </figure>
    </div>

    
    
      <div class="col-xs-2">
      <figure>
      <c:forEach var="p"  items="${list1}">
       <img src="<c:url value='/Images/treatment records.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='treatment';" value="Patient Treatment Records"></figcaption>
      </c:forEach>
      </figure>
      </div>
         
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/input output.jpg'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='iochart?location=dochome'" value="IO Chart"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Hour Chart.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='hourchart?location=dochome'" value="Hour Chart"></figcaption>
      </figure>
    </div>
   
 </div>
 <br>
 
 <div class="row text-center">
  <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/drug chart icon.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='drugchart?location=dochome'" value="Drug Chart"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Summary.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/discharge?location=dochome'" value="Discharge Summary"></figcaption>
      </figure>
    </div>
    
    
    
     <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Summary.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/dslip'" value="Discharge Slip"></figcaption>
      </figure>
    </div>
    
      
       <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Sick Note2.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/sick'" value="Sick Note"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/download.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/referral'" value="Referral Note"></figcaption>
      </figure>
    </div>
    
      <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Print Prescription.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/prdocs'" value="Print Documents"></figcaption>
      </figure>
    </div>
    
  
    
   
 </div>
 <br>
 <div class="row text-center">

<div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/glassgow.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='glasgowcoma?location=dochome'" value="Glasgow Coma Scale"></figcaption>
      </figure>
    </div>
    
     <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/blant.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='blantyrecoma?location=dochome'" value="Blantyre Coma Scale"></figcaption>
      </figure>
    </div>  
   
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/opd1.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='opdchart?location=dochome'" value="OPD Other Procedures"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Lab Tests Icon.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/labup?location=dochome';" value="Lab Tests"></figcaption>
      </figure>
    </div>
    <!--  
   <div class="col-xs-2">
      <figure>
     
       <img src="<c:url value='/Images/labicon.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/labconfig'" value="Lab Configuration"></figcaption>
     
      </figure>
    </div>-->
    
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Vitals.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='vitals?location=dochome'" value="Check Vitals"></figcaption>
      </figure>
    </div>
    
   
    </div>
    <br>
   <div class="row text-center">
   
    <div class="col-xs-2">
      <figure>
       <c:forEach var="p"  items="${list1}">
       <img src="<c:url value='/Images/Gc.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='prescription'" value="General Checkup"></figcaption>
      </c:forEach>
      </figure>
    </div>
   
   <div class="col-xs-2" id="hided">
      <figure>
     
       <img src="<c:url value='/Images/Cdc.png'/>"/><br><br>

      <figcaption><input type="button" onclick="location.href='/HMS/diagnose/config'" value="Clinical Diagnosis Configuration"></figcaption>

     
      </figure>
    </div>
    <div class="col-xs-1" id="hdf"></div>
     

    
   <div class="col-xs-2" id="hidedd">
      <figure>
     
       <img src="<c:url value='/Images/ddc.png'/>"/><br><br>

      <figcaption><input type="button" onclick="location.href='/HMS/cdiagnose/config'" value="Dental Diagnosis Configuration"></figcaption>

     
      </figure>
    </div> 
     
    
     
   
   </div>

 </div>
 <br>
 
</div>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>