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
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.js"></script>


      
<script type="text/javascript">

function checkhome(user){
	if(user.includes("D-")){
		 var url = "http://localhost:8085/HMS/doctor1" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else{
		 var url = "http://localhost:8085/HMS/home" ;
			
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

function myFunction() {
	
	 
	
		 var input, filter, table, tr, td, i;
		  
		  
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		 
		  table = document.getElementById("myTable").getElementsByTagName('tbody')[0];
		  tr = table.getElementsByTagName("tr");
		  
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[0];
		    if (td) {
		    	
		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    }       
		  }
		  
		  document.getElementById("container").style.visibility ="visible";
			document.getElementById("hide").style.visibility ="visible";
	}
	
	 var ip ;
	function check(catcode,subcname,subcategory,catname){
		ip = catcode;
		
        
		var namep = subcname.split(',');
        var subc = subcategory.split(',');
       
       
 	     	
    	
    	  for(var x=0; x<namep.length; x++) {
    		  
    		  var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
    	    	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
    		  
    	    
    		 
    	      var newCell = rowsAdd.insertCell();
    	   	  newCell.innerHTML="<tr><td><input  form ='' class= 'form-control input-sm catcode'  type='text' id = 'catcode1' name= 'catcode' value='"+catcode+"'  required> </td></tr>";
    	   	  newCell.style.width ='178px';
    	   	  
    	   	  newCell = rowsAdd.insertCell();
    	   	  newCell.innerHTML="<tr><td><textarea form ='forma'  class= 'form-control input-sm'  rows='1' data-rule='required' data-msg='address1' id = 'subcategory' value='"+namep[x]+"'  name= 'subcategory' required>"+subc[x]+"</textarea></td></tr>";
    	   	  newCell.style.width ='178px';
    	   	  
    	   	  newCell = rowsAdd.insertCell();
    	   	  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm'  type='text'  id = 'subcname' name= 'subcname'  value='"+namep[x]+"' required  ></td></tr>";
    	   	  newCell.style.width ='178px';
    	   	   
    	  }
    	  
 for(var x=0; x<namep.length; x++) {
    		  
    		  var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
    	    	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
    		  
    	    
    		 
    	      var newCell = rowsAdd.insertCell();
    	   	  newCell.innerHTML="<tr><td><input  form ='' class= 'form-control input-sm catcode'  type='text' id = 'catcode1' name= 'catcode' value='"+catcode+"'  required> </td></tr>";
    	   	  newCell.style.width ='220px';
    	   	  
    	   	newCell = rowsAdd.insertCell();
  	   	    newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm'  type='text'  id = 'catcname' name= 'catcname'  value='"+catname+"' required  ></td></tr>";
  	   	    newCell.style.width ='220px';
  	   	    
    	   	  newCell = rowsAdd.insertCell();
    	   	  newCell.innerHTML="<tr><td><textarea form ='forma'  class= 'form-control input-sm'  rows='1' data-rule='required' data-msg='address1' id = 'subcategory' value='"+namep[x]+"'  name= 'subcategory' required>"+subc[x]+"</textarea></td></tr>";
    	   	  newCell.style.width ='220px';
    	   	  
    	   	  newCell = rowsAdd.insertCell();
    	   	  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm'  type='text'  id = 'subcname' name= 'subcname'  value='"+namep[x]+"' required  ></td></tr>";
    	   	  newCell.style.width ='220px';
    	   	   
    	  }
	}

function addname(myname){

	if(myname == "new"){
		
		document.getElementById("catcode").disabled = false;
		document.getElementById("catname").disabled = false;
		document.getElementById("checkbox").disabled = false;
	}
	else{
		document.getElementById("catcode").disabled = true;
		document.getElementById("catname").disabled = true;	
		document.getElementById("checkbox").disabled = true;
		
		var str = document.getElementById("pname1").value;
		
		
	
		var strSplit = str.split('|');
		document.getElementById("catcode").value = strSplit[0];
		document.getElementById("catname").value = strSplit[1];	
		
		document.getElementById("myInput").value = strSplit[0];	
		myFunction();
	}
	
	/*
	var cid = document.getElementById("pname").value; 
	var str = cid.split(',');
	var pid;
	 document.getElementById("pid").value=str[0];
	 document.getElementById("admdate").value=str[2];
	 document.getElementById("pidH").value = str[0];
	
	 
	 document.getElementById("formab").disabled = false;
	 var url = "http://localhost:8085/HMS/nursetr/" + str[0];
	
	 var element = document.getElementById('nob');
	 element.setAttribute("href",url)
*/
}
function display(){ 

	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	
	var catc = document.getElementById("catcode").value;
	
	
	
	//    var m = moment().format('YYYY-MM-DD h:mm a');

	  var newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td ><input  form ='' class= 'form-control input-sm catcode'  type='text' id = 'catcode1' name= 'catcode' value='"+catc+"'  required> </td></tr>";
	  newCell.style.width ='178px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><textarea form ='forma' class= 'form-control input-sm'  rows='1' data-rule='required' data-msg='address1' id = 'subcategory'  name= 'subcategory' required></textarea></td></tr>";
	  newCell.style.width ='178px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm'  type='text'  id = 'subcname' name= 'subcname'  required  ></td></tr>";
	  newCell.style.width ='178px';  
	

	
}
	  
	    
	function disptab(){
		if(document.getElementById("checkbox").checked){
			$("#myTable tbody tr").remove();
			
			document.getElementById("container").style.visibility ="visible";
			document.getElementById("hide").style.visibility ="visible";
		
		}
		else{
			document.getElementById("container").style.visibility ="hidden";
			document.getElementById("hide").style.visibility ="hidden";
		}
	}

	// show full view or less view
	function disptab1(){
		if(document.getElementById("checkbox1").checked){
			
			document.getElementById("container1").style.display ="block";
		
		
		}
		else{
			document.getElementById("container1").style.display ="none";
			
		}
	}



</script>
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
  max-width:900px;
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
    color: black;
    width : 180px;
}

.table-fixed{
 
}
  tbody{
    height:170px;
    overflow-y:auto;
 }
  thead,tbody{
  
    display:block;
  }
  
 #myTable1 table {
    border-collapse: collapse;
    width: 100%;
    }
#myTable1 th {
    background-color: #009999;
    color: black;
    width : 220px;
}

.table-fixed{
 
}
#myTable1  tbody{
    height:180px;
    overflow-y:auto;
 }
#myTable1  thead,tbody{
  
    display:block;
  }

.modal-body{
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
.col-xs-1{
	  margin-left : -1cm;
	  
	 background: #EBF6E0;
	 
	 
}
#myTable{
	margin-right : 7cm;
}
.delete{
	width :50px;
}
#col3{
border-style : groove;
border-radius : 10px;
}





</style>
</head>
<body onload="disptab(),disptab1()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Lab Masters</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
      <li class=""><a  href="http://localhost:8085/HMS/myapps/${pageContext.request.userPrincipal.name}">My Appointments</a></li>
        <li class=""><a  href="http://localhost:8085/HMS/prescription/${pageContext.request.userPrincipal.name}">Diagnose Patients</a></li>
          <li class=""><a  href="http://localhost:8085/HMS/discharge.html">Discharge Summary</a></li>
 
       <li class=""><a id="nob" href="http://localhost:8085/HMS/nursetr/"  onclick=' return visible();' target="_blank">Nurse observations</a></li>
    </ul>
  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1><button type="button" class="btn btn-warning button1" onclick="location.href='http://localhost:8085/HMS/treatment.html';">
	  <span class="fa fa-refresh"></span> Refresh</button>
	
	
<font size="5">Lab Category Masters</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="" onblur="myFunction()" style="width:150px"/></span>
	</h1>

<form id="forma" name="forma" action="labssave.html" method="post"></form>


	    <br>
	    <div class="form-group row" >
	     <div class="col-xs-4"></div>
	      <div class="col-xs-3">
	         <select class="selectpicker form-control"onchange="addname(this.value); this.selectedindex = -1" data-size="5" data-live-search="true" name = "pname1" id ="pname1" >
          <option selected disabled>Select Category Name</option>
          <option value="new"> New</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.catcode} | ${p.catname}" >${p.catname}</option>
        </c:forEach>
      </select>
      </div>
      </div>
      <br>
	    <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-4" id="col3">
  
	<div class="form-group">
            <p>Category Code<span>*</span></p>
             <input type="text" name="catcode" id="catcode" disabled form="forma" class="form-control input-sm"  required>
	       	</div>
	<div class="form-group">
            <p>Category Name<span>*</span></p>
     <input type="text" name="catname" id="catname" disabled form="forma" class="form-control input-sm"  required>
       <br>
       
       
       Create Sub Category : <input type ="checkbox" id="checkbox" disabled onclick="disptab()" > 
     <span class="button2" > Full View : <input type ="checkbox" id="checkbox1"onclick="disptab1()"  > </span>
	</div>

    
	
	
	 <!--   <button type="button" class="btn btn-warning button1" onclick="display()">
	  <span class="glyphicon glyphicon-plus"></span>Add Row</button> 
	 -->
     
      <button type="submit" class="btn btn-warning button1" form="forma"  >
	 <span class="fa fa-floppy-o"></span> Save</button>
	 
	   <a id="hide" class="button2" href="#" onclick="display()">Add Row</a> 
    <br> 
	  <br>

  </div>
  
   
	    <div class="container" id="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed button2" style="width: 500px; " id="myTable">
    <thead>
      <tr>
        <th class="">Category Code</th>
        <th class="">Subcategory Code</th>
        <th class="">Subcategory Name</th>
        
       
      </tr>
    </thead>
    <tbody class="tbody">

    <tr>
    
    
    </tr>
     
    </tbody>
     
    </table>
  
    </div>
    
       
	  
    </div>
  
  <br><br>
       <div class="col-xs-1"></div>
	    <div class="container" id="container1">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed " style="width: 830px; " id="myTable1">
    <thead>
      <tr>
        <th class="">Category Code</th> 
        <th class="">Category Name</th>
        <th class="">Sub Category Code</th>
        <th class="">Sub Category Name</th>
        
       
      </tr>
    </thead>
    <tbody class="tbody1">

    <tr>
    
    
    </tr>
     
    </tbody>
     
    </table>
  
    </div>
   
    <button type="" class="bouton-contact"   ></button>
   </div>
     

   </div>
 <c:forEach var="p"  items="${model.list2}">
<script>
check('<c:out value="${p.catcode}" />','<c:out value="${p.subcname}" />','<c:out value="${p.subcategory}" />','<c:out value="${p.catname}" />');
</script>
</c:forEach>
</body>
</ht0ml>