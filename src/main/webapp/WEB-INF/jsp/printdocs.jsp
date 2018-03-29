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

<link href="<c:url value="home.css" />" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.min.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
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
<script type="text/javascript">
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

function checkhome(user){

	var m = moment().format("DD-MM-YYYY");
	
	
	if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
	//	$("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
	
		 var url = "/HMS/frontdesk" ;
	//	 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 
	}
	else if(user.includes("[ROLE_DOCTOR]")){
		
		 var url = "/HMS/doctor1" ;
			$("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_Accounts Admin]")){
		
		 var url = "/HMS/frontdesk" ;
		// $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
	}
	
	else if(user.includes("[ROLE_CHIEFNURSE]")){
		
		 var url = "/HMS/nursedesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 document.getElementById("samplea").style.display = "none";
	}
	else if(user.includes("[ROLE_NURSE]")){
		
		 var url = "/HMS/nursedesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("samplea").style.display = "none";
		 document.getElementById("myInput").style.visibility ="hidden";
	}
	else{
		 var url = "/HMS/home" ;
			
		// var element = document.getElementById('ho');
		 //element.setAttribute("href",url)
		
		 if(bac.includes("frontdesk")){
			 $("#back").attr("href","/HMS/frontdesk")
			 $("#tit").text("Back to Frontdesk")
		 }
 else{
	 $("#back").attr("href","/HMS/doctor1")
	 $("#tit").text("Back to Doctor home")
 }
	}
	disbut()
}

function goBack() {
    window.history.back();
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
<sec:authentication property="principal.authorities" var="username" />

<body onload = "checkhome('<c:out value="${username}" />')">
<div class= "wrapper">
<br>
<font color="#228B22" class="left" >Welcome : ${pageContext.request.userPrincipal.name}</font><a style="text-decoration: underline;" href="#" class="button2 rightspace" id="back" ><span id="tit">Back</span></a>
<i class='fa fa-sign-out button2 rightspace' style='font-size:20px;color : #228B22'  onclick="return myconfirm()"></i>

<div class="well well-lg" id="well"> <center><h4><font color="white">CMS Wedge</font></h4></center></div>

 <div class ="container" >
 <div class="row text-center">
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Print Prescription.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/prprs'" value="Print Prescription"></figcaption>
      </figure>
    </div>
   
     <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Print Prescription.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/dslippr'" value="Print Discharge Slip"></figcaption>
      </figure>
    </div>
    
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Print Prescription.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/dischargepr'" value="Print Discharge Summary"></figcaption>
      </figure>
    </div>
    
     <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/Print Prescription.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='/HMS/ipdpr'" value="IPD Prescription"></figcaption>
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
       <img src="<c:url value='/Images/Print Prescription.png'/>"/><br><br>
      <figcaption><input type="button" id="opener" onclick="" value="Bill Report"></figcaption>
      </figure>
    </div>
 </div>
 <br>

   <br>
   

 </div>
 <br>
 <div id="result"  title="Bill Report">
   <div class="form-group row" >
        <div class="col-xs-10">
        <p>From Date<span></span></p>
       <div class="form-group">
     
      <input type="date" name="admdate" id="admdate"  class="form-control input-sm"  required />
     
      </div>
      </div>
      </div>
     <div class="form-group row" >
        <div class="col-xs-10">
        <p>To Date<span></span></p>
       <div class="form-group">
     <input type="date" name="disdate" id="disdate"  class="form-control input-sm"  required />
   
      </div>
      </div>
      </div>   
      <a href="#" target="_blank" class="btn btn-warning" onclick="return addp(this)">Bill Report</a></div>
  </div>
</div>

<script>

var bac = '<c:out value='${model.bac}'/>';

</script>
</body>
</html>