<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">
<link rel='stylesheet' href='<c:url value="/resources/css/printsaleo.css" />' type='text/css' media='print' />
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.min.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>


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
  max-width:1000px;
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
    
    }
#myTable th {
    background-color: #009999;
    color: black;
   
}

#myTable .tbody{
    height:300px;
    overflow-y:scroll;
 }
#myTable  thead,.tbody{
  
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
width : 970px;
height : 620px;
}




  
</style>


<script type="text/javascript">
function goBack() {
    window.history.back();
}

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

function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
    var x = document.getElementById('myTable').getElementsByTagName('tbody')[0];
    document.getElementById("count").value=x.rows.length;
    
}

function check(id){
	
	var n = moment().format("DD-MM-YYYY hh:mm");
	document.getElementById("orderDate").value = n;
	
	if (id == "" || id == null){
		
		id = 1;
		var str1 = "ORD-";
		var str2 = "HO";
		var str3 = "-";
		var m = moment().format("DDMMYYYY-");
		
		var str4 = id;
		var res = str1.concat(str2);
		var res1 = res.concat(str3);
		var res3 = res1.concat(m);
		var res4 = res3.concat(str4);
		
		document.getElementById("orderid").value = res4;
		

			}
	else {
		
		id = Number(id) + 1;
		
		var str1 = "ORD-";
		var str2 = "HO";
		var str3 = "-";
		var m = moment().format("DDMMYYYY-");
		
		var str4 = id;
		var res = str1.concat(str2);
		var res1 = res.concat(str3);
		var res3 = res1.concat(m);
		var res4 = res3.concat(str4);
	
		document.getElementById("orderid").value = res4;
		

		
	}
}

function auto_grow(element) {
	
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
}

function getCount(){

	var x = document.getElementById("myTable").rows.length;
	
    document.getElementById("count").value=$("#myTable .tbody tr").length;

    
  //  document.getElementById("invoiceDate").valueAsDate = new Date();
  
}

var quanto;
var unito;
var upo;
var p;

function add1(getval){
	

	var myname = getval.getAttribute('data-value'); 
	  
	   var strSplit = myname.split(',');
	 
     if(strSplit[0] == "Select"){
    	 $('select[name=pname]').val('Select');
  	   $('#pname').selectpicker('refresh');
     }
     else{ 
   	   $('select[name=pname]').val(strSplit[1]);
	   $('#pname').selectpicker('refresh');
	   p = strSplit[2];
     }
	   
		// document.getElementById("eans").value = strSplit[0];
	       
		   
	    disbut();
	      
		   
	   
	   
}


function add2(getval){
	
	var myname = getval.getAttribute('data-value'); 
	       var strSplit = myname.split(',');
	       if(strSplit[1] == "Select"){
	    	   $('select[name=ean1]').val('Select');
			   $('#ean1').selectpicker('refresh');
	       }
	       else{
	   	   $('select[name=ean1]').val(strSplit[0]);
		   $('#ean1').selectpicker('refresh');
		   p = strSplit[2];
		//   document.getElementById("eans").value = strSplit[0];
	       }
	     disbut();
		 
	 
	
}

function calc(tid) {
	
	  
	
	idx = tid;

	 
	  
	  var price = (parseFloat(document.getElementById("unitprice"+idx).value) *  parseFloat(document.getElementById("quantity"+idx).value)) - parseFloat(document.getElementById("discount"+idx).value) + parseFloat(document.getElementById("tax"+idx).value);
	 
	
	  document.getElementById("total"+idx).value= price.toFixed(2);//isNaN(price)?"0.00":price.toFixed(2);
	 
	   
	}
	function setdefault(){
	//  document.getElementById("medicine").value = "new";
	    //alert(document.getElementById("medicine").value);
	}




	function totalIt() {
	  var qtys = document.getElementsByName("qty[]");
	 
	  var total=0;
	  for (var i=1;i<=qtys.length;i++) {
	    calc(i);  
	    var price = parseFloat(document.getElementById("total"+i).value);
	    total += Number(price)//isNaN(price)?0:price;
	  }
	  document.getElementById("grandTotal").value= total.toFixed(2);  //isNaN(total)?"0.00":total.toFixed(2);    
	  
	  
	  
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
	
	
	
function add() {
	
    
  
 
    var pname = encodeURI(document.getElementById("pname").value);
    var ean = document.getElementById("ean1").value;
    var sup= document.getElementById("Supplier").value;
    if(sup=="Select"){
    	alert("Please select Supplier")
    	return false;
    }
if(pname == "Select" && ean == "Select"){
	alert("Please select the Product")
	return false;
}

    
var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];

 

var markup = "<tr><td style='width:100px;'><input type='text'  class='form-control input-sm' id = 'ean' name= 'ean' form ='saveo' value = "+ean+" required></td><td style='width:400px;'><input type='text'  form ='saveo' class='form-control input-sm' id = 'productName' name= 'productName'  value = '"+decodeURI(pname)+"' required></td><td style='width:160px;'><input id = 'unit' form ='saveo' type='text' name= 'unit' class='form-control input-sm' required></td><td style='width:100px;'><input form ='saveo'  type='number' onkeypress='return onlyNos(event,this);'  id = 'quantity' name= 'quantity' min = '1' value = '0' class='form-control input-sm' required ></td><td style='width:100px;'><input type = 'text' form ='saveo'  readonly='readonly' type='text'  id = 'stks' name='stks' value="+Number(p)+" class='form-control input-sm' required></td><td style='width:70px;'><i class='fa fa-trash-o'  style='font-size:20px'onclick='deleteRow(this)'></i></td></tr>"

 $('#myTable tbody').append(markup);


 
 getCount()
 
  $('select[name=pname]').val('Select');
  $('#pname').selectpicker('refresh');
  
  $('select[name=ean1]').val('Select');
  $('#ean1').selectpicker('refresh');
/* 

    for(var x=0; x<row; x++) {
    	
    	
	
 	
 	      var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
 	      var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
 
 	      getCount();
  
           var idx = document.getElementById("myTable").rows.length-1;
           
           var quantity =  "quantity"+idx;
           
           var unit = "unit"+idx;
           
          var up = "unitprice"+idx;
           
          var discount = "discount"+idx;
           
          var tax = "tax"+idx;
           
          var total = "total" + idx;
         
   
        var newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input type = 'hidden' form ='purchasesave' name = 'ean1' id='eans' value='"+str[0]+"'><input class='form-control input-sm' form ='purchasesave'  type='text' id = 'productSale' name= 'pname1' value = '"+str[1]+"'required> </td></tr>";
        newCell.style.width ='150px';
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' type ='text'  name='Batch1' value ='' id='batch'  form ='purchasesave' required></td></tr>";
        newCell.style.width ='70px';
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' type ='date' name='mDate1'  id='mDate'  form ='purchasesave' required></td></tr>";
     

        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<input class='form-control input-sm'  form ='purchasesave'  type='date' id = 'expSale' name= 'expDate1' required>";
       
 
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' form='purchasesave' min='0'   type='number'  id = '"+quantity+"' name='qty[]' oninput = calc('"+idx+"'),totalIt()  onchange = calc('"+idx+"'),totalIt() value = '"+quanto+"' required></td></tr>";
        newCell.style.width ='70px';
   
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' form ='purchasesave'  type='text' id = 'unitp'  name= 'unitp' required ></td></tr>";
        newCell.style.width ='70px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' form ='purchasesave' onkeypress='return onlyNos(event,this);' min='0' type='text' id = '"+up+"'  name= 'up2[]'  required oninput = calc('"+idx+"'),totalIt()></td></tr>";
        newCell.style.width ='100px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input onkeypress='return onlyNos(event,this);'  class='form-control input-sm' form ='purchasesave' min='0' type='text' id = '"+discount+"' name='discount1[]' required  value ='0' oninput = calc('"+idx+"'),totalIt()></td></tr>";
        newCell.style.width ='60px';  
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input onkeypress='return onlyNos(event,this);' class='form-control input-sm' form ='purchasesave' min='0' type='text' id = '"+tax+"' name='tax1[]'  value = '0' required oninput = calc('"+idx+"'),totalIt()></td></tr>";
        newCell.style.width ='60px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input onkeypress='return onlyNos(event,this);' class='form-control input-sm' form ='purchasesave' type='text'  id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
        newCell.style.width ='100px';
        
       
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm'  form ='purchasesave' readonly = 'readonly' type='text' id = '"+total+"'  name='price[]'  value = '0'></td></tr>";
        newCell.style.width ='80px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px' onclick='deleteRow(this)'></i></td></tr>";
        newCell.style.width ='50px';
        
        disbut();
       
  //onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
       
          //calc('"+idx+"')
}
*/    }
    
    
    /*
function checkactive(id,odate,ed,cr,name,supplier,pack,quant,stock,up1,total1){
	
	document.getElementById("Supplier").setAttribute("disabled","disabled");
	document.getElementById("orderid").value = id;
	document.getElementById("orderDate").value = odate;
	document.getElementById("receiveddate").value = ed;
	
	 
	  $('select[name=supplier]').val(supplier);
	  $('#Supplier').selectpicker('refresh');

	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody1')[0];
    var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	  
    var idx = document.getElementById("myTable1").rows.length-1;
	
    var quantity =  "quantity"+idx;
    
    var unit = "unit"+idx;
    
   var up = "unitprice"+idx;
    
   var discount = "discount"+idx;
    
   var tax = "tax"+idx;
    
   var total = "total" + idx;
	
   var newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input form ='purchasesave' class='form-control input-sm' type='text' id = 'productSale' name= 'pname1'   value = '"+name+"'required> </td></tr>";
   newCell.style.width ='250px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input type ='text' class='form-control input-sm'   name='Batch1'  id='batch'  form ='purchasesave' required></td></tr>";
   newCell.style.width ='50px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input type ='date'  class='form-control input-sm'  name='mDate1'  id='mDate'  form ='purchasesave' required></td></tr>";
   newCell.style.width ='200px';

   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input class='form-control input-sm'  form ='purchasesave'  type='date' id = 'expSale' name= 'expDate1' value = ''></td></tr>";
   newCell.style.width ='200px';
  

   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input form='purchasesave' class='form-control input-sm'   type='number'  id = '"+quantity+"' name='qty[]'  onchange = calc('"+idx+"'),totalIt() value = '"+quant+"' ></td></tr>";
   newCell.style.width ='50px';

   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input form ='purchasesave' class='form-control input-sm'  type='text' id = 'unitp'  name= 'unitp' value = '"+pack+"'></td></tr>";
   newCell.style.width ='50px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input form ='purchasesave' class='form-control input-sm'  type='number' id = '"+up+"'  name= 'up2[]' value = '"+up1+"' onchange = calc('"+idx+"'),totalIt()></td></tr>";
   newCell.style.width ='70px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input class='form-control input-sm'  form ='purchasesave' type='number' id = '"+discount+"' name='discount1[]'  value ='0' onchange = calc('"+idx+"'),totalIt()></td></tr>";
   newCell.style.width ='50px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input class='form-control input-sm'  form ='purchasesave'  type='number' id = '"+tax+"' name='tax1[]'  value = '0' onchange = calc('"+idx+"'),totalIt()></td></tr>";
   newCell.style.width ='50px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><input form ='purchasesave' type='text' class='form-control input-sm'  id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
   newCell.style.width ='50px';
   
  
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><tdclass='count-me'><input  class='form-control input-sm'  form ='purchasesave' readonly = 'readonly' type='text' id = '"+total+"'  name='price[]'  value = '"+total1+"'></td></tr>";
   newCell.style.width ='50px';
   
   newCell = rowsAdd.insertCell();
   newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px'onclick='deleteRow(this)'></i></td></tr>";
   newCell.style.width ='10px';
  
//onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
  
     //calc('"+idx+"')

}


function checkSupply(supply,quant,unit,up){
	
	quanto = quant;
	unito = unit;
	upo = up;
	
	$("#Supplier").append('<option value="'+supply+'"selected="">'+supply+'</option>');
	   $("#Supplier").selectpicker("refresh");
}

function disbut(){
	//alert();
	if(document.getElementById("pname").value == "Select"){
		document.getElementById("addepr").disabled = true;
	}
	else{
		document.getElementById("addepr").disabled = false;	
	}
	
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
	 
	
	if(tableRef.rows.length == "0"){
		document.getElementById("bouton-contact").disabled = true;
	}
	else{
		document.getElementById("bouton-contact").disabled = false;	
	}
	
}
	


function validate()
{    alert("changes saved successfully!");
	
	document.getElementById("purchasesave").submit();
	
	}
	
*/	
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/orderho.html";
	}
}
function disp(){
	if(document.getElementById("sinvoice").value == "Select"){
		alert("Please select Order Id")
		return false;
	}
	$("#col3").css("border-style","none");
	 document.getElementById("myTable").style.width = "890px"; 	
	document.getElementById("re").style.visibility = "hidden";
	$("#myTable th:eq(5), #myTable td:nth-child(6)").hide();
	$("#myTable th:eq(6), #myTable td:nth-child(7)").hide();

	$(".fe").hide();
	document.getElementById("addepr").style.display = "none";
	//document.getElementById("pr").style.display = "block";
	//document.getElementById("gtot").style.visibility = "hidden";
	document.getElementById("bouton-contact").style.visibility = "hidden";
	document.getElementById("close").style.display = "none";
	//document.getElementById("col3").style.width = "1070px";
	//document.getElementById("di").style.display = "none";
	window.print();
	
	document.getElementById("re").style.visibility = "visible";
	document.getElementById("addepr").style.display = "block";
	//document.getElementById("gtot").style.visibility = "visible";
	document.getElementById("bouton-contact").style.visibility = "visible";
	document.getElementById("close").style.display = "block";
	$(".fe").show();
	//document.getElementById("col3").style.width = "1170px";

	//document.getElementById("pr").style.display = "block";
	$("#myTable th:eq(5), #myTable td:nth-child(6)").show();
	$("#myTable th:eq(6), #myTable td:nth-child(7)").show();
	document.getElementById("myTable").style.width = "930px"; 	
	$("#col3").css("border-style","groove");
//	document.getElementById("di").style.display = "block";
}



function verifypro(){
	var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];

	if((tableRef.rows.length) < 1 )
	{
		alert("No products added.")
	   return false;
	}
	
}
</script>
<script>
$(document).ready(function(){
	$('#close').prop("disabled",true);
	
	$("#sinvoice").change(function(){
    	
    	var theValue = $("#sinvoice").val();
        if(theValue!='Select')
            {
        	$('#close').prop("disabled",false);
            }
        });
})

function doAjaxdel(r){

	//var a = document.getElementById(drug).value;
//	var b = document.getElementById(type).value;
	var c = $('#sinvoice').val();

	
	    
	   
	   $.ajax({
      	 
           type: "GET",
   
           url: "/HMS/delor/"+c+"/"+r.id+"",
           async : false,      
           dataType: "JSON",
           contentType: "application/json; charset=UTF-8",
           
         success: function(response){
              	if(response.toString() == "success")   
                 {
             	  alert("Record deleted Successfully")
                 }
             	  unsaved = false;
                 },
                 

            	
              //   error: function(e){
              	  
              	//           alert('Error: ' + e);
              	  
              	 //          }
              	           });
	   deleteRow(r)
}

</script>
<script>

       function doAjaxPost(order) {
    	   // get the form values
    	 
    	   //  var order = $('#sinvoice').val();
        document.getElementById("saveo").reset();
        /*
        $('#ean').find('option').not(':first').remove();
        $('#pname').find('option').not(':first').remove();
		 */  
		 if(order == "Select"){
			 
		     $("#myTable tbody tr").remove(); 
			  $('select[name=ean1]').val('Select');
			   $('#ean1').selectpicker('refresh');
			   
			   $('select[name=pname]').val('Select');
			   $('#pname').selectpicker('refresh');
			   $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
		            
		        	unsaved = false;
		        });
			   window.location.reload();
			   
			  return false;
		 }
        $("#myTable tbody tr").remove();
     
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/getDetailsho.html",
		       data: "orderid=" + order,
	           async : false,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	     	  
	        	   $.each(response, function(index, datec) {
	                   //to print name of employee
	             
	     		   document.getElementById("orderid").value = datec.orderid;
	   	           document.getElementById("author").value = datec.author;
	   	         
        		 
        		   document.getElementById("count").value = datec.count;
        		   document.getElementById("orderDate").value = datec.orderDate;
        		  
        		  
        		   var markup = "<tr><td style='width:100px;' class='pc'><input type='text'  class='form-control input-sm' id = 'ean' name= 'ean' form ='saveo' value = '"+datec.ean+"' required></td><td style='width:400px;' class='pc1'><textarea rows = '1' form ='saveo' class='form-control input-sm' id = 'productName' name= 'productName' oninput='auto_grow(this)' required>"+datec.productName+"</textarea></td><td style='width:160px;' class='pc2'><input id = 'unit' class='form-control input-sm' form ='saveo' type='text' name= 'unit' value='"+decodeURI(datec.unit)+"' required></td><td style='width:100px;' class='pc'><input form ='saveo'  type='number' onkeypress='return onlyNos(event,this);' id = 'quantity' name= 'quantity' min = '1' value = '"+datec.quantity+"' class='form-control input-sm'  required></td><td style='width:100px;'class='pc'><input type = 'text' form ='saveo'   type='text'  id = 'stks' name='stks' value="+Number(datec.stks)+"  readonly='readonly' class='form-control input-sm' required></td><td style='width:70px;'><i class='fa fa-trash-o' id='"+encodeURI(datec.ean)+"' style='font-size:20px' onclick=doAjaxdel(this)></i></td></tr>"

        		   $('#myTable tbody').append(markup);
        		
        		   $('select[name=Supplier]').val(datec.Supplier);
        		   $('#Supplier').selectpicker('refresh');
	                   });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
	        	        	   
    	        	        }


      

       
       
       </script>
       <script>
       $('input').keypress(function(e){ 
    	   if (this.value.length == 0 && e.which == 48 ){
    	      return false;
    	   }
    	});
       
       </script>
       <script type="text/javascript">
   
$(function () {
	
$('#datetimepicker1').datetimepicker({
	 
	format: "dd-mm-yyyy  hh:ii",
    autoclose: true,
    todayBtn: true
   
	
});

});

</script>  

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="disbut(),checkhome2('<c:out value="${username}" />')">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" >Order & Reorder</a>
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
    <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="goBack()"></i>
  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1><button type="submit"  form="saveo" onclick="return verifypro();" id="bouton-contact" class="btn btn-warning button1">Save</button> 
       <font size="5">Order & Reorder</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i> <button type="button" id="close" class="btn btn-warning button2" onclick="return disp()">Print</button> 
       
	 
	
	

	</h1>
	    
	    <div class="container">
</div>
<br>
<form id="ui" action=""></form>
<form id="saveo" action="saveOrderho.html" method="post"></form>
      <div id="col3">
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	      
	      <div class="form-group">
       <p>Order Id <span></span></p>
 <select class="selectpicker form-control"  data-size="6" data-live-search="true" name = "sinvoice" id ="sinvoice"  onchange="return doAjaxPost(this.value);this.selectedindex = -1">
    <option value="Select">New</option>
    <c:forEach var="od"  items="${model.list1}">
      <option value="${od.orderid}">${od.orderid}</option>
    </c:forEach>
</select>
     
     <!--      <select class="selectpicker" data-show-subtext="true" data-live-search="true"  name = "supplier" id ="Supplier"  onchange="doAjaxPost(this.value);this.selectedindex = -1" required>
  <option>--Select--</option>
 <c:forEach var="purchase"  items="${model.list1}">
 <option value = "${purchase.supplier}">${purchase.supplier}</option>
 </c:forEach>
      </select>
      -->
      
      
      </div>
	</div>

	      
	       <div class="col-xs-3">
	      <div class="form-group">
	     
        <p>Order Date<span>*</span></p>
        <div class='input-group date' id='datetimepicker1'>
       <input type="text" class="form-control input-sm" form="saveo" name="orderDate" id ="orderDate" required>
        <span class="input-group-addon" id="re"><span class="glyphicon glyphicon-calendar "></span></span>
   
       </div>
	</div>
	      </div>
	      
	       <div class="col-xs-2"> 
  
  <div class="form-group">
  
  <p>Supplier<span>*</span></p>
     <select class="selectpicker form-control input-sm" data-size="5" data-show-subtext="true" data-live-search="true"  name = "Supplier" id ="Supplier"  form="saveo" required>
  <option value="Select">Select</option>
 <c:forEach var="product"  items="${model.list6}">
  <option value="${product.name}" >${product.name}</option>
 </c:forEach>
      </select>
</div>
  </div>
  
	      <div class="col-xs-2">
	       <div class="form-group">
	       <p>Created By <span></span></p>
	       <input form="saveo" type="text" id = "author" name="author" value="${pageContext.request.userPrincipal.name}" class="form-control input-sm">
     </div>
	      </div>
	  </div>
	  
	  
	  

  <input form="saveo" type="hidden" name="orderid" id="orderid">
 <div class="form-group row" >
  <div class="col-xs-1"></div>
	<!--    
	    
	      
	      <c:forEach var="q"  items="${model.list2}">
   <script>
   checkSupply('<c:out value="${q.supplier}" />','<c:out value="${q.quantity}" />','<c:out value="${q.unit}" />','<c:out value="${q.up}" />');
   </script>
   </c:forEach>
	-->      
	     
	      <div class="col-xs-3">
	       <div class="form-group fe">
	       
	        <p>Product Code<span>*</span></p>
      <select class="selectpicker form-control input-sm" data-size="6" data-show-subtext="true" data-live-search="true" name = "ean1" id ="ean1"  onchange="add1(this.options[this.selectedIndex])" required>
     <option value="Select" data-value="Select">Select</option>
     <c:forEach var="product"  items="${model.list}">
       <option value="${product.prc}" data-value="${product.prc},${product.name},${product.stocks}">${product.prc}</option>
    </c:forEach>
</select> 
   

	       </div>
	       </div>
	       
	       
	      <div class="col-xs-3">
	      <div class="form-group fe">
	       
   <p>Product Name<span>*</span></p>
      <select class="selectpicker form-control input-sm" data-size="6"  data-show-subtext="true" data-live-search="true" name = "pname" id ="pname"  onchange="add2(this.options[this.selectedIndex])" required>
       <option value="Select" data-value="Select">Select</option>
        <c:forEach var="product"  items="${model.list}">
       <option value="${product.name}" data-value="${product.prc},${product.name},${product.stocks}">${product.name}</option>
    </c:forEach>
     </select>
	       </div>
	       </div>
	       
	       
	       
	       <div class="col-xs-1">
	       <div class="form-group">
	      
<br>
<p></p>
	       <button type="button" id="addepr" style="width:80px;" class="button1 btn btn-warning"  onclick="return add()"> ADD</button>
	       </div>
	       </div>
	       </div>
	       
	       
	    <div class="container" id="">
	    
  <table class="table table-striped table-bordered  table-hover table-condensed" id="myTable" style="width:930px;">
    <thead class="thead">
    
      <tr>
 <th width="100px;" class="pc">Product Code</th>
 <th width="400px;" class="pc1">Product Name</th>
 <th width="160px;" class="pc2">Pack Size</th>
 <th width="100px;" class="pc">Quantity</th>
 <th width="100px;"class="pc">Current Stocks</th>
 <th width="40px;">Delete</th>
 <th width="30px;"></th>
 <!-- 
 <th style="width:">Unit Cp</th>
 <th style="width:">Discount</th>
 <th style="width:">Tax</th>
 <th style="width:">Unit Sp</th>
 <th style="width:">Total</th>
 <th style="width:">Delete</th>
 <th style="width:"></th>
  -->
      </tr>
    </thead>
   
   <tbody class="tbody">
     
     
     
     
    </tbody>
 
  </table>
  
   
  
    </div>
  
  <div class="form-group row" >
  <div class="col-xs-9"></div>
    <div class="col-xs-2">
   
    
   Total Items<input  form="saveo"  class="form-control" readonly = "readonly" type= "text" name="count" id="count">
      
 
  </div>
  <!-- 
   <div class="form-group">
    <label class="sr-only" for="show">show</label>
   <div class="input-group">
    <div class="input-group-addon">Grand Total</div>
    <input form ="purchasesave" class="form-control" readonly = "readonly" type= "text" name="grandTotal" id="grandTotal" >
       </div>
   
  </div>
  -->
  
  </div>
  
 	  </div>
	  
	  
	  
	      
 <input type=""  class="bouton-contact"  >
	  </div>
	  </div>
	  <script>
datasuccess('<%=request.getParameter("message")%>')
</script>

 <c:forEach var="od"  items="${model.list4}">
  <script>
  
  check('<c:out value="${od.orderid}" />')
  </script>
  </c:forEach>
	  </body>
	   
	      
</html>  



				