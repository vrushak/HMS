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
<title>Pharmacy </title>
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





modal-body{
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

.delete{
	width :50px;
}

#col3{
margin-left: 25px; 
border-style : groove;
border-radius : 10px;
width : 1000px;

}




#tallModal .modal-body p { margin-bottom: 900px }

.mygrid-wrapper-div {
    border: solid black 2px;
    height: 300px;
    width : 250px;
    overflow: scroll;
    
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
		 
		document.getElementById("bouton-contact").disabled = true; 
		document.getElementById("mm").style.display = "none"; 
		document.getElementById("sm").style.display = "none"; 
		document.getElementById("or").style.display = "none"; 
		document.getElementById("pe").style.display = "none"; 
		 $('input').prop('readonly', true);
		 document.getElementById("manufacturer").disabled = true;
		 document.getElementById("check").disabled = true;
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

function check(id){
	
	
	if (id == "" || id == null){
		
		id = 1;
	  
		document.getElementById("product").value = id;
		
	}
	else {
		
		id = Number(id) + 1;
		
        
		
		
		
		document.getElementById("product").value = id;
		
	}
}

$(".modal-wide").on("show.bs.modal", function() {
	
	  var height = $(window).height() - 200;
	  $(this).find(".modal-body").css("max-height", height);
	});
	var prname;
	function run(vali) {
		
		if($(vali).val() == "new"){
	    	
	    	document.getElementById("form1").reset();
	    	
	    	document.getElementById("active").checked = true;
	    	    	   $('#prc').prop('readonly', false);
	    	
	    	document.getElementById("stocks").value = "";
	    	oncheck()
	    	location.reload();
	    	unsaved = false;
	    	 var ch = document.getElementsByName("checkb");
	    	   
	    	    for(var i=0;i<ch.length;i++){
	    	    	ch[i].checked = false;
	    	    }
	    	    $('select[name=manufacturer]').val("new");
	 		   $('#manufacturer').selectpicker('refresh');
	 		 unsaved = false; 
	 		   
	 			
	 			 
	    }
	    else{
	    	
	 	   var str = $(vali).val();
		   var strSplit = str.split('=');
		   $('#prc').prop('readonly', true);
		   prname = strSplit[0];
		   
		   $('select[name=myname1]').val(str);
		   $('#myname1').selectpicker('refresh');
		   
		   $('select[name=myname]').val(str);
		   $('#myname').selectpicker('refresh');
		document.getElementById("name").value = strSplit[0];
		document.getElementById("descr").value = strSplit[1];
		document.getElementById("pc").value = strSplit[2];
		document.getElementById("prc").value = strSplit[3];
	
	document.getElementById("manufacturer").value = strSplit[4];
		document.getElementById("composition").value = strSplit[5];
		document.getElementById("sp").value = strSplit[6];
		document.getElementById("bc").value = strSplit[7];
		document.getElementById("mc").value = strSplit[8];
		document.getElementById("rl").value = strSplit[9];
		document.getElementById("rq").value = strSplit[10];
		document.getElementById("doc").value = strSplit[11];
		document.getElementById("dsc").value = strSplit[12];
		document.getElementById("supplier").value = strSplit[13];
		
		document.getElementById("product").value = strSplit[16];
		var full = strSplit[14].split(".");
		document.getElementById("stocks").value = full[0];
		if(strSplit[15] == "active"){
			document.getElementById("active").checked = true;
		}
		else{
			document.getElementById("active").checked = false;
		}
	    }
		$("#dps").val(strSplit[17])
		$("#dsp").val(strSplit[18])
	/*	
	    if ($("#manufacturer option[value='"+strSplit[4]+"']").length == 0){
	    	
		  $("#manufacturer").append('<option value="'+strSplit[4]+'" selected="">'+strSplit[4]+'</option>');
		   $("#manufacturer").selectpicker("refresh");
		   
	    }
	*/
	  $('select[name=manufacturer]').val(strSplit[4]);
	   $('#manufacturer').selectpicker('refresh');	
	   
	    $('.checkb').attr('checked',false);
	    var check = strSplit[13].split("/");

		for(var i=0;i<check.length;i++){
		if(check[i].length > 1){
			document.getElementById(check[i]).checked = true;
		}
		}
		arr = [];
		modalshow()
		 //document.getElementById("manufacturer").setAttribute("readonly","readonly"); 
		 $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
			  
		     	unsaved = false;
		     });
	}


function caluclate(){
var num = Number(document.getElementById("mc").value) * (Number(document.getElementById("rl").value)/100);
document.getElementById("rq").value = Math.round(num);
	
}
var arr = [];

function modalshow()
{

	var checkboxes = document.getElementsByName("checkb");
for (var i = 0; i < checkboxes.length; i++) 
{ 
    //if (checkboxes[i].type == "checkbox") {
        if (checkboxes[i].checked) {
        	
        	getvalue(checkboxes[i].id);
       
       // }
        
        }
    }
//document.getElementById("supplier").value = arr.join("/");
}
function getvalue(myname) {
	
	
	var text = myname;
	
	if (document.getElementById(myname).checked){
	
		arr.push(myname);
	    
	}
	else 
		{
	    arr.splice( arr.indexOf(myname), 1 );
		
		}
       console.log(arr);
	document.getElementById("supplier").value = arr.join("/");
	
	
	
}
function supply(){
	if($('#name').val().length==0){
		alert("Enter Product Name");
		return false
	}
	if($('#pc').val().length==0){
		alert("Enter Product Category");
		return false
	}
	if($('#prc').val().length==0){
		alert("Enter Product Code");
		return false
	}
	var len = document.getElementById("supplier").value;
	if(len == 0){
		alert("Please select Supplier");
		return false;
	}
	else if(pflag > 0){
		alert("Product code already exists");
		
		return false;
	}
	else if(pnflag > 0){
		alert("Product name already exists");
		
		return false;
	}
	else{
		return true;
	}
}
	function verify(form){
		alert("changes updated successfully!");
		document.getElementById(form).submit();
	}
	
	function check1(){
		$('#myModal').modal('show');
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
	     
	     
	        if(parts.length >1 && charCode == 46){
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

	function datasuccess(data){
		
		if(data != "null"){
			
			alert(data)
	window.location = "/HMS/productho.html";
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
var pflag;
var pnflag;
       function doAjaxPost() {
    	   // get the form values

    	       var pcode = $('#prc').val();
        
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/checkpcode.html",
	          data: "prc=" + encodeURIComponent(pcode),
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        	   
	       	 
	       		 document.getElementById("bouton-contact").disabled = false;
	       	
	      if(pflag > 0){
	    	  pflag = 0;
	      }
	        	   $.each(response, function(index, datec) {
	                   //to print name of employee
	             
	                  if(datec.prc != null || datec.prc == " "){
	                	  alert("Product Code already exists")
	                	  document.getElementById("bouton-contact").disabled = true;
	                	  pflag = 1;
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
       <script>
       function doAjaxPost1() {
    	   // get the form values

    	       var pname = $('#name').val();
    	       if(prname == pname){
    	    	   return false;
    	       }
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/checkpname.html",
	          data: "name=" + pname,
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        	   
	       	 
	       		 document.getElementById("bouton-contact").disabled = false;
	       		 if(pnflag > 0){
	   	    	  pnflag = 0;
	   	      }
	   	        
	      
	        	   $.each(response, function(index, datec) {
	                   //to print name of employee
	             
	                  if(datec.name != null || datec.name == " "){
	                	  alert("Product Name already exists")
	                	  document.getElementById("bouton-contact").disabled = true;
	                	  pnflag = 1;
	                  }
	                  else{
	                	  pnflag = 0;
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
       <script>
       function oncheck(){
    	   document.getElementById('active').checked=true;
       }
       function goBack() {
   	    window.history.back();
   	}
       </script>

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome2('<c:out value="${username}" />'),oncheck()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Product Master</a>
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
 <!-- <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="goBack()"></i>-->
    

  </div>
</nav>
  <center>
</center>
  <div id="form2" >  
  
     <h1><button type="button" id="refresh" class="btn btn-warning button1" onclick="location.href='/HMS/productho.html';">
	  <span class="fa fa-refresh"></span> Refresh</button>
	
	
<font size="5">Product Master</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="submit" id="bouton-contact" onclick = "return supply()" class="form-control input-sm button2 btn btn-warning" form="form1" value="Save" /></span>
	</h1>

 <form id ="form1" action = "saveproductho.html" method = "post"></form>

   <br>
	    
	    <div class="container">
 
  

  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Product Details</a></li>
    <li><a data-toggle="pill" href="#menu1">Manufacturer and Supplier Details</a></li>
</ul>
</div>
<br>
<div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div id="col3">
      
      <div class="form-group row">
 
<div class="col-xs-1"></div>
  <div class="col-xs-3">
  <div class="form-group">
            <p>Select Product Code<span></span></p>
     <select class="selectpicker form-control" data-size="5" data-live-search="true" name = "myname1" id ="myname1"  onchange = "run(this)" required>
        <option value ="new">New</option>
      
       <c:forEach var="stks" items="${model.list3}">
       <option value = "${stks.name}=${stks.descr}=${stks.pc}=${stks.prc}=${stks.manufacturer}=${stks.composition}=${stks.sp}=${stks.bc}=${stks.mc}=${stks.rl}=${stks.rq}=${stks.doc}=${stks.dsc}=${stks.supplier}=${stks.stocks}=${stks.active}=${stks.product}=${stks.dps}=${stks.dsp}">${stks.prc}</option>
       </c:forEach>
       
      </select>
       </div>
     </div>

  <div class="col-xs-4">
  <div class="form-group">
            <p>Select Product <span></span></p>
     <select class="selectpicker form-control" data-size="5" data-live-search="true" name = "myname" id ="myname"  onchange = "run(this)" required>
        <option value ="new">New</option>
      
       <c:forEach var="stks" items="${model.list3}">
       <option value = "${stks.name}=${stks.descr}=${stks.pc}=${stks.prc}=${stks.manufacturer}=${stks.composition}=${stks.sp}=${stks.bc}=${stks.mc}=${stks.rl}=${stks.rq}=${stks.doc}=${stks.dsc}=${stks.supplier}=${stks.stocks}=${stks.active}=${stks.product}=${stks.dps}=${stks.dsp}">${stks.name}</option>
       </c:forEach>
       
      </select>
      
        </div>
      
      </div>
      
    
     <div class="col-xs-3">
      <div class="form-group">
            <p>Current Stocks<span></span></p>
            <input readonly="readonly" type="text" class="form-control"  id="stocks" name="stocks" >
   
      
      </div>
      
      </div>
 
               
  
      </div>
      <br>
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	   <!-- 
	      <div class="col-xs-3">
	      
	      <div class="form-group">
            <p>Product Id<span>*</span></p>
         <input type="text" onkeypress="return onlyNos(event,this);"  class="form-control" id="id" name="id" form="form1" required>
	</div>
	      </div>
	       -->
	          <div class="col-xs-3">
	      
	      <div class="form-group">
            <p>Product Name<span>*</span></p>
         <input type="text" onfocusout= "doAjaxPost1()"  class="form-control" id="name" name="name" form="form1" required>
         <input type="hidden" form="form1" name = "product" id ="product" >
       </div>
	      </div>
	      
	      
	       <div class="col-xs-4">
	         <p>Product Category<span>*</span></p>
	       <div class="form-group">
        <input type="text" class="selectpicker form-control" form="form1"   name = "pc" id ="pc"   required>
        </div>
	      </div>
	      
	   <div class="col-xs-3">
      <div class="form-group">
            <p>Description<span></span></p>
            <input  type="text" class="form-control"  id="descr" name="descr" form="form1" >
   
      
      </div>
      
      </div>
 
     
	      
	      </div>
	      
	    
	      	         <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	       <div class="form-group">
     
            <p>Code<span>*</span></p>
        <input type="text" oninput= "doAjaxPost()"  class="form-control" id="prc" name="prc" form="form1" required>
        </div>
	      </div>
	      
	       <div class="col-xs-4">
	      <div class="form-group">
          <p>Composition<span></span></p>
        <input form="form1" class ="form-control" type="text" id="composition" name="composition" >
      
     </div>
	      </div>
	      
	      <div class="col-xs-3">
	       <div class="form-group">
     
            <p>Similar Products<span></span></p>
       <input  class="form-control" form="form1" type="text" onkeypress="return onlyAlphabets(event,this);" id="sp" name="sp">
      </div>
	      </div>
	       
	      </div>
	      
	           
	      	         <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	       <div class="form-group">
     
            <p>Base Units<span></span></p>
      <input type = "text" class="form-control" form="form1"   name = "bc" id ="bc" >
     </div>
	      </div>
	      
	       <div class="col-xs-4">
	      <div class="form-group">
          <p>Max Stock<span></span></p>
        <input class="form-control" form="form1" type="number" id="mc" onkeypress="return onlyNos(event,this)" oninput="caluclate()" onchange="caluclate()" name="mc" value="0" >
           
     </div>
	      </div>
	      
	        <div class="col-xs-3">
	      <div class="form-group">
         <p>ReOrder Level<span></span></p>
         <input class="form-control" onkeypress="return onlyNos(event,this)" oninput="caluclate()" onchange="caluclate()"  form = "form1" type="number" id="rl" name="rl" >
    
     
          </div>
	      </div>
	      
	      </div>
	      
	      
	      	         <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	       <div class="form-group">
       <p>Reorder Quantity<span></span></p>
       <input class="form-control" onkeypress="return onlyNos(event,this);" readonly="readonly" type="number" form="form1" id="rq" name="rq" >
      
          </div>
	      </div>
	      
	       <div class="col-xs-4">
	      <div class="form-group">
              <p>Order Pack Description<span></span></p>
       <input  class="form-control" type="text"  form="form1" name = "doc" id ="doc">
  
     </div>
	      </div>
	        <div class="col-xs-3">
	      <div class="form-group">
     <p>Sales Pack Description<span></span></p>
         <input type="text" class = "form-control" form="form1" name = "dsc" id ="dsc">
         
     </div>
	      </div>
	       
	      </div>
	     <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	       <div class="form-group">
        <br>
	       Active: <input type="checkbox" value="active" id="active" name="active" form="form1" >
           
       </div>
	      </div>
	        <div class="col-xs-4">
	       <div class="form-group">
         <p>Default Order Pack Size<span></span></p>
       <input  class="form-control" type="text"  form="form1" name = "dps" id ="dps">
           
       </div>
	      </div>
	        <div class="col-xs-3">
	       <div class="form-group">
        <p>Default Sales Pack Size<span></span></p>
       <input  class="form-control" type="text"  form="form1" name = "dsp" id ="dsp">
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
	        <p>Manufacturers<span></span></p>
             <select class="selectpicker form-control"   class = "input-small" data-live-search="true" data-size="5" name = "manufacturer" id ="manufacturer" form="form1" >
     <option value="new">Select Manufacturer</option>
    <c:forEach var="manufact" items="${model.list}">
    <option value="${manufact.name}">${manufact.name}</option>
</c:forEach>
</select>
      </div>
	        </div>
	        
	         <div class="col-xs-4">
	        <div class="form-group">
	     <p>Suppliers<span>*</span></p>
	<input type="text"  class="form-control" id="supplier" name="supplier"  readonly   form = "form1" required>
    
          </div>
	        </div>
	        
	        
	         <div class="col-xs-3">
	        <div class="form-group">
	        <br>
	        <br>
	          <button id ="check" value="Select Manufacture" data-toggle="modal" data-target="#myModal" >Select Suppliers</button>
	        <br><br><br><br><br>
       </div>
	        </div>
	        
	 
	      
	      
	      </div>
	      
      
      
	           
	      
	      
  
         
      </div>
      </div>
    </div>
	    
    
   
     
	 
	 
	 
	 
	      
	      
    <button type="" class="bouton-contact" ></button>
     </div>
   </div>
     


 
   <div class="container">
  
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Suppliers</h4>
        </div>
        <div class="modal-body">
         <div class="form-group row">
<div class="col-xs-3">
 <div class="mygrid-wrapper-div">
<c:forEach var="detBean" items="${model.list1}">
<input type="checkbox" id = "${detBean.name}" name="checkb" class="checkb" onclick = "getvalue('${detBean.name}')" value="${detBean.name}">  ${detBean.name}</input></br>
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
  check('<c:out value="${custid.product}" />');
  </script>
  </c:forEach>
       <script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>