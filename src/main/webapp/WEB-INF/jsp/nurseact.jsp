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


<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>


<script type="text/javascript">
    $("#datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
</script>      
<style type="text/css">

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
    color: white;
    width : 300px;
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

</style>
<script type="text/javascript">
function checkhome2(user){

	if(user.includes("N-")){
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
	/*
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
	*/
	}
	var idp,namep,admdatep,datetimep,dailychartp,dnamed,commentsd;
	function check(name,id,admdate,datetime,dailychart,dname,comments){
		
		var idp = id.split(',');
        
		var namep = name.split(',');
        var admdatep = admdate.split(',');
        var datetimep = datetime.split(',');
        var dailychartp = dailychart.split(',');
        var dnamed = dname.split(',');
        var commentsd = comments.split(',');
        
        
  
        
        $('select[name=pname]').val(name);
 	   $('#pname').selectpicker('refresh');
 	   
 	   document.getElementById("pid").value = id; 
 	   document.getElementById("admdate").value = admdatep; 
       
 	     	
    	
    	  for(var x=0; x<dnamed.length; x++) {
    		  
    		  var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
    	    	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
    		  
    	    
    		 
    		  var newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='190px';><input style='width: 140px;' form ='forma' class= 'form-control input-sm'  type='text' id = 'datetime' name= 'datetime' value='"+datetimep[x]+"' required> </td></tr>";
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='190px';><textarea form ='forma'  style='width: 150px;' class= 'form-control input-sm'  rows='1'  id = 'dailychart'  name= 'dailychart' value ='"+dailychartp[x]+"' required>"+dailychartp[x]+"</textarea></td></tr>";
    		 
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' style='width: 150px;' type='text'  id = 'dname' name= 'dname' value='"+dnamed[x]+"' required  ></td></tr>";
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><textarea form ='forma' class= 'form-control input-sm' rows='1'  id = 'comments'  name= 'comments' value='"+commentsd[x]+"'  required>"+commentsd[x]+"</textarea></td></tr>";
    		   
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
    		  

    	  }
	}


function addname(){
	var cid = document.getElementById("pname").value; 
	var str = cid.split(',');
	
	 document.getElementById("pid").value=str[0];
	 document.getElementById("admdate").value=str[2];
	 document.getElementById("pidH").value = str[0];
	 document.getElementById("formab").disabled = false;
}

function display(){ 
	
	
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	
	//    var m = moment().format('YYYY-MM-DD h:mm a');

	  var newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='190px';><input style='width: 140px;' form ='forma' class= 'form-control input-sm'  type='text' id = 'datetime' name= 'datetime'  required> </td></tr>";
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='190px';><textarea form ='forma'  style='width: 150px;'class= 'form-control input-sm'  rows='1' data-rule='required' data-msg='address1' id = 'dailychart'  name= 'dailychart' required></textarea></td></tr>";
	   
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' style='width: 150px;' type='text'  id = 'dname' name= 'dname'  required  ></td></tr>";
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td width ='';><textarea form ='forma' class= 'form-control input-sm' rows='1' data-rule='required' data-msg='comments' id = 'comments'  name= 'comments'  required></textarea></td></tr>";
	   
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
	  

	
}
	  
	    
function clos(){
	window.location.reload();
}



</script>
</head>
<body >
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Patient Care </a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
    <br>
         <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="goBack()"></i>
  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1><button type="button" class="btn btn-warning button1" onclick="clos()">
	  <span class="fa fa-refresh"></span> Refresh</button>
	
	
<font size="5">Observations</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInput" class="form-control input-sm button2" placeholder="Search by Patient Name or Id"  style="width:150px"/></span>
	</h1>

   <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 870px; " id="myTable">
    <thead>
      <tr>
        <th class="">Patient Name</th>
        <th class="">Patient Id</th>
        <th class="">WardNo/Bed No</th>
       
         
      </tr>
    </thead>
     <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list1}">
    <tr>
    <td width="300px;">${p1.pname}</td>
    <td width="300px;">${p1.pid}</a></td>
    <td width="300px;">${p1.wardno}</td>
    </tr>
    </c:forEach>
    </tbody>
    </table>

	</div>
 <button type="" class="bouton-contact" form="forma"  ></button>
   
     <c:forEach var="p1"  items="${model.list2}">
     <script>
  
      checkhome2('<c:out value="${p1.nid}" />')
      </script>
     </c:forEach>

   </div>
 </div>
 
</body>
<script>
function goBack() {
    window.history.back();
}


function filterTable(event) {

	var filter = event.target.value.toUpperCase();
    var rows = document.querySelector("#myTable tbody").rows;
    
    for (var i = 0; i < rows.length; i++) {
        var firstCol = rows[i].cells[0].textContent.toUpperCase();
        var secondCol = rows[i].cells[1].textContent.toUpperCase();
        if (firstCol.indexOf(filter) > -1 || secondCol.indexOf(filter) > -1) {
            rows[i].style.display = "";
        } else {
            rows[i].style.display = "none";
        }      
    }
}


document.querySelector('#myInput').addEventListener('input', filterTable, false);
</script>
</html>