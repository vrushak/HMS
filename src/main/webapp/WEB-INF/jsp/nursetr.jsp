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

<link rel='stylesheet' href='<c:url value="/resources/css/treatment.css" />' type='text/css' media='all' />
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
    $("#datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
</script>      
<script type="text/javascript">

function checkhome(user){
	if(user.includes("N-")){
		 var url = "http://localhost:8085/HMS/nursedesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("D-")){
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

function clos(){
	window.location.reload();
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
	
	var idp,namep,admdatep,datetimep,dailychartp,dnamed,commentsd;
	function check(name,id,admdate,datetime,dailychart,dname,comments,ncomments){
		
		var idp = id.split(',');
        
		var namep = name.split(',');
        var admdatep = admdate.split(',');
        var datetimep = datetime.split(',');
        var dailychartp = dailychart.split(',');
        var dnamed = dname.split(',');
        var commentsd = comments.split(',');
        var ncommentsd = ncomments.split(',');
        
       
  
        
       
 	   document.getElementById("pid").value=idp;
 	  
       
 	     	
    	
    	  for(var x=0; x<dnamed.length; x++) {
    		  
    		  var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
    	    	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
    		  
    	    	
    		  var newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td><input style='width: 175px;' form ='forma' class= 'form-control input-sm' readonly type='text' id = 'datetime' name= 'datetime' value='"+datetimep[x]+"' required> </td></tr>";
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td><textarea form ='forma'  style='width: 177px;' readonly class= 'form-control input-sm'  rows='1'  id = 'dailychart'  name= 'dailychart' value ='"+dailychartp[x]+"' required>"+dailychartp[x]+"</textarea></td></tr>";
    		 
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><input form ='forma' readonly class= 'form-control input-sm' style='width: 177px;' type='text'  id = 'dname' name= 'dname' value='"+dnamed[x]+"' required  ></td></tr>";
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><textarea form ='forma' readonly class= 'form-control input-sm' rows='1' style='width: 182px;' id = 'comments'  name= 'comments' value='"+commentsd[x]+"'  required>"+commentsd[x]+"</textarea></td></tr>";
    		   
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><textarea form ='forma' class= 'form-control input-sm grow' rows='1' style='width: 182px;' data-rule='required' data-msg='ncomments' id = 'ncomments'  name= 'ncomments' value='"+ncommentsd[x]+"' required>"+ncommentsd[x]+"</textarea></td></tr>";
    		   
    		  

    	  }
	}



	$(document).ready(function(){
		$('#ncomments').on('change keyup', function() {
			 var gr = document.getElementsByClassName("grow");
			 for(var i=0;i<gr.length;i++){
			  var sanitized = $(gr[i]).replace(/[,]/g, '');
			  $(gr[i]).val(sanitized);
			 }
			});
			

		});

	  
	    
	



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
  max-width:1100px;
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
    width : 200px;
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
.delete{
	width :50px;
}

.grow {
 padding: 5px 5px 5px 5px;
 
 height: 49px;
 width: 100%;
 margin: 5px 1% 5px 1%;
 float: left;
 position: relative;
 transition: height 0.5s;
 -webkit-transition: height 0.5s;
 
 overflow: hidden;
}
.grow:hover {
 height: 145px;
}
</style>

</head>
<body onload="checkhome('<c:out value="${pageContext.request.userPrincipal.name}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Transactions Details</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1><button type="button" class="btn btn-warning button1" onclick="clos()">
	  <span class="fa fa-refresh"></span> Refresh</button>
	
	
<font size="5">In Patient Treatment Records</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search by Doctor Name" onkeyup="myFunction()" style="width:150px"/></span>
	</h1>

<form id="forma" name="forma" action="http://localhost:8085/HMS/saveTre1.html" method="post"></form>
    <br>
	    <div class="form-group row" >
	     <div class="col-xs-1"></div>
	   
  <div class="col-xs-4">
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 951px; " id="myTable">
    <thead>
      <tr>
        <th class="">Date-Time</th>
        <th class="">Actions Before next visits</th>
        <th class="">Doctor Name</th>
        <th class="">Doctor Observations</th>
        <th class="">Actions Performed</th>
        
        
       
      </tr>
    </thead>
    <tbody class="tbody">

    <tr>
    
    
    </tr>
     
    </tbody>
    </table>
    </div>
    </div>
     <div class="col-xs-1"></div>
    </div>
    
    <input type="hidden" form ="forma" id="pid" name="pid">
 <button type="submit" class="bouton-contact" form="forma"  >Update Record</button>
   </div>
     

   </div>
 <c:forEach var="p"  items="${list2}">
<script>
check('<c:out value="${p.pname}" />','<c:out value="${p.pid}" />','<c:out value="${p.admdate}" />','<c:out value="${p.datetime}" />','<c:out value="${p.dailychart}" />','<c:out value="${p.dname}" />','<c:out value="${p.comments}" />','<c:out value="${p.ncomments}" />');
</script>
</c:forEach>
</body>
</html>