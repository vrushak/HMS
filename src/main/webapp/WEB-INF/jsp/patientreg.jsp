<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMS Wedge</title>

<link rel='stylesheet' href='<c:url value="/resources/css/patientreg.css" />' type='text/css' media='all' />
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
 <script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<script type="text/javascript">
function check(str){
	
 
	if (str == "" || str == null){
    	
		
		
		id = 1;
		var str1 = "P-";
	    var m = moment().format("DDMMYYYY-");
	    
		var str3 = id;
		var res = str1.concat(m);
		var res1 = res.concat(str3);
		 document.getElementById("regdate").valueAsDate = new Date();

		document.getElementById("pid").value = res1;
		 
		 
    	//alert(res1);
	}
	else {
		
	
		
		var id = str;
		
		var ida = Number(id) + 1;
	
		var str1 = "P-";
		var m = moment().format("DDMMYYYY-");
		var str3 = ida;
		var res = str1.concat(m);
		var res1 = res.concat(str3);
		 document.getElementById("regdate").valueAsDate = new Date();
		
		document.getElementById("pid").value = res1;
	//	alert(res1);
	
	    
		
	}
}


function checkhome(user){
	 var n = moment().format("YYYY-MM-DD");
	   
		document.getElementById("modate").setAttribute("max",n);
		document.getElementById("fodate").setAttribute("max",n);
		document.getElementById("spdate").setAttribute("max",n);


	if(user.includes("dbfdesk")){
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
	
	}
	
	else if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		$("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
	
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	
	else if(user.includes("[ROLE_Accounts Admin]")){
		
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
}
function clos(){
	window.location.reload();
}

function myFunction() {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
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
		
		alert(data)
		window.location = "/HMS/patient.html";
	}
}

	function copy(pid,address2){

    	var strSplit = pid.split(',');
	
       document.getElementById("pid").value = strSplit[0];
	  
       document.getElementById("fname").value=strSplit[1];
    
	   document.getElementById("lname").value = strSplit[2];
	  
	   document.getElementById("regdate").value =strSplit[3];
	   document.getElementById("pofvisit").value = strSplit[4];
	   document.getElementById("dob").value = strSplit[5];
	   document.getElementById("age").value = strSplit[6];
	
	   if( strSplit[7] == "M"){
		     $('#male').click();
		     
		   }
	   else if(strSplit[7] == "F"){
		     $('#female').click();
		    
		    }
	   else{
		   $('#other').click();
		       
	   }
	   document.getElementById("mstatus").value =strSplit[8];
	   document.getElementById("ethnicity").value=strSplit[9];
	   document.getElementById("ssn").value = strSplit[10];
	   document.getElementById("landphone").value=strSplit[11];
	   document.getElementById("mobile").value = strSplit[12];
	   document.getElementById("email").value =strSplit[13];
	 
	  
	  
	   document.getElementById("city").value = strSplit[15];
	   document.getElementById("country").value =strSplit[14];
	  document.getElementById("pcode").value = strSplit[16];
	  document.getElementById("state").value = strSplit[17];
	   document.getElementById("mname").value = strSplit[18];
	 
	   if(strSplit[19] == "yes"){
		   document.getElementById("child").checked = true;
		   disptab()
	   }
	 
	   document.getElementById("mo").value = strSplit[20];
	   document.getElementById("modate").value = strSplit[21];
	   document.getElementById("fo").value = strSplit[22];
	   document.getElementById("fodate").value = strSplit[23];

	   document.getElementById("address2").value = address2;
	   unsaved = false;
	   $('#myModal').modal('show');
	   unsaved = false;
	}
	function copy1(address){
		document.getElementById('address1').value = address;
		
	}
	function agec(birthDate){
		alert(birthDate);
		
		var birthDate= new Date(birthDate);
		   var  currentDate= new Date();
       
		    var years = (currentDate.getFullYear() - birthDate.getFullYear());

		    if (currentDate.getMonth() < birthDate.getMonth() || 
		        currentDate.getMonth() == birthDate.getMonth() && currentDate.getDate() < birthDate.getDate()) {
		        years--;
		    }
		    document.getElementById("age").value = years;
	} 
	
	
	
	function disptab(){
		if(document.getElementById("child").checked){
		
			
			document.getElementById("col3").style.display ="block";
			document.getElementById("col4").style.display ="block";
		//	document.getElementById("hide").style.visibility ="visible";
		
		}
		else{
			document.getElementById("col3").style.display ="none";
			document.getElementById("col4").style.display ="none";
		//	document.getElementById("hide").style.visibility ="hidden";
		}
	}
	function validf(){
		var x = document.getElementById("fname").value;
		var y = document.getElementById("lname").value;
		var z = document.getElementById("mobile").value;
		
		if(x.length == 0){
			alert("Please fill out First Name ")
			return false;
			
		}
		else if(y.length == 0){
			alert("Please fill out Last Name ")
			return false; 
		}
		else if(z.length == 0){
			alert("Update Mobile Number in Contact Details")
			return false; 
		}
		else{
			
			document.getElementById("form4").submit();
		}
	}
	
	function disptab1(){
		if(document.getElementById("spouse").checked){
		
			
			document.getElementById("col5").style.display ="block";
			
		//	document.getElementById("hide").style.visibility ="visible";
		
		}
		else{
			document.getElementById("col5").style.display ="none";
			
		//	document.getElementById("hide").style.visibility ="hidden";
		}
	}
	
	
		function getAge(dateString,id) {
			  var now = new Date();
			 
			  
			  var today = new Date(now.getYear(),now.getMonth(),now.getDate());

			  var yearNow = now.getYear();
			  var monthNow = now.getMonth();
			  var dateNow = now.getDate();

			  var dob = new Date($(dateString).val());

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
			    ageString = age.years + yearString + " " + age.months + monthString + " " + age.days + dayString;
			  else if ( (age.years == 0) && (age.months == 0) && (age.days > 0) )
			    ageString = age.days + dayString;
			  else if ( (age.years > 0) && (age.months == 0) && (age.days == 0) )
			    ageString = age.years + yearString;
			  else if ( (age.years > 0) && (age.months > 0) && (age.days == 0) )
			    ageString = age.years + yearString + "  " + age.months + monthString;
			  else if ( (age.years == 0) && (age.months > 0) && (age.days > 0) )
			    ageString = age.months + monthString + "  " + age.days + dayString;
			  else if ( (age.years > 0) && (age.months == 0) && (age.days > 0) )
			    ageString = age.years + yearString + " " + age.days + dayString;
			  else if ( (age.years == 0) && (age.months > 0) && (age.days == 0) )
			    ageString = age.months + monthString;
			  else{ ageString = "Invalid Date!";

			   alert(ageString);
			  }
			   document.getElementById(id).value = ageString;
			}


		function getAge1(dateString) {
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
			    ageString = age.years + yearString + " " + age.months + monthString + " " + age.days + dayString;
			  else if ( (age.years == 0) && (age.months == 0) && (age.days > 0) )
			    ageString =  age.days + dayString;
			  else if ( (age.years > 0) && (age.months == 0) && (age.days == 0) )
			    ageString = age.years + yearString;
			  else if ( (age.years > 0) && (age.months > 0) && (age.days == 0) )
			    ageString = age.years + yearString + "  " + age.months + monthString;
			  else if ( (age.years == 0) && (age.months > 0) && (age.days > 0) )
			    ageString = age.months + monthString + "  " + age.days + dayString;
			  else if ( (age.years > 0) && (age.months == 0) && (age.days > 0) )
			    ageString = age.years + yearString + "  " + age.days + dayString;
			  else if ( (age.years == 0) && (age.months > 0) && (age.days == 0) )
			    ageString = age.months + monthString;
			  else {var ageString = "Invalid Date!";
			  alert(ageString);
			  }
			  
			   document.getElementById("ager").value = ageString;
			}

		function addcid(id){
			var myname = document.getElementById(id).value; 	
if(id == "pic"){
	if(myname == "Others"){
		 $("#pins").prop('readonly', false);
		 document.getElementById("pins").value ="";
	}
	else{
		$("#pins").prop('readonly', true);
	document.getElementById("pins").value =myname;
	}
}
else{
	if(myname == "Others"){
		 $("#sins").prop('readonly', false);
		 document.getElementById("sins").value ="";
	}
	else{
		 $("#sins").prop('readonly', true);
		document.getElementById("sins").value =myname;
		}
}
			//var cid = document.getElementById("pid").value; 
			
			
			
		}
		function validdate(id){
		
		var va	='Valid? '+ !!document.getElementById(id).value;
	
		if(va == 'Valid? false'){
			alert("invalid date")
			return false;
		}
		else{
			return true;
		}
		}


		
</script>

<script type="text/javascript">
/*    
function doAjaxPostNew(uri, postData, successFn, errorFn) {
    	   $.ajax({
    		   type: "GET",
    		   url: uri,
    		   data: postData,
               contentType: "application/json; charset=UTF-8",
               success: successFn,
               error: errorFn
    	   });
       }
       
       function patientRet() {
    	   var pid = $('#pid').val();
    	   var postData = "pid=" +pid;
    	   var successFn = function(response){
	        	
        	   $.each(response.list2, function(index, datec) {
                    //to print name of employee
               //    $("#date").append('<option value="'+datec.date+','+datec.time+'">'+datec.date+'</option>');
                //   $("#date").selectpicker("refresh");
                   document.getElementById("pins").value =datec.pins;
            	   document.getElementById("sins").value=datec.sins;
            	   document.getElementById("grp1").value = datec.grp1;
            	   document.getElementById("grp2").value= datec.grp2;
            	   document.getElementById("gid1").value = datec.gid1;
            	   document.getElementById("gid2").value = datec.gid2;
            	   document.getElementById("ph1").value = datec.ph1;
            	   document.getElementById("ph2").value= datec.ph2;
            	   document.getElementById("policyheader1").value = datec.policyh1;
            	   document.getElementById("policyheader2").value= datec.policyh2;
            	   
               }),    
        	   
        	   $.each(response.list3, function(index, addn) {
                  //to print name of employee
               //    $("#date").append('<option value="'+datec.date+','+datec.time+'">'+datec.date+'</option>');
                //   $("#date").selectpicker("refresh");

                   document.getElementById("personname").value =addn.personname;
            	   document.getElementById("relationship").value=addn.relationship;
            	   document.getElementById("employer").value = addn.employer;
            	   document.getElementById("rdateofbirth").value= addn.rdateofbirth;
            	   document.getElementById("ager").value = addn.ager;
            	   document.getElementById("workphone").value = addn.workphone;
            	   document.getElementById("mobilephone").value = addn.mobilephone;
            	   document.getElementById("raddress").value= addn.raddress;
            	   document.getElementById("rprovince").value = addn.rprovince;
            	   document.getElementById("rstate").value= addn.rstate;
                   document.getElementById("rcountry").value =addn.rcountry;
                  
            	   if(addn.spouse == "yes"){
            		   
            		   document.getElementById("spouse").checked=true;
            		   document.getElementById("spname").value=addn.spname;
	            	   document.getElementById("spdate").value = addn.spdate;
	            	   disptab1();
            	   }
            	   document.getElementById("nofon").value= addn.nofon;
            	   document.getElementById("refference").value = addn.refference;
            	   document.getElementById("family").value = addn.family;
            	   document.getElementById("allergies").value = addn.allergies;
            	   document.getElementById("presurgery").value= addn.presurgery;
            	   document.getElementById("testrelease").value = addn.testrelease;
            	   document.getElementById("nphone").value= addn.nphone;
            	 
               });    };
             //  var errorFn = ;
           doAjaxPostNew(uri, postData, successFn, errorFn);
       }
*/
       function doAjaxPost() {
    	   // get the form values
    	   
    	         //  var name = $('#pname').val();
    	            var pid = $('#pid').val();
    	           $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/ins.html",
    	        	           data: "pid=" + pid,
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           
    	        	           success: function(response){
    	        	        	
    	        	        	   $.each(response.list2, function(index, datec) {
    	        	                    //to print name of employee
    	        	               //    $("#date").append('<option value="'+datec.date+','+datec.time+'">'+datec.date+'</option>');
    	        	                //   $("#date").selectpicker("refresh");
    	        	           
    	        	                   document.getElementById("pins").value =datec.pins;
    	        	            	   document.getElementById("sins").value=datec.sins;
    	        	            	   document.getElementById("grp1").value = datec.grp1;
    	        	            	   document.getElementById("grp2").value= datec.grp2;
    	        	            	   document.getElementById("gid1").value = datec.gid1;
    	        	            	   document.getElementById("gid2").value = datec.gid2;
    	        	            	   document.getElementById("ph1").value = datec.ph1;
    	        	            	   document.getElementById("ph2").value= datec.ph2;
    	        	            	   document.getElementById("policyheader1").value = datec.policyh1;
    	        	            	   document.getElementById("policyheader2").value= datec.policyh2;
    	        	            	   document.getElementById("policyno1").value = datec.policyno1;
    	        	            	   document.getElementById("policyno2").value= datec.policyno2;
    	        	            	   document.getElementById("mid1").value = datec.mid1;
    	        	            	   document.getElementById("mid2").value= datec.mid2;
    	        	            	   
    	        	               }),    
    	        	        	   
    	        	        	   $.each(response.list3, function(index, addn) {
    	        	                  //to print name of employee
    	        	               //    $("#date").append('<option value="'+datec.date+','+datec.time+'">'+datec.date+'</option>');
    	        	                //   $("#date").selectpicker("refresh");
    
    	        	                   document.getElementById("personname").value =addn.personname;
    	        	            	   document.getElementById("relationship").value=addn.relationship;
    	        	            	   document.getElementById("employer").value = addn.employer;
    	        	            	   document.getElementById("rdateofbirth").value= addn.rdateofbirth;
    	        	            	   document.getElementById("ager").value = addn.ager;
    	        	            	   document.getElementById("workphone").value = addn.workphone;
    	        	            	   
    	        	            	   document.getElementById("mobilephone").value = addn.mobilephone;
    	        	            	   document.getElementById("raddress").value= addn.raddress;
    	        	            	   document.getElementById("rprovince").value = addn.rprovince;
    	        	            	   document.getElementById("rstate").value= addn.rstate;
    	        	                   document.getElementById("rcountry").value =addn.rcountry;
    	        	                  
    	        	            	   if(addn.spouse == "yes"){
    	        	            		   
    	        	            		   document.getElementById("spouse").checked=true;
    	        	            		   document.getElementById("spname").value=addn.spname;
        	        	            	   document.getElementById("spdate").value = addn.spdate;
        	        	            	   disptab1();
    	        	            	   }
    	        	            	   document.getElementById("nofon").value= addn.nofon;
    	        	            	   document.getElementById("refference").value = addn.refference;
    	        	            	   document.getElementById("family").value = addn.family;
    	        	            	   document.getElementById("allergies").value = addn.allergies;
    	        	            	   document.getElementById("presurgery").value= addn.presurgery;
    	        	            	   document.getElementById("testrelease").value = addn.testrelease;
    	        	            	   document.getElementById("nphone").value= addn.nphone;
    	        	            	  
    	        	            	  
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
       function doAjaxPost1() {
    	   // get the form values
    	   
    	         //  var name = $('#pname').val();
    	            var pid = $('#pid').val();
    	           $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/adt.html",
    	        	           data: "pid=" + pid,
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           
    	        	           success: function(response){
    	        	        	  
    	        	        	   $.each(response, function(index, datec) {
    	        	                   //to print name of employee
    	        	                   $("#date").append('<option value="'+datec.date+','+datec.time+'">'+datec.date+'</option>');
    	        	                   $("#date").selectpicker("refresh");
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
      
       
 jQuery().ready(function() {

	
	

   
  // Binding next button on first step
      $(".frm").hide("fast");
        $("#sf1").show("slow");
      
     
        
  $(".open1").click(function() {
	  
	  
	 
        
        $(".frm").hide("fast");
        $("#sf2").show("slow");
	  
   });
 
   // Binding next button on second step
   $(".open2").click(function() {
    
	 
        $(".frm").hide("fast");
        $("#sf3").show("slow");
	   
    });
   $(".open3").click(function() {
	   doAjaxPost();  
       $(".frm").hide("fast");
       $("#sf4").show("slow");
   
   });
   
   $(".open4").click(function() {
	    
       $(".frm").hide("fast");
       $("#sf5").show("slow");
   
   });
   
   $(".open5").click(function() {
	    
       $(".frm").hide("fast");
       $("#sf6").show("slow");
   
   });
   
   
 
     // Binding back button on second step
    $(".back2").click(function() {
      $(".frm").hide("fast");
      $("#sf1").show("slow");
    });
 
     // Binding back button on third step
     $(".back3").click(function() {
      $(".frm").hide("fast");
      $("#sf2").show("slow");
    });
     
     $(".back4").click(function() {
         $(".frm").hide("fast");
         $("#sf3").show("slow");
       });
 
     $(".back5").click(function() {
         $(".frm").hide("fast");
         $("#sf4").show("slow");
       });
 
     $(".back6").click(function() {
         $(".frm").hide("fast");
         $("#sf5").show("slow");
       });
 
     
 

   });

</script>


</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="onload = checkhome('<c:out value="${username}" />'),disptab(),disptab1()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Patient Details </a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
    <br>
    <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e' id="back" onclick="window.location.href='/HMS/frontdesk';"></i>
    
  </div>
</nav>
  <center>
</center>
    
  <div id="form2">  
  
    
	  <h1>
	  <button type="button" class="btn btn-warning button1"  data-toggle="modal" data-target="#myModal">
	  <span class="glyphicon glyphicon-plus"></span>New Patient</button>
<font size="5">Patient Details</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Name or Id"  style="width:150px"/></span>
	  </h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 915px; " id="myTable">
    <thead>
      <tr>
        <th style="width:150px;">PatientId</th>
        <th style="width:150px;">First Name</th>
        <th style="width:150px;">Last Name</th>
        <th style="width:150px;">Registered Date</th>
        <th style="width:150px;">Purpose of visit</th>
        <th style="width:150px;">Edit</th>
         <th style="width:15px;"></th>
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list2}">
    <tr>
    <td width="150px;">${p1.pid}</td>
    <td width="150px;">${p1.fname}</td>
    <td width="150px;">${p1.lname}</td>
     <td width="150px;">${p1.regdate}</td>
    <td width="150px;">${p1.pofvisit}</td>
    <td width="150px;"><i class="fa fa-pencil" style="color:#00b300" onclick="copy('${p1.pid},${p1.fname},${p1.lname},${p1.regdate},${p1.pofvisit},${p1.dob},${p1.age},${p1.gender},${p1.mstatus},${p1.ethnicity},${p1.ssn},${p1.landphone},${p1.mobile},${p1.email},${p1.country},${p1.city},${p1.pcode},${p1.state},${p1.mname},${p1.child},${p1.mo},${p1.modate},${p1.fo},${p1.fodate}','${p1.address2 }'),copy1('${p1.address1}')"></i></td>
   
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    
   

   
	  <!--  
	   <div style="text-align:center;">
	    
	 <select class="selectpicker" data-width="20%" multiple title="Patient ID" data-show-subtext="true" data-live-search="true" name = "pid1" id ="pid1" onchange="change()">
      <option value="new">New</option>
     <c:forEach var="p1"  items="${model.list1}">
  <option value ="${p1.pid},${p1.fname},${p1.lname},${p1.regdate},${p1.dob},${p1.age},${p1.gender},${p1.mstatus},${p1.pofvisit},${p1.landphone},${p1.mobile},${p1.email},${p1.ssn},${p1.address},${p1.city},${p1.country},${p1.pcode},${p1.ethnicity}">${p1.pid}</option>
   </c:forEach>
      </select>
     
   </div>
    
    <br>
  
    <div class="contentform">
<div class="leftcontact">
			   
			   <div class="validation"></div>
			   
<div class="input-group">  
 		<span class="input-group-addon">Id</span>
		<input type="text" name="pid" id="pid" class="form-control input-sm" placeholder="Patient Id" style="width:200px"/>
	</div><br>
			   
        
<div class="input-group">  
 		<span class="input-group-addon">First Name</span>
		<input type="text" name="fname" id="fname" class="form-control input-sm" placeholder="First Name" style="width:200px"/>
	</div><br>

<div class="input-group">  
 		<span class="input-group-addon">Last Name</i></span>
		<input type="text" name="lname" id="lname" class="form-control input-sm" placeholder="Last Name" style="width:200px"/>
</div><br>

<div class="input-group">  
 		<span class="input-group-addon">Registeration Date</span>
<input placeholder="Registration Date" class="textbox-n form-control input-sm" name="regdate" type="text" onfocus="(this.type='date')" style="width:200px" onblur="(this.type='text')" id="regdate">
</div><br>

<div class="input-group">  
 		<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
		<input type="text" onfocus="(this.type='date')" style="width:200px" onblur="(this.type='text')" name="dob" id="dob" class=" textbox-n form-control input-sm" placeholder="Date of birth" style="width:200px"/>
</div><br>

<div class="input-group">  
 		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		<input type="text" name="age" id="age" class="form-control input-sm" placeholder="Age" style="width:200px"/>
</div><br>

<div class="input-group">  
 		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
 <select class="form-control" title="Gender" name = "gender" id ="gender" style="width:200px">
      <option>M</option>
      <option>F</option>
      <option>O</option>
 </select>
 </div>
 <br>


<div class="input-group">  
 		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		<input type="text" name="mstatus" id="mstatus" class="form-control input-sm" placeholder="Marital Status" style="width:200px"/>
</div><br>

<div class="input-group">  
 		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		<input type="text" name="pofvisit" id="pofvisit" class="form-control input-sm" placeholder="Reason for visit" style="width:200px"/>
</div>
 </div>

	<div class="rightcontact">	

<div class="input-group">  
 <span class="input-group-addon"><i class="fa fa-phone"></i></span>
	<input type="text" name="landphone" id="landphone" class="form-control input-sm" placeholder="Land Line" style="width:200px"/>
</div><br>

<div class="input-group">  
 <span class="input-group-addon"><i class="fa fa-mobile"></i></span>
<input type="text" name="mobile" id="mobile" class="form-control input-sm" placeholder="Mobile" style="width:200px"/>
</div><br>

<div class="input-group">  
 <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
<input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email" style="width:200px"/>
</div><br>

<div class="input-group">  
 		<span class="input-group-addon"><i class="fa fa-lock"></i></span>
		<input type="text" name="ssn" id="ssn" class="form-control input-sm" placeholder="SSN" style="width:200px"/>
</div><br>

<div class="input-group">  
 		<span class="input-group-addon"><i class="fa fa-address-book-o"></i></span>
		<input type="text" name="address" id="address" class="form-control input-sm" placeholder="Address" style="width:200px"/>
</div><br>

<div class="input-group">  
 		<span class="input-group-addon"><i class="fa fa-building"></i></span>
		<input type="text" name="city" id="city" class="form-control input-sm" placeholder="City" style="width:200px"/>
</div><br>

<div class="input-group">  
 		<span class="input-group-addon"><i class="fa fa-flag"></i></span>
		<input type="text" name="country" id="country" class="form-control input-sm" placeholder="Country" style="width:200px"/>
</div><br>

<div class="input-group">  
 		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		<input type="text" name="pcode" id="pcode" class="form-control input-sm" placeholder="Postal code" style="width:200px"/>
</div><br>

<div class="input-group">  
 		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		<input type="text" name="ethnicity" id="ethnicity" class="form-control input-sm" placeholder="Ethnicity" style="width:200px"/>
</div>
			
	</div>
	</div>
	
	<c:forEach var="q"  items="${model.list}">
   <script>
   check('<c:out value="${q.pid}" />');
   </script>
   </c:forEach>	
  -->
<button type="" class="bouton-contact"></button>
	
</div>

<div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
      <div id="form1">
       <form id="form4" action="/HMS/saveP.html" method="post">  
  
        <h1>New Patient Registration
         <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>    
       </h1>
       <br>
       <div id="sf1" class="frm">
<!--  user name field will be here with next button -->
     <fieldset>
     <div class="col-xs-1"></div>
            <font size="2" color="#009999">Step 1 of 6</font>
          
  
           	
            <hr style="border: 1px solid #cccccc">
        <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  <div class="form-group">
            <p>Patient Id <span>*</span></p>
          <input type="text" readonly name="pid" id="pid" class="form-control input-sm"  required>
	</div>
  </div>
  
   <div class="col-xs-4">
 <div class="form-group">
            <p>Registered Date <span></span></p>
         	<input type="date" readonly max="2999-12-31"name="regdate" id="regdate" class="form-control input-sm" required>
	</div>
  </div>
  
   <div class="col-xs-3">
    
	   <div class="form-group">
            <p>Purpose of Visit <span></span></p>
    <input type="text" name="pofvisit" id="pofvisit" class="form-control input-sm"  required>
</div>
	</div>
 
 </div>
    <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
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
            <font size="2" color="#009999">Step 2 of 6    </font>
      <span class="button3"><font size="2" color="#009999">Click here if patient is a Minor: </font><input type="checkbox" name="child" id="child" value="yes" onclick="disptab()"></span>
            <hr style="border: 1px solid #cccccc">
   
  
  
 <center><b><font size="3">Personal Details</font></b></center>
   <br>
          <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  
   <div class="form-group">
    
            <p>First Name <span>*</span></p>
         	<input type="text" name="fname" id="fname" maxlength="100" class="form-control input-sm"  required>
	
	</div>
 
  </div>
  
   <div class="col-xs-4">
    <div class="form-group">
            <p>Middle Name <span></span></p>
         	<input type="text" name="mname" maxlength="10" id="mname" class="form-control input-sm"   >
</div>
    </div>
  
   <div class="col-xs-3">
  <div class="form-group">
            <p>Last Name <span>*</span></p>
     <input type="text" name="lname" id="lname" maxlength="10" class="form-control input-sm"  required>

	</div>
  </div>
       
 
</div>

<div class="form-group row" id="col3" >
        <div class="col-xs-1"></div>
        
<div class="col-xs-5">
    <div class="form-group">
            <p>Mother Name <span></span></p>
     <input type="text" name="mo" id="mo" maxlength="100"  class="form-control input-sm" required>

	</div>
   </div>
   <div class="col-xs-5">
    <div class="form-group">
            <p>Date of Birth <span></span></p>
     <input type="date" maxlength="2999-312-31"name="modate" id="modate" onkeydown="return false"  onblur="return validdate(this.id)"  class="form-control input-sm" required>

	</div>
   </div>
  
</div>

<div class="form-group row" id="col4" >
        <div class="col-xs-1"></div>
        
<div class="col-xs-5">
    <div class="form-group">
            <p>Father Name <span></span></p>
     <input type="text" name="fo" id="fo"  maxlength="100" class="form-control input-sm" required>

	</div>
   </div>
   <div class="col-xs-5">
    <div class="form-group">
            <p>Date of Birth <span></span></p>
     <input type="date" maxlength="2999-312-31"  name="fodate" id="fodate" onkeydown="return false"  onblur="return validdate(this.id)" class="form-control input-sm" required>

	</div>
   </div>
  
</div>
  <div class="form-group row" >
        <div class="col-xs-1"></div>

<div class="col-xs-3">
    <div class="form-group">
            <p>Date of Birth <span></span></p>
     <input type="date" maxlength="2999-312-31"name="dob" id="dob"  onblur='getAge(this,"age")' class="form-control input-sm" required>

	</div>
   </div>
   
   <div class="col-xs-4">
    <div class="form-group">
            <p>Age <span></span></p>
    <input type="text" readonly="readonly" name="age" id="age" class="form-control input-sm"   required>
</div>
   </div>
   
    <div class="col-xs-3">
    <div class="form-group">
        
     <div class="btn-group" data-toggle="buttons"><p>Gender <span></span></p>
     <label class="btn btn-default"><input class="form-control input-sm"  style="width: 0px;" id="male" value="M" type="radio" name="gender" />M</label>
 		<label class="btn btn-default"><input class="form-control input-sm" style="width: 0px;" id="female" value="F" type="radio" name="gender" />F</label>
 	<label class="btn btn-default"><input class="form-control input-sm" style="width: 0px;" type="radio" value="O" id="other" name="gender" />Other</label> 
 		</div>
   </div>
	</div>
  </div>
  
     <div class="form-group row" >
        <div class="col-xs-1"></div>
  <div class="col-xs-3">
  <div class="form-group">
            <p>Marital Status<span></span></p>
   
    <select name="mstatus" id="mstatus" class="form-control input-sm">
    <option value="Divorced">Divorced</option>
    <option value="Single">Single</option>
    <option value="Married">Married</option>
    
    </select> 
</div>
  </div>
  
  <div class="col-xs-4">
   <div class="form-group">
            <p>Ethnicity<span></span></p>
    <input type="text" name="ethnicity" id="ethnicity" class="form-control input-sm"  />

	</div>
  </div>

 <div class="col-xs-3">
 <div class="form-group">
            <p>NRC No or Passport No <span></span></p>
    <input type="text" name="ssn" id="ssn" class="form-control input-sm"  />
</div>
  </div>

  </div>
  

   
   
    <div class="clearfix" style="height: 10px;clear: both;"></div>

            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                <!-- back2 unique class name  -->
                <center><button class="btn btn-warning back2" type="button"><span class="fa fa-arrow-left"></span> Back</button> 
                <!-- open2 unique class name -->
                <button class="btn btn-primary open2" type="button">Next <span class="fa fa-arrow-right"></span></button> </center>
              </div>
            </div>
</fieldset>

</div>

   <!-- id will be unique, but class name will be same -->
<div id="sf3" class="frm">
<!--  user email field will be here with next and previous button -->
<fieldset>
            <div class="col-xs-1"></div>
            <font size="2" color="#009999">Step 3 of 6</font>
            <hr style="border: 1px solid #cccccc">
<center><b><font size="3">Contact Details</font></b></center>
   <br>
   <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
   <div class="form-group">
            <p>LandPhone <span></span></p>
       <input type="text" class="form-control input-sm" value="080" required maxlength="11" name="landphone" id="landphone" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
</input>
</div>
  </div>
  
  <div class="col-xs-4">
 <div class="form-group">
            <p>Mobile<span>*</span></p>
       <input type="text" class="form-control input-sm"  required maxlength="14" name="mobile" id="mobile" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
</input></div>
  </div>
  
  <div class="col-xs-3">
  <div class="form-group">
            <p>Email <span></span></p>
    <input type="email" name="email" placeholder="someone@example.com" id="email" class="form-control input-sm"  required>
</div>
  </div>
  
  </div>
  
  <div class="form-group row" >
        <div class="col-xs-1"></div>
  
 <div class="col-xs-3">
  <div class="form-group">
            <p>Address1<span></span></p>
            <textarea name="address1" id="address1" rows="5" data-rule="required" data-msg="address1"></textarea>
</div>
  </div>
  <div class="col-xs-4">
  <div class="form-group">
            <p >Address2<span></span></p>
            <textarea name="address2" id="address2" rows="5" data-rule="required" data-msg="address2"></textarea>
</div>
  
  </div>
   <div class="col-xs-3">
    <div class="form-group">
            <p>Country <span></span></p>
            <input type="text" name="country" id="country" class="form-control input-sm" >
</div>
  </div>
  </div>
  
  <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        <div class="col-xs-3">
 <div class="form-group">
            <p>Province <span></span></p>
             <input type="text" name="state" id="state" class="form-control input-sm" >
</div>
  </div>
  <div class="col-xs-4">
  <div class="form-group">
            <p>City <span></span></p>
             <input type="text" name="city" id="city" class="form-control input-sm" >
</div>
  </div>
  <div class="col-xs-3">
   <div class="form-group">
            <p>Po Box<span></span></p>
    <input type="text" maxlength="6" name="pcode" onkeypress='return event.charCode >= 48 && event.charCode <= 57' id="pcode" class="form-control input-sm" >
</div>
  </div>
  
  </div>
 
  <div class="form-group row" >
     <div class="col-xs-1"></div>
        
       <div class="col-xs-3">
           
</div>

<div class="col-xs-4">
  
  </div>
         <div class="col-xs-3">
  
  </div>
  </div>
  
 <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                <!-- Unique class name -->
              <center>  <button class="btn btn-warning back3" type="button"><span class="fa fa-arrow-left"></span> Back</button> 
                <!-- Unique class name -->
                <button class="btn btn-primary open3" type="button">Next <span class="fa fa-arrow-right"></span></button> </center>
           
              </div>
            </div>
   
   </fieldset>
   </div>
<div id="sf4" class="frm">
<!--  user email field will be here with next and previous button -->
<fieldset>
             <div class="col-xs-1"></div>
            <font size="2" color="#009999">Step 4 of 6</font>
            <hr style="border: 1px solid #cccccc">
 
  
  
 <center><b><font size="3">Insurance Information</font></b></center>
   <br>
   <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-2">
  
   <div class="form-group">
    
            <p>Primary Ins <span></span></p>
         	<input type="text" name="pins" id="pins" class="form-control input-sm" readonly="readonly" value="NA" required>
	
	</div>
 
  </div>
  
  <div class="col-xs-3">
  
            <p>Insurance Companies<span></span></p>
    <select class="selectpicker form-control" data-size="5"  data-live-search="true" id="pic"onchange="addcid(this.id)">
    <option value="Select" selected disabled>Select</option>
     <c:forEach var="p"  items="${model.list4}">
        <option value="${p.psis}">${p.psis}</option>
      </c:forEach>
    <option value="Others">Others</option>
    
    </select>

	
   </div>
  
  
   <div class="col-xs-2">
    <div class="form-group">
            <p>Secondary Ins <span></span></p>
         	<input type="text" name="sins" id="sins" class="form-control input-sm"  value="NA" readonly="readonly" >
</div>
    </div>
  
  <div class="col-xs-3">
 
           <p>Insurance Companies<span></span></p>
    <select class="selectpicker form-control" data-size="5"  data-live-search="true" id="sic" onchange="addcid(this.id)">
    <option value="Select" selected disabled>Select</option>
     <c:forEach var="p"  items="${model.list4}">
        <option value="${p.psis}">${p.psis}</option>
      </c:forEach>
    <option value="Others">Others</option>
    </select>
	
   </div> 
       

</div>
  <div class="form-group row" >
        <div class="col-xs-1"></div>

<div class="col-xs-3">
    <div class="form-group">
            <p>Group No <span></span></p>
     <input type="text" name="grp1" id="grp1"   class="form-control input-sm" value="NA" required>

	</div>
   </div>
   
   <div class="col-xs-2">
    <div class="form-group">
            <p>Group IDS<span></span></p>
     <input type="text" name="gid1" id="gid1"   class="form-control input-sm" value="NA" required>

	</div>
   </div>
   
   <div class="col-xs-3">
    <div class="form-group">
            <p>Group Nums<span></span></p>
    <input type="text" name="grp2" id="grp2" class="form-control input-sm" value="NA"  required>
</div>
   </div>
   
   <div class="col-xs-2">
    <div class="form-group">
            <p>NRC No <span></span></p>
    <input type="text"  name="gid2" id="gid2" class="form-control input-sm" value="NA"  required>
</div>
   </div>
   
  
  </div>
  
   <div class="form-group row" >
        <div class="col-xs-1"></div>

<div class="col-xs-3">
    <div class="form-group">
            <p>Policy No <span></span></p>
     <input type="text" name="policyno1" id="policyno1"   class="form-control input-sm" value="NA" required>

	</div>
   </div>
   
   <div class="col-xs-2">
    <div class="form-group">
            <p>Membership Id<span></span></p>
     <input type="text" name="mid1" id="mid1"   class="form-control input-sm" value="NA" required>

	</div>
   </div>
   
   <div class="col-xs-3">
    <div class="form-group">
            <p>Policy No<span></span></p>
    <input type="text" name="policyno2" id="policyno2" class="form-control input-sm"   required>
</div>
   </div>
   
   <div class="col-xs-2">
    <div class="form-group">
            <p>Membership Id<span></span></p>
    <input type="text"  name="mid2" id="mid2" class="form-control input-sm"  value="NA" required>
</div>
   </div>
   
  
  </div>
  
     <div class="form-group row" >
        <div class="col-xs-1"></div>
  <div class="col-xs-5">
  <div class="form-group">
            <p>Ins.Phone <span></span></p>
   
     <input type="text" name="ph1" id="ph1" class="form-control input-sm" value="NA" />
</div>
  </div>
  <div class="col-xs-5">
   <div class="form-group">
            <p>Ins.Phone <span></span></p>
    <input type="text" name="ph2" id="ph2" class="form-control input-sm" value="NA" />

	</div>
  </div>
 </div>
  
       <div class="form-group row" >
        <div class="col-xs-1"></div>
  <div class="col-xs-5">
  <div class="form-group">
            <p>Policy Holder<span></span></p>
   
     <input type="text" name="policyh1" id="policyheader1" class="form-control input-sm" value="NA" />
</div>
  </div>
  
  <div class="col-xs-5">
   <div class="form-group">
            <p>Policy Holder <span></span></p>
    <input type="text" name="policyh2" id="policyheader2" class="form-control input-sm"  value="NA" />

	</div>
  </div>

 

  </div>
    <div class="clearfix" style="height: 10px;clear: both;"></div>

            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                <!-- back2 unique class name  -->
                <center><button class="btn btn-warning back4" type="button"><span class="fa fa-arrow-left"></span> Back</button> 
                <!-- open2 unique class name -->
                 <button class="btn btn-primary open4" type="button">Next <span class="fa fa-arrow-right"></span></button> </center>
           
             
               
              </div>
            </div>
</fieldset>
</div>

<div id="sf5" class="frm">
<!--  user email field will be here with next and previous button -->
<fieldset>
             <div class="col-xs-1"></div>
            <font size="2" color="#009999">Step 5 of 6</font>
              <span class="button3"><font size="2" color="#009999">Spouse Information: </font><input type="checkbox" name="spouse" id="spouse" value="yes" onclick="disptab1()"></span>
      
            <hr style="border: 1px solid #cccccc">
 
  
  
 <center><b><font size="2">Responsible Part Information</font></b></center>
   <br>
   
          <div class="form-group row" id="col5">
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-5">
  
   <div class="form-group">
    
            <p>Spouse Name<span></span></p>
         	<input type="text" name="spname" id="spname" class="form-control input-sm"  >
	
	</div>
 
  </div>
  
  <div class="col-xs-5">
  
   <div class="form-group">
    
            <p>Date of Birth<span></span></p>
         	<input type="date" name="spdate" id="spdate" onkeydown="return false"  onblur="return validdate(this.id)" class="form-control input-sm"  >
	
	</div>
 
  </div>
  
  </div>
          <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-3">
  
   <div class="form-group">
    
            <p>Name of Person<span></span></p>
         	<input type="text" name="personname" id="personname" class="form-control input-sm"  >
	
	</div>
 
  </div>
  
  <div class="col-xs-4">
  
   <div class="form-group">
    
            <p>Relationship to Patient<span></span></p>
         	<input type="text" name="relationship" id="relationship" class="form-control input-sm"  >
	
	</div>
 
  </div>
  
   <div class="col-xs-3">
  
   
       <div class="form-group">
    
            <p>Employer<span></span></p>
         	<input type="text" name="employer" id="employer" class="form-control input-sm"  >
	
	</div>
 
  </div>
 
	</div>
            <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        

  
   <div class="col-xs-3">
    <div class="form-group">
            <p>Date of Birth <span></span></p>
         	<input type="date" name="rdateofbirth"  onblur='getAge(this,"ager")' id="rdateofbirth" class="form-control input-sm"   >
</div>
    </div>
  
  
  
   <div class="col-xs-4">
  <div class="form-group">
            <p>Age<span></span></p>
     <input type="text" name="ager" id="ager" readonly="readonly" class="form-control input-sm"  >

	</div>
  </div>
  
     <div class="col-xs-3">
  <div class="form-group">
            <p>Address<span></span></p>
   	<input type="text" name="raddress" id="raddress" class="form-control input-sm"  >
	

	</div>
  </div>
  
  
  
  
   
   
 
</div>
          <div class="form-group row" >
        <div class="col-xs-1"></div>
        <div class="col-xs-3">
    <div class="form-group">
            <p>Mobile Phone<span></span></p>
         	<input type="text" name="mobilephone" id="mobilephone" class="form-control input-sm"   >
</div>
    </div>
  <div class="col-xs-4">
  
   <div class="form-group">
    
            <p>Work Phone<span></span></p>
         	<input type="text" name="workphone" id="workphone" class="form-control input-sm"  >
	
	</div>
 
  </div>
        
  <div class="col-xs-3">
  
   <div class="form-group">
    
            <p>Home Phone<span></span></p>
         	<input type="text" name="homephone" id="homephone" class="form-control input-sm"  >
	
	</div>
 
  </div>
  

  
  
  
  
  
  
       
 
</div>

  <div class="form-group row" >
        <div class="col-xs-1"></div>
          <div class="col-xs-3">
  
   <div class="form-group">
    
            <p>Country<span></span></p>
              <input type="text" name="rcountry" id="rcountry" class="form-control input-sm" >
            
         
	</div>
 
  </div>
        
         <div class="col-xs-4">
    <div class="form-group">
            <p>Province<span></span></p>
              <input type="text" name="rprovince" id="rprovince" class="form-control input-sm" >
            
         	
</div>
    </div>

 <div class="col-xs-3">
  <div class="form-group">
            <p>City<span></span></p>
            <input type="text" name="rstate" id="rstate" class="form-control input-sm" >

            
            
            
            </select>
     
	</div>
  </div>
  
  </div>
  
  
  
    <div class="clearfix" style="height: 10px;clear: both;"></div>

            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                <!-- back2 unique class name  -->
                <center><button class="btn btn-warning back5" type="button"><span class="fa fa-arrow-left"></span> Back</button> 
                <!-- open2 unique class name -->
                <button class="btn btn-primary open5" type="button">Next <span class="fa fa-arrow-right"></span></button> </center>
              </div>
            </div>
</fieldset>
</div>
<div id="sf6" class="frm">
<!--  user email field will be here with next and previous button -->
<fieldset>
             <div class="col-xs-1"></div>
            <font size="2" color="#009999">Step 6 of 6</font>
            <hr style="border: 1px solid #cccccc">
 
  
  
 <center><b><font size="2">Additional Information</font></b></center>
   <br>
          <div class="form-group row" >
        <div class="col-xs-1"></div>
        
        
  <div class="col-xs-5">
  
   <div class="form-group">
    
            <p>Name of nearest relative not living with you <span></span></p>
         	<input type="text" name="nofon" id="nofon" class="form-control input-sm"  >
	
	</div>
 
  </div>
  
   <div class="col-xs-5">
    <div class="form-group">
            <p>Phone<span></span></p>
         	<input type="text" name="nphone" id="nphone" class="form-control input-sm"   >
</div>
    </div>
  
  
       
</div>
  <div class="form-group row" >
        <div class="col-xs-1"></div>

<div class="col-xs-5">
    <div class="form-group">
            <p>Who referred you to our office <span></span></p>
     <input type="text" name="refference" id="refference"   class="form-control input-sm" >

	</div>
   </div>
   
   <div class="col-xs-5">
    <div class="form-group">
            <p>Name of immediate family who have been patients<span></span></p>
    <input type="text"  name="family" id="family" class="form-control input-sm"  >
</div>
   </div>
   
    
	</div>
	
	
  
  
     <div class="form-group row" >
        <div class="col-xs-1"></div>
  <div class="col-xs-5">
  <div class="form-group">
            <p>Patient's Allergies to Medicines<span></span></p>
   <input type="text"  name="allergies" id="allergies" class="form-control input-sm"   >
    
</div>
  </div>
  
  <div class="col-xs-5">
   <div class="form-group">
            <p>List patient's previous Surgeries<span></span></p>
    <input type="text" name="presurgery" id="presurgery" class="form-control input-sm"  />

	</div>
  </div>

 
  </div>
  
   <div class="form-group row" >
        <div class="col-xs-1"></div>
  <div class="col-xs-5">
  <div class="form-group">
            <p>Reason for visit<span></span></p>
   <input type="text"  name="" id="" class="form-control input-sm"   >
    
</div>
  </div>
  
  <div class="col-xs-5">
   <div class="form-group">
            <p>Family member to whom the test can be released in absence of Patient<span></span></p>
    <input type="text" name="testrelease" id="testrelease" class="form-control input-sm"  />

	</div>
  </div>

 
  </div>
    <div class="clearfix" style="height: 10px;clear: both;"></div>

            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                <!-- back2 unique class name  -->
                <center><button class="btn btn-warning back6" type="button"><span class="fa fa-arrow-left"></span> Back</button> 
                <!-- open2 unique class name -->
                    <button class="btn btn-primary" form="form4" type="submit" id="bouton-contact" onclick="return validf();"> Save</button> </center>
                   
              </div>
            </div>
</fieldset>
</div>

</form>
<button  class="bouton-contact"></button>
</div>
        
        </div>
        
      </div>
      
    </div>
  


<c:forEach var="p"  items="${model.list}">
<script>
check('<c:out value="${p.pid}" />');
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