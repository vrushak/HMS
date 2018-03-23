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
<title>CMS Wedge </title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel='stylesheet' href='<c:url value="/resources/css/discharge.css" />' type='text/css' media='all' />
<link rel='stylesheet' href='<c:url value="/resources/css/print.css" />' type='text/css' media='print' />

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-confirm.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >


<script type="text/javascript" src="/HMS/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-confirm.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.min.js"></script>


<style type="text/css">
 div.jconfirm-title-c {
    background-color: #009999;
    font-size : 18px;
    color : white;
    text-align : center;
    }
.jconfirm-buttons button{
color : orange;
}


pre::first-line { 
   font-weight: bold;
}
</style>
<script type="text/javascript">
function goBack() {
    window.history.back();
}


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
	  $("#formd").trigger("reset");
	  $('#investigation').val("")	
	$('#disdate').val(moment().format("DD-MM-YYYY HH:mm"));
	var myname = getval.getAttribute('data-value');
	var str = myname.split('=');
    assUrl(str[1],str[5])
	document.getElementById("pid2").value=str[0];
	
	 $('select[name=pname]').val(str[1]);
	 $('#pname').selectpicker('refresh');
	 
	 $('select[name=fileid]').val('select');
	 $('#fileid').selectpicker('refresh');
	//document.getElementById("pname").value =str[1];
	
	document.getElementById("dname1").value = str[2];
	document.getElementById("docid").value = str[3];
	
	document.getElementById("admdate").value = str[4];
	
	document.getElementById("fileno1").value = str[5];
	document.getElementById("admitno").value = str[6];
	  document.getElementById("wardno").value = str[8];
	   
	   document.getElementById("age").value = str[9];
	   
	   document.getElementById("gender").value = str[10];

	   doAjaxPostfl(str[0],str[5])
}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/discharge.html";
	}
}
var invsg;
function copy(pid){

	var strSplit = pid.split('=');

    document.getElementById("pid2").value = strSplit[0];
	   
    assUrl(strSplit[1],strSplit[7])
	   
	   $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
	   $("#pname").selectpicker("refresh");
	   
	//   $('select[name=pname]').val(strSplit[1]);
	//	 $('#pname').selectpicker('refresh');
	 
	 //document.getElementById("pname1").disabled = true; 
	// document.getElementById("bouton-contact").disabled = true; 
	 
	   
	 //  document.getElementById("pname").value = strSplit[1];
	   document.getElementById("pname").disabled = true; 
	   
	  
	   document.getElementById("dname1").value = strSplit[2];
	   
	   document.getElementById("docid").value = strSplit[3];
	  
	   document.getElementById("admdate").value = strSplit[4];

	   
	   document.getElementById("disdate").value = strSplit[5];
	 
	   document.getElementById("admitno").value = strSplit[6];

	   document.getElementById("fileno1").value = strSplit[7];
	   
	   document.getElementById("wardno").value = strSplit[8];
	   
	   document.getElementById("age").value = strSplit[9];
	   
	   document.getElementById("gender").value = strSplit[10];
	  $("#dissum").val(strSplit[12])
	  
	  // document.getElementById("dissum").value = dissum;
	  
	   document.getElementById("investigation").value = strSplit[11];
	   
	   doAjaxPostfl(strSplit[0],strSplit[7]);
	   
	   
	   
	   $( "#myModal" ).dialog( "open" );
}
function date(){
	
var hid = document.getElementsByClassName("hidetd");
for(var i =0;i<hid.length;i++){
	hid[i].style.display = "none";
}
}


function clos(){
	window.location.reload();
}

function refresh(){
	$('#prv').text('');
}

function ze(){
	
	 if($("#pname").val() == 'select'){
		 alert("Please select Patient Name")
		 return false;
	 }
	 else if($("#disdate").val().length == 0){
		 alert("Please select Discharge date")
	     return false;
	 }
	 else if($("#investigation").val().length == 0){
		 alert("Please fill out summary details")
	     return false;
	 }
	 else{
		 
	 }
	$.confirm({
	    title: 'Freeze Discharge Summary',
	    content: 'Freeze Discharge Summary editing for current patient?<br>Click CONFIRM to Freeze<br>Click CANCEL to continue editing',
	    buttons: {
	        confirm: function () {
	            $("#freeze").val("yes")
	            $("#formd").submit();
	        },
	        cancel: function () {
	            $("#freeze").val("no")
	            $("#formd").submit();
	         }
	       
	    }
	});
	$("#dissum").val('<c:out value="${pageContext.request.userPrincipal.name}" />  '+moment().format("DD-MM-YYYY hh:mm"))
	
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
   	        	        				$("#back").hide();
   	        	        				 var element = document.getElementById('ho');
   	        	        				 element.setAttribute("href",url)	
   	        	        				 
   	        	        				 document.getElementById("cs").disabled = true;
   	        	        				 document.getElementById("bouton-contact").disabled = true;
   	        	        				 
   	        	        			}
    	        	        			else if(user.includes("D-")){
    	        	        				
    	        	        				var url = "/HMS/doctor1" ;
    	        	        				 $("#back").hide();
    	        	        				
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
       <script type="text/javascript">
       function doAjaxPostfl(pid,file) {
    	   // get the form values
    	   
    	   $('#prv').text("")
    	 $('#fileid').find('option').not(':first').remove()
    	          // var pid = $('#pid').val();
    
    	    $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/dischargefile?location1="+pid+"&location2="+file+"",
    	        	           async :false,
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           
    	        	           success: function(response){
    	        	        
    	        	        	   $.each(response, function(index, datec) {
    	        	        		   var user = datec.username;
    	        	        		   if ($("#fileid option[value="+datec.fileno+"]").length == 0){
    	        	     	               
    	        	                	   $("#fileid").append('<option value="'+datec.fileno+'" data-subtext="'+datec.date+'" >'+datec.fileno+'</option>');
    	        	                   
    	        	                   $("#fileid").selectpicker("refresh");
    	        	                  
    	        	                   }
    	        	        		   

    	   	                    });
    	        	        	 //  $('select[name =fileid]').val(file);
    	        	      		 //$('#fileid').selectpicker('refresh');
    	        	           },
    	        	           error: function(e){
    	        	        	  
    	        	        	           alert('Error: ' + e);
    	        	        	  
    	        	        	           }
    	        	        	           });
    	        	        	   
    	        	        	           }

       </script>
 <script>
 /*
  $( function() {
	  var url = "HMS/prescription";
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
 
    $( "#opener" ).on( "click", function() {
    	var isOpen = $( "#result" ).dialog( "isOpen" );
      if(isOpen == true){
    	  
    	  $( "#result" ).dialog( "open" );
      }
      else{
    	
    	doAjaxPost1(),
    	 $( "#result" ).dialog( "open" );
      }
    
    });
    $('#result').dialog({height: 500, width:600 });
   
    
  });
 */
  </script>
   <script>
  $( function() {
	  var newBtn = '<button type="button" class="btn btn-warning button3"  id="bouton-contact" onclick="ze();" >Save</button>';
	  var newBtn1 = '<button type="button" id="close" class="btn btn-warning button4" onclick="clos()">Close</button>';
    $( "#myModal" ).dialog({
    	
    	dialogClass: 'mymodal',
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }, 
      create: function() {
          $(this).prev('.ui-dialog-titlebar').find('.ui-dialog-title').after(newBtn)
          $(this).prev('.ui-dialog-titlebar').find('.ui-dialog-title').after(newBtn1)
      }
      
    });
    //$(".mymodal").children(".ui-dialog-titlebar").append(""<span class='ui-icon ui-icon-help'></span>");

   
    $( "#cs" ).on( "click", function() {
      $( "#myModal" ).dialog( "open" );
    });
    $('#myModal').dialog({height: 600, width :1200});
    $(".ui-dialog").find(".ui-widget-header").css("background", "#009999","text-align","center");
    

    
  });
  </script>
  
<script>
        function doAjaxPost1(val) {
    	   // get the form values
    	   // $('#investigation').val("");
    	   
    	  var counter = 1;
    	 
    	          var pid = $('#pid2').val();
    	          var fileno = $('#fileno1').val();
    	 if(pid.length == 0){
    		 alert("Please select the Patient")
    		 return false;
    	 }
    	 if(val != "cur"){
    		 
    		 fileno = $('#fileid').val();
    		
    	    if(fileno.includes("select")){
    		 alert("Please select the fileno")
    		 return false;
    	 }
    	    
    	 }
    	 
    	 
    	            $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/prescription1/"+fileno+"/"+pid+"",
    	        	           async: false,
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           
    	        	          
    	        	           
    	        	          
    	             
    	             success: function(response){
      	        	  /*
    	             $.each(response.list3, function(index, addn) {
      	                    //to print name of employee
      	                  
      	               var newTextBoxDiv0 = $(document.createElement('div'))
                        .attr("class", 'form-group')
                   newTextBoxDiv0.after().html('<label for="df">'+addn.buttonl+' :</label><textarea class="form-control" rows="2" id="df">'+addn.df+'</textarea>');
                   newTextBoxDiv0.appendTo('#result');
                     counter++;
	            	  
	                    }),
	                    */
      	               /*
      	             $.each(response.list6, function(index, addn) {
      	            	 
      	            	 document.getElementById("pc").value =addn.pc;
            	           
    	            	   document.getElementById("pmsh").value=addn.pmsh;
    	            	  
    	            	   document.getElementById("ph").value = addn.ph;
    	            	   document.getElementById("dhr").value = addn.dh;
    	            	   document.getElementById("fh").value = addn.fh;
    	            	   document.getElementById("ogh").value = addn.ogh;
    	            	   document.getElementById("psh").value = addn.psh;
    	            	 //  document.getElementById("sge").value= addn.sge;
    	            	   document.getElementById("scv").value = addn.scv;
    	            	   document.getElementById("sres").value= addn.sres;
    	                   document.getElementById("sgas").value =addn.sgas;
    	                   document.getElementById("smusc").value =addn.smusc;
  	            	   document.getElementById("sgenit").value=addn.sgenit;
  	            	   document.getElementById("sendoc").value = addn.sendoc;
  	            	   document.getElementById("sskin").value= addn.sskin;
  	            	   document.getElementById("scns").value = addn.scns;
  	            	   document.getElementById("pge").value = addn.pge;
  	            	   document.getElementById("poc").value = addn.poc;
  	            	   document.getElementById("pns").value= addn.pns;
  	            	   document.getElementById("pcv").value = addn.pcv;
  	            	   document.getElementById("prs").value= addn.prs;
  	                   document.getElementById("pas").value =addn.pas;
  	                   document.getElementById("pds").value =addn.pds;
  	            	   document.getElementById("pir").value=addn.pir;
  	            	   
  	            	   unsaved = false;
      	           });
       	          */
    	            	 if(response.list19.length == 0){
    	    	           	   alert("No records found for this "+ fileno)
    	    	       	    	
    	    	            	}  
       	       $.each(response.list19, function(index, addn) {
  	            	
       	    	   
       	       if(val.includes('cur')){
  	            		
  	            		$("#investigation").val(addn.diagnose);
  	            	//	var head = document.getElementById("investigation").value;
  	            	//	$("#investigation").val(head+"\n"+"Last Modified"+'<c:out value="${pageContext.request.userPrincipal.name}" />  '+moment().format("DD-MM-YYYY hh:mm"))
  	      	           }
  	            	else{
  	               $('#prv').val("")
  
  	           	   $('#prv').text(addn.diagnose);    	
  	               var ha = "<span><b>Discharge Summary :</b></span>"
  	               var db = "<span>"+addn.iop+"<span>"
  	      
  	               if(addn.iop != undefined){
  	            	 $("#prv").append("\n"+ha);
    	               $("#prv").append(db);
  	               }
  	               
  	            	}
       	    
       	    	  unsaved = false;
       	       });
       	        
      	        
      	           },
      	           error: function(e){
      	        	  
      	        	           alert('Error: ' + e);
      	        	  
      	        	           }
      	        	           });
      	        
    	             unsaved = false;
    	          
      	        	           }
    	        	        	   
    	        	        	           


      

       
       
       </script>
      
       <style>
#result.ui-dialog-content{
 
 overflow :auto;   
}

#myModal.ui-dialog-content {

 overflow :auto;   
}
​

</style>
   <script>
   
   $(function () {
	    $('#myTable .tbody tr').on('click', function () {
	   // 	$('.success').removeClass('success');
	   //     $(this).addClass('success');
	        
	        var x=this.cells;
	    
	        var encodedStr = x[6].innerHTML;
	        var as1 = decodeURI(encodedStr);
	        var parser = new DOMParser;
	        var dom = parser.parseFromString(as1,'text/html');
	        var decodedString = dom.body.textContent;
	        
	        
	        document.getElementById("investigation").value = decodedString;
	    
        
	       
	      
	     
	    });
	    
   });
   function assUrl(pname,file){
	   $('#tr').attr('href','/HMS/treatment1?location='+pname+'&location2='+file+'')	
	   $('#ipd').attr('href','/HMS/ipdpr1?location='+pname+'&location2='+file+'')	
	   $('#dr').attr('href','/HMS/drugchart1aa?location1='+pname+'&location2='+file+'')	
   }
   
   function chpn(id){
	   if($('#pname').val() == "select"){
		   alert('Please select the Patient Name')
		   return false;
	   }
	   else{
		   return true;
	   }
   }
   </script>    

</head>
<body onload="date(),doAjaxPost('<c:out value="${pageContext.request.userPrincipal.name}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Discharge Summary</a>
    </div>
    <ul class="nav navbar-nav">
    <li class="active"><a id="ho" href ="">Home</a></li>
   <!-- <li class=""><a id="hc" href="">My Appointments</a></li>
    <li class=""><a id="hp" href="">General Checkup</a></li>
 <li class=""><a id="m2" href="">Treatment Records</a></li> -->
            </ul>
     <ul class="nav navbar-nav navbar-right">
  <li><a href="/HMS/doctor1" id="back" ><span class="glyphicon glyphicon-user"></span><span id="tit">Back to Doctor Home </span></a></li>
    </ul>  </div>
</nav>
  <center>
</center>
  <form id="form1" action="" method="">  
 
    
	  <h1>
	  <button type="button" id="cs" class="btn btn-warning button1">
	  <span class="glyphicon glyphicon-plus"></span>Create Summary</button>
<font size="5">Summary History</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Patient Name or Id"  style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 960px; " id="myTable">
    <thead class="thead"> 
      <tr>
        <th width="155px;">Patient Id</th>
        <th width="155px;">Patient Name</th>
        <th width="155px;">Doctor Name</th>
        <th width="160px;">Date of Admission</th>
        <th width="165px;">Date of Discharge</th>
        <th width="145px;">View</th>
        <th width="20px;"></th>
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
    <td width="145px;"><i class="fa fa-eye" style="color:#00b300" onclick="copy('${p1.pid}=${p1.pname}=${p1.dname}=${p1.docid}=${p1.admdate}=${p1.disdate}=${p1.admitno}=${p1.fileno}=${p1.wardno}=${p1.age}=${p1.gender}=${p1.freeze}=${p1.dissum}')"></i></td>
    <td class="hidetd">${p1.investigation}</td>
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
     <button type="" class="bouton-contact" disabled onclick="" ></button>
     </form>
      <div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
 
  
    
   
 



 </div>
 </div>
 <div id="myModal" title="Discharge Summary">
 <div class="col-md-9" style="">
       <form id="formd" action="/HMS/saved.html" method="post"></form>
 
      <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control" data-size="6" data-live-search="true"name = "pname" id ="pname" onchange="addcname(this.options[this.selectedIndex])"    required>
          <option value="select" selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option data-subtext="${p.fileno},${p.admitno}" value="${p.pname}" data-value="${p.pid}=${p.pname}=${p.dname}=${p.docid}=${p.admdate}=${p.fileno}=${p.admitno}=${p.cause}=${p.wardno}=${p.age}=${p.gender}">${p.pname}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  
   <div class="col-xs-3">
  <div class="form-group">
 <p>Patient Id<span>*</span></p>
  <input type="text" name="pid" id="pid2" form="formd" class="form-control input-sm" readonly="readonly" required>
  </div>
  </div>   
  
  <div class="col-xs-2">
  <div class="form-group">
 <p>Age<span>*</span></p>
  <input type="text" name="age" id="age" form="formd" class="form-control input-sm" readonly="readonly" required>
  </div>
  </div> 
  
    <div class="col-xs-2">
  <div class="form-group">
<p>Gender<span>*</span></p>
  <input type="text" name="gender" id="gender" form="formd" class="form-control input-sm"  readonly="readonly" required>
  </div>
</div>
 
</div>

<input type="hidden" name="docid" id="docid" form="formd">

 <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
   <div class="form-group">
 <p>Patient File No<span>*</span></p>
  <input type="text" name="fileno" id="fileno1" form="formd" readonly="readonly" class="form-control input-sm"  >
  </div>
  </div>   
  
 
   <div class="col-xs-4">
   <div class="form-group">
<p>Admission No<span>*</span></p>
  <input type="text" name="admitno" id="admitno" form="formd" class="form-control input-sm"  required>
  </div>
 
 </div>
 
    <div class="col-xs-3">
  <div class="form-group">
<p>Ward No/Bed No<span>*</span></p>
  <input type="text" name="wardno" id="wardno" form="formd" class="form-control input-sm"  required>
  </div>
</div>
 
</div>

   <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
   <div class="form-group">
 <p>Date of Admission<span>*</span></p>
  <input type="text" name="admdate" id="admdate" form="formd" readonly="readonly" class="form-control input-sm"  >
  <input type="hidden" name="freeze" id="freeze" form="formd">
  </div>
  </div>   
 
   <div class="col-xs-4">
   <div class="form-group">
<p>Date of Discharge<span>*</span></p>
<div class='input-group date' id='datetimepicker1'>
  <input type="text" name="disdate" id="disdate" form="formd" class="form-control input-sm"  required>
   <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
   </div>
   
</div>
 </div>
 
   <div class="col-xs-3">
   <div class="form-group">
 <p>Doctor Name<span>*</span></p>
  <input type="text" name="dname" id="dname1" form="formd" readonly="readonly" class="form-control input-sm"  >
  </div>
  </div>   
   
 
</div>
<div class="form-group row" >
  
 
   <div class="col-xs-1"></div>
    <div class="col-xs-3">
   <div class="form-group">
    <button  id="opener" style="color:#fff;" class="btn btn-warning button1" onclick="return doAjaxPost1('cur')">Fetch Patient Records</button>
  
   </div>
   </div>
  
   <div class="col-xs-3">
   <div class="form-group">
  <a href="treatment.html" id="tr" target="_blank" style="color:#fff;" onclick="return chpn(this)" class="btn btn-warning button1">Treatment Records</a>
   </div>
   </div>
   
   <div class="col-xs-2">
   <div class="form-group">
  <a href="drugchart.html" id="dr" target="_blank"  onclick="return chpn(this)" style="color:#fff;" class="btn btn-warning button1">Drug Chart</a>
  </div>
   </div>
   
   <div class="col-xs-2">
   <div class="form-group">
  <a href="ipdpr.html" id="ipd" target="_blank" style="color:#fff;"  onclick="return chpn(this)" class="btn btn-warning button1">View Prescription</a>
  </div>
   </div>
   </div>

<div class="form-group row" >
  
 
   <div class="col-xs-1"></div>
    <div class="col-xs-8">
    <p>Summary<span>*</span></p>
<div class="form-group">
           
            <textarea name="investigation" id="investigation" rows="5" form="formd" required></textarea>
</div>
</div>

</div>
  <span style="float:left;"><b>Last Modified : </b><input type="text" name="dissum" id="dissum" form="formd" style="border:none;" readonly="readonly"></span> 
  
</div>

   

    
<div class="col-md-3" id="mypanel" style="border-style:ridge;border-width:2px;">
<div class="col-xs-9" >
   <p>Previous File No<span>*</span></p>
   <select class="selectpicker form-control" data-size="6" data-live-search="true" name = "fileid" id ="fileid" onchange="refresh()"  required>
          <option value="select" selected>Select</option>
          </select>
       
        </div>
        <br><br>
    <i class="fa fa-angle-double-down" style="font-size:36px;color:orange;"onclick="return doAjaxPost1('prv')"></i>
  <pre class="col-xs-12"  id="prv" style="height:370px;scroll-Y:auto;margin-top:30px;">
  
  
  </pre> 
 </div> 
  
 

<!--
<div id="result"  title="OPD Details">

  
    <div class="form-group">
      <label for="pc">Presenting Complaints :</label>
      <textarea class="form-control" rows="2" id="pc"></textarea>
    </div>
   <div class="form-group">
      <label for="pmsh">Past Medical & Surgical History :</label>
      <textarea class="form-control" rows="2" id="pmsh"></textarea>
    </div>
   <div class="form-group">
      <label for="ph">Pain History :</label>
      <textarea class="form-control" rows="2" id="ph"></textarea>
    </div>
   <div class="form-group">
      <label for="dh">Drug History :</label>
      <textarea class="form-control" rows="2" id="dhr"></textarea>
    </div>
   <div class="form-group">
      <label for="fh">Family History :</label>
      <textarea class="form-control" rows="2" id="fh"></textarea>
    </div>
   <div class="form-group">
      <label for="ogh">Obstetrics and Gynaecology History :</label>
      <textarea class="form-control" rows="2" id="ogh"></textarea>
    </div>
      <div class="form-group">
      <label for="psh">Personal/Social History :</label>
      <textarea class="form-control" rows="2" id="psh"></textarea>
    </div>
     <div class="form-group">
     <label for="cds">Cardiovascular :</label>
      <textarea class="form-control" rows="2" id="scv"></textarea>
    </div>
   <div class="form-group">
      <label for="pmsh">Respiratory :</label>
      <textarea class="form-control" rows="2" id="sres"></textarea>
    </div>
   <div class="form-group">
      <label for="sgas">Gastrointestinal :</label>
      <textarea class="form-control" rows="2" id="sgas"></textarea>
    </div>
   <div class="form-group">
      <label for="smusc">Musculoskeletal :</label>
      <textarea class="form-control" rows="2" id="smusc"></textarea>
    </div>
   <div class="form-group">
      <label for="sgenit">Genito-Urinary :</label>
      <textarea class="form-control" rows="2" id="sgenit"></textarea>
    </div>
   <div class="form-group">
      <label for="sendoc">Endocrine :</label>
      <textarea class="form-control" rows="2" id="sendoc"></textarea>
    </div>
      <div class="form-group">
      <label for="sskin">Skin :</label>
      <textarea class="form-control" rows="2" id="sskin"></textarea>
    </div>  
    <div class="form-group">       
     <label for="scns">Central Nervous System :</label>
      <textarea class="form-control" rows="2" id="scns"></textarea>
    </div>
   <div class="form-group">
      <label for="pge">On Examination :</label>
      <textarea class="form-control" rows="2" id="pge"></textarea>
    </div>
   <div class="form-group">
      <label for="poc">Oral Cavity :</label>
      <textarea class="form-control" rows="2" id="poc"></textarea>
    </div>
   <div class="form-group">
      <label for="pns">Nervous System :</label>
      <textarea class="form-control" rows="2" id="pns"></textarea>
    </div>
   <div class="form-group">
      <label for="pcv">Cardiovascular :</label>
      <textarea class="form-control" rows="2" id="pcv"></textarea>
    </div>
   <div class="form-group">
      <label for="prs">Respiratory System :</label>
      <textarea class="form-control" rows="2" id="prs"></textarea>
    </div>
      <div class="form-group">
      <label for="pas">Abdominal System :</label>
      <textarea class="form-control" rows="2" id="pas"></textarea>
    </div>   
    <div class="form-group">      
     <label for="pds">Provisional Diagnosis :</label>
      <textarea class="form-control" rows="2" id="pds"></textarea>
    </div>
   <div class="form-group">
      <label for="pir">Pathology Investigation Recommended :</label>
      <textarea class="form-control" rows="2" id="pir"></textarea>
    </div>
                
</div>
  --> 
 </div>
 </div>
 <script type="text/javascript">
   
$(function () {
	
$('#datetimepicker1').datetimepicker({
	 
	
	useCurrent: false,
	format: "dd-mm-yyyy hh:ii",
	collapse:false,
	
    autoclose: true,
    todayBtn: true
   
	
});
$('#disdate').val(moment().format("DD-MM-YYYY HH:mm"))
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