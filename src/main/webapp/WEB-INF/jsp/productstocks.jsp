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
<title>Pharmacy</title>
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
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>

<style type="text/css">
.wrapper {
  height : auto;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
}


#form2a h1 {
  font-size: 18px;
  background: #009999 none repeat scroll 0% 0%;
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form2a {
  border-radius: 5px;
  max-width:1300px;
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
.bouton-contact{
  background-color: #81BDA4;
  color: #FFF;
  text-align: center;
  width: 100%;
  border:0;
  padding: 17px 25px;
  border-radius: 0px 0px 5px 5px;
  cursor: pointer;
  margin-top: 20px;
  font-size: 18px;
}

#myTable {
    border-collapse: collapse;
    width: 100%;
    
    }
#myTable th {
    background-color: #009999;
    color: black;
 
}
 #myTable tbody{
    height:250px;
    overflow :auto;
 }
  #myTable thead,tbody{
  
    display:block;
  }

 

  
  .button1{
	float : left;
}
.button2{
	float : right;
}



#col3{
margin-left: 15px; 
border-style : groove;
border-radius : 10px;
width : 1250px;
height : 650px;
}

#span2{
height :350px;
width : 1200px;
overflow-X : auto;
overflow-Y : hidden;
}
  
</style>


 <script type="text/javascript">
 var cuser;
 function checkhome2(user){
 	cuser = user;

 	     
 	
 	 if(user.includes("[ROLE_SALESMANAGER]")){
 	
 		var url = "/HMS/hmspharma1" ;
 		
 		 var element = document.getElementById('ho');
 		 element.setAttribute("href",url)
 	
 		document.getElementById("bc").style.display = "none"; 
 		document.getElementById("mm").style.display = "none"; 
 		document.getElementById("sm").style.display = "none"; 
 		document.getElementById("or").style.display = "none"; 
 		document.getElementById("pe").style.display = "none";  
 		
 		$("#myTable th:eq(6), #myTable td:nth-child(7)").hide();
 		$("#myTable th:eq(7), #myTable td:nth-child(8)").hide();
 		$("#myTable th:eq(8), #myTable td:nth-child(9)").hide();
 		$("#myTable th:eq(11), #myTable td:nth-child(12)").hide();
 		$("#myTable th:eq(12), #myTable td:nth-child(13)").hide();
 		$("#myTable th:eq(16), #myTable td:nth-child(17)").hide();
        document.getElementById("myTable").style.width = "1730px"; 		
        $('.ft').prop('readonly', true);
 	}
 	else if(user.includes("[ROLE_PHARMACIST]")){
 	
 		 var url = "/HMS/hmspharma" ;
 			
 		 var element = document.getElementById('ho');
 		 element.setAttribute("href",url)
 		
 		 
 	
 		
 	}
 	 
 	
 	else{
 		 var url = "/HMS/hmspharma" ;
 		
 		 var element = document.getElementById('ho');
 		 element.setAttribute("href",url)
 	}
 }
 
 function getCount(){
		document.getElementById("myTable").rows.length = 1;
	  
	    document.getElementById("expDate").valueAsDate = new Date();
	    var val=$('#expDate').val();
		  var add=moment(val).add(1, 'y').toDate();
		//  add=moment(add).format("DD-MM-YYYY");
		  
		    document.getElementById("toDate").valueAsDate = new Date(add);
	    //document.getElementById("toDate").valueAsDate = new Date();
	} 
function search(id,name,batch,stk,expdate){

document.getElementById("codeS").value = id;
document.getElementById("nameS").value = name;
document.getElementById("batchS").value = batch;
document.getElementById("cs").value = stk;

document.getElementById("expdate").value = expdate;

$('#myModal').modal('show');
}

function copyName(code,name,category,expDate,toDate,batch,records){
	
	document.getElementById("code").value = code;
	document.getElementById("name").value = name;
	document.getElementById("category").value = category;
	if(records == 0){
		
	}else{
	document.getElementById("records").value = records;
	}
	document.getElementById("batch").value=batch;
}

function chdate(){
	   var val=$('#expDate').val();
	  var add=moment(val).add(1, 'y').toDate();
	//  add=moment(add).format("DD-MM-YYYY");
	  
	    document.getElementById("toDate").valueAsDate = new Date(add);
	
}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/stopriceho.html";
	}
}
function onlyNos(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        var parts = e.srcElement.value.split('.');
     
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        
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

function onlyNos1(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        var parts = e.srcElement.value.split('.');
     
        if (charCode > 31 && charCode !=46 && (charCode < 48 || charCode > 57)) {
        
            return false;
        }
        else if(parts.length >1 && charCode == 46){
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
function getInputDateFormat(date) {
	 return date.toISOString().split('T')[0];
	}
	
function validDate() {
	 var today = new Date();
	 var maxDate = new Date();
	 maxDate.setDate(maxDate.getDate() + 7);
var s = document.getElementsByName("expDate");
for(var i =0;i<s.length;i++){
	s[i].setAttribute('min', getInputDateFormat(today));
//s[i].setAttribute('max', getInputDateFormat(maxDate));	
}
	 
	}

</script>
   <script>
      $(document).ready( function() {
    	  $(document).on('keypress', 'input', function(e){ 
    		   if (this.value.length == 0 && e.which == 48 ){
    		      return false;
    		   }
    		});
      });
</script>
<script>
   
$(document).ready(function() {
  
	$("#myTable .tbody tr").each(function(){
		
        	 var x=this.cells;
	        var a = x[6].getElementsByTagName('input')[0].value;
	        var b = Number(x[12].getElementsByTagName('input')[0].value)/100;
	        var c = Number(a) + (Number(a) * Number(b));
	        x[13].getElementsByTagName('input')[0].value = c.toFixed(2);
	       
	        x[16].getElementsByTagName('input')[0].value = (Number( x[9].getElementsByTagName('input')[0].value) * Number( x[13].getElementsByTagName('input')[0].value)).toFixed(2);
	        x[18].getElementsByTagName('input')[0].value = (Number(x[15].getElementsByTagName('input')[0].value) * Number(x[17].getElementsByTagName('input')[0].value)).toFixed(2);
	        x[19].getElementsByTagName('input')[0].value = (Number(x[13].getElementsByTagName('input')[0].value) * Number(x[18].getElementsByTagName('input')[0].value)).toFixed(2);
		      
      
       
	    
	});
	    $(document).on('focusout','.tbody tr', function () {
	   // 	$('.success').removeClass('success');
	   //     $(this).addClass('success');
	        
	        var x=this.cells;
	        var a = x[6].getElementsByTagName('input')[0].value;
	        var b = Number(x[12].getElementsByTagName('input')[0].value)/100;
	        var c = Number(a) + (Number(a) * Number(b));
	        x[13].getElementsByTagName('input')[0].value = c.toFixed(2);

	        x[16].getElementsByTagName('input')[0].value = (Number( x[9].getElementsByTagName('input')[0].value) * Number(x[13].getElementsByTagName('input')[0].value)).toFixed(2);
	        x[18].getElementsByTagName('input')[0].value = (Number(x[15].getElementsByTagName('input')[0].value) * Number(x[17].getElementsByTagName('input')[0].value)).toFixed(2);
	        x[19].getElementsByTagName('input')[0].value = (Number(x[13].getElementsByTagName('input')[0].value) * Number(x[18].getElementsByTagName('input')[0].value)).toFixed(2);
	    });
	   
   });
   
   </script>    


</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="getCount(),checkhome2('<c:out value="${username}" />')">

<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" >Product Stocks and Pricing</a>
    </div>
     <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown">Masters
        <span class="caret"></span></a>
        
        <ul class="dropdown-menu">
        <li id="mm"><a href="/HMS/manufactureho.html">Manufacturer Master</a></li>
       <li id="sm"><a href="/HMS/supplierho.html">Supplier Master</a></li>
       <li><a href="/HMS/customerho.html">Customer Master</a></li>
       <li><a href="/HMS/productho.html">Product  Master</a></li>
         
        </ul>
      
        <li id="or"><a href="/HMS/orderho.html">Order & Reorder</a></li>
        <li id="pe"><a href="/HMS/purchaseho.html">Purchase Entry</a></li>
        <li><a href="/HMS/saleho.html">Sales</a></li>
        <li><a href="/HMS/stopriceho.html">Product Stocks and Pricing</a></li>
      </li>
     
    </ul>
    <br>
    <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="window.history.back();"></i>
  </div>
</nav>
  <center>
</center>
  <div id="form2a" >  
  
     <h1>
     <font size="5">Product Stocks and Pricing </font><span class="button2"></span><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
	 
	</h1>
	    
	    <div class="container">
</div>
<br>

      <div id="col3">
       <form id = "form2" method="post" action ="pssaveho.html"></form>
     <form id ="form1" class="" method="get" action="pssearchho.html">
     
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	      
	      <div class="form-group">
            <p>Product Code<span>*</span></p>
      <input type="text" class="form-control" id="code" name="code" placeholder="Product Code">
       
      </div>
	</div>
	
	      
	       <div class="col-xs-4">
	      <div class="form-group">
	     
        <p>Product Name<span>*</span></p>
       <input type="text" class="form-control" id="name" name="name" placeholder="Product Name">
       </div>
	
	      </div>
	      
	      
	          <div class="col-xs-3">
	      <div class="form-group">
	     
        <p>Category<span>*</span></p>
         <select class="selectpicker form-control"  data-live-search="true" data-size="5" name = "category" id ="category" required>
          <option value="All">All</option>
        <c:forEach var="pp"  items="${model.list1}">
         <option value="${pp.pc}">${pp.pc}</option>
         </c:forEach>
    </select> </div>
	
	      </div>
	      </div>
	      
	            <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	      
	      <div class="form-group">
            <p>Expiry Date<span>*</span></p>
      <input type="date" class="form-control" min="2017-11-21" id="expDate" name="expDate">
     
      </div>
	</div>
	
	      
	       <div class="col-xs-4">
	      <div class="form-group">
	     
        <p>To Date<span>*</span></p>
      <input type="date" class="form-control" id="toDate" name="todate" >
              </div>
	
	      </div>
	      
	      
	          <div class="col-xs-3">
	      <div class="form-group">
	     
        <p>Batch <span>*</span></p>
       <input type="text" class="form-control" id="batch" name="batch" placeholder="Batch code">
      </div>
	
	      </div>
	      
	      
	      
	      </div>    
	      
	      
	    
	  

	     <div class="form-group row" >
  <div class="col-xs-1"></div>
  
   <div class="col-xs-2">
	       <div class="form-group">
	<p> Show<span>*</span></p>
	    <input type="number" class="form-control" id="records"   name="records" value='20' required>
  
     </div>
	      </div>
	      <div class="col-xs-3">
	       <div class="form-group">
	       <br>	
	 
    <input type="submit" id="bouton-contact" class="btn btn-warning" value="Search">
  <a href="/HMS/stopriceho.html" class="btn btn-primary" role="button">Refresh</a>

	       </div>
	       </div>
	       
	       

	       </div>
	       </form>
	<div class="container" id="span2">
                                            
  <table class="table table-striped table-bordered table-hover table-condensed" id="myTable" style="width: 2330px;" >
    <thead class="thead">
      <tr>
        
        <th style="width:100px;">Product Code</th>
        <th style="width:300px;">Product Name</th>
        <th style="width:100px;">Batch</th>
        
        <th style="width:200px;">ExpiryDate</th>
        <th style="width:100px;"> Manufacture Pack Desc</th>
        <th style="width:100px;">Manufacturing Pack Size</th>
        <th style="width:100px;">UnitCP</th>
        <th style="width:100px;">Purchase Qty</th>
        <th style="width:100px;">Total Purchase Price</th>
        <th style="width:100px;">StockNumber</th>
        <th style="width:100px;">Single Unit Desc</th>
        <th style="width:100px;">StockValue at Purchase</th>
        
        <th style="width:100px;">Markup</th>
        <th style="width:100px;">Selling Price</th>
        <th style="width:100px;">Selling Pack Desc</th>
        <th style="width:100px;">Selling Pack Size</th>
        <th style="width:100px;">Stock Value at SP</th>
        <th style="width:100px;">Selling Qty</th>
        <th style="width:100px;">Total Single Units</th>
        <th style="width:100px;">Total Price</th>
        <th style="width:30px;"></th>
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="ps"  items="${model.list}">
     <tr>
        <td style="width:100px;"><input type="text" name="code" id="code" form="form2" class="form-control input-sm ft" value="${ps.code}"></td>
        <td style="width:290px;"><input type="text" name="name" form="form2" id="name" class="form-control input-sm ft" value="${ps.name}"></td>
        <td style="width:100px;"><input type="text" name="batch" form="form2" id="batch" class="form-control input-sm ft" value="${ps.batch}"></td>
        
        <td style="width:200px;"><input type="date" name="expDate" onkeydown="return false" form="form2" id="expDate"  class="form-control input-sm ft" value="${ps.expDate}"></td>
        <td style="width:100px;"><input type="text" name="mpack" form="form2" id="mpack" class="form-control input-sm ft" value="${ps.mpack}"></td>
        <td style="width:100px;"><input type="number" min='1' name="mpsize" form="form2" id="mpsize" onkeypress='return onlyNos(event,this);' class="form-control input-sm ft" value="${ps.mpsize}"></td>
        <td style="width:100px;"><input type="number" name="cp" form="form2" id="cp" class="form-control input-sm ft" value="${ps.cp}"></td>
        <td style="width:100px;"><input type="number" min='1' name="prqty" form="form2" id="prqty" onkeypress='return onlyNos(event,this);' class="form-control input-sm ft" value="${ps.prqty}"></td>
        <td style="width:100px;"><input type="number" name="prprice" form="form2" id="prprice" class="form-control input-sm ft" value="${ps.prprice}"></td>  
        <td style="width:100px;"><input type="text" name="quantity" form="form2" id="quantity" class="form-control input-sm ft" value="${ps.quantity}"></td>
        <td style="width:100px;"><input type="text" name="sudesc" form="form2" id="sudesc" class="form-control input-sm ft" value="${ps.sudesc}"></td>
        <td style="width:100px;"><input type="number" name="stkpr" form="form2" id="stkpr" class="form-control input-sm ft" value="${ps.stkpr}"></td>
        <td style="width:100px;"><input type="number" name="markup" form="form2" id="markup" class="form-control input-sm ft" value="${ps.markup}"></td>
        <td style="width:100px;"><input type="text" name="sp" form="form2" id="sp" onkeypress='return onlyNos1(event,this);' class="form-control input-sm ft" value="${ps.sp}"></td>
        <td style="width:100px;"><input type="text" name="spdesc" form="form2" id="spdesc" class="form-control input-sm ft" value="${ps.spdesc}"></td> 
        <td style="width:100px;"><input type="number" name="spsize" form="form2" id="spsize" min='0' onkeypress='return onlyNos(event,this);' class="form-control input-sm ft" value="${ps.spsize}"></td> 
        <td style="width:100px;"><input type="text" onkeypress='return onlyNos1(event,this);' name="stksp" form="form2" id="stksp"  class="form-control input-sm ft" value="${ps.stksp}"></td> 
        <td style="width:100px;"><input type="number" min='0' name="sellqty" onkeypress='return onlyNos(event,this);' form="form2" id="sellqty" class="form-control input-sm ft" value="${ps.sellqty}"></td> 
        <td style="width:100px;"><input type="text"  onkeypress='return onlyNos1(event,this);' name="sunits" form="form2" id="sunits" class="form-control input-sm ft" value="${ps.sunits}"></td> 
        <td style="width:100px;"><input type="text"  onkeypress='return onlyNos1(event,this);' name="tprice" form="form2" id="tprice" class="form-control input-sm ft" value="${ps.tprice}"></td> 
     
    
      </tr>
          <script>
         // validDate()
        </script>
      </c:forEach>
      
       <c:forEach var="ps"  items="${model.list}">
 
   <script>
   /*
    copyName('<c:out value="${ps.code}" />','<c:out value="${ps.name}" />','<c:out value="${ps.category}" />','<c:out value="${ps.expDate}" />','<c:out value="${pp.toDate}" />','<c:out value="${ps.batch}" />','<c:out value="${ps.records}" />');
   */
   </script>
    </c:forEach>
    </tbody>
  </table>

</div>
<br>
     <div class="form-group row" >
  <div class="col-xs-6"></div>
<div class="col-xs-2">
	      
	      <div class="form-group"> 
    <input type="submit"  form="form2" class="btn btn-warning button1" id='bc' value="Update" >
	  </div>
	  </div>
	  </div>
</div>

  
     <input type="button"  form="purchasesave" id="" class="bouton-contact" >


 </div>
</div>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
	  </body>
	   
	      
</html>  
