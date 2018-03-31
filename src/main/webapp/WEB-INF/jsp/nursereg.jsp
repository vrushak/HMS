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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel='stylesheet' href='<c:url value="/resources/css/nursereg.css" />' type='text/css' media='all' />

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />


<script type="text/javascript" src="/HMS/resources/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<script type="text/javascript">
function check(str){
	
	if (str == "" || str == null){
    	
				
		var id = 1;
		var str1 = "N-";
	    var m = moment().format("DDMMYYYY-");
		var str3 = id;
		var res = str1.concat(m);
		var res1 = res.concat(str3);
         
		 document.getElementById("joindate").valueAsDate = new Date();
			
		document.getElementById("nid").value = res1;
    	
	}
	else {
		
		
		
		var id = str;
		
		var ida = Number(id) + 1;
	   
		var str1 = "N-";
		var m = moment().format("DDMMYYYY-");
		var str3 = ida;
		var res = str1.concat(m);
		var res1 = res.concat(str3);
		 document.getElementById("joindate").valueAsDate = new Date();
		
		document.getElementById("nid").value = res1;
	//	alert(res1);
	}
}

function change(){
	  var str = document.getElementById("pid1").value;
	   var strSplit = str.split(',');

       var res1 = $('select[name=pid1]').val();
  	   
	   
  	   $('select[name=gender]').val(res1);
	   $('#gender').selectpicker('refresh');
	   
	   document.getElementById("pid").value = strSplit[0];
	   document.getElementById("fname").value=strSplit[1];
	   document.getElementById("lname").value = strSplit[2];
	   document.getElementById("regdate").value =strSplit[3];
	   document.getElementById("dob").value = strSplit[4];
	   document.getElementById("age").value = strSplit[5];
	   document.getElementById("mstatus").value =strSplit[7];
	   document.getElementById("pofvisit").value = strSplit[8];
	   document.getElementById("landphone").value=strSplit[9];
	   document.getElementById("mobile").value = strSplit[10];
	   document.getElementById("email").value =strSplit[11];
	   document.getElementById("ssn").value = strSplit[12];
	   document.getElementById("address").value=strSplit[13];
	   document.getElementById("city").value = strSplit[14];
	   document.getElementById("country").value =strSplit[15];
	   document.getElementById("pcode").value = strSplit[16];
	   document.getElementById("ethnicity").value=strSplit[17];
	   
		

}

function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
		  tdi = tr[i].getElementsByTagName("td")[0];
		  tdf = tr[i].getElementsByTagName("td")[1];
	       td = tr[i].getElementsByTagName("td")[2];
	    if (td || tdi ||tdf) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	      if (tdi.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
	      if (tdf.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
	    }       
	  }
	}

function clos(){
	window.location.reload();
}
	var un;
	function copy(pid,address2){
      
    	var strSplit = pid.split(',');
	
       document.getElementById("nid").value = strSplit[0];
	  
       document.getElementById("fname").value=strSplit[1];
    
	   document.getElementById("lname").value = strSplit[2];
	  
	   document.getElementById("joindate").value =strSplit[3];
	  
	   document.getElementById("dob").value = strSplit[4];
	   
	   document.getElementById("age").value = strSplit[5];
	  
	   if( strSplit[6] == "M"){
		     $('#male').click();
		     
		   }
	   else if(strSplit[6] == "F"){
		     $('#female').click();
		    
		    }
	   else{
		   $('#other').click();
	   }
	  
	   document.getElementById("regnno").value = strSplit[7];
	   document.getElementById("ssn").value = strSplit[8];
	 document.getElementById("qualification").value = strSplit[9];
	   document.getElementById("landphone").value=strSplit[10];
	   document.getElementById("mobile").value = strSplit[11];
	   document.getElementById("email").value =strSplit[12];
	
	  
	 
	   document.getElementById("country").value = strSplit[13];
	   document.getElementById("city").value =strSplit[14];
	   document.getElementById("pcode").value = strSplit[15];
	   document.getElementById("prfshift").value = strSplit[16];
	   document.getElementById("emptype").value=strSplit[17];
	   document.getElementById("dept").value = strSplit[18];
	 document.getElementById("desg").value = strSplit[19];
	 document.getElementById("state").value = strSplit[20];
	 document.getElementById("mname").value = strSplit[21];
	 document.getElementById("specialization").value=strSplit[22];  
	   document.getElementById("username").value = strSplit[23];
	   document.getElementById("password").value = strSplit[24];
	    document.getElementById("address2").value = address2;
	    unsaved = false;
	    un = strSplit[23];
	   $('#myModal').modal('show');
	}
	
	function copy1(address){
		 document.getElementById("address1").value=address;
	}
	function validate(){
		alert("records saved successfully");
		document.getElementById('form1').submit();
	}
	
	function validateForm()
	{ 
	  var fields = ["nid","mobile","address1"];
	  var i;
	  var l = fields.length;
	  var fieldname;
	  
	  for (i = 0; i < l; i++) {
		  
	    fieldname = fields[i];
	    if (document.getElementById(fieldname).value == "") {
	      alert("Please fill all mandatory fields");
	      return false;
	    }
	    
	  }
	  
	  return true;
	}
	
function checkfor(){
		
		if(document.getElementById("password").value == document.getElementById("cpassword").value){
			document.getElementById('open2a').disabled = false;
			disablenxt()
			return true;
		}
		else{
			document.getElementById('open2a').disabled = true;
			alert("Please type in same password");
		
			return false;
		}
	}
	

function disablenxt(){
	
	if(blok == true){
		  document.getElementById('open2a').disabled = true;
	}
	  else{
		  document.getElementById('open2a').disabled = false;
	  }	
}	
	function agec(birthDate){
		
		var birthDate= new Date(birthDate);
		   var  currentDate= new Date();
       
		    var years = (currentDate.getFullYear() - birthDate.getFullYear());

		    if (currentDate.getMonth() < birthDate.getMonth() || 
		        currentDate.getMonth() == birthDate.getMonth() && currentDate.getDate() < birthDate.getDate()) {
		        years--;
		    }
		    document.getElementById("age").value = years;
	} 
	
	function datasuccess(data){
		
		if(data != "null"){
			
			alert(data)
	window.location = "/HMS/nurse.html";
		}
	}
	function getAge(dateString) {
		  var now = new Date();
		  
		  
		  var today = new Date(now.getYear(),now.getMonth(),now.getDate());

		  var yearNow = now.getYear();
		  var monthNow = now.getMonth();
		  var dateNow = now.getDate();

		  var dob = new Date(dateString);

		  var yearDob = dob.getYear();
		  var monthDob = dob.getMonth();
		  var dateDob = dob.getDate();
		  var age = {};
		  var ageString = "";
		  var yearString = "";
		  var monthString = "";
		  var dayString = "";


		  yearAge = yearNow - yearDob;

		  if (monthNow >= monthDob)
		    var monthAge = monthNow - monthDob;
		  else {
		    yearAge--;
		    var monthAge = 12 + monthNow -monthDob;
		  }

		  if (dateNow >= dateDob)
		    var dateAge = dateNow - dateDob;
		  else {
		    monthAge--;
		    var dateAge = 31 + dateNow - dateDob;

		    if (monthAge < 0) {
		      monthAge = 11;
		      yearAge--;
		    }
		  }

		  age = {
		      years: yearAge,
		      months: monthAge,
		      days: dateAge
		      };

		  if ( age.years > 1 ) yearString = " years";
		  else yearString = " year";
		  if ( age.months> 1 ) monthString = " months";
		  else monthString = " month";
		  if ( age.days > 1 ) dayString = " days";
		  else dayString = " day";


		  if ( (age.years > 0) && (age.months > 0) && (age.days > 0) )
		    ageString = age.years + yearString + " " + age.months + monthString + "  " + age.days + dayString;
		  else if ( (age.years == 0) && (age.months == 0) && (age.days > 0) )
		    ageString = age.days + dayString;
		  else if ( (age.years > 0) && (age.months == 0) && (age.days == 0) )
		    ageString = age.years + yearString + " old. Happy Birthday!!";
		  else if ( (age.years > 0) && (age.months > 0) && (age.days == 0) )
		    ageString = age.years + yearString + " " + age.months + monthString;
		  else if ( (age.years == 0) && (age.months > 0) && (age.days > 0) )
		    ageString = age.months + monthString + " " + age.days + dayString;
		  else if ( (age.years > 0) && (age.months == 0) && (age.days > 0) )
		    ageString = age.years + yearString + "  " + age.days + dayString;
		  else if ( (age.years == 0) && (age.months > 0) && (age.days == 0) )
		    ageString = age.months + monthString;
		  else{ ageString = "Invalid Date!";
alert(ageString);

		  }
		   document.getElementById("age").value = ageString;
		}


</script>
<script type="text/javascript">

jQuery().ready(function() {
	
	var v = $("#form1").validate({
	      rules: {

	          prnum: {
	            required: true,
	            
	          },
	          fname: {
	              required: true,
	              
	            },
	            lname: {
	                required: true,
	                
	              },  
	            username: {
	                  required: true,
	                  
	                },  
	            password: {
	                    required: true,
	            },      
	            
	           mobile: {
	                required: true,
	                
	           },
	           
	        
	           email :{
	        	   email : true,
	           },
	           
	           dob :{
	        	   maxlength : 10,
	           },

	      },
	      
	      messages: {
	    	  prnum: {
	              required: "Please fill out this field",
	              
	            },
	            fname: {
	            	   required: "Please fill out this field",
	                
	              },
	              lname: {
	            	   required: "Please fill out this field",
	                  
	                },  
	              username: {
	            	   required: "Please fill out this field",
	                    
	                  },  
	              password: {
	            	   required: "Please fill out this field",
	              },      
	              
	             mobile: {
	            	   required: "Please fill out this field",
	                  
	             },
	             
	            
	             email :{
	            	   required: "Please fill out this field",
	             },
	             dob :{
		        	   maxlength : "Year cannot be more than 4 digits",
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
	 $(".open2").click(function() {
		  if (v.form()) {
	      $(".frm").hide("fast");
	      $("#sf2a").show("slow");
		  }
	  });
	 $(".open2a").click(function() {
		  if (v.form()) {
	     $(".frm").hide("fast");
	     $("#sf3").show("slow");
		  }
	 });
	 $(".open3").click(function() {
		  if (v.form()) {
	     $(".frm").hide("fast");
	     $("#sf4").show("slow");
		  }
	 });

	   // Binding back button on second step
	  $(".back2").click(function() {
	    $(".frm").hide("fast");
	    $("#sf1").show("slow");
	  });
	   
	  $(".back2a").click(function() {
	      $(".frm").hide("fast");
	      $("#sf2").show("slow");
	    });

	   // Binding back button on third step
	   $(".back3").click(function() {
	    $(".frm").hide("fast");
	    $("#sf2a").show("slow");
	  });
	   
	   $(".back4").click(function() {
	       $(".frm").hide("fast");
	       $("#sf3").show("slow");
	     });


   });




</script>

<script type="text/javascript">
var blok;
       function doAjaxPost1(user) {
    	   // get the form values
    	   if(un == user ){
    		   $("#open2a").prop('disabled',false)
    		   return true;
    	   }
    	         //  var name = $('#pname').val();
    	           // var pid = $('#pid').val();
    	           $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/chkuser/"+user+"",
    	        	          
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           
    	        	           success: function(response){
    	        	        	//  alert(response)
    	        	        	   $.each(response, function(index, datec) {
    	        	                   //to print name of employee
    	        	              //   alert(datec.username)
    	        	                   
    	        	        		    if(datec.username > 0){
     	        	                	   alert("Username already exists!")
     	        	              //  	   $("#open2a").prop('disabled',true)
     	        	                	   blok = true;
     	        	                	   disablenxt()
     	        	                	   return false;
     	        	                	
     	        	                   }
     	        	                   else{
     	        	                //	   $("#open2a").prop('disabled',false)
     	        	                	   blok = false;
     	        	                disablenxt()
     	        	                   } 
    	        	               });    
    	        	           },
    	        	           error: function(e){
    	        	        	  
    	        	        	           alert('Error: ' + e);
    	        	        	  
    	        	        	           }
    	        	        	           });
    	        	        	   
    	        	        	           }

       </script>

       
</head>
<body>
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Nurse Details</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/HMS/home">Home</a></li>
          <li class="dropdown back" id="back">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Quick Access
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/HMS/staff">Staff Details</a></li>
          <li><a href="/HMS/doctor1">Doctor View</a></li>
          <li><a href="/HMS/nursedesk">Nurse Station</a></li>
          <li><a href="/HMS/frontdesk">Front Desk</a></li>
        </ul>
      </li>
    </ul>
   <ul class="nav navbar-nav navbar-right">
    </ul>
   </div>
</nav>
  <center>
</center>
    
  <form id="form" action="" method="">  
  
    
	  <h1>
	  <button type="button" class="btn btn-warning button1"  data-toggle="modal" data-target="#myModal">
	  <span class="glyphicon glyphicon-plus"></span>Add Nurse</button>
<font size="5">Nurse Details</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Name or Id"  style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 976px; " id="myTable">
    <thead>
      <tr>
        <th style="width:140px;">Nurse Id</th>
        <th style="width:140px;">First Name</th>
        <th style="width:140px;">Last Name</th>
        <th style="width:140px;">Department</th>
        <th style="width:140px;">Designation</th>
        <th style="width:140px;">Specialization</th>
        <th style="width:140px;">Edit</th>
        <th style="width:16px;"></th>
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list1}">
    <tr>
    <td width="140px;">${p1.nid}</td>
    <td width="140px;">${p1.fname}</td>
    <td width="140px;">${p1.lname}</td>
     <td width="140px;">${p1.dept}</td>
    <td width="140px;">${p1.desg}</td>
     <td width="140px;">${p1.specialization}</td>
    <td width="140px;"><i class="fa fa-pencil" style="color:#00b300" onclick="copy('${p1.nid},${p1.fname},${p1.lname},${p1.joindate},${p1.dob},${p1.age},${p1.gender},${p1.regnno},${p1.ssn},${p1.qualification},${p1.landphone},${p1.mobile},${p1.email},${p1.country},${p1.city},${p1.pcode},${p1.prfshift},${p1.emptype},${p1.dept},${p1.desg},${p1.state},${p1.mname},${p1.specialization},${p1.username},${p1.password}','${p1.address2}'),copy1('${p1.address}')"></i></td>
   	<td style="width:16px;"></td>
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    
   

   
   
	  <!--  
	
    <br>

  -->
<button type="submit" class="bouton-contact"></button>
	
</form>

<div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
       
       <form id="form1" action="saveN.html" method="post">  
  
        <h1> Nurse Registration Form
          <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>    
      
        </h1>
        
       <br>
       <div id="sf1" class="frm">
<!--  user name field will be here with next button -->
     <fieldset>
     <div class="col-xs-1"></div>
            <font size="2" color="#009999">Step 1 of 5</font>
            <hr style="border: 1px solid #cccccc">
        <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  <div class="form-group">
            <p>Nurse Id <span>*</span></p>
          <input type="text" name="nid" readonly="readonly" id="nid" class="form-control input-sm"  required>
	</div>
  </div>
  
   <div class="col-xs-4">
 <div class="form-group">
            <p>Date of Join <span>*</span></p>
         	<input type="date"  readonly="readonly" name="joindate" id="joindate" class="form-control input-sm" >
	</div>
  </div>
  
   <div class="col-xs-3">
    
	   <div class="form-group">
            <p>Registration Number<span>*</span></p>
    <input type="text" name="regnno" id="regnno" class="form-control input-sm"  required>
</div>
	</div>
 
 </div>
 
         <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  <div class="form-group">
            <p>Employment Type <span></span></p>
            <select class="form-control" name="emptype" id="emptype" >
            <option disabled selected>Select Employment Type</option>
            <option>Permanent</option>
            <option>Temporary</option>
            </select>
	</div>
  </div>
  
   <div class="col-xs-4">
 <div class="form-group">
            <p>Preferred Shift <span></span></p>
         	 <select class="form-control" name="prfshift" id="prfshift">
            <option disabled selected>Select Shift</option>
            <option>Morning</option>
            <option>Afternoon</option>
            <option>Evening</option>
            <option>Night</option>
            </select>
	</div>
  </div>
  
   <div class="col-xs-3">
    <div class="form-group">
            <p>Department <span></san></p>
         	 <select class="form-control" name="dept" id="dept" >
                 <option disabled selected>Select Department</option>
            <option>General Care</option>
            <option>Gynaecology</option>
            <option>Haemotology</option>
            <option>Oncology</option>
            <option>Pediatrics</option>
            <option>ENT</option>
            </select>
	</div>
</div>
 
 </div>
 
 
         <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  <div class="form-group">
            <p>Designation <span></span></p>
          <select class="form-control" name="desg" id="desg" >
            <option disabled selected>Select Designtion</option>
            <option>Intensive Care Assistant</option>
            <option>Child Care Assistant</option>
           
            <option></option>
            </select>
	</div>
  </div>
  
   <div class="col-xs-4">
 
  </div>
  
   <div class="col-xs-3">
 
  </div>
  </div>
   <div class="form-group">
              <div class="col-lg-10 col-lg-offset-1">
                <!-- open1 is given in the class that is binded with the click event -->
                <center><button class="btn btn-primary open1" name="button1" id="button1" type="button" onclick='return validateForm1("button1")' >Next <span class="fa fa-arrow-right"></span></button> </center>
              </div>
            </div>
            
            
            
 
</fieldset>
</div>
 
  <!-- id will be unique, but class name will be same -->
<div id="sf2" class="frm">
<!--  user email field will be here with next and previous button -->
<fieldset>
<div class="col-xs-1"></div>
            <font size="2" color="#009999">Step 2 of 5</font>
            <hr style="border: 1px solid #cccccc">
  
 <center><b><font size="3">Personal Details</font></b></center>
   <br>
          <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  
   <div class="form-group">
    
            <p>First Name <span>*</span></p>
         	<input type="text" name="fname" id="fname" class="form-control input-sm" required >
	
	</div>
 
  </div>
  
   <div class="col-xs-4">
    <div class="form-group">
            <p>Middle Name <span></span></p>
         	<input type="text" name="mname" id="mname" class="form-control input-sm"  />
</div>
    </div>
  
   <div class="col-xs-3">
  <div class="form-group">
            <p>Last Name <span>*</span></p>
     <input type="text" name="lname" id="lname" class="form-control input-sm"  required>

	</div>
  </div>
       
 
</div>
  <div class="form-group row" >
        <div class="col-xs-1"></div>

<div class="col-xs-3">
    <div class="form-group">
            <p>Date of Birth <span></span></p>
     <input type="date" maxlength="10" name="dob" id="dob" onblur='getAge(this.value)' class="form-control input-sm" >

	</div>
   </div>
   
   <div class="col-xs-4">
    <div class="form-group">
            <p>Age <span></span></p>
    <input type="text"  readonly="readonly" name="age" id="age" class="form-control input-sm"  >
</div>
   </div>
   
    <div class="col-xs-3">
    <div class="form-group">
        
     <div class="btn-group" data-toggle="buttons"><p>Gender <span></span></p>
    <label class="btn btn-default"><input class="form-control input-sm"  style="width: 0px;" id="male" value="M" type="radio" name="gender" />M</label>
 		<label class="btn btn-default"><input class="form-control input-sm" style="width: 0px;" id="female" value="F" type="radio" name="gender" />F</label>
 	<label class="btn btn-default"><input style="width: 0px;" class="form-control input-sm" type="radio" value="O" id="other" name="gender" />Other</label> 
 		</div>
   </div>
	</div>
  </div>
  
     <div class="form-group row" >
        <div class="col-xs-1"></div>
  <div class="col-xs-3">
  
   <div class="form-group">
            <p>NRC No or Passport No <span></span></p>
    <input type="text" name="ssn" id="ssn" class="form-control input-sm"  >
</div>
  </div>
  
  <div class="col-xs-4">
   
  </div>

 <div class="col-xs-3">

  </div>

  </div>
    <div class="clearfix" style="height: 10px;clear: both;"></div>

            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-1">
                <!-- back2 unique class name  -->
                <center><button class="btn btn-warning back2" type="button"><span class="fa fa-arrow-left"></span> Back</button> 
                <!-- open2 unique class name -->
                <button class="btn btn-primary open2" type="button">Next <span class="fa fa-arrow-right"></span></button> </center>
              </div>
            </div>
</fieldset>
</div>

    <!-- id will be unique, but class name will be same -->
<div id="sf2a" class="frm">
<!--  user email field will be here with next and previous button -->
<fieldset>
             <div class="col-xs-1"></div>
            <font size="2" color="#009999">Step 3 of 5</font>
            <hr style="border: 1px solid #cccccc">

       <center><b><font size="3">Nurse Login Details</font></b></center>
   <br>
          <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  
   <div class="form-group">
    
            <p>UserName <span>*</span></p>
         	<input type="text" name="username" id="username" onchange="return doAjaxPost1(this.value)" class="form-control input-sm" required  />
	
	</div>
 
  </div>
  
   <div class="col-xs-4">
    <div class="form-group">
            <p>Password <span>*</span></p>
         	<input type="text" name="password" id="password" class="form-control input-sm" required />
</div>
    </div>
  
   <div class="col-xs-3">
  <div class="form-group">
            <p>Confirm Password<span>*</span></p>
     <input type="text" name="cpassword" id="cpassword" class="form-control input-sm" onblur = 'return checkfor();'/>

	</div>
  </div>
       
 
</div>
 
  
    
       
 
 

            <div class="clearfix" style="height: 10px;clear: both;"></div>

            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-1">
                <!-- back2 unique class name  -->
                <center><button class="btn btn-warning back2a" type="button"><span class="fa fa-arrow-left"></span> Back</button> 
                <!-- open2 unique class name -->
                <button class="btn btn-primary open2a" id="open2a" type="button">Next <span class="fa fa-arrow-right"></span></button> </center>
              </div>
            </div>
</fieldset>
</div>
 <!-- id will be unique, but class name will be same -->
<div id="sf3" class="frm">
<!--  user email field will be here with next and previous button -->
<fieldset>
            <div class="col-xs-1"></div>
            <font size="2" color="#009999">Step 4 of 5</font>
            <hr style="border: 1px solid #cccccc">
<center><b><font size="3">Contact Details</font></b></center>
   <br>
   <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
   <div class="form-group">
            <p>LandPhone <span></span></p>
    <input type="text" class="form-control input-sm" value="080" maxlength="11" name="landphone" id="landphone"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
</div>
  </div>
  
  <div class="col-xs-4">
 <div class="form-group">
            <p>Mobile<span>*</span></p>
       <input type="text" class="form-control input-sm" value="+91-" required maxlength="14" name="mobile" id="mobile" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
</input>
</div>
  </div>
  
  <div class="col-xs-3">
  <div class="form-group">
            <p>Email <span></span></p>
    <input type="email" name="email" id="email" placeholder="someone@example.com" class="form-control input-sm" >
</div>
  </div>
  
  </div>
  
  <div class="form-group row" >
        <div class="col-xs-1"></div>
  
 <div class="col-xs-3">
  <div class="form-group">
            <p>Address1<span></span></p>
            <textarea name="address" id="address1" rows="5" data-rule="required" data-msg="address1" ></textarea>
</div>
  </div>
  <div class="col-xs-4">
  <div class="form-group">
            <p >Address2<span></span></p>
            <textarea name="address2" id="address2" rows="5"  data-msg="address2"></textarea>
</div>
  
  </div>
   <div class="col-xs-3">
   <div class="form-group">
            <p>Country <span></span></p>
         <input type="text" class="form-control input-sm"  name="country" id="country">
  </div>
  </div>
  </div>
  <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        <div class="col-xs-3">
   <div class="form-group">
            <p>Province <span></span></p>
           <input type="text"  class="form-control input-sm"  name="state" id="state">
</div>
  </div>
  <div class="col-xs-4">
  
   <div class="form-group">
            <p>City <span></span></p>
          <input type="text" class="form-control input-sm"  name="city" id="city">
</div>
</div>
    <div class="col-xs-3">
          <div class="form-group">
            <p>Po Box<span></span></p>
    <input type="text" maxlength="6" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="pcode" id="pcode" class="form-control input-sm" >
</div>
  </div>
  
  
  </div>
 
   <div class="clearfix" style="height: 10px;clear: both;"></div>

            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-1">
                <!-- back2 unique class name  -->
               <center> <button class="btn btn-warning back3" type="button"><span class="fa fa-arrow-left"></span> Back</button> 
                <!-- open2 unique class name -->
                <button class="btn btn-primary open3" type="button">Next <span class="fa fa-arrow-right"></span></button> </center>
              </div>
            </div>
</fieldset>
</div>
 
  
  <div id="sf4" class="frm">
<!--  user email field will be here with next and previous button -->
<fieldset>
             <div class="col-xs-1"></div>
            <font size="2" color="#009999">Step 5 of 5</font>
            <hr style="border: 1px solid #cccccc">
 <center><b><font size="3">Educational Details</font></b></center>
   <br>
          <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  
   <div class="form-group">
            <p>Qualification <span></span></p>
    <select class="form-control"name="qualification" id="qualification" >
      <option value=""></option>
            <option disabled selected>Select Qualification</option>
            <option>BSc</option>
           
</select>            
            
	</div>
 
  </div>
  
   <div class="col-xs-4">
    
    </div>
  
   <div class="col-xs-3">
  <div class="form-group">
    <p>Specialization <span></span></p>
          <select class="form-control" name="specialization" id="specialization" >
            <option value=""></option>
            <option disabled selected>Select Specialization</option>
            <option> Nursing</option>
             <option>ICU Care</option>
            <option>ENT</option>
    </select>
	</div>
  </div>
       
 
</div>
 
  <div class="form-group">
              <div class="col-lg-10 col-lg-offset-1">
                <!-- Unique class name -->
              <center>  <button class="btn btn-warning back4" type="button"><span class="fa fa-arrow-left"></span> Back</button> 
                <!-- Unique class name -->
                <button type="submit" id="bouton-contact" class="btn btn-primary open4 " >Save</button> </center>
               
              </div>
            </div>
   
   </fieldset>
   </div>
  

 
  
    
<button type="submit" class="bouton-contact" onclick="" ></button>
        </form>
        </div>
        
      </div>
      
    </div>
  


<c:forEach var="p"  items="${model.list}">
<script>
check('<c:out value="${p.nid}" />');
</script>
</c:forEach>
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