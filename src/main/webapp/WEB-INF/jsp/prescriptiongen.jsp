<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMS Wedge</title>

<link rel='stylesheet' href='<c:url value="/resources/css/prescription.css" />' type='text/css' media='all' />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
<link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">

function checkhome(user,val){

	if (val != "Admin"){
		if(user.includes("D-")){
			var url = "http://localhost:8085/HMS/doctor1" ;
			
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url);
			 
			 var url1 = "http://localhost:8085/HMS/myapps/"+user+"" ;
	
			 var element1 = document.getElementById('hc');
			 element1.setAttribute("href",url1)
			 
			  var url2 = "http://localhost:8085/HMS/treatment/"+user+"" ;
			
		 var element = document.getElementById('m2');
		 element.setAttribute("href",url2)
		}
		else{
			var url = "http://localhost:8085/HMS/doctor1" ;
			
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
			 
			  var url1 = "http://localhost:8085/HMS/myapps/"+user+"" ;
			
			 var element1 = document.getElementById('hc');
			 element1.setAttribute("href",url1)
			 
			  var url2 = "http://localhost:8085/HMS/treatment/"+user+"" ;
			
		 var element = document.getElementById('m2');
		 element.setAttribute("href",url2)
		}
		
	}
	else{
		
		 var url = "http://localhost:8085/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		   var url1 = "http://localhost:8085/HMS/myapps/"+user+"" ;
			
			 var element1 = document.getElementById('hc');
			 element1.setAttribute("href",url1)
			 
			  var url2 = "http://localhost:8085/HMS/treatment/"+user+"" ;
			
		 var element = document.getElementById('m2');
		 element.setAttribute("href",url2)
	}
}

function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable1").deleteRow(i);
    
}
function hide(user,val){
	if(val !="Admin"){
		if(user.includes("D-")){
			document.getElementById("dh").style.display="none";
			var no = document.getElementsByClassName("trunk");
			for(var i=0;i<no.length;i++){
				no[i].style.display="none";
				
			}
			
			document.getElementById("myTable").setAttribute("style","border:0;"); 
		  document.getElementById("form2").style.width ='800px'; 
			
		}
		
		else{
			document.getElementById("dh").style.display="none";
			var no = document.getElementsByClassName("trunk");
			for(var i=0;i<no.length;i++){
				no[i].style.display="none";
				
			}
			
			document.getElementById("myTable").setAttribute("style","border:0;"); 
		  document.getElementById("form2").style.width ='800px'; 
				
		}
	
	}
	else{
		document.getElementById("dh").style.display="visible";
		document.getElementById("tr").style.display="visible";
		
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
	
function disp(){
	document.getElementById("rdate").valueAsDate = new Date();
	$('#myModal').modal('show');
}
function check(id,name){

	document.getElementById("docid").value = id;
	document.getElementById("dname").value = name;
	
	
}


function display(){ 
	
	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	
	//    var m = moment().format('YYYY-MM-DD h:mm a');

	  var newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input style='width: 140px;' form ='form1' class= 'form-control input-sm'  type='text' id = 'gtest' name= 'gtest'  required> </td></tr>";
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input style='width: 140px;' form ='form1' class= 'form-control input-sm'  type='text' id = 'gvalue' name= 'gvalue'  required> </td></tr>";
	  
	 
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='width: 85px;font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
	  

	
}
function addcname(){
	var cid = document.getElementById("pname").value; 
	var str = cid.split(',');
	
	 var res5 = $('select[name=pname1]').val();
 	   $('select[name=pid1]').val(res5);
	   $('#pid').selectpicker('refresh');
	   
	document.getElementById("pid").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	document.getElementById("symptoms").value = str[2];
	
	
	
}

var arr = [];
function getvalue(myname) {
	
	
	
	
	if (document.getElementById(myname).selected){
	
		arr.push(myname);
	    alert(arr);
	}
	else 
		{
		alert(arr);
	    arr.splice( arr.indexOf(myname), 1 );
		
		}
       console.log(arr);
       alert(arr);
	document.getElementById("medicine").value = arr.join("\n");
		
	
	
	}

function clos(){
	window.location.reload();
}

function copy(pid,sym,treat,diag,ka,pm,systemic,gtest,gvalue){

	var strSplit = pid.split(',');

	 document.getElementById("bgh").disabled = true;
   document.getElementById("pid").value = strSplit[0];
   
   $("#pid").append('<option value="'+strSplit[0]+'"selected="">'+strSplit[0]+'</option>');
   $("#pid").selectpicker("refresh");
   
   $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
   $("#pname").selectpicker("refresh");
   
 //  document.getElementById("docid").value = strSplit[0];
    document.getElementById("pname").disabled = true; 
    document.getElementById("pid").disabled = true;
  
   
  
   
 //  document.getElementById("pid").value= strSplit[3];
   
   document.getElementById("pname").value = strSplit[4];
   
   if( strSplit[5] == "Yes"){
	     $('#yes').click();
	     
	   }
 else{
	     $('#no').click();
	    
	    }
 
   document.getElementById("symptoms").value = sym; 
   
   document.getElementById("treatment").value = treat;
   
  
   document.getElementById("medicine").value = diag;
   
   document.getElementById("rdate").value = strSplit[6];
   
  // document.getElementById("admit").value = strSplit[8];
   
  
     document.getElementById("ka").value = ka;
     document.getElementById("pm").value = pm;
     document.getElementById("systemic").value = systemic;
     
 	var gt = gtest.split(',');
    
	var gv = gvalue.split(',');
   

	  for(var x=0; x<gt.length; x++) {
		  
		  var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	    	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
		  
	    
		 
		  var newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='190px';><input style='width: 140px;' form ='forma' class= 'form-control input-sm'  type='text' id = 'gtest' name= 'gtest' value='"+gt[x]+"' required> </td></tr>";
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='190px';><textarea form ='forma'  style='width: 140px;' class= 'form-control input-sm'  rows='1'  id = 'gvalue'  name= 'gvalue' value ='"+gv[x]+"' required>"+gv[x]+"</textarea></td></tr>";
		 
		
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='width: 85px;font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
		  

	  }

  
 
   $('#myModal').modal('show');

}
</script>
<script type="text/javascript">
$(document).ready(function() {

	/* $(function () {
         $('#dob').datetimepicker({
        	 format:'DD/MM/YYYY HH:mm'
         });
     });*/
	
	
	var v = $("#form1").validate({
      rules: {

          pid: {
            required: true,
            
          },
          pname: {
              required: true,
              
            },

        
      },
      errorElement: "span",
      errorClass: "help-inline",
    });


  // Binding next button on first step
  $(".frm").hide("fast");
  $("#sf1").show("slow");

  $(".open1").click(function() {
    if (v.form()) {
      $(".frm").hide("fast");
      $("#sf2").show("slow");
    }
  });

  // Binding next button on second step
 

  // Binding back button on second step
  $(".back2").click(function() {
    $(".frm").hide("fast");
    $("#sf1").show("slow");
  });

 
});

</script>


</head>
<body onload="" >

<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Patients History </a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href ="">Home</a></li>
   <li class=""><a id="hc" href="">My Appointments</a></li>
 <li class=""><a id="m2" href="">Treatment Records</a></li>
           <li class=""><a  href="http://localhost:8085/HMS/discharge.html">Discharge Summary</a></li>
         
    </ul>
    <ul class="nav navbar-nav navbar-right">
       <li style ="color:#ff9900;"><span class="glyphicon glyphicon-log-in">Welcome : ${pageContext.request.userPrincipal.name}</span></li>
      </ul> 
  </div>
</nav>
  <center>
</center>
 <form id="form2" action="" method="post">  
  <h1>
	  <button type="button" class="btn btn-warning button1" onclick="disp()">
	  <span class="glyphicon glyphicon-plus"></span>General Checkup</button>
<font size="5">Patient History</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search by Name" onkeyup="myFunction()" style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 1000px;border:0px; " id="myTable">
    <thead>
      <tr>
        <th class="">Patient Name</th>
        <th class="">Patient Id</th>
        <th class="">Date</th>
        <th class="" id="dh">Doctor Name</th>
        <!--  <th class="">Treatment</th>
        <th class="">Medicines</th>
        <th class="">Admission</th> -->
        <th width="20px;">View More</th>
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list3}">
    <tr>
    <td width="192px;">${p1.pname}</td>
    <td width="192px;">${p1.pid}</td>
    <td width="192px;">${p1.date}</td>
      <td width="192px;" class="trunk">${p1.dname}</td>
   <!--   <td width="180px;">${p1.treatment}</td>
    <td width="180px;">${p1.medicine}</td>
    <td width="180px;">${p1.admit}</td> -->
    <td width="192px;"><i class="fa fa-eye" style="color:#00b300" onclick="copy('${p1.docid},${p1.dname},${p1.specialization},${p1.pid},${p1.pname},${p1.admit},${p1.date}','${p1.symptoms}','${p1.treatment}','${p1.medicine}','${p1.ka}','${p1.pm}','${p1.systemic}','${p1.gtest}','${p1.gvalue}')"></i></td>
   
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    <button type="" class="bouton-contact"></button>
     </form>

<div class="container">
 
  <!-- Trigger the modal with a button -->
 

 
    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
 <form id="form1" action="http://localhost:8085/HMS/saveprs.html" method="post"> 
  <h1 id="">Out Patient Details
        <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>    
      
        </h1>
  <br>
  <div id="sf1" class="frm">
    <!--  user name field will be here with next button -->
    <fieldset>
      <div class="col-xs-1"></div>
      
      
        
  
        
        
       <br>
   
  
   
       <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control" data-live-search="true" name = "pname1" id ="pname" onchange="addcname()"   >
          <option disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.specialization}">${p.pname}</option>
        </c:forEach>
      </select>
       
	</div>
  </div>
  
   <div class="col-xs-4">
  <div class="form-group">
     <p>Patient Id<span>*</span></p>
             <select class="selectpicker form-control" data-width="100%"  data-live-search="true"  name = "pid1" id ="pid"  required>
      <option disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.specialization}">${p.pid}</option>
        </c:forEach>
      </select>
           
     
   
</div>
  </div>
  <input type="hidden" name="pname" form="form1" id="pname1">
  <input type="hidden" name="pid" form="form1" id="pid1" >
  <input type="hidden" name="docid" id="docid" form = "form1">
  <input type="hidden" name="dname" id="dname" form = "form1">
  
     <div class="col-xs-3">
  <div class="form-group">
       <div class="btn-group" data-toggle="buttons"><p>Admit <span>*</span></p>
     <label class="btn btn-default"><input class="form-control input-sm"  style="width: 0px;" value="Yes" id="yes" type="radio" form="form1" name="admit" />Yes</label>
 		<label class="btn btn-default"><input class="form-control input-sm" style="width: 0px;" type="radio" value="No" id="no" form="form1" name="admit" />No</label>
 		</div>
</div>
  </div>
  
  
   
 </div>
   <div class="form-group row" >
        <div class="col-xs-1"></div>
          <div class="col-xs-3">
          <div class="form-group">
     <p>Date<span>*</span></p>
        <input type="date" name="date" id="rdate" class="form-control input-sm" form="form1" readonly="readonly" required>
           
     </div>
  </div>
        
       <div class="col-xs-5">
        <div class="form-group">
   <p>Symptoms<span>*</span></p>
   <textarea name="symptoms" id="symptoms" form="form1" rows="5"   data-rule="required" data-msg="Please fill this field" required  ></textarea>
  </div>
  </div>
  </div>
   <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
            <p>Known Afflictions<span>*</span></p>
      <textarea name="ka" id="ka" form="form1" rows="5" data-rule="" data-msg="address1" ></textarea>
      </div>
  </div>

        <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
            <p>Current-Medication<span>*</span></p>
      <textarea name="pm" id="pm" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea>
      </div>
  </div>
  </div>
   
<div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
            <p>Fileno<span>*</span></p>
      <textarea name="fileno" id="fileno" form="form1" rows="5" data-rule="" data-msg="address1" ></textarea>
      </div>
  </div>
  </div>
  
 

       
      
      <div class="form-group">
        <div class="col-lg-10 col-lg-offset-2">
          <!-- open1 is given in the class that is binded with the click event -->
          <center>
            <button class="btn btn-primary open1" name="button1" id="button1" type="button">Next <span class="fa fa-arrow-right"></span></button>
          </center>
        </div>
      </div>
    </fieldset>
  </div>
  <!-- id will be unique, but class name will be same -->
  <div id="sf2" class="frm">
    <!--  user email field will be here with next and previous button -->
    <fieldset>
   <div class="form-group row" >
	     <div class="col-xs-1">
	   
	     </div>
	      <div class="col-xs-4">
    <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 400px;" scroll="no" style="overflow: hidden" id="myTable1">
    <thead>
      <tr>
        <th width="150px;">General Tests</th>
        <th width="150px;">Test Results</th>
        <th width="100px;">Delete Row </th>
       
       
      </tr>
    </thead>
    <tbody class="tbody">
    
  
    </tbody>
    </table>
    <a id="mt" href="#" onclick = "display()">Add Row</a><br>
    </div>
      
      <div class="col-xs-1"></div>
    <div class="col-xs-4">
	       <div class="form-group">
            <p>Systemic Tests<span>*</span></p>
      <textarea name="systemic" id="systemic" form="form1" rows="15" data-rule="required" data-msg=""></textarea>
      </div>
      <div class="form-group">
            <p>Select Medicines<span>*</span></p>
             <select class="selectpicker form-control" onchange="getvalue(this.value); this.selectedindex = -1" data-size="5" data-live-search="true" name = "med" id ="med"  >
          <option  disabled selected>Select</option>
         <c:forEach var="p"  items="${model.list4}">
        <option id="${p.medicine}" value="${p.medicine}">${p.medicine}</option>
        </c:forEach>
        
      </select>
       
	</div>
	      </div>
  </div>
  
     <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
            <p>Diagnosis<span>*</span></p>
      <textarea name="treatment" id="treatment" form="form1" rows="5" data-rule="required" data-msg="Please fillout this field" required></textarea>
      </div>
  </div>

        <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
            <p>Prescription<span>*</span></p>
      <textarea name="medicine" id="medicine" rows="5" form="form1" data-rule="required" data-msg="Please fillout this field" required></textarea>
      </div>
  </div>
  </div>
      <div class="clearfix" style="height: 10px;clear: both;"></div>
      <div class="form-group">
        <div class="col-lg-10 col-lg-offset-2">
          <!-- back2 unique class name  -->
          <center>
            <button class="btn btn-warning back2" type="button" id="back2"><span class="fa fa-arrow-left"></span> Back</button>
            <!-- open2 unique class name -->
            <button class="btn btn-primary open2" form="form1" id ="bgh" type="submit" id="open2">Save <span class="fa fa-save"></span></button>
            
          </center>
        </div>
      </div>
    </fieldset>
  </div>
  <!-- id will be unique, but class name will be same -->
 
 
  <button type="" class="bouton-contact" onclick=""></button>
  
</form>
</div>
</div>
</div>
<c:forEach var="p"  items="${model.list1}">
<script>
check('<c:out value="${p.docid}" />','<c:out value="${p.dname}" />');
checkhome('<c:out value="${p.docid}" />','<c:out value="${p.idc}" />');
hide('<c:out value="${p.docid}" />','<c:out value="${p.idc}" />');
</script>
</c:forEach>
</body>
</html>
