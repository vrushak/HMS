<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


<style type="text/css">
.wrapper {
  height : auto;
  background: #e6e6e6;  
  font-family: 'Open Sans', sans-serif;
}


.info i {
  color:#F6AA93;
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
  color: #0066FF;
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
  height: 50px; 
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




i {
  color:#555;
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




table {
    border-collapse: collapse;
    width: 100%;
    }
th {
    background-color: #009999;
    color: white;
    width : 150px;
}

.table-fixed{
 
}
  tbody{
    height:300px;
    overflow-y:auto;
 }
  thead,tbody{
  
    display:block;
  }

 

.button1{
	float : left;
	
	
}
.button2{
	float : right;
}

option[default] {
  display: none;
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
  max-width:1000px;
  width:100%;
  margin: 5% auto;
  background-color: #FFFFFF;
  overflow: hidden;
}
</style>
<script>
function check(str){
	
	 
	if (str == "" || str == null){
    	
		
		
		id = 1;
		var str1 = "P-";
	    var m = moment().format("DDMMYYYY-");
		var str3 = id;
		var res = str1.concat(m);
		var res1 = res.concat(str3);


		document.getElementById("pid").value = res1;
    	//alert(res1);
	}
	else {
		
		var ida = str.split('-');
		
		var id = ida[2];
		
		var ida = Number(id) + 1;
	
		var str1 = "P-";
		var m = moment().format("DDMMYYYY-");
		var n = moment().format("DD-MM-YYYY");
		var str3 = ida;
		var res = str1.concat(m);
		var res1 = res.concat(str3);
		 document.getElementById("date1").value = n;
		
		document.getElementById("pid").value = res1;
	//	alert(res1);
	}
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

	function copy(pid){

    	var strSplit = pid.split(',');
	
       document.getElementById("pid").value = strSplit[0];
	  
       document.getElementById("fname").value=strSplit[1];
    
	   document.getElementById("lname").value = strSplit[2];
	  
	   document.getElementById("regdate").value =strSplit[3];
	   document.getElementById("pofvisit").value = strSplit[4];
	   document.getElementById("dob").value = strSplit[5];
	   document.getElementById("age").value = strSplit[6];
	   document.getElementById("mstatus").value =strSplit[8];
	 
	  
	   document.getElementById("landphone").value=strSplit[9];
	   document.getElementById("mobile").value = strSplit[10];
	   document.getElementById("email").value =strSplit[11];
	   document.getElementById("ssn").value = strSplit[12];
	   document.getElementById("address1").value=strSplit[13];
	   
	   document.getElementById("city").value = strSplit[14];
	   document.getElementById("country").value =strSplit[15];
	  document.getElementById("pcode").value = strSplit[16];
	   document.getElementById("ethnicity").value=strSplit[17];
	   
	   $('#myModal').modal('show');
	}
	
	function display(){ 
		
		
		var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
		var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
		
		//    var m = moment().format('YYYY-MM-DD h:mm a');

		  var newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='220px';><select class='selectpicker form-control' data-size='1' data-live-search='true' style='width: 125px;' form ='forma'   type='text' id = 'labtestname' name= 'labtestname'  required><option disabled>Select</option></select> </td></tr>";
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='220px';><input style='width:125px;' form ='forma'  style='width: 125px;'class= 'form-control input-sm'  rows='1'  id = 'sampletype'  name= 'sampletype' required></td></tr>";
		   
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='220px';><input form ='forma' class= 'form-control input-sm' style='width: 125px;' type='number'  id = 'sampleqty' name= 'sampleqty'  required  ></td></tr>";
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='220px';><select style='width: 125px;' form ='forma' class= 'form-control input-sm'  id = 'samplecol'  name= 'samplecol'  required><option disabled>Select</option><option>Yes</option><option>No</option></select></td></tr>";
		   
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='220px';><select style='width: 125px;' form ='forma' class= 'form-control input-sm'  id = 'sampletest'  name= 'sampletest'  required><option disabled>Select</option><option>Yes</option><option>No</option></select></td></tr>";
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='220px';><input style='width: 125px;' form ='forma' class= 'form-control input-sm'  id = 'sampleid'  name= 'sampleid'  required></td></tr>";
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='220px';><textarea form ='forma' class= 'form-control input-sm' rows='1' data-rule='required' data-msg='comments' id = 'tresult'  name= 'tresult'  required></textarea></td></tr>";
		 
		  

		
	}
		  
	
</script>
<script type="text/javascript">
$(document).ready(function() {

	/*var v = $("#form1").validate({
      rules: {
        pid: {
          required: true,
          
        },
        regdate: {
          required: true,
        },
        pofvisit: {
          required: true,
          
        },
        fname: {
            required: true,
        },
        lname: {
            required: true,
        },
        dob: {
            required: true,
        },
        age: {
            required: true,
        },
        ssn: {
            required: true,
        },
        landphone: {
            required: true,
        },
        mobile: {
            required: true,
        },
        ssn: {
            required: true,
        },
        landphone: {
            required: true,
        },
        mobile: {
            required: true,
        },
        email: {
            required: true,
        },
        address1: {
            required: true,
        },
        country: {
            required: true,
        },
        state: {
            required: true,
        },
        city: {
            required: true,
        },
        pcode: {
            required: true,
        }
      },
      errorElement: "span",
      errorClass: "help-inline",
    });*/


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
	 
    $(".frm").hide("fast");
    $("#sf4").show("slow");
	 
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

});

</script>


</head>
<body>
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Patient Details</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="homeH.jsp">Home</a></li>
    </ul>
  </div>
</nav>
<form id="form1" name="form1" action="saveP.html" method="post">  
  
   <h1>
	  <button type="button" class="btn btn-warning button1"   data-toggle="modal" data-target="#myModal">
	  <span class="glyphicon glyphicon-eye"></span>View Previous Tests</button>
<font size="5" color="#FFF">Lab Activity</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search by Name" onkeyup="myFunction()" style="width:150px"/></span>
	  </h1><br>
	  <div id="sf1" class="frm">
<!--  user name field will be here with next button -->
     <fieldset>
     <div class="col-xs-1"></div>
            <font size="2" color="#009999">Page 1 of 2</font>
            <hr style="border: 1px solid #cccccc">
   <div class="form-group row" >
        
        <div class="col-xs-1"></div>
        <div class="col-xs-3">
  		<div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control" data-size="1" data-live-search="true" name = "pname" id ="pname" onchange="addname()"   >
          <option>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.admdate}">${p.pname}</option>
        </c:forEach>
      </select>
       </div>
  		</div>
  		
  		<div class="col-xs-4">
  		<div class="form-group">
            <p>Lab Record No. <span>*</span></p>
          <input type="text" name="lid" id="lid" class="form-control input-sm"  required readonly>
		</div>
  		</div>
  		
  		<div class="col-xs-3">
  		<div class="form-group">
            <p>Date<span>*</span></p>
          <input type="text" name="date1" id="date1" class="form-control input-sm"  required readonly>
		</div>
  		</div>
  		
  		
   </div>
   
   <div class="form-group row" >
   			<div class="col-xs-1"></div>
   			<div class="col-xs-3">
  		<div class="form-group">
            <p>Patient ID<span>*</span></p>
          <input type="text" name="pid" id="pid" class="form-control input-sm"  required readonly>
		</div>
  		</div>
  		
  		<div class="col-xs-4">
  		<div class="form-group">
            <p>Referred by Doctor<span>*</span></p>
          <input type="text" name="dname" id="dname" class="form-control input-sm"  required readonly>
		</div>
  		</div>
  		
  		<div class="col-xs-3">
  		<div class="form-group">
            <p>In/Out Patient<span>*</span></p>
          <input type="text" name="iop" id="iop" class="form-control input-sm"  required readonly>
		</div>
  		</div>
   
   
   </div>
   
   
   <div class="form-group row" >
   			<div class="col-xs-1"></div>
   			<div class="col-xs-3">
  		<div class="form-group">
            <p>Lab Person Name<span>*</span></p>
          <input type="text" name="labpersname" id="labpersname" class="form-control input-sm"  required>
		</div>
  		</div>
   
   </div>
   <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                <!-- open1 is given in the class that is binded with the click event -->
                <center><button class="btn btn-primary open1" name="button1" id="button1" type="button"  >Next <span class="fa fa-arrow-right"></span></button> </center>
              </div>
            </div>
    </fieldset>
    </div>
    <div id="sf2" class="frm">
<!--  user email field will be here with next and previous button -->
<fieldset>
             <div class="col-xs-1"></div>
            <font size="2" color="#009999">Page 2 of 2</font>
            <hr style="border: 1px solid #cccccc">
            
            <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 965px; " id="myTable">
    <thead>
      <tr>
        <th class="">Lab Test Name</th>
        <th class="">Sample Type</th>
        <th class="">Sample Qty</th>
        <th class="">Sample Collected</th>
        <th class="">Sample Tested</th>
        <th class="">Sample ID</th>
        <th class="">Test Result</th>
        
        
       
      </tr>
    </thead>
    <tbody class="tbody">

    <tr>
    	
    
    </tr>
     
    </tbody>
    </table>
    </div>
	  <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                <!-- back2 unique class name  -->
                <center><button class="btn btn-warning back2" type="button"><span class="fa fa-arrow-left"></span> Back</button> 
                <!-- open2 unique class name -->
                <button class="btn btn-warning" type="button" onclick="display()"><span class="glyphicon glyphicon-plus"></span>Add Row </button>
                <button class="btn btn-warning " type="button"><span class="fa fa-save"></span> Save</button>  </center>
               
              </div>
            </div>
    </fieldset>
    </div>
    
    
<button type="submit" class="bouton-contact"></button>
        </form>
    
   

   
	 

	
</div>

</body>
</html>
