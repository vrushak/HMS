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
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.min.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.js"></script>
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


function addp(id){
	if($("#admdate").length == 0){
		alert("Please select admission date")
		return false;
	}
	else if($("#disdate").length == 0){
		alert("Please select disacharge date")
	}
	else{
		var url = "/HMS/pdf?location1="+$("#admdate").val()+"&location2="+$("#disdate").val()+"" ;
		$(id).attr("href",url)
		return true;
	}
}

function addp1(id){
	
		var url = "/HMS/pdf?location1="+moment().format("DD-MM-YYYY")+"&location2="+moment().format("DD-MM-YYYY")+"" ;
		$(id).attr("href",url)
	
}
</script>
<script>
$( function() {
	  $( "#result" ).dialog({
	      
	    	dialogClass: 'result',
	      autoOpen: false,
	      show: {
	        effect: "blind",
	        duration: 1000
	      },
	      hide: {
	    	  
	    
	        effect: "explode",
	        duration: 1000
	      }
	    });
	   $('#result').dialog({height: 300, width:300 });
	    $(".ui-dialog").find(".ui-widget-header").css("background", "#009999","text-align","center");
	    
	    $( "#opener" ).on( "click", function() {
		  	  
		  	  var isOpen = $( "#result" ).dialog( "isOpen" );
		        
		    	if(isOpen == true){
		    	
		    	  $( "#result" ).dialog( "open" );
		      }
		      else{
		    	  $("#admdate").val('');
		    	  $("#disdate").val('');
		    
		    	 $( "#result" ).dialog( "open" );
		      }
		    	
		    	$('.dp1').datetimepicker({
		   	   	 
			    	defaultDate: new Date(),
			    	useCurrent: false,
			    	format: "dd-mm-yyyy",
			        autoclose: true,
			        todayBtn: true,
			        minView: 2
			       
			    	
			    });

		  	  
		    });  
	    
});

</script>
</head>
<body>
<div class= "wrapper">
<br>
<font  color="#228B22" class="left" >Welcome : ${pageContext.request.userPrincipal.name}</font>  <i style="font-size:20px; align: right;color : #228B22" class="fa fa-cog" ></i> 
<i class='fa fa-sign-out button2 rightspace' style='font-size:20px;color : #228B22'  onclick="return myconfirm()"></i>
<div class="well well-lg" id="well"> <center><h4><font color="white">CMS Wedge</font></h4></center></div>

<div class="row"  id="dashboard"   >
  	 <div class="col-lg-1"></div>
  	 <a href="/HMS/cappointment.html">
    	<div class="col-lg-2" >
  	 <div  style="height: 85px; border: 2px solid;border-radius: 15px; background-color:#049be6;">
  	 <div class="row">
  	 <div class="co col-lg-8" style="margin-top:20px;">
  	 <div class="text" style="margin:0px 5px 0px; color:#ffff">Appoinments</div>
                    <div class="app" style="margin:0px 10px 0px; color:#ffff"></div>
  	 </div>
  	 <div class="logo col-lg-4" style="margin-top:25px;">
  	<i style="font-size: 40px;" class="fa fa-stethoscope" aria-hidden="true"></i>
  	 </div>
  	 </div>
    	 </div>
    	</div>
    	</a>
    	<a href="/HMS/diagnose.html">
   	<div class="col-lg-2" >
 	 <div  style="height: 85px; border: 2px solid ;border-radius: 15px; background-color:#049be6;">
 	 <div class="row">
  	 <div class="co col-lg-8" style="margin-top:20px;">
  	 <div class="text" style="margin:0px 5px 0px;color:#ffff">OPD</div>
                    <div class="opd" style="margin:0px 10px 0px;color:#ffff"></div>
  	 </div>
  	 <div class="logo col-lg-4" style="margin-top:25px;">
  <i style="font-size: 40px;" class="fa fa-user" aria-hidden="true"></i>
 	 </div>
 	 </div>
 	 </div>
   	</div>
    	</a>
    	<a href="/HMS/ipdpr.html">
    	<div class="col-lg-2" >
  	 <div  style="height: 85px; border: 2px solid ;border-radius: 15px; background-color:#049be6;">
  	 <div class="row">
  	 <div class="co col-lg-8" style="margin-top:20px;">
  	 <div class="text" style="margin:0px 5px 0px; color:#ffff">IPD</div>
                    <div class="ipd" style="margin:0px 10px 0px;color:#ffff"></div>
  	 </div>
  	 <div class="logo col-lg-4" style="margin-top:25px;">
  	<i style="font-size: 40px;" class="fa fa-wheelchair " aria-hidden="true"></i>
  	 </div>
  	 </div>
    	 </div>
    	</div>
    	</a>
    	<a  id = "opener" href="#">
    	<div class="col-lg-2" >
  	 <div  style="height: 85px; border: 2px solid  ;border-radius: 15px; background-color:#049be6;">
  	 <div class="row">
  	 <div class="co col-lg-8" style="margin-top:20px;">
  	 <div class="text" style="margin:0px 5px 0px; color:#ffff">Billing for the month</div>
                    <div class="bm" style="margin:0px 10px 0px; color:#ffff"></div>
  	 </div>
  	 <div class="logo col-lg-4" style="margin-top:25px;">
  	<i style="font-size: 40px;" class="fa fa-file-text" aria-hidden="true"></i>
  	 </div>
  	 </div>
  	 </div>
    	</div>
    	</a>
    	<a id ="bod" target="_blank" onclick="addp1(this)" href="#">
    	<div class="col-lg-2" >
  	 <div  style="height: 85px; border: 2px solid ;border-radius: 15px; background-color:#049be6;">
  	 <div class="row">
  	 <div class="co col-lg-8" style="margin-top:20px;">
  	 <div class="text" style="margin:0px 5px 0px; color:#ffff">Billing for the day</div>
                    <div class="bd" style="margin:0px 10px 0px;color:#ffff"></div>
  	 </div>
  	 <div class="logo col-lg-4" style="margin-top:25px;">
  	<i style="font-size: 40px;" class="fa fa-file-text" aria-hidden="true"></i>
  	 </div>
  	 </div>
    	 </div>
    	</div>
    	</a>    	
    	<div class="col-lg-1"></div>
  </div>
  <br>
  <div class="row">
  	<div class="col-lg-1"></div>
  	 <div class="col-lg-10" style="height:1.5px;  background-color:#099;"></div>
  	<div class="col-lg-1"></div>
  </div>
  <br>

  
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
 <c:forEach var="p"  items="${model.list}"><script>$('.app').text('<c:out value="${p.appointment}" />')</script></c:forEach>
  <c:forEach var="p"  items="${model.list1}"><script>$('.opd').text('<c:out value="${p.datetime}" />')</script></c:forEach>
  <c:forEach var="p"  items="${model.list2}"><script>$('.ipd').text('<c:out value="${p.date}" />')</script></c:forEach>
  <c:forEach var="p"  items="${model.list3}"><script>$('.bm').text('<c:out value="${p.disdate}" />')</script></c:forEach>
  <c:forEach var="p"  items="${model.list4}"><script>$('.bd').text('<c:out value="${p.admdate}" />')</script></c:forEach>
 
  <div id="result"  title="Bill Report">
   <div class="form-group row" >
        <div class="col-xs-10">
        <p>From Date<span></span></p>
       <div class="form-group">
      <div class='input-group date dp1'>
      <input type='text' name="admdate" id="admdate" class="form-control input-sm" required />
      <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
      </div></div>
      </div>
      </div>
     <div class="form-group row" >
        <div class="col-xs-10">
        <p>To Date<span></span></p>
       <div class="form-group">
      <div class='input-group date dp1'>
      <input type='text' name="disdate" id="disdate" class="form-control input-sm" required />
      <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
      </div></div>
      </div>
      </div>   
      <a href="" target="_blank" class="btn btn-warning" onclick="return addp(this)">Bill Report</a></div>
  </div>	  
	  					
</div>

</body>
</html>