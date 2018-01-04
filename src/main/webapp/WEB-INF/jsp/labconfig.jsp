<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page import="java.net.URLDecoder"%>
  <%@page import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMS Wedge</title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-editable-select.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-editable-select.min.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-editable-select.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-editable-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>


<script type="text/javascript">

function checkhome(user){
	adminusr = user;
//	document.getElementById("adr").style.visibility ="hidden";
		
			if(user.includes("[ROLE_DOCTOR]")){
				var url = "/HMS/doctor1" ;
				
				 var element = document.getElementById('ho');
				 element.setAttribute("href",url);
			}
			else if(user.includes("[ROLE_NURSE]"))	{
				 var url = "/HMS/nursedesk" ;
					
				 var element = document.getElementById('ho');
				 element.setAttribute("href",url)
			}
			else if(user.includes("[ROLE_ASSISTANT]")){
				
				 var url = "/HMS/frontdesk" ;
					
				 var element = document.getElementById('ho');
				 element.setAttribute("href",url)
			}
			else if(user.includes("[ROLE_Accounts Admin]")){
				
				 var url = "/HMS/frontdesk" ;
					
				 var element = document.getElementById('ho');
				 element.setAttribute("href",url)
				 }
			else if(user.includes("[ROLE_CHIEFNURSE]")){
				
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
function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
    
}
function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
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
	}
	
function onlyAlphabets(e, t) {
    
	try {
        if (window.event) {
            var charCode = window.event.keyCode;
         
        }
        else if (e) {
            var charCode = e.which;
            
        }
        else { return true; }
       
        if ((charCode == 47)){
        	
        	alert("Please use any other charachter! ");
       return false;
        }
        else{
            return true;
        }
    }
    catch (err) {
        alert(err.Description);
    }
}
	//testname,category,subcategory,range,sampletype,sampleqty,cost,intext,details
function check(category1,subcategory1,range1){

 var category = encodeURI(category1);
 var subcategory = encodeURI(subcategory1);
 var range = encodeURI(range1); 
	
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var row = "tab"+ tableRef.rows.length;
	var markup = "<tr id='"+row+"'><td style='width:300px'><input type='text'  class='form-control input-sm' onkeypress='return onlyAlphabets(event,this);' id = 'category' name= 'category' form ='formc' value = '"+decodeURI(category)+"' required></td><td style='width:300px'><input type='text'  form ='formc' class='form-control input-sm' onkeypress='return onlyAlphabets(event,this);' id = 'subcategory' name= 'subcategory'  value='"+decodeURI(subcategory)+"' required></td><td style='width:150px'><input id = 'range' form ='formc' type='text' name= 'range' class='form-control input-sm' value='"+decodeURI(range)+"' required></td><td style='width:30px'><a href='/HMS/del?val="+range+"' class='fa fa-trash-o' style='font-size:20px'></a></td></tr>"
	 $('#myTable tbody').append(markup);
	 var elmnt = document.getElementById(row);
     elmnt.scrollIntoView();
     $(row).focus(); 
	
	/*
	
	for(var x=0; x<strSplit1.length; x++) {
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	
	//    var m = moment().format('YYYY-MM-DD h:mm a');

	var newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='formc' class= 'form-control input-sm'  type='text' id = 'labtestname' name= 'labtestname' value='"+strSplit1[x]+"'  required> </td></tr>";
	  newCell.style.width ='200px';
	
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form ='formc' class= 'form-control input-sm'  type='text'  id = 'category' name= 'category' value='"+strSplit2[x]+"'  required  ></td></tr>";
	  newCell.style.width ='150px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'subcategory' name= 'subcategory' value='"+strSplit3[x]+"' required  ></td></tr>";
	  newCell.style.width ='150px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'range' name= 'range'  value='"+strSplit4[x]+"'required  ></td></tr>";
	  newCell.style.width ='80px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'sampletype' name= 'sampletype' value='"+strSplit5[x]+"' required  ></td></tr>";
	  newCell.style.width ='80px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'sampleqty' name= 'sampleqty'  value='"+strSplit6[x]+"' required  ></td></tr>";
	  newCell.style.width ='80px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'cost' name= 'cost' value='"+strSplit7[x]+"' required  ></td></tr>";
	  newCell.style.width ='80px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'intext' name= 'intext' value='"+strSplit8[x]+"' required  ></td></tr>";
	  newCell.style.width ='120px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'details' name= 'details' value='"+strSplit9[x]+"'  required  ></td></tr>";
	  newCell.style.width ='150px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='font-size:20px;width: 45px;'  onclick='deleteRow(this)'></i></td></tr>";
	  
	
         }
	*/
	}



function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/labconfig";
	}
}

function display(){ 
	
	
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var row = "tab"+ tableRef.rows.length;
	var markup = "<tr id='"+row+"'><td style='width:300px'><input type='text' class='form-control input-sm' onkeypress='return onlyAlphabets(event,this);' id = 'category' name= 'category' form ='formc' required></td><td style='width:300px' ><input type='text'  form ='formc' class='form-control input-sm' id = 'subcategory' name= 'subcategory' onkeypress='return onlyAlphabets(event,this);' value='NA' required></td><td style='width:150px'><input id = 'range' form ='formc' type='text' name= 'range' onfocusout = 'doAjaxPost(this.value)' class='form-control input-sm' required></td><td style='width:30px'><a href='#' onclick='deleteRow(this)' class='fa fa-trash-o' style='font-size:20px'></a></td></tr>"
    $('#myTable tbody').append(markup);
	
	 var elmnt = document.getElementById(row);
     elmnt.scrollIntoView();
     $(row).focus(); 

	
	//    var m = moment().format('YYYY-MM-DD h:mm a');
/*
	  var newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='formc' class= 'form-control input-sm'  type='text' id = 'labtestname' name= 'labtestname'  required> </td></tr>";
	  newCell.style.width ='200px';
	
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td style='width:150px'><input form ='formc' class= 'form-control input-sm' type='text'  id = 'category' name= 'category'  required  ></td></tr>";
	  newCell.style.width ='150px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'subcategory' name= 'subcategory'  required  ></td></tr>";
	  newCell.style.width ='150px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'range' name= 'range'  required  ></td></tr>";
	  newCell.style.width ='80px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'sampletype' name= 'sampletype'  required  ></td></tr>";
	  newCell.style.width ='80px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'sampleqty' name= 'sampleqty'  required  ></td></tr>";
	  newCell.style.width ='80px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'cost' name= 'cost'  required  ></td></tr>";
	  newCell.style.width ='80px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'intext' name= 'intext'  required  ></td></tr>";
	  newCell.style.width ='120px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form='formc' class= 'form-control input-sm'  type='text'  id = 'details' name= 'details'  required  ></td></tr>";
	  newCell.style.width ='150px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='font-size:20px;width: 45px;'  onclick='deleteRow(this)'></i></td></tr>";
	*/ 
}
</script>

 <script>
       function doAjaxPost(value) {
    	   // get the form values
//alert("j")
    	      // var mname = $('#name').val();
        
$.ajax({
  	  
        type: "GET",
        url: "/HMS/labconfig1/"+value+"",
        async : false,
        dataType: "JSON",
        contentType: "application/json; charset=UTF-8",	           
	           success: function(response){
	        	   
	       	 
	       
	       	
	     
	        	   $.each(response, function(index, datec) {
	                   //to print name of employee
	             
	                  if(datec.range > 0){
	                	  alert("Category code already exists")
	                	  //document.getElementById("bc").disabled = true;
	                  }
	                  
	                  

	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
	        	        	   
    	        	        }


      

       
       
       </script>
       
  <script type="text/javascript">

  

$(document).ready(function(){

    
	 $('myTable .tbody1').on( 'paste','tr td:nth-child(1)', function(e,t) {
		 
		 try {
		        if (window.event) {
		            var charCode = window.event.keyCode;
		         
		        }
		        else if (e) {
		            var charCode = e.which;
		            
		        }
		        else { return true; }
		       
		        if ((charCode == 47)){
		        	
		        	alert("Please use any other charachter! ");
		       return false;
		        }
		        else{
		            return true;
		        }
		    }
		    catch (err) {
		        alert(err.Description);
		    }

    	
     });

 
  
    
 

    
  });
</script>
<style>

.wrapper {
  height : auto;
  background: #e6e6e6;  
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
  max-width:850px;
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





</style>
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Lab Configuration</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
    <br>
         <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="window.location.href='/HMS/doctor1';"></i>
  </div>
</nav>
  
  <div id="form1" >  
  <form action="savelabc.html" method="post" id = "formc" >
     <h1><button type="button" class="btn btn-warning button1" onclick="display()">
	  <span class="fa fa-plus"></span> Add Row</button>
	
	
<font size="5">Lab Configurations</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by category,code,subcategory" style="width:150px"/></span>
		</h1>
   <br>
   	  
    <div class="container">
   <table class="table table-striped table-bordered  table-hover table-condensed " style="width: 800px;" id="myTable">
   
    <thead>
     
      <tr>
        <th style="width:300px">Category</th>
        <th style="width:300px">Sub-Category</th>
        <th style="width:150px">Code</th>
        <th style="width:30px"></th>
        <th style="width:20px"></th>
        <!--
        <th style="width:80px">Range</th>
        <th style="width:80px">Sample Type</th>
        <th style="width:80px">Sample Qty</th>
        <th style="width:80px">Cost of Test</th>
        <th style="width:80px">Internal/External Lab</th>
        <th style="width:150px">Details</th>
        <th class="delete">Delete Row</th>
        -->
       
      </tr>
    </thead>
    <tbody class="tbody">

    <tr>
    	
    
    </tr>
     
    </tbody>
    </table>
    </div>
    <!--  
    <option value="LUNG,KIDNY,SKELETON">LUNG,KIDNY,SKELETON</option>
    <option value="GLUCOSE METABOLISM">GLUCOSE METABOLISM</option>
    <option value="LIPID METABOLISM">LIPID METABOLISM</option>
    <option value="HEART / MUSCLE">HEART / MUSCLE</option>
    <option value="IRON STUDIES">IRON STUDIES</option>
    <option value="LIVER,PANCREAS,GIT">LIVER,PANCREAS,GIT</option>
    <option value="URINE/FAECAL/OTHER CHEM">URINE/FAECAL/OTHER CHEM</option>
    <option value="PHARMACOLOGY">PHARMACOLOGY</option>
    <option value="GENERAL ENDOCRINE">GENERAL ENDOCRINE</option>
    <option value="THYRIOID">THYRIOID</option>
    <option value="PREGNANCY">PREGNANCY</option>
    <option value="BONE TURNOVER">BONE TURNOVER</option>
    <option value="AUTO IMMUNE TESTS">AUTO IMMUNE TESTS</option>
    <option value="HIV TESTS ">HIV TESTS </option>
    <option value="VIRAL STUDIES">VIRAL STUDIES</option>
    <option value="OTHER INFECTIONS">OTHER INFECTIONS</option>
    <option value="TUMOUR MARKERS">TUMOUR MARKERS</option>
    <option value="HAEMATOLOGY ">HAEMATOLOGY </option>
    <option value="COAGULATION">COAGULATION</option>
    <option value="MOLECULAR BIOLOGY PCR">MOLECULAR BIOLOGY PCR</option>
    <option value="MICROBIOLOGY">MICROBIOLOGY</option>
    -->
       
 <button type="submit" class="bouton-contact" id="bc" form="formc"  >Save</button>
  </form>
   </div>
    

   </div>


  <script>
datasuccess('<%=request.getParameter("message")%>')
</script>

 <c:forEach var="p"  items="${list1}">
<script>

check('<c:out value="${p.category}" />','<c:out value="${p.subcategory}" />','<c:out value="${p.range}" />')

</script>
</c:forEach>
<script>

function filterTable(event) {

	var filter = event.target.value.toUpperCase();
    var rows = document.querySelector("#myTable .tbody").rows;
    
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
</body>
</html>
