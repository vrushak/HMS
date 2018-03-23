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

<style>
.wrapper {
  height : auto;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
  height : 900px;
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
  max-width:1050px;
  width:100%;
  margin: 5% auto;
  margin-top :  1cm;
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

textarea {
  border-radius: 0px 5px 5px 0px;
  border: 1px solid #cccccc;
  margin: 0;
  width: 225px;
  height: 5px; 
  float: left;
  padding: 0px 15px;
}
#address2{
	 border-radius: 0px 5px 5px 0px;
  border: 1px solid #cccccc;
  margin:0;
  width: 312px;
  height: 50px; 
  float: left;
  padding: 0px 15px;
}

.tds{
	width : 200px;
}




.bouton-contact{
  background-color: #81BDA4;
  color: #FFF;
  text-align: center;
  width: 100%;
  border:0;
  padding: 15px 10px;
  border-radius: 0px 0px 5px 5px;
  cursor: pointer;
  margin-top: 10px;
  font-size: 18px;
}



table {
    border-collapse: collapse;
    width: 100%;
    }
th {
    background-color: #009999;
    color: black;
    
}

.table-fixed{
 
}
  tbody{
    height:50px;
    
 }
 
#myTable1 {
    border-collapse: collapse;
    width: 100%;
    }
#myTable1 th {
    background-color: #009999;
    color: black;
    width : 180px;
}

.table-fixed{
 
}
  #myTable1 .tbody1{
    height:5px;
    overflow-y:auto;
 }
 #myTable1 thead,.tbody1{
  
    display:block;
  }

modal-body{
	background-color: #eaeaea;
	height:auto;
	width: auto;
}  

.button1{
	float : left;
}
.button2{
	float : right;
}

.delete{
	width :50px;
}

#col3{
margin-left: 25px; 
border-style : groove;
border-radius : 10px;
width : 1000px;
}

.highlight {
    background-color: yellow;
}
.btn-block{
 width : 1000px;
}
</style>


<script type="text/javascript">


function deleteRow(r) {
	 
	   var i = r.parentNode.parentNode.rowIndex;
	  
	   document.getElementById("myTable1").deleteRow(i);
	  //   totalIt();
	    
	}

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
		 
		// document.getElementById("hiderow").style.display = "none";
	}
     else if(user.includes("[ROLE_DOCTOR]")){
		
		var url = "/HMS/doctor1" ;
		$("#back").hide();
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		// document.getElementById("hiderow").style.display = "none";
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
		 if(bac.includes("dochome")){
			 $("#back").attr("href","/HMS/doctor1")
			 $("#tit").text("Back to Doctor Home")
		 }
		 else{
			 $("#back").attr("href","/HMS/nursedesk") 
			 $("#tit").text("Back to Nurse Desk")
		 }

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

function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
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
		
		//alert(data)
window.location = "/HMS/blantyrecoma.html";
	}
}
	  
function blantyre()
{
	document.getElementById("date").value= moment().format("DD-MM-YYYY hh:mm:ss");
	}
function addname(getval){
	
	
	var myname = getval.getAttribute('data-value'); 	
		//var str = document.getElementById("pname").getAttribute("data-value");
	//	alert(str);
		
		
	
		var strSplit = myname.split(',');
		document.getElementById("name").value = strSplit[0];
		document.getElementById("pid").value = strSplit[1];
		document.getElementById("age").value = strSplit[2];	
		document.getElementById("gender").value = strSplit[3];
		document.getElementById("fileno").value = strSplit[4];	
		document.getElementById("admdate").value = strSplit[5];	
		document.getElementById("wardno").value = strSplit[6];	
		document.getElementById("doctsig").value = strSplit[7];	
		document.getElementById("nursesig").value = strSplit[8];	
	
	
}

function run(getval){
	
	
	var myname = getval.getAttribute('data-value'); 	
		//var str = document.getElementById("pname").getAttribute("data-value");
	//	alert(str);
		
	
		var strSplit = myname.split('=');
		
//		alert(strSplit[9]);
//alert(strSplit[5])
		document.getElementById("name").value = strSplit[0];
		document.getElementById("pid").value = strSplit[1];
		document.getElementById("age").value = strSplit[2];	
		document.getElementById("gender").value = strSplit[3];
		document.getElementById("fileno").value = strSplit[4];
		
		document.getElementById("admdate").value = strSplit[5];	
		document.getElementById("wardno").value = strSplit[6];	
//		document.getElementById("doctsig").value = strSplit[7];	
		//document.getElementById("nursesig").value = strSplit[8];
		document.getElementById("admitno").value = strSplit[9];
		
		document.getElementById("id").innerHTML = strSplit[1];
		document.getElementById("nm").innerHTML = strSplit[0];
		document.getElementById("flno").innerHTML = strSplit[4];
		
	disbut();
	
}
function selectOnlyThis(id){
	  var myCheckbox = document.getElementsByName("bestmotor");
	  Array.prototype.forEach.call(myCheckbox,function(e){
	    e.checked = false;
	  });
	  id.checked = true;
	}
function selectOnly(id){
	  var myCheckbox = document.getElementsByName("response");
	  Array.prototype.forEach.call(myCheckbox,function(el){
	    el.checked = false;
	  });
	  id.checked = true;
	}
function selectThis(id){
	  var myCheckbox = document.getElementsByName("movement");
	  Array.prototype.forEach.call(myCheckbox,function(ee){
	    ee.checked = false;
	  });
	  id.checked = true;
	}
	
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/blantyrecoma.html";
	}
}

	</script>
	
	
	<script type="text/javascript">
var user2a;
       function doAjaxPost(user2) {
    	   // get the form values

    	      //  var name = $('#pname').val();
           
    	   var admitno = $('#admitno').val();
          user2a = user2;
   	
    $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/blantyre1.html",
	           data: "admitno=" + admitno,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        	 
	        	   $.each(response.list5, function(index, datec) {
	                   //to print name of employee
	         
	             
	                   if ($("#datec option[value='"+encodeURIComponent(datec.date)+"']").length == 0){
	               
	                	   $("#datec").append('<option value="'+datec.date+'">'+datec.date+'</option>');
	                   
	                   $("#datec").selectpicker("refresh");
	                   }

	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
    	   unsaved = false;
    	        	        }


      

       
       
       </script>
<script type="text/javascript">

       function doAjaxPost1(id) {
    	   // get the form values

    	  
           //	    $("#myTable1 .tbody1 tr").remove();
    	   //  var name = $('#pname').val();
          // var str = id.split(",");
    	   var admitno = $('#admitno').val();
    	   if(admitno.length == "0"){
    		   admitno = id;
    	   }

    	  // var date = $('#date').val();
   
    	  
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/blantyre2/"+admitno+"/"+id+"",
	           async: false,
	         //  data: "admitno=" + admitno,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	       	   //alert(response)
	       	   $.each(response.list5, function(index, datec) {
	                   //to print name of employee
	              //     $("#date").append('<option value="'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'">'+datec.date+'</option>');
	               //    $("#date").selectpicker("refresh");
	       // alert(datec.date)
	       document.getElementById("date").value = datec.date;
	       $('#timestamp').val(datec.timestamp)
	       /*
		                   if ($("#datec option[value='"+encodeURIComponent(datec.date)+"']").length == 0){
		               
		                	   $("#datec").append('<option value="'+datec.date+'" selected="">'+datec.date+'</option>');
		                   
		                   $("#datec").selectpicker("refresh");
		                   }
		                   
		                   else if(id != document.getElementById("date").value){
		                	   $('select[name=daten]').val(id);
		                	   $('#date').selectpicker('refresh');
		                   }
		                   else{
		                	   
		                   }
		   */  
	       // alert(datec.bestmotor)
		               	if(datec.bestmotor == "localize") {
		            		
		            		document.getElementById('localize').checked=true;
		            	}
		               	else if(datec.bestmotor == "withdraw"){
		               		document.getElementById('withdraw').checked=true;
		               	}
		               	else if(datec.bestmotor == "specific"){
		               		document.getElementById('specific').checked=true;
		               	}
		               	
		               	else{
		               		
		               	}
		          // alert(datec.response)
		            if(datec.response == "cry") {
	            		
	            		document.getElementById('cry').checked=true;
	            		//alert()
	            	}
		            
	               	else if(datec.response == "moan"){
	               		document.getElementById('moan').checked=true;
	               	}
	               	else if(datec.response == "none"){
	               		document.getElementById('none').checked=true;
	               	}
	               	
	               	else{
	               		
	               	}
		            (datec.movement)
                    if(datec.movement == "dir") {
	            		
	            		document.getElementById('dir').checked=true;
	            	}
	               	else if(datec.movement == "notd"){
	               		document.getElementById('notd').checked=true;
	               	}
	               	
	               	else{
	               		
	               	}
		            	document.getElementById("grandtotal").value = datec.total;	
		              		
		            	if(datec.total <=4 && datec.total > 1){
		            		   $('#sel3').addClass('highlight');
		            	}
		            	else{
		            		 $('#sel3').removeClass('highlight');
		            	}
		            	
		            	if(datec.total == 5){
		            		   $('#sel2').addClass('highlight');
		            	}
		            	else{
		            		 $('#sel2').removeClass('highlight');
		            	}
		            	
		            	if(datec.total == 0){
		            		   $('#sel1').addClass('highlight');
		            	}
		            	else{
		            		 $('#sel1').removeClass('highlight');
		            	}
		            	
		            	  if ($(":checkbox[name='bestmotor']:checked").length == 1)                                              
		          		    $(":checkbox[name='bestmotor']:not(:checked)").prop('disabled', true);  
		          		   else                                                     
		          		    $(":checkbox[name='bestmotor']:not(:checked)").prop('disabled', false); 
		          	
		          	  
		          		   if ($(":checkbox[name='response']:checked").length == 1)                                              
		          		    $(":checkbox[name='response']:not(:checked)").prop('disabled', true);  
		          		   else                                                     
		          		    $(":checkbox[name='response']:not(:checked)").prop('disabled', false); 
		          		
		          	
		          		   if ($(":checkbox[name='movement']:checked").length == 1)                                              
		          		    $(":checkbox[name='movement']:not(:checked)").prop('disabled', true);  
		          		   else                                                     
		          		    $(":checkbox[name='movement']:not(:checked)").prop('disabled', false); 
		            	
	       		 
	       	unsaved = false;
	               });   
	        	 
	        	   
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
    	
    	   
    	   $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
               
           	unsaved = false;
           });
    	        	        }


      

       
       
       </script>
<script type="text/javascript">
var sum ;
function a(id, num) {
	sum = Number(document.getElementById("grandtotal").value);
	
    if(id.checked == true){
        sum += num;
        id.onclick = function() { a(id, num)};
    }
    else {
        sum -= num;
        id.onclick = function() { a(id, num)};
    }
    document.getElementById("grandtotal").value=sum;
    
  	if(sum <=4 && sum > 1){
		   $('#sel3').addClass('highlight');
	}
	else{
		 $('#sel3').removeClass('highlight');
	}
	
	if(sum == 5){
		   $('#sel2').addClass('highlight');
	}
	else{
		 $('#sel2').removeClass('highlight');
	}
	
	if(sum == 0){
		   $('#sel1').addClass('highlight');
	}
	else{
		 $('#sel1').removeClass('highlight');
	}
}
</script>


<script type="text/javascript">
$(document).ready(function(){
	$('.slectOne').on('change', function() {
	   $('.slectOne').not(this).prop('checked', false);
	   $('#result').html($(this).data( "id" ));
	   if($(this).is(":checked"))
	   	$('#result').html($(this).data( "id" ));
	   else
	   	$('#result').html('');
	});
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('.slect').on('change', function() {
	   $('.slect').not(this).prop('checked', false);
	   $('#resultset').html($(this).data( "id" ));
	   if($(this).is(":checked"))
	   	$('#resultset').html($(this).data( "id" ));
	   else
	   	$('#resultset').html('');
	});
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('.selectoneof').on('change', function() {
	   $('.selectoneof').not(this).prop('checked', false);
	   $('#resu').html($(this).data( "id" ));
	   if($(this).is(":checked"))
	   	$('#resu').html($(this).data( "id" ));
	   else
	   	$('#resu').html('');
	});
	});
</script>
  <script type="text/javascript">
       
       
       $(function () {
    	   $(":checkbox[name='bestmotor']").change(function(){
    		   if ($(":checkbox[name='bestmotor']:checked").length == 1)                                              
    		    $(":checkbox[name='bestmotor']:not(:checked)").prop('disabled', true);  
    		   else                                                     
    		    $(":checkbox[name='bestmotor']:not(:checked)").prop('disabled', false); 
    		 });
    	   $(":checkbox[name='response']").change(function(){
    		   if ($(":checkbox[name='response']:checked").length == 1)                                              
    		    $(":checkbox[name='response']:not(:checked)").prop('disabled', true);  
    		   else                                                     
    		    $(":checkbox[name='response']:not(:checked)").prop('disabled', false); 
    		 });
    	   $(":checkbox[name='movement']").change(function(){
    		   if ($(":checkbox[name='movement']:checked").length == 1)                                              
    		    $(":checkbox[name='movement']:not(:checked)").prop('disabled', true);  
    		   else                                                     
    		    $(":checkbox[name='movement']:not(:checked)").prop('disabled', false); 
    		 });
       });
       
       
      function appendts(){
    	  $('#timestamp').val('<c:out value="${pageContext.request.userPrincipal.name}" />  '+moment().format("DD-MM-YYYY HH:mm"))
    		
      } 
       </script>
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />'),blantyre()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Blantyre Coma Scale</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
      
 
    </ul>
   <ul class="nav navbar-nav navbar-right">
  <li><a href="#" id="back" ><span class="glyphicon glyphicon-user"></span><span id="tit">Back</span></a></li>
    </ul>  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1><button type="button" id="refresh" class="btn btn-warning button1" form="forma" onclick="location.reload(true);">
     
	  <span class="fa fa-refresh"></span> Refresh</button>
	
	
<font size="5">Blantyre Coma Scale</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="button" id="myInput" class="form-control input-sm button2 btn btn-warning" value="Previous Records" onclick="doAjaxPost('<c:out value="${username}" />')"  /></span>
	</h1>

<form id="forma" name="forma" action="blantyrecomasc.html" method="post"></form>


   <br>
  <div class="container" style="width:auto;height:auto">
 <button type="button" style="background:#81BDA4",  class="btn btn-primary btn-block"><span id="pi" style="float:left">Patient Information</span><span id="flno" style="float:right">Fileno</span><span id="id" style="float:right;margin-right:15px;">Id</span><span style="float:right;margin-right:25px;" id="nm">Name</span></button>
 <br>
  </div>   
	    
	    <div class="container">
 
  

  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Patient Details</a></li>
    <li><a data-toggle="pill" href="#menu1">BLANTYRE COMA SCALE</a></li>
</ul>
</div>
<br>
<div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div id="col3">
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	      
	      <div class="form-group">
            <p>Patient Name<span></span></p>
             <select class="selectpicker form-control" data-size="4" data-live-search="true" name = "pname" id ="pname" onchange="run(this.options[this.selectedIndex])">
          <option value="Select" selected disabled>Select</option>
        <c:forEach var="p"  items="${model.list3}">
        <option value="${p.name}" data-subtext="${p.fileno},${p.admdate}" data-value="${p.name}=${p.pid}=${p.age}=${p.gender}=${p.fileno}=${p.admdate}=${p.wardno}=${p.doctsig}=${p.nursesig}=${p.admitno}">${p.name}</option>
        </c:forEach>
      </select>
       
	</div>
	      </div>
	      
	       <div class="col-xs-4">
	      
	       <div class="form-group">
         <p>Patient Id<span></span></p>
     <input type="text" name="pid" id="pid"  form="forma" class="form-control input-sm" readonly required>
       
       
       
	</div>
	      </div>
	      
	       <div class="col-xs-3">
	        <div class="form-group">
	        
     <p>Admit No<span></span></p>
             <input type="text" name="admitno" id="admitno"  form="forma" class="form-control input-sm" readonly required>
             <input type="hidden" name="fileno" id="fileno" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         <input type="hidden" name="name" id="name" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         <input type="hidden" name="" id="" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         
     
       
	</div>
	      
	      </div>
	      
	      </div>
	      
	         <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	       <div class="form-group">
     
            <p>Age<span></span></p>
     <input type="text" name="age" id="age"  form="forma" class="form-control input-sm" readonly >
     </div>
	      </div>
	      
	       <div class="col-xs-4">
	      <div class="form-group">
          <p>Gender<span></span></p>
     <input type="text" name="gender" id="gender"  form="forma" class="form-control input-sm" readonly>
       
     </div>
	      </div>
	      
	       <div class="col-xs-3">
	      <div class="form-group">
            <p>Admission Date<span></span></p>
     <input type="text" name="admdate" id="admdate"  form="forma" class="form-control input-sm"  readonly required>
       
	</div>
	      </div>
	      
	      </div>
	      
	            <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	       <div class="form-group">
     
          <p>WardNo/BedNo<span></span></p>
     <input type="text" name="wardno" id="wardno"  form="forma" class="form-control input-sm" readonly>
     </div>
	      </div>
	      
	       <div class="col-xs-4">
	        <div class="form-group">
     
          <p>Current Date<span></span></p>
     <input type="text" name="date" id="date"  form="forma" class="form-control input-sm" readonly required>
     </div>
	      </div>
	      
	       <div class="col-xs-3">
	      
	      </div>
	      
	      </div>
	      
	        <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	       <div class="form-group">
     
          
     </div>
	      </div>
	      
	       <div class="col-xs-4">
	        <div class="form-group">
     
          
     </div>
	      </div>
	      
	       <div class="col-xs-3">
	       <div class="form-group">
     
          
     </div>
	      </div>
	      
	      </div>
	     </div>
    </div>
      <div id="menu1" class="tab-pane fade">
      
      <br>
            <div class="form-group row" >
	     <div class="col-xs-3"></div>
	       <div class="col-xs-3">
	        <div class="form-group">
	          
             <select class="selectpicker form-control" data-size="4" form="forma"  data-live-search="true" name = "datec" id ="datec" onchange="doAjaxPost1(this.value);this.selectedindex = -1">
          <option selected disabled>Select Date to fetch records</option>
       
      </select>
      </div>
	        </div>
	          <div class="col-xs-5"> 
	     <div class="form-group"><b>Last Modified : </b><input type="text" name="timestamp" id="timestamp" form="forma" style="border:none;width:200px;" readonly="readonly"></div> 
       </div>
	    
	      </div>
	      
      
            <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      
	      
	        <div class="col-xs-8">
	     <div class="form-group">
	     
	   
	<br>	    
  <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 900px; " id="myTable1">
    <thead>
      <tr>
         <th style="width:350px;border-bottom:solid;border-right: 1px solid;border-top:solid;border-left: solid;"">BEHAVIOR</th>
        <th style="width:300px;border-bottom:solid;border-right: 1px solid;border-top:solid;border-left: solid;"">RESPONSE</th>
        <th style="width:250px;border-bottom:solid;border-right: 1px solid;border-top:solid;border-left: solid;"">SCORE</th>
        <th style="width:100px;border-bottom:solid;border-right: solid;border-top:solid;border-left: solid;""></th>

        <tr><th  style="vertical-align:top;border-bottom:solid;border-right: 1px solid;border-top:solid;border-left: solid;"  rowspan="3">Best motor response</th><td style="border-bottom:1px solid;border-right: 1px solid;border-top:solid;">Localizes painful stimulus</td><td style="border-bottom:1px solid;border-right: 1px solid;border-top:solid;"><center>2</center></td><td style="border-bottom:1px solid;border-right: solid;border-top:solid;"><center><input type="checkbox"   name="bestmotor" id="localize" class="slectOne" value="localize" onClick="a(this,2),test();"  form="forma" /></center></td></tr>    
<tr><td style="border-bottom:1px solid;border-right: 1px solid;border-right: 1px solid;">Withdraws limb from pain</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>1</center></td><td style="border-bottom:1px solid;border-right:  solid;"><center><input type="checkbox"  name="bestmotor" id="withdraw"  value="withdraw" class="slectOne" onClick="a(this,1),test();" form="forma"/></center></td></tr>
<tr><td style="border-bottom: solid;border-right: 1px solid;border-right: 1px solid;">Non-specific or absent response</td><td style="border-bottom: solid;border-right: 1px solid;"><center>0</center></td><td style="border-bottom: solid;border-right:  solid;"><center><input type="checkbox" class="slectOne"   name="bestmotor" id="specific"  value="specific" onClick="a(this,0),test(); "  form="forma" /></center></td></tr>
<span id="result"></span>

<tr><th style="vertical-align:top;border-bottom:solid;border-right: 1px solid;border-top:solid;border-left: solid;" rowspan="3"> Verbal response</th><td style="border-bottom:1px solid;border-right: 1px solid;">Appropriate cry</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>2</center></td><td style="border-bottom:1px solid;border-right: solid;"><center><input type="checkbox" name="response" id="cry"  value="cry" class="slect"  onClick="a(this,2);"  form="forma" /></center></td></tr>    
<tr><td style="border-bottom:1px solid;border-right: 1px solid;border-right: 1px solid;">Moan or inappropriate cry</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>1</center></td><td style="border-bottom:1px solid;border-right:  solid;"><center><input type="checkbox"   name="response"  id="moan"  value="moan" class="slect"  onClick="a(this,1);" form="forma" /></center></td></tr>
<tr><td style="border-bottom: solid;border-right: 1px solid;border-right: 1px solid;">None</td><td style="border-bottom: solid;border-right: 1px solid;"><center>0</center></td><td style="border-bottom: solid;border-right:  solid;"><center><input type="checkbox" name="response" id="none"  value="none" class="slect"  onClick="a(this,0);" form="forma"   /></center></td></tr>
 <span id="resultset"></span>
              
  <tr><th style="vertical-align:top;border-bottom:solid;border-right: 1px solid;border-top:solid;border-left: solid;" rowspan="2">Eye movement</th><td style="border-bottom:1px solid;border-right: 1px solid;">Directed(e.g,Follows Mother's face)</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>1</center></td><td style="border-bottom:1px solid;border-right:solid;"><center><input type="checkbox"  name="movement" id="dir"  value="dir" class="selectoneof" onClick="a(this,1);" form="forma"  /></center></td></tr>    
<tr><td style="border-bottom:solid;border-right: 1px solid;">Not Directed</td><td style="border-bottom: solid;border-right:1px solid;"><center>0</center></td><td style="border-bottom: solid;border-right:  solid;"><center><input type="checkbox" id="notd"   name="movement"  value="notd" class="selectoneof" onClick="a(this,0);" form="forma" /></center></td></tr>
<span id="resu"></span>

  <tr><th style="border-bottom: solid;border-right: 1px solid;border-left:  solid;">Total score</th><td style="border-bottom:solid;border-right:1px solid;"></td><td style="border-bottom: solid;border-right: 1px solid;"><center><input type="text" id="grandtotal" name="total" style="text-align:center;" value="0" form="forma"  placeholder="5(MaxTotal)"></center></p></td><td style="border-bottom:solid;border-right:solid;"></td></tr>  
    
    </thead>
    </table> 
    <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 500px;margin-left:300px; " id="septable" >
    <thead>
    <tr id="sel1"><td style="display : none;border-bottom: 1px solid;border-top: solid;border-right: 1px solid;border-left:solid;"></td><td style="border-bottom:1px solid;border-right: 1px solid;width:270px;border-top: solid;border-left:  solid;">minimum score:0(poor)</td><td style="border-bottom:1px solid;border-right:solid;width:230px;border-top: solid;"></td><td style="display :none;"></td></tr>
    <tr id="sel2"><td style="display :none;border-bottom: 1px solid;border-right: 1px solid;border-left:  solid;"></td><td style="border-right :1px solid;border-bottom:1px solid;border-left:solid;width:270px;">maximum score:5(good)</td><td style="border-bottom: 1px solid;border-right: solid;width:230px;"></td><td style="display:none;"></td></tr>
    <tr id="sel3"><td style="display :none;border-bottom: solid;border-right: 1px solid;border-left:  solid;"></td><td style="border-right :1px solid;border-bottom: solid;border-left:solid;width:270px;">abnormal score <= 4</td><td style="border-bottom: solid;border-right: solid;width:230px;"></td><td style="display:none;"></td></tr>
   </thead>
       
       </table> 
       </div> 
	      </div>	      
	      </div>
	      </div>
	      </div>
	      
<button type="submit" value="submit" id="bc" name="save" onclick="appendts()" class="bouton-contact" form="forma" >Save</button>
   </div>
   </div>
  
   <script>
datasuccess('<%=request.getParameter("message")%>')
</script>
<script>
var bac = '<c:out value='${model.bac}'/>';
</script>
</body>
</html>