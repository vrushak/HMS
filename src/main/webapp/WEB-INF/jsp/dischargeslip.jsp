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


<link rel='stylesheet' href='<c:url value="/resources/css/print.css" />' type='text/css' media='print' />

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>

<style type="text/css">
.tab-pane{
width : auto;
border-style : groove;
border-radius : 10px;
height : 400px;
overflow-y : auto;

}
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
  max-width:1000px;
  width:100%;
  margin: 5% auto;
  background-color: #FFFFFF;
  overflow: hidden;
}
#form2 h1 {
  font-size: 18px;
  background: #009999 none repeat scroll 0% 0%;
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form2 {
  border-radius: 5px;
  max-width:1200px;
  width:100%;
  margin: 5% auto;
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
  width: 800px;
  height: 100px; 
  float: left;
  padding: 0px 15px;
}





.bouton-contact{
  background-color: #81BDA4;
  color: #FFF;
  text-align: center;
  width: 100%;
  border:0;
  padding: 17px 25px;
  border-radius: 0px 0px 5px 5px;
  cursor: pointer;
  margin-top: 40px;
  font-size: 18px;
}


#myTable {
    border-collapse: collapse;
    width: 100%;
    }
#myTable th {
    background-color: #009999;
    color: white;
   
}


#myTable  .tbody{
    height:300px;
    overflow-y:auto;
 }
#myTable .thead,.tbody{
  
    display:block;
  }

.modal-body{
	background-color: #eaeaea;
	height:auto;
	width: auto;
}  
.modal{
margin-top: -35px;

}
.button1{
	float : left;
}
.button2{
	float : right;
}
.btn-block{
 width : 1150px;
}
</style>
<script type="text/javascript">

function checkhome(user){
	
	
}

function ch(){
	if(document.getElementById("pname1").value == "select"){
		
	document.getElementById("bouton-contact").disabled = true; 
}
	else{
		document.getElementById("bouton-contact").disabled = false; 	
	}
}
function addcname(getval){
	var myname = getval.getAttribute('data-value');
	var str = myname.split('=');
	
	document.getElementById("pid").value=str[0];
	
	 $('select[name=pname]').val(str[1]);
	 $('#pname').selectpicker('refresh');
	//document.getElementById("pname").value =str[1];
	
	document.getElementById("dname").value = str[2];
	
	document.getElementById("docid").value = str[3];
	
	document.getElementById("admdate").value = str[4];
	
	document.getElementById("fileno").value = str[5];
	document.getElementById("admitno").value = str[6];
	document.getElementById("treatment").value = str[7];
    document.getElementById("wardno").value = str[8];
	document.getElementById("age").value = str[9];
	document.getElementById("gender").value = str[10];
	document.getElementById("flno").innerHTML = str[5];
    document.getElementById("id").innerHTML = str[0];
    document.getElementById("nm").innerHTML = str[1]; 	
}


function copy(pid){

	var strSplit = pid.split('=');


   document.getElementById("pid").value = strSplit[0];
   
  
   
 //  $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
  // $("#pname").selectpicker("refresh");
   
   $('select[name=pname]').val(strSplit[1]);
	 $('#pname').selectpicker('refresh');
 
 //document.getElementById("pname1").disabled = true; 
// document.getElementById("bouton-contact").disabled = true; 
 
   
 //  document.getElementById("pname").value = strSplit[1];
   document.getElementById("pname").disabled = true; 
   
  
   document.getElementById("dname").value = strSplit[2];
   
   document.getElementById("docid").value = strSplit[3];
  
   document.getElementById("admdate").value = strSplit[4];

   
   document.getElementById("disdate").value = strSplit[5];
 
   document.getElementById("admitno").value = strSplit[6];

   document.getElementById("fileno").value = strSplit[7];
   
   document.getElementById("wardno").value = strSplit[8];
   
   document.getElementById("age").value = strSplit[9];
   
   document.getElementById("gender").value = strSplit[10];
  
   //document.getElementById("treatment").value = treat;
   
  // document.getElementById("dissum").value = dissum;
  
  // document.getElementById("investigation").value = investigation;
   
  // document.getElementById("management").value = management;
  
   document.getElementById("revisit").value =strSplit[11];
   
   document.getElementById("ec").value = strSplit[12];
   
   document.getElementById("amno").value = strSplit[13];
   document.getElementById("flno").innerHTML = strSplit[7];
   document.getElementById("id").innerHTML = strSplit[0];
   document.getElementById("nm").innerHTML = strSplit[1]; 	
   $('#myModal').modal('show');
}
function date(){
	//document.getElementById("disdate").valueAsDate = new Date();
	
	var hid = document.getElementsByClassName("hidetd");
	for(var i =0;i<hid.length;i++){
		hid[i].style.display = "none";
	}
}


function clos(){
	window.location.reload();
}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
	    window.location = "/HMS/dslip"
	}
	
}
</script>
 <script type="text/javascript">
       function doAjaxPost(userid) {
    	   // get the form values
    	   
    	         //  var name = $('#pname').val();
    	   
    	           $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/discharge1/"+userid+"",
    	        	       
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           
    	        	           success: function(response){
    	        	        
    	        	        	   $.each(response, function(index, datec) {
    	        	        		   var user = datec.username;
    	        	        		   
    	        	           		   if(user.includes("dbfdesk")){
    	        	        				 var url = "/HMS/frontdesk" ;
    	        	        					
    	        	        				 var element = document.getElementById('ho');
    	        	        				 element.setAttribute("href",url)
    	        	        				 document.getElementById("cs").disabled = true;
    	        	        				 document.getElementById("bouton-contact").disabled = true;
    	        	        			}
    	        	        		   else if(user.includes("A-")){
   	        	        				
   	        	        				var url = "/HMS/frontdesk" ;
   	        	        				
   	        	        				 var element = document.getElementById('ho');
   	        	        				 element.setAttribute("href",url)	
   	        	        				 
   	        	        				 document.getElementById("cs").disabled = true;
   	        	        				 document.getElementById("bouton-contact").disabled = true;
   	        	        				 
   	        	        			}
    	        	        			else if(user.includes("D-")){
    	        	        				
    	        	        				var url = "/HMS/doctor1" ;
    	        	        				
    	        	        				 var element = document.getElementById('ho');
    	        	        				 element.setAttribute("href",url)
    	        	        				 
    	        	        				  
	                                           var url1 = "/HMS/myapps/"+user+"" ;
			                                   var element1 = document.getElementById('hc');
			                                   element1.setAttribute("href",url1)
			                                      
			                                   var url3 = "/HMS/prescription/"+user+"" ;
   	    		                              var element3 = document.getElementById('hp');
                                               element3.setAttribute("href",url3)
	 
	                                           
			                                   var url2 = "/HMS/treatment/"+user+"" ;
			                                   var element = document.getElementById('m2');
			                             	    element.setAttribute("href",url2) 
		  
    	        	        			}
    	        	        			else{
    	        	        				
    	        	        				 var url = "/HMS/home" ;
    	        	        					
    	        	        				 var element = document.getElementById('ho');
    	        	        				 element.setAttribute("href",url)
    	        	        				 
    	        	        				  var url1 = "/HMS/myapps/"+user+"" ;
			                                   var element1 = document.getElementById('hc');
			                                   element1.setAttribute("href",url1)
			                                      
			                                   var url3 = "/HMS/prescription/"+user+"" ;
 	    		                              var element3 = document.getElementById('hp');
                                             element3.setAttribute("href",url3)
	 
	                                           
			                                   var url2 = "/HMS/treatment/"+user+"" ;
			                                   var element = document.getElementById('m2');
			                             	    element.setAttribute("href",url2) 
    	        	        			}
    	        	               });    
    	        	           },
    	        	           error: function(e){
    	        	        	  
    	        	        	           alert('Error: ' + e);
    	        	        	  
    	        	        	           }
    	        	        	           });
    	        	        	   
    	        	        	           }

       </script>

    <script>
   
   $(function () {
	    $(document).on('click','#myTable .tbody tr', function () {
	   // 	$('.success').removeClass('success');
	   //     $(this).addClass('success');
	        
	        var x=this.cells;
	        document.getElementById("treatment").value = x[6].innerHTML;
	        document.getElementById("investigation").value = x[7].innerHTML;
	        document.getElementById("management").value = x[8].innerHTML;
	    
        
	       
	      
	     
	    });
	    
   });
   
   </script>    

</head>
<body onload="date(),doAjaxPost('<c:out value="${pageContext.request.userPrincipal.name}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Discharge Slip</a>
    </div>
    <ul class="nav navbar-nav">
    <li class="active"><a id="ho" href ="">Home</a></li>
   <!-- <li class=""><a id="hc" href="">My Appointments</a></li>
    <li class=""><a id="hp" href="">General Checkup</a></li>
 <li class=""><a id="m2" href="">Treatment Records</a></li> -->
            </ul>
  </div>
</nav>
  <center>
</center>
  <form id="form1" action="" method="">  
 
    
	  <h1>
	  <button type="button" id="cs" class="btn btn-warning button1" data-toggle="modal" data-target="#myModal">
	  <span class="glyphicon glyphicon-plus"></span>Create Slip</button>
<font size="5">Discharge Slip History</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Patient Name or Id"  style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 960px; " id="myTable">
    <thead class="thead"> 
      <tr>
        <th width="155px;"class="">Patient Id</th>
        <th width="155px;"class="">Patient Name</th>
        <th width="155px;" class="">Doctor Name</th>
        <th width="160px;"class="">Date of admission</th>
        <th width="165px;" class="">Date of Discharge</th>
        <th width="165px;">View</th>
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list2}">
    <tr>
    <td width="155px;">${p1.pid}</td>
    <td width="155px;">${p1.pname}</td>
    <td width="155px;">${p1.dname}</td>
     <td width="160px;">${p1.admdate}</td>
    <td width="165px;">${p1.disdate}</td>
    <td width="165px;"><i class="fa fa-eye" style="color:#00b300" onclick="copy('${p1.pid}=${p1.pname}=${p1.dname}=${p1.docid}=${p1.admdate}=${p1.disdate}=${p1.admitno}=${p1.fileno}=${p1.wardno}=${p1.age}=${p1.gender}=${p1.revisit}=${p1.ec}=${p1.amno}')"></i></td>
     <td class="hidetd">${p1.treatment}</td>
     <td class="hidetd">${p1.investigation}</td>
     <td class="hidetd">${p1.management}</td>
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
     <button type="" class="bouton-contact" onclick="" ></button>
     </form>
      <div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
      <div id="form2">
          <h1>  <button type="submit" class="btn btn-warning button1" form ="formd" id="bouton-contact" onclick="" >Save</button> 
        Discharge Slip
         <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>    
      
        </h1>
        
       <br>
      <form id="formd" action="/HMS/saveds.html" method="post"></form>
  
 <div class="container">
<button type="button" class="btn btn-primary btn-block"><span style="float:left">Discharge Slip</span><span id="flno" style="float:right">Fileno</span><span id="id" style="float:right;margin-right:15px;">Id</span><span style="float:right;margin-right:25px;" id="nm">Name</span></button>
 <br>
  <ul class="nav nav-pills nav-stacked col-md-2">
    <li class="active"><a data-toggle="pill" href="#home1">Patient Details</a></li>
    <li><a data-toggle="pill" href="#home">Diagnosis and Results</a></li>
    <li><a data-toggle="pill" href="#menu1">Revisit and Emergency contact</a></li>
   
   
  </ul>
  <div class="tab-content col-md-10">
  <!-- Home1-->
   
   <div id="home1" class="tab-pane fade in active">
   <br>
    
   
   <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control" data-size="6" data-live-search="true"name = "pname" id ="pname" onchange="addcname(this.options[this.selectedIndex])"    required>
          <option value="select" selected disabled>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option data-subtext="${p.fileno},${p.admitno}" value="${p.pname}" data-value="${p.pid}=${p.pname}=${p.dname}=${p.docid}=${p.admdate}=${p.fileno}=${p.admitno}=${p.cause}=${p.wardno}=${p.age}=${p.gender}">${p.pname}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  
   <div class="col-xs-3">
  <div class="form-group">
 <p>Patient Id<span>*</span></p>
  <input type="text" name="pid" id="pid" form="formd" class="form-control input-sm" readonly="readonly" required>
  </div>
  </div>   
  
  <div class="col-xs-2">
  <div class="form-group">
 <p>Age<span></span></p>
  <input type="text" name="age" id="age" form="formd" class="form-control input-sm" readonly="readonly">
  </div>
  </div> 
  
    <div class="col-xs-2">
  <div class="form-group">
<p>Gender<span></span></p>
  <input type="text" name="gender" id="gender" form="formd" class="form-control input-sm"  readonly="readonly">
  </div>
</div>
 
</div>



 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
   <div class="form-group">
 <p>File No<span></span></p>
  <input type="text" name="fileno" id="fileno" form="formd" readonly="readonly" class="form-control input-sm"  >
  </div>
  </div>   
  
 
   <div class="col-xs-4">
   <div class="form-group">
<p>Admission No<span></span></p>
  <input type="text" name="admitno" id="admitno" form="formd" class="form-control input-sm"  >
  </div>
 
 </div>
 
    <div class="col-xs-3">
  <div class="form-group">
<p>Ward No/Bed No<span></span></p>
  <input type="text" name="wardno" id="wardno" form="formd" class="form-control input-sm" >
  </div>
</div>
 
</div>

   <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
   <div class="form-group">
 <p>Date of admission<span>*</span></p>
  <input type="text" name="admdate" id="admdate" form="formd" readonly="readonly" class="form-control input-sm" required >
  </div>
  </div>   
 
   <div class="col-xs-4">
   <div class="form-group">
<p>Date of discharge<span>*</span></p>
<div class='input-group date' id='datetimepicker1'>
  <input type="text" name="disdate" id="disdate" form="formd" class="form-control input-sm"  required>
   <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
   </div>
   
</div>
 </div>
 
   <div class="col-xs-3">
   <div class="form-group">
 <p>Doctor Name<span></span></p>
  <input type="text" name="dname" id="dname" form="formd" readonly="readonly" class="form-control input-sm"  >
  <input type="hidden" name="docid" id="docid" form="formd" readonly="readonly" class="form-control input-sm"  >
  </div>
  </div>   
   
 
</div>


  


 
   </div>
   
    <div id="home" class="tab-pane fade">
    
    
    <div class="form-group row" >
   
 
   <div class="col-xs-1"></div>
    <div class="col-xs-8">
<div class="form-group">
            <p>Diagnosis<span></span></p>
            <textarea name="treatment" id="treatment" rows="5" form="formd" ></textarea>
</div>
</div>

</div>

<div class="form-group row" >
   
 
   <div class="col-xs-1"></div>
    <div class="col-xs-8">
<div class="form-group">
            <p>Results<span></span></p>
            <textarea name="investigation" id="investigation" rows="5" form="formd"></textarea>
</div>
</div>

</div>

<div class="form-group row" >
   
 
   <div class="col-xs-1"></div>
    <div class="col-xs-8">
<div class="form-group">
            <p>Advice<span></span></p>
            <textarea name="management" id="management" rows="5" form="formd" ></textarea>
</div>
</div>

</div>
    </div>
    
      <div id="menu1" class="tab-pane fade">
    
    <div class="form-group row" >
   
<div class="col-xs-1"></div>
    <div class="col-xs-3">
<div class="form-group">
            <p>Revisit<span>*</span></p>
            <div class='input-group date' id='datetimepicker2'>
            <input type="text" class="form-control input-sm" name="revisit" id="revisit" rows="4" form="formd" >
            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
  </div>
</div>
</div>

  <div class="col-xs-3">
<div class="form-group">
            <p>Emergency Contact<span>*</span></p>
            <input type="number" class="form-control input-sm" name="ec" id="ec" rows="4" form="formd">
</div>
</div>


  <div class="col-xs-3">
<div class="form-group">
            <p>Ambulance No<span></span></p>
            <input type="number" maxlength="14" class="form-control input-sm" name="amno" id="amno" rows="4" form="formd" >
</div>
</div>


</div>
    </div>
    </div>
  </div>
 
 <button type="" class="bouton-contact"  onclick="" ></button>
  
      
</div> 
  
  
    </div>

 </div>
 
 </div>
 
 <script type="text/javascript">
   
$(function () {
	
$('.date').datetimepicker({
	 
	
	useCurrent: false,
	format: "dd-mm-yyyy hh:ii",
	collapse:false,
	
    autoclose: true,
    todayBtn: true
   
	
});
$('#disdate').val(moment().format("DD-MM-YYYY HH:mm"));
   
   
$('#datetimepicker2').datetimepicker({
	 
	
	useCurrent: false,
	format: "dd-mm-yyyy hh:ii",
	collapse:false,
	
    autoclose: true,
    todayBtn: true
   
	
});
$('#revisit').val(moment().format("DD-MM-YYYY HH:mm"))
});
</script>  
 
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