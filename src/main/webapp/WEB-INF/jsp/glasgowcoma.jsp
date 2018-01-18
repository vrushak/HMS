<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
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

<link rel='stylesheet' href='<c:url value="/resources/css/ioochart.css" />' type='text/css' media='all' />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<style>
.wrapper {
  height : auto;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
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
  margin-top: 20px;
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
</style>


<script type="text/javascript">


function deleteRow(r) {
	 
	   var i = r.parentNode.parentNode.rowIndex;
	  
	   document.getElementById("myTable1").deleteRow(i);
	  //   totalIt();
	    
	}
	function glas()
	{
		document.getElementById("date").value= moment().format("DD-MM-YYYY hh:mm:ss");
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
function runner() {
    
 	   var str = document.getElementById("myTable1").value;
	   var strSplit = str.split('=');
	  // alert(strSplit);
	
	
	if(strSplit[0].value == "spontaneous") {
		
		document.getElementById('spontaneous').checked=true;
	}
	document.getElementById("spontaneous").value = strSplit[0];
			
	if(strSplit[1].value == "response"){
				
				document.getElementById('response').checked=true;
			}
	document.getElementById("response").value = strSplit[1];
	
	if(strSplit[2].value == "obey"){
		
		document.getElementById('obey').checked=true;
	}
	document.getElementById("obey").value = strSplit[2];
	//document.getElementById('caseh').checked;
	
	
	
	
   }


function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/glasgowcoma.html";
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
function selectOnlyThis(id){
	  var myCheckbox = document.getElementsByName("opener");
	  Array.prototype.forEach.call(myCheckbox,function(e){
	    e.checked = false;
	  });
	  id.checked = true;
	}
function selectOnly(id){
	  var myCheckbox = document.getElementsByName("verbal");
	  Array.prototype.forEach.call(myCheckbox,function(el){
	    el.checked = false;
	  });
	  id.checked = true;
	}
function selectThis(id){
	  var myCheckbox = document.getElementsByName("motor");
	  Array.prototype.forEach.call(myCheckbox,function(ee){
	    ee.checked = false;
	  });
	  id.checked = true;
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
		
	disbut();
	
}


function selectOnlyThis(id){
	  var myCheckbox = document.getElementsByName("opener");
	  Array.prototype.forEach.call(myCheckbox,function(e){
	    e.checked = false;
	  });
	  id.checked = true;
	}
function selectOnly(id){
	  var myCheckbox = document.getElementsByName("verbal");
	  Array.prototype.forEach.call(myCheckbox,function(el){
	    el.checked = false;
	  });
	  id.checked = true;
	}
function selectThis(id){
	  var myCheckbox = document.getElementsByName("motor");
	  Array.prototype.forEach.call(myCheckbox,function(ee){
	    ee.checked = false;
	  });
	  id.checked = true;
	}
	
</script>
<script type="text/javascript">
var sum;

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
    
    if(sum == 15){
		   $('#sel1').addClass('highlight');
	}
	else{
		 $('#sel1').removeClass('highlight');
	}
	
	if(sum <= 8 && sum > 3 ){
		   $('#sel2').addClass('highlight');
	}
	else{
		 $('#sel2').removeClass('highlight');
	}
	
	if(sum <= 3){
		   $('#sel3').addClass('highlight');
	}
	else{
		 $('#sel3').removeClass('highlight');
	}
}
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
var user2a;
       function doAjaxPost(user2) {
    	   // get the form values

    	      //  var name = $('#pname').val();
           
    	   var admitno = $('#admitno').val();
          user2a = user2;
   	
    $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/glasgow1.html",
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
	   
	           url: "/HMS/glasgow2/"+admitno+"/"+id+"",
	           async: false,
	         //  data: "admitno=" + admitno,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	       	   
	       	   $.each(response.list5, function(index, datec) {
	                   //to print name of employee
	              //     $("#date").append('<option value="'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'">'+datec.date+'</option>');
	               //    $("#date").selectpicker("refresh");
	        		//alert(datec.date)
	        		document.getElementById("date").value = datec.date;
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
		           // alert(datec.opener)
		               	if(datec.opener == "spontaneous") {
		            		
		            		document.getElementById('spontaneous').checked=true;
		            	}
		               	else if(datec.opener == "speech"){
		               		document.getElementById('speech').checked=true;
		               	}
		               	else if(datec.opener == "pain"){
		               		document.getElementById('pain').checked=true;
		               	}
		               	else if(datec.opener == "response"){
		               		document.getElementById('response').checked=true;
		               	}
		               	else{
		               		
		               	}
		           // alert(datec.verbal)
		            if(datec.verbal == "place") {
	            		
	            		document.getElementById('place').checked=true;
	            		//alert()
	            	}
		            
	               	else if(datec.verbal == "confused"){
	               		document.getElementById('confused').checked=true;
	               	}
	               	else if(datec.verbal == "words"){
	               		document.getElementById('words').checked=true;
	               	}
	               	else if(datec.verbal == "sound"){
	               		document.getElementById('sound').checked=true;
	               	}
	               	else if(datec.verbal == "noresp"){
	               		document.getElementById('noresp').checked=true;
	               	}
	               	else{
	               		
	               	}
		            //alert(datec.motor)
                    if(datec.motor == "obey") {
	            		
	            		document.getElementById('obey').checked=true;
	            	}
	               	else if(datec.motor == "withdraw"){
	               		document.getElementById('withdraw').checked=true;
	               	}
	               	else if(datec.motor == "abnormal"){
	               		document.getElementById('abnormal').checked=true;
	               	}
	               	else if(datec.motor == "extension"){
	               		document.getElementById('extension').checked=true;
	               	}
	               	else if(datec.motor == "noresponse"){
	               		document.getElementById('noresponse').checked=true;
	               	}
	               	else{
	               		
	               	}
		            	document.getElementById("grandtotal").value = datec.total;		
		            	if(datec.total == 15){
		            		   $('#sel1').addClass('highlight');
		            	}
		            	else{
		            		 $('#sel1').removeClass('highlight');
		            	}
		            	
		            	if(datec.total <= 8 && datec.total > 3){
		            		   $('#sel2').addClass('highlight');
		            	}
		            	else{
		            		 $('#sel2').removeClass('highlight');
		            	}
		            	
		            	if(datec.total <= 3){
		            		   $('#sel3').addClass('highlight');
		            	}
		            	else{
		            		 $('#sel3').removeClass('highlight');
		            	}
		            	
		            	   if ($(":checkbox[name='opener']:checked").length == 1)                                              
		           		    $(":checkbox[name='opener']:not(:checked)").prop('disabled', true);  
		           		   else                                                     
		           		    $(":checkbox[name='opener']:not(:checked)").prop('disabled', false); 
		           	
		         
		           		   if ($(":checkbox[name='verbal']:checked").length == 1)                                              
		           		    $(":checkbox[name='verbal']:not(:checked)").prop('disabled', true);  
		           		   else                                                     
		           		    $(":checkbox[name='verbal']:not(:checked)").prop('disabled', false); 
		        
		           	   
		           		   if ($(":checkbox[name='motor']:checked").length == 1)                                              
		           		    $(":checkbox[name='motor']:not(:checked)").prop('disabled', true);  
		           		   else                                                     
		           		    $(":checkbox[name='motor']:not(:checked)").prop('disabled', false); 
		           		
		           	   
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
       
       
       $(function () {
    	   $(":checkbox[name='opener']").change(function(){
    		   if ($(":checkbox[name='opener']:checked").length == 1)                                              
    		    $(":checkbox[name='opener']:not(:checked)").prop('disabled', true);  
    		   else                                                     
    		    $(":checkbox[name='opener']:not(:checked)").prop('disabled', false); 
    		 });
    	   $(":checkbox[name='verbal']").change(function(){
    		   if ($(":checkbox[name='verbal']:checked").length == 1)                                              
    		    $(":checkbox[name='verbal']:not(:checked)").prop('disabled', true);  
    		   else                                                     
    		    $(":checkbox[name='verbal']:not(:checked)").prop('disabled', false); 
    		 });
    	   $(":checkbox[name='motor']").change(function(){
    		   if ($(":checkbox[name='motor']:checked").length == 1)                                              
    		    $(":checkbox[name='motor']:not(:checked)").prop('disabled', true);  
    		   else                                                     
    		    $(":checkbox[name='motor']:not(:checked)").prop('disabled', false); 
    		 });
       });
       

       </script>
    	    </head>
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />'),glas()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Glasgow Coma Scale</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
     
    </ul>
    <br>
         <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e' id="back"  onclick="window.location.href='/HMS/doctor1';"></i>
  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1><button type="button" id="refresh" class="btn btn-warning button1"  onclick="location.href='glasgowcoma';">
	  <span class="fa fa-refresh"></span> Refresh</button>
	
	
<font size="5">Glasgow Coma Scale</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="button" id="myInput" class="form-control input-sm button2 btn btn-warning" value="Previous Records" onclick="doAjaxPost('<c:out value="${username}" />')" /></span>
	</h1>

<form id="forma" name="forma" action="glasgowcomasc.html" method="post"></form>


   <br>
	    
	    <div class="container">
 
  

  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Patient Details</a></li>
    <li><a data-toggle="pill" href="#menu1">GLASGOW COMA SCALE</a></li>
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
        <c:forEach var="p"  items="${list3}">
        <option value="${p.name}" data-subtext="${p.fileno},${p.admdate}" data-value="${p.name}=${p.pid}=${p.age}=${p.gender}=${p.fileno}=${p.admdate}=${p.wardno}=${p.doctsig}=${p.nursesig}=${p.admitno}">${p.name}</option>
        </c:forEach>
      </select>
       
	</div>
	      </div>
	      
	       <div class="col-xs-4">
	      
	       <div class="form-group">
         <p>Patient Id<span></span></p>
     <input type="text" name="pid" id="pid"  form="forma" class="form-control input-sm"  required>
       
       
       
	</div>
	      </div>
	      
	       <div class="col-xs-3">
	        <div class="form-group">
     
         <p>Admit No<span></span></p>
             <input type="text" name="admitno" id="admitno"  form="forma" class="form-control input-sm"  required>
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
     <input type="text" name="age" id="age"  form="forma" class="form-control input-sm"  >
     </div>
	      </div>
	      
	       <div class="col-xs-4">
	      <div class="form-group">
          <p>Gender<span></span></p>
     <input type="text" name="gender" id="gender"  form="forma" class="form-control input-sm">
       
     </div>
	      </div>
	      
	       <div class="col-xs-3">
	      <div class="form-group">
            <p>Admission Date<span></span></p>
     <input type="text" name="admdate" id="admdate"  form="forma" class="form-control input-sm" >
       
	</div>
	      </div>
	      
	      </div>
	      
	            <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	       <div class="form-group">
     
          <p>WardNo/BedNo<span></span></p>
     <input type="text" name="wardno" id="wardno"  form="forma" class="form-control input-sm"  >
     </div>
	      </div>
	      
	       <div class="col-xs-4">
	        <div class="form-group">
     
          <p>Current Date<span></span></p>
     <input type="text" name="date" id="date"  form="forma" class="form-control input-sm"  required>
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
      
      
            <div class="form-group row" >
	     <div class="col-xs-4"></div>
	       <div class="col-xs-3">
	        <div class="form-group">
	          
             <select class="selectpicker form-control" data-size="4" data-live-search="true" form="forma" name = "datec" id ="datec"  onchange="doAjaxPost1(this.value);this.selectedindex = -1">
          <option selected disabled>Select Date to fetch records</option>
        </select>
      </div>
	        </div>
	      </div>
	      
      
            <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      
	      
	        <div class="col-xs-8">
	     <div class="form-group">
	     
	     	    
  <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 900px;margin-left: 10px; " id="myTable1" >
    <thead>
      <tr>
        <th style="width:350px;border-bottom:solid;border-right: 1px solid;border-top:solid;border-left: solid;"">BEHAVIOR</th>
        <th style="width:300px;border-bottom:solid;border-right: 1px solid;border-top:solid;border-left: solid;"">RESPONSE</th>
        <th style="width:250px;border-bottom:solid;border-right: 1px solid;border-top:solid;border-left: solid;"">SCORE</th>
        <th style="width:100px;border-bottom:solid;border-right: solid;border-top:solid;border-left: solid;""></th>

<tr><th style="vertical-align:top;border-bottom:solid;border-right: 1px solid;border-top:solid;border-left: solid;" rowspan="4">Eye opening response</th><td  style="border-bottom:1px solid;border-right: 1px solid;border-top:solid;">Spontaneously</td><td style="border-bottom:1px solid;border-right: 1px solid;border-top:solid;"><center>4</center></td><td style="border-bottom:1px solid;border-right: solid;border-top:solid;"><center><input type="checkbox" align="middle" name="opener" id="spontaneous" class="slectOne" value="spontaneous" onClick="a(this,4);" form="forma" /></center></td></tr>    
<tr><td style="border-bottom:1px solid;border-right: 1px solid;">To speech</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>3</center></td><td style="border-bottom:1px solid;border-right:  solid;"><center><input type="checkbox" align="middle" name="opener" id="speech" class="slectOne" value="speech" onClick="a(this,3);" form="forma"  /></center></td></tr>
<tr><td style="border-bottom:1px solid;border-right: 1px solid;">To pain</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>2</center></td><td style="border-bottom:1px solid;border-right:  solid;"><center><input type="checkbox" align="middle"  name="opener" id="pain" value="pain" class="slectOne" onClick="a(this,2);"  form="forma"   /></center></td></tr>
<tr><td style="border-bottom:solid;border-right: 1px solid;">No response</td><td style="border-bottom:solid;border-right: 1px solid;"><center>1</center></td><td style="border-bottom:solid;border-right: solid;"><center><input type="checkbox" align="middle"  name="opener" id="response" value="response" class="slectOne" onClick="a(this,1);"  form="forma"  /></center></td></tr>
<span id="result"></span>

<tr><th  style="vertical-align:top;border-bottom:solid;border-right: 1px solid;border-left: solid;" rowspan="5">Best verbal response</th><td style="border-bottom:1px solid;border-right: 1px solid;border-right: 1px solid;">Oriented to time,place, and person</td><td style="border-bottom:1px solid;border-right:1px solid;"><center>5</center></td><td style="border-bottom:1px solid;border-right: solid;"><center><input type="checkbox" align="middle" class="slect"  name="verbal" id="place" value="place"  onClick="a(this,5);" form="forma" /></center></td></tr>    
<tr><td style="border-bottom:1px solid;border-right: 1px solid;">Confused</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>4</center></td><td style="border-bottom:1px solid;border-right: solid;"><center><input type="checkbox" align="middle"  name="verbal" id="confused" value="confused" class="slect" onClick="a(this,4);"   form="forma"  /></center></td></tr>
<tr><td style="border-bottom:1px solid;border-right: 1px solid;">Inappropriate words</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>3</center></td><td style="border-bottom:1px solid;border-right: solid;"><center><input type="checkbox" align="middle"   name="verbal" id="words"  class="slect" value="words" onClick="a(this,3);"  form="forma" /></center></td></tr>
<tr><td style="border-bottom:1px solid;border-right: 1px solid;">Incomprehensible sounds</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>2</center></td><td style="border-bottom:1px solid;border-right:  solid;"><center><input type="checkbox" align="middle"  name="verbal" id="sound" value="sound" class="slect" onClick="a(this,2);"  form="forma" /></center></td></tr>
<tr><td style="border-bottom:solid;border-right: 1px solid;">No response</td><td style="border-bottom:solid;border-right: 1px solid;"><center>1</center></td><td style="border-bottom:solid;border-right:  solid;"><center><input type="checkbox" align="middle"  name="verbal" id="noresp" class="slect" value="noresp"  onClick="a(this,1);"  form="forma" /></td></tr>
   <span id="resultset"></span>
              
              
  <tr><th style="vertical-align:top;border-bottom:solid;border-left: solid;" rowspan="6">Best motor response</th><td style="border-bottom:1px solid;border-right: 1px solid;">Obeys commands</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>6</center></td><td style="border-bottom:1px solid;border-right: solid;"><center><input type="checkbox" align="middle"  name="motor" id="obey" value="obey" class="selectoneof" onClick="a(this,6);"  form="forma"  /></center></td></tr>    
<tr><td style="border-bottom:1px solid;border-right: 1px solid;">Moves to localized pain</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>5</center></td><td style="border-bottom:1px solid;border-right: solid;"><center><input type="checkbox" align="middle"   name="motor" id="withdraw" value="withdraw" class="selectoneof" onClick="a(this,5);" form="forma" /></center></td></tr>
<tr><td style="border-bottom:1px solid;border-right: 1px solid;">Flexion withdrawal from pain</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>4</center></td><td style="border-bottom:1px solid;border-right: solid;"><center><input type="checkbox" align="middle"   name="motor" id="withdraw" value="withdraw" class="selectoneof" onClick="a(this,4);" form="forma" /></center></td></tr>
<tr><td style="border-bottom:1px solid;border-right: 1px solid;">Abnormal flexion(decorticate)</td><td style="border-bottom:1px solid;border-right: 1px solid;"><center>3</center></td><td style="border-bottom:1px solid;border-right:solid;"><center><input type="checkbox" align="middle"   name="motor" id="abnormal" value="abnormal" class="selectoneof" onClick="a(this,3);"  form="forma" /></center></td></tr>
<tr><td style="border-bottom:1px solid;border-right: 1px solid;">Abnormal extension(decerebrate)</td><td style="border-bottom:1px solid;border-right: 1px solid;;border-right: 1px solid;"><center>2</center></td><td style="border-bottom:1px solid;border-right:solid;"><center><input type="checkbox" align="middle"  name="motor" id="extension" value="extension" class="selectoneof"  onClick="a(this,2);"  form="forma" /></center></td></tr>
<tr><td style="border-bottom:solid;border-right: 1px solid;">No response</td><td style="border-bottom:solid;border-right: 1px solid;"><center>1</center></td><td style="border-bottom:solid;border-right: solid;"><center><input type="checkbox" align="middle"   name="motor" id="noresponse" value="noresponse" class="selectoneof" onClick="a(this,1);"  form="forma"/></center></td></tr>
  <span id="resu"></span>
  <tr><th style="border-bottom:solid;border-right: 1px solid;border-left: solid;">Total Score</th><td style="border-bottom:solid;border-right: 1px solid;"></td><td style="border-bottom:solid;border-right: 1px solid;"><center><input type="text" id="grandtotal" style="text-align:center;" name="total" value="0" form="forma"  ></center></p></td><td style="border-bottom:solid;border-right: solid;"></td></tr>  
     </thead>
    <tbody class="tbody"> </tbody>
    </table>   
     <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 600px;margin-left: 300px; " id="septable" >
    <thead>
    <tr id="sel1"><td style="display:none"></td><td style="border-left:solid;border-bottom:1px solid;border-right: 1px solid;border-top: solid;width:200px;">Best response</td><td style="border-bottom:1px solid;border-right: solid;border-top: solid;width:210px;"><center>15</center></td><td style="display:none;"></td></tr>
     <tr id="sel2"><td style="display :none;" ></td><td style="border-left:solid;border-bottom:1px solid;border-right: 1px solid;width:200px;">Comatose client</td><td style="border-bottom:1px solid;border-right: solid;width:210px;"><center>8 or less</center></td><td style="display:none;"></td></tr>
     
     <tr id="sel3"><td style="display :none; "></td><td style="border-left:solid;border-bottom:solid;border-right: 1px solid;width:200px;">Totally unresponsive</td><td style="border-bottom:solid;border-right: solid;width:210px;"><center>3</center><td style="display:none;"></td></tr>       
    </thead>
       <tbody class="tbody"> </tbody>
       </table>
       </div>
      
	      </div>	      
	      </div>
	      </div>
	      </div>
<button type="submit" value="submit" class="bouton-contact" id="bc" name="save" form="forma" >Save</button>
   </div>
   </div>
   <script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>