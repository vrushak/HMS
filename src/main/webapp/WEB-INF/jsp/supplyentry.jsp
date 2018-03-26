<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pharmacy</title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">


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
  height : 800px;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
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
  max-width:1050px;
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
    
}

.table-fixed{
 
}
  tbody{
    height:50px;
    
 }
 
#myTable1 {
    border-collapse: collapse;
    width: 100%;
    }
#myTable1 th {
    background-color: #009999;
    color: black;
    width : 180px;
}

.table-fixed{
 
}
  #myTable1 .tbody1{
    height:200px;
    overflow-y:auto;
 }
 #myTable1 thead,.tbody1{
  
    display:block;
  }

modal-body{
	background-color: #eaeaea;
	height:500px;
	width:500px;
	
	
}  

.button1{
	float : left;
}
.button2{
	float : right;
}

.delete{
	width :50px;
}

#col3{
margin-left: 25px; 
border-style : groove;
border-radius : 10px;
width : 1000px;
}


.modal.modal-wide .modal-dialog {
  width: 70%;
}
.modal-wide .modal-body {
  overflow-y: auto;
}

.borderless td, .borderless th {
    border: none;
}

fieldset.scheduler-border {
    border: 1px groove #ddd !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
}

    legend.scheduler-border {
        font-size: 1.2em !important;
        font-weight: bold !important;
        text-align: left !important;
        width:auto;
        padding:0 10px;
        border-bottom:none;
    }
/* irrelevant styling */

#tallModal .modal-body p { margin-bottom: 900px }

.mygrid-wrapper-div {
    border: solid black 2px;
    height: 300px;
    width : 250px;
    overflow: scroll;
    
}

</style>

<script type="text/javascript">

function check(id){
	
	
	if (id == "" || id == null){
		
		id = 1;
	  
		document.getElementById("sid").value = id;
		
	}
	else {
		
		id = Number(id) + 1;
		
        
		
		
		
		document.getElementById("sid").value = id;
		
	}
}

var prname;
function run() {
	if(document.getElementById("myname").value == "new"){
    	
    	document.getElementById("form1").reset();
    	oncheck()
    	location.reload();
    		document.getElementById("active").checked = true;
    var ch=	document.getElementsByName("checkb");
   
    for(var i=0;i<ch.length;i++){
    	ch[i].checked = false;
    }
	}
	
    else{
 	   var str = document.getElementById("myname").value;
	   var strSplit = str.split('=');
	  prname = strSplit[0];
	document.getElementById("name").value = strSplit[0];
	document.getElementById("medical").value = strSplit[1];
	document.getElementById("address1").value = strSplit[2];
	document.getElementById("address2").value = strSplit[3];
	document.getElementById("city").value = strSplit[4];
	document.getElementById("state").value = strSplit[5];
	document.getElementById("country").value = strSplit[6];
	//document.getElementById("pincode").value = strSplit[7];
	document.getElementById("phone").value = strSplit[7];
	document.getElementById("mobile").value = strSplit[8];
	document.getElementById("fax").value = strSplit[9];
	document.getElementById("email").value = strSplit[10];
	document.getElementById("poc").value = strSplit[11];
	document.getElementById("pca").value = strSplit[12];
	document.getElementById("website").value = strSplit[13];

	document.getElementById("manufacturers").value = strSplit[14];
	document.getElementById("comments").value = strSplit[15];
	document.getElementById("sid").value = strSplit[16];

	if(strSplit[17] == "on"){
		
		document.getElementById("active").checked = true;
	}
	else{
	
		document.getElementById("active").checked = false;
	}
	
	$('.checkb').attr('checked',false);
 
    
	var check = strSplit[14].split("/");

	for(var i=0;i<check.length;i++){
	if(check[i].length > 1){
		document.getElementById(check[i]).checked = true;
	}
	}
    }
	pc = [];

	modalshow()
	 $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
		  
	     	unsaved = false;
	     });
}

var arr = [];


function getvalue(myname) {
	
	
	var text = myname;
	
	if (document.getElementById(myname).checked){
	//alert(myname)
		arr.push(myname);
	    
	}
	else 
		{
	    arr.splice( arr.indexOf(myname), 1 );
		
		}
       console.log(arr);
    // alert(arr)
    
  
   
	document.getElementById("manufacturers").value = arr.join("/");
	//alert(myname);	
	
	
	
	}




	
var pc = [];
function modalshow()
{

	var checkboxes = document.getElementsByName("checkb");
for (var i = 0; i < checkboxes.length; i++) 
{ 
    //if (checkboxes[i].type == "checkbox") {
        if (checkboxes[i].checked) {
        	
            getPc(checkboxes[i].id);
       
       // }
        
        }
    }
document.getElementById("manufacturers").value = pc.join("/");
}
function getPc(myname) {
	
    var text1 = myname;
    
    if (document.getElementById(myname).checked) {
        //alert(myname)
        pc.push(myname);
        //alert(pc)
    	
    } else {
    	//alert(myname)
    	//alert(pc)
        pc.splice(pc.indexOf(myname), 1);
    }
   
    console.log(pc);
    document.getElementById("manufacturers").value = pc.join("/");
}
	
	
function manufacture(){
	
	var len = document.getElementById("manufacturers").value;
	if(len == 0){
		alert("Please select Manufacturer");
		return false;
	}
	else{
		return true;
	}
}
function check1(){
	$('#myModal').modal('show');
  // modalshow()
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
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode = 32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
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
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}
 
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/supplierho.html";
	}
}
</script>
<script type="text/javascript">

$(document).ready(function () {
	$("input").on("keypress", function(e) {
	    if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	
});

</script>
<script>
       function oncheck(){
    	   document.getElementById('active').checked=true;
    	   //check1()
    	  ///modalshow()
       }
       </script>
       <script>
       function doAjaxPost1() {
    	   // get the form values

    	       var sname = $('#name').val();
        if(prname == sname){
        	return false;
        }
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/checksname.html",
	          data: "name=" + sname,
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	       
	           success: function(response){
	        	   
	       	 
	       		 document.getElementById("bc").disabled = false;
	       	
	      
	        	   $.each(response, function(index, datec) {
	                   //to print name of employee
	             
	                  if(datec.name != null || datec.name == " "){
	                	  alert("Supplier name already exists")
	                	  document.getElementById("bc").disabled = true;
	                  }
	                  
	                  

	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
	        	        	   
    	        	        }


      
       function goBack() {
   	    window.history.back();
   	}
       </script>
</head>
<body onload="oncheck()">
<div class = "wrapper">
 <div class="container1">
 <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Supplier Master</a>
    </div>
     <ul class="nav navbar-nav">
      <li class="active"><a href="/HMS/hmspharma">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown">Masters
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
       <li> <a href="/HMS/manufactureho.html">Manufacturer Master</a></li>
       <li><a href="/HMS/supplierho.html">Supplier Master</a></li>
       <li><a href="/HMS/customerho.html">Customer Master</a></li>
       <li><a href="/HMS/productho.html">Product  Master</a></li>
         
        </ul>
    <li><a href="/HMS/orderho.html">Order & Reorder</a></li>
        <li><a href="/HMS/purchaseho.html">Purchase Entry</a></li>
        <li><a href="/HMS/saleho.html">Sales</a></li>
        <li><a href="/HMS/stopriceho.html">Product Stocks and Pricing</a></li>
      </li>
    </ul>
    <br>
  <!--     <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="goBack()"></i>-->
    
</div>
</nav>
</div>
 <!--<form id = "form2" action = "savesupply.html" method = "post"></form>-->
  <div id="form2" >  
  
     <h1><button type="button" id="refresh" class="btn btn-warning button1" onclick="location.href='/HMS/supplierho.html';">
	  <span class="fa fa-refresh"></span> Refresh</button>
	
	
<font size="5">Supplier Master</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="submit" id="bc" onclick = "return manufacture()" class="form-control input-sm button2 btn btn-warning" form="form1" value="Save"/></span>
	</h1>

<form id = "form1" action="savesupply.html" method ="post"></form>


   <br>
	    
	    <div class="container">
 
  

  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Supplier Details</a></li>
    <li><a data-toggle="pill" href="#menu1">Manufacturer and Product Categories</a></li>
</ul>
</div>
<br>
<div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div id="col3">
      
         
      <div class="form-group row">
 
 <div class="col-xs-4"></div>
 <div class="col-xs-3">
    <p>Select Supplier<span></span></p>
 <select class="selectpicker form-control" data-size="5" data-live-search="true"  id = "myname" name="myname" onchange="run()">
<option value="new">New</option>
<c:forEach var="supp"  items="${model.list1}">
<option value="${supp.name}=${supp.medical}=${supp.address1}=${supp.address2}=${supp.city}=${supp.state}=${supp.country}=${supp.phone}=${supp.mobile}=${supp.fax}=${supp.email}=${supp.poc}=${supp.pc}=${supp.website}=${supp.manufacturers}=${supp.comments}=${supp.sid}=${supp.active}">${supp.name}</option>
</c:forEach>
</select>
 </div>
 
 </div>
 
      <div class="form-group row">
 
 <div class="col-xs-1"></div>
<div class="col-xs-3">
<div class="form-group">
  <p>Supplier Name<span>*</span></p>
  <input class="form-control" type="text" onfocusout="doAjaxPost1()" id = "name" name="name" form="form1"  required>
  <input class="form-control" form="form1" type="hidden"  name="sid" id="sid">
	        
</div>
</div>

  <div class="col-xs-4">
  <div class="form-group">
  <p>Supplier Type<span>*</span></p>
   <input type="text" class="form-control" form="form1" name = "medical" id="medical" required>
 

        </div>
      
      </div>  <div class="col-xs-3">
	         <p>Point of Contact<span></span></p>
	       <div class="form-group">
      <input type="text"   class="form-control" id="poc" name="poc" form="form1" >
       
	</div>
	      </div>
	      
</div>




      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	      
	      <div class="form-group">
            <p>Phone<span></span></p>
         <input type="text" onkeypress="return onlyNos(event,this);" class="form-control" id="phone" name="phone" form="form1" >
	</div>
	      </div>
	      
	       <div class="col-xs-4">
	         <p>Mobile<span></span></p>
	       <div class="form-group">
      <input type="text" onkeypress="return onlyNos(event,this);" class="form-control" id="mobile" name="mobile" form="form1" >
       
	</div>
	      </div>
	      <div class="col-xs-3">
	     <div class="form-group">
  <p>Email<span></span></p>
 <input type="email" form="form1" class="form-control" id="email" name="email" >
</div>
</div>
</div>




     <div class="form-group row" >
	     <div class="col-xs-1"></div>
	     
	  
	           <div class="col-xs-3">
   <div class="form-group">
  <p>Address1<span></span></p>
 <input type="text" class="form-control"  form="form1" id="address1" name="address1" >
</div>
  </div>
	     <div class="col-xs-4">
	     <div class="form-group">
  <p>Address2<span></span></p>
 <input type="text" form="form1" class="form-control" id="address2" name="address2">
</div></div>
   
	      <div class="col-xs-3">
	      
	      <div class="form-group">
            <p>Fax<span></span></p>
         <input type="text" onkeypress="return onlyNos(event,this);" class="form-control" id="fax" name="fax" form="form1">
	</div>
	      </div>
	         </div>



	
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	     <div class="col-xs-3">
	     <div class="form-group">
  <p>Country<span></span></p>
 <input type="text" onkeypress="return onlyAlphabets(event,this);" form="form1" class="form-control" id="country" name="country" >
</div></div>
	  
	        
	      <div class="col-xs-4">
	      
	      <div class="form-group">
            <p>State<span></span></p>
         <input type="text"  onkeypress="return onlyAlphabets(event,this);" class="form-control" form="form1"id="state" name="state" form="form1" >
	</div>
	      </div>
	      
	       <div class="col-xs-3">
	         <p>City<span></span></p>
	       <div class="form-group">
      <input type="text" onkeypress="return onlyAlphabets(event,this);" class="form-control" id="city" name="city" form="form1" >
       
	</div>
	 </div>
	  </div>
	        
	           
	      	   
	      </div>
	      
	       
	     </div>
   
      <div id="menu1" class="tab-pane fade">
      
        <div id="col3">
      
            <div class="form-group row" >
	     <div class="col-xs-1"></div>
	       <div class="col-xs-3">
	        <div class="form-group">
	        <p>Product Categories<span></span></p>
             <input type="text" class="form-control" id="pca" name="pc" form="form1">
      
      </div>
	        </div>
	        
	         <div class="col-xs-4">
	        <div class="form-group">
	     <p>Manufacturers<span></span></p>
	           <input type="text"   class="form-control"  id="manufacturers" name="manufacturers" form="form1" required>
       
          </div>
	        </div>
	        
	        
	         <div class="col-xs-3">
	        <div class="form-group">
	        <br>
	        <br>
	       <button id ="check"  value="Select Manufacture"  data-toggle="modal" data-target="#myModal" >Select Manufacturers</button>
       </div>
	        </div>
	        
	 
	      
	      
	      </div>
	      
	           
	      
	               <div class="form-group row" >
	     <div class="col-xs-1"></div>
	       <div class="col-xs-3">
	        <div class="form-group">
	        <p>Website<span></span></p>
            <input type="text" class="form-control" id="website" name="website" form="form1" >
    
      </div>
	        </div>
	        
	         <div class="col-xs-4">
	        <div class="form-group">
	     <p>Comments<span></span></p>
	       <input type="text" class="form-control" id="comments" name="comments" form="form1" >
     
          </div>
	        </div>
	        
	        
	         <div class="col-xs-3">
	        <div class="form-group">
	       
	            Active: <input type="checkbox" id="active" name="active"  form="form1" >
        </div>
	        </div>
	        
	 
	      
	      
	      </div>
	      
       
         
      </div>
      </div>
     
    </div>
	    
    
   
     
	 
	 
	 
	
	      
	      
    <button type="" class="bouton-contact"  ></button>
   </div>
     
 </div>
 
   <div class="container">
  
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Manufacturers</h4>
        </div>
        <div class="modal-body">
         <div class="form-group row">
<div class="col-xs-2">
 <div class="mygrid-wrapper-div">
<c:forEach var="detBean" items="${model.list}">
<input type="checkbox" id = "${detBean.name}" name="checkb" class="checkb" onclick = "getPc('${detBean.name}')" value="${detBean.name}">${detBean.name}</input></br>
</c:forEach>
</div>
</div>

</div>
</div>
 <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
 </div>
       
      </div>
    </div>
  
  </div>
  <c:forEach var="custid"  items="${model.list2}">
  <script>
  check('<c:out value="${custid.sid}" />');
  </script>
  </c:forEach>
  <script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>