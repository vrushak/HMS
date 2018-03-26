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


<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datetimepicker.min.css" />' >


<script type="text/javascript" src="/HMS/resources/js/jquery-2.1.1.min.js"></script>
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

#scroll{
	overflow:auto;
}
#form1 {
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

#mDate{
width : 130px;
}

#expSale{
width : 130px;
}
#myTable {
    border-collapse: collapse;
    width: 100%;
    }
#myTable th {
    background-color: #009999;
    color: black;
    
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
height : 700px;
}

#span2{
height:300px;!important;
overflow : auto;
}
  
  
</style>


<script type="text/javascript">
function goBack() {
    window.history.back();
}

var cuser;
function checkhome2(user){
	cuser = user;

	$(".expSale").attr("min",new Date())     
	
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
function check(id){
	
	var n = moment().format("DD-MM-YYYY hh:mm");
	document.getElementById("receiveddate").value = n;
	
	if (id == "" || id == null){
		
		id = 1;
		var str1 = "All-";
		
		var m = moment().format("DDMMYYYY-");
		
		var str4 = id;
		var res = str1.concat(m);
		var res1 = res.concat(id);
	
		
		document.getElementById("allocationid").value = res1;
		

			}
	else {
		
		id = Number(id) + 1;
		
        var str1 = "All-";
		
		var m = moment().format("DDMMYYYY-");
		
		var str4 = id;
		var res = str1.concat(m);
		var res1 = res.concat(id);
	
		document.getElementById("allocationid").value = res1;
		
		
	}
}



function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
    var x = document.getElementById("myTable").rows.length-1;
    document.getElementById("totalItems").value=x;
   // document.getElementById("subTotal").value=x;
   disbut();
   if(x<=0){
	   document.getElementById("disc").value=0.00;
	   totalIt();
   }
   else{
	   totalIt();
	   
   }
   
}



function getCount(){

	var x = document.getElementById("myTable").rows.length-1;
	    document.getElementById("totalItems").value=x;
    
    
  //  document.getElementById("invoiceDate").valueAsDate = new Date();
  
}

var quanto;
var unito;
var upo;
var p;

function add1(){
	

	   var str = document.getElementById("ean").value;
	   
	  
	   var strSplit = str.split(',');
	  var p = strSplit[1];
	 
       var res4 = $('select[name=ean]').val();
   	  
	   
   	   $('select[name=pname]').val(str);
	   $('#pname').selectpicker('refresh');

	   
		// document.getElementById("eans").value = strSplit[0];
	       
		   
	    disbut();
	      
		   
	   
	   
}


function add2(){
	
	   var str = document.getElementById("pname").value;
	 
	       var strSplit = str.split(',');
	       var p = strSplit[1];
	       var res5 = $('select[name=pname]').val();
	   	   
		   
	   	   $('select[name=ean]').val(res5);
		   $('#ean').selectpicker('refresh');
		//   document.getElementById("eans").value = strSplit[0];
		   
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
	
		 var qtys = document.getElementsByName("discount1[]");
		
		  var total=0;
		  for (var i=0;i<qtys.length;i++) {
		    //calc(i);  
		    
		    total += Number(qtys[i].value)//isNaN(price)?0:price;
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
	
    var row = 1;
  
 
    var text = document.getElementById("pname").value;
   // var ean = document.getElemntById("ean").value
      
    $('select[name=ean]').val("Select");
    $('#ean').selectpicker('refresh');	
	 		   
	$('select[name=pname]').val("Select");
    $('#pname').selectpicker('refresh');	
var str = text.split(',');
    

  

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
         var batch = "batch" + idx;
         var mdesc  = "mdesc" + idx;
         var exp = "expdate"+idx; 
          var newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input class='form-control input-sm' type = 'text' form ='purchasesave' name = 'ean1' id='eans' value='"+str[0]+"'></td></tr>";
         
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input class='form-control input-sm' form ='purchasesave'  type='text' id = 'productSale' name= 'pname1' value = '"+str[1]+"'required> </td></tr>";
          
          
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input class='form-control input-sm' type ='text'  name='Batch1' value ='NA' id='"+batch+"' onfocusout = 'doAjaxPost2(this.value)' form ='purchasesave' required></td></tr>";
         
          
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<input class='form-control input-sm expSale' style='width:135px;' max='2999-12-31' form ='purchasesave'  type='date' id = '"+exp+"' name= 'expDate1' required>";
         
   // manufacture pack desc
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input class='form-control input-sm' form='purchasesave'   type='text'  id = 'mpack' name='mpack' required value ='NA' required></td></tr>";
          
     // maniufacture pack size
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input class='form-control input-sm' form='purchasesave'  onkeypress='return onlyNos(event,this);'  type='number' min='1' id = '"+mdesc+"' name='mdesc' required  value = '1' required></td></tr>";
          
   
          //single unit pack size
          
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input class='form-control input-sm unitp' form ='purchasesave'  type='text' id = 'sudesc'   name= 'sudesc' required value = 'NA' ></td></tr>";
    //quantity
          
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input onkeypress='return onlyNos(event,this);' class='form-control input-sm' form ='purchasesave'  type='number' min='1' id = '"+quantity+"' name='qty[]'  required value ='0'></td></tr>";
         
          //total purchase price
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input  class='form-control input-sm caluclate' form ='purchasesave' type='text' id = '"+discount+"' name='discount1[]' required  value ='0.00'></td></tr>";
        
        //unit price  
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input  class='form-control input-sm' form ='purchasesave' onfocusout=checkbatch($('#"+batch+"').val(),$('#"+exp+"').val(),$('#"+mdesc+"').val(),$('#"+up+"').val()) type='text' id = '"+up+"'  name= 'up2[]'  value = '0.00' required ></td></tr>";
        
          //stockno
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input onkeypress='return onlyNos(event,this);' class='form-control input-sm' form ='purchasesave' type='text'  id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
         
         //stock value at purchase
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><input class='form-control input-sm'  form ='purchasesave' readonly = 'readonly' type='text' id = '"+total+"'  name='price[]'  value = '0.00'></td></tr>";
         
          
          
         
          
          
          newCell = rowsAdd.insertCell();
          newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px' onclick='deleteRow(this)'></i></td></tr>";
       




        disbut();
       
  //onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
       
          //calc('"+idx+"')
}
    validDate()
    }
    
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

*/
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
	 
	
	if(tableRef.rows.length == 0){
		document.getElementById("bouton-contact").disabled = true;
	}
	else{
		document.getElementById("bouton-contact").disabled = false;	
	}
	
}
	


function verifyproAdd(){
	
	//var x = ;
	//var x1 =document.getElementById("saleCustId").value;
	//var x2 = document.getElementById("saleCustName").value;
	//var x3 = document.getElementById("saleCustPhone").value;
	//var x4 = document.getElementByName("quantity").value;
	
	var x5 =document.getElementsByName("qty[]");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Purchase Qty cannot be 0")
			return false;
		}
	}

	var x5 =document.getElementsByName("discount1[]");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Please enter 'Total Purchase Price' or 'Unit CP' value based on option selected in 'Price Entry'")
			return false;
		}
	}
	
	var x5 =document.getElementsByName("up2[]");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Please enter 'Total Purchase Price' or 'Unit CP' value based on option selected in 'Price Entry'")
			return false;
		}
	}

	var x5 =document.getElementsByName("expDate1");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value < moment().format("YYYY-MM-DD")){
			alert("Expiry date should be greater than Current date")
			return false;
		}
	}

	if((document.getElementById("myTable").rows.length-1) == 0 )
	{
		alert("please add the products")
	   return false;
	}
	
    else if((document.getElementById("grandTotal").value) == 0)  {
		alert("Please click on Generate total")
	return false;
	  }
	
	else{
		
		return true;
	}
	
}


function validate()
{    alert("changes saved successfully!");
	
	document.getElementById("purchasesave").submit();
	
	}
	
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/purchaseho.html";
	}
}

function getInputDateFormat(date) {
	 return date.toISOString().split('T')[0];
	}
	
function validDate() {
	 var today = new Date();
	 var maxDate = new Date();
	 maxDate.setDate(maxDate.getDate() + 7);
var s = document.getElementsByName("expDate1");
for(var i =0;i<s.length;i++){
	s[i].setAttribute('min', getInputDateFormat(today));
//s[i].setAttribute('max', getInputDateFormat(maxDate));	
}
	 
	}

function setUrl(myurl){
	var url = myurl.getAttribute('value');
	$('#vp').attr("href","/HMS/prpur?allo="+url+"");
}

function chdate(id){
	var datea = $(id).val().split(' ');

	var from = datea[0].split("-");
	var f = new Date(from[2], from[1] - 1, from[0]);
	

var date1 = new Date()
var longformat = f*1;

var longformat1 = date1*1; 	
if(longformat > longformat1){
	alert("Cannot create purchase entry for future dates")
	$('#bouton-contact').prop("disabled",true)
	return false;
}
else{
	$('#bouton-contact').prop("disabled",false)
	return true
}
}

function checkUrl(valie){
	if($("#allocationid1").val() == "select"){
		alert("Please select Allocation Id")
		$(valie).attr("href","javascript:;")
	}
}
</script>
<script>

       function doAjaxPost(user2) {
    	   // get the form values
    	   $("#supplier").val(user2)
    	      //  var name = $('#pname').val();
      //  document.getElementById("purchasesave").reset();
        $('#ean').find('option').not(':first').remove();
        $('#pname').find('option').not(':first').remove();
		
        document.getElementById("Supplier").disabled = true;
        
        $("#myTable tbody tr").remove();
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/getsupplyorder.html",
	          data: "supplier=" + user2,
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	    
	        	   $.each(response.list2, function(index, datec) {
	                   //to print name of employee
	             
	                //   if ($("#ean option[value="+datec.ean+"]").length == 0){
	               e = datec.ean;
	               p = datec.pname;
	                	   $("#ean").append('<option class="'+datec.ean+'" value="'+datec.ean+','+datec.productName+'">'+datec.ean+'</option>');
	                   
	                   $("#ean").selectpicker("refresh");
	                  // }
	          //  alert(datec.productName)
	                 // if ($("#pname option[value="+datec.productName+"]").length == 0 ){
	    	             
	                	   $("#pname").append('<option value="'+datec.ean+','+datec.productName+'">'+datec.productName+'</option>');
	                   
	                   $("#pname").selectpicker("refresh");
	                  // }

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
var ba;
var ex;
var mps;
var cps;
       function doAjaxPost2(batch) {
    	   // get the form values
    	   
       
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/getBatdet?location="+encodeURIComponent(batch)+"",
	          data: "0",
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	   
	        	   $.each(response, function(index, datec) {
	               
	        		 ba = datec.batch;
	                 ex = datec.expDate;
	                 mps = datec.mpsize;
	                 cps = datec.cps;
	        	   });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
	        	        	   
    	        	        }


      function checkbatch(batch,exp,mpsize,cp){
    	  
    	  if(batch == ba){
    		 
    		  if(exp == ex || mpsize == mps || cp == cps){
    			  alert("Same batch exists")
    		  }
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
   
   $(function () {
	    $('#myTable').on('focusout','.tbody tr', function () {
	   // 	$('.success').removeClass('success');
	   //     $(this).addClass('success');
	        
	        var x=this.cells;
	        var a = x[8].getElementsByTagName('input')[0].value;
	        var b = x[9].getElementsByTagName('input')[0].value;
	        
	       
	       if(document.getElementById("cash").checked == true){
	        	
	        	b =0;
	        	x[9].getElementsByTagName('input')[0].value = 0;
	        	b= Number(x[8].getElementsByTagName('input')[0].value)/(Number(x[7].getElementsByTagName('input')[0].value)*Number(x[5].getElementsByTagName('input')[0].value)); 
	        	x[9].getElementsByTagName('input')[0].value = Number(b);
	        	console.log(b)
	        
	        	
	        }
	        
	        else if(document.getElementById("ins").checked == true){
	        	a = 0;
	        	x[8].getElementsByTagName('input')[0].value = 0;
	        		a = Number(b) * Number(x[7].getElementsByTagName('input')[0].value)*Number(x[5].getElementsByTagName('input')[0].value); 
	        	x[8].getElementsByTagName('input')[0].value = Number(a);
	        	console.log(x[8].getElementsByTagName('input')[0].value)
	        }
	        else{
	        	 
	        }
	        x[10].getElementsByTagName('input')[0].value = Math.round(Number(x[5].getElementsByTagName('input')[0].value) * Number(x[7].getElementsByTagName('input')[0].value));
	        x[11].getElementsByTagName('input')[0].value = Math.round(Number(x[9].getElementsByTagName('input')[0].value) * Number(x[10].getElementsByTagName('input')[0].value));
	       price = 0;
	      
	    });
	   
   });
   
   </script> 
   <script type="text/javascript">
   
$(function () {
	
$('#datetimepicker1').datetimepicker({
	 

	useCurrent: false,
	format: "dd-mm-yyyy  hh:ii",
    autoclose: true,
    todayBtn: true,
 
    
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
    <a class="navbar-brand" >Purchase Entry </a>
    </div>
     <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
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
  <!--  <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="goBack()"></i>-->
    
  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1>
      <button type="reset" id="refresh" class="btn btn-warning button1" onclick="location.href='/HMS/purchaseho.html';" >
	  <span class="fa fa-refresh"></span> Refresh</button> <a href="#" target="_blank" id="vp" class="btn btn-warning button2 rmt" onclick="return checkUrl(this)">Print</a>
	
       <font size="5">Purchase Entry </font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
	 
	
    
	

	</h1>
	    
	    <div class="container">
</div>
<br>
<form id="ui" action=""></form>
<form id="purchasesave" action="purchaseSaveho.html" method="post"></form>
      <div id="col3">
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
	      
	      <div class="form-group">
            <p>Supplier<span>*</span></p>
     <select class="selectpicker" data-show-subtext="true" data-live-search="true"  name = "supplier" id ="Supplier"  onchange="doAjaxPost(this.value);this.selectedindex = -1" required>
  <option>--Select--</option>
 <c:forEach var="purchase"  items="${model.list1}">
 <option value = "${purchase.supplier}">${purchase.supplier}</option>
 </c:forEach>
      </select>
      </div>
	</div>

	      
	       <div class="col-xs-2">
	      <div class="form-group">
	     
        <p>Supplier Invoice<span>*</span></p>
       <input  form="purchasesave"  type="text" name="orderDate" id = "orderDate" class="form-control" required>
       
       </div>
	
	      </div>
	      
	<div class="col-xs-2"> 
  
  <div class="form-group">
  
   <p>Received Date<span>*</span></p>
 <div class='input-group date' id='datetimepicker1'>
    <input form="purchasesave"  type="text" data-date-end-date="0d" class="form-control" name="receiveddate" id = "receiveddate" onchange ="return chdate(this)" required>
       <span class="input-group-addon"><span  class="glyphicon glyphicon-calendar"></span></span>
    </div>
</div>


	      
	  </div>
	  
	  <div class="col-xs-3">
	      
	      <div class="form-group">
            <p>Allocation Id<span>*</span></p>
     <select class="selectpicker" data-show-subtext="true" data-live-search="true"  name = "allocationid1" id ="allocationid1" onchange="setUrl(this.options[this.selectedIndex])"  required>
  <option value="select">--Select--</option>
 <c:forEach var="purchase"  items="${model.list2a}">
 <option value = "${purchase.allocationid}">${purchase.allocationid}</option>
 </c:forEach>
      </select>
      </div>

  </div>  
  <div class="col-xs-1">
 <!--   <a href="#" target="_blank" id="vp" onclick="return checkUrl(this)">View Purchase Entry</a>-->
  
  </div>
</div>
    
	  <input form="purchasesave" type="hidden" name="allocationid" id="allocationid">
  <input form="purchasesave" type="hidden" name="supplier" id="supplier">
<!--  <input form="purchasesave" type="hidden" name="ean1" id="eans">-->  
	   
	     <div class="form-group row" >
  <div class="col-xs-1"></div>
	      
	     	     
	      <div class="col-xs-3">
	       <div class="form-group">
	       
	        <p>Code<span></span></p>
      <select class="selectpicker" form="ui" data-show-subtext="true" data-live-search="true" name = "ean" id ="ean"  onchange="add1()" required>
     <option value="Select">New</option>
   
 </select>
	       </div>
	       </div>
	       
	       
	      <div class="col-xs-3">
	      <div class="form-group">
	       
   <p>Product<span></span></p>
      <select class="selectpicker" form="ui"  data-show-subtext="true" data-live-search="true" name = "pname" id ="pname"  onchange="add2()" required>
       <option value="Select">New</option>
     </select>
	       </div>
	       </div>
	       
	       
	       
	       <div class="col-xs-1">
	       <div class="form-group">
	      
<br>
<p></p>
	       <button type="button" id="addepr" style="width:80px;" class="button1 btn btn-warning"  onclick="add()"> ADD</button>
	       </div>
	       </div>
	       
	       <div class="col-xs-4">
	       <div class="form-group">
	       <br>
	       <b>Price Entry: </b><input type="radio" name="type" id="cash" value="cash" checked>Total Purchase Price
	        <input type="radio" name="type"  id="ins" value="ins" >Unit CP
	
	       </div>
	       </div>
	       
	       </div>
	        
	       <div class="container" id="scroll" style="height:300px; border:1px groove;" >
	   <div class="table-responsive">    
	  
  <table class="table table-striped table-bordered table-fixed table-hover table-condensed " style="" id="myTable">
    <thead class="thead">
    
    <tr>
    <th>Product Code</th>
    <th>Product Name</th>
    <th>Batch</th>
    <th>Exp Date</th>
    <th>Manufacture Pack Desc</th>
    <th>Manufacturing Pack Size</th>
    <th>Single Unit Desc</th>
    <th>Purchase Qty</th>
    <th>Total Purchase Price</th>
    <th>Unit CP</th>
    <th>Stock Number</th>
    <th>Stock Value at Purchase</th>
    <th></th>
</tr>
    <!-- 
 <th style="width:140px">Product Name</th>
 <th style="width:70px">Batch</th>
 <th style="width:150px">M Date</th>
 <th style="width:150px">Exp Date</th>
 <th style="width:70px">Quantity</th>
 <th style="width:80px">Unit</th>
 <th style="width:90px">Unit CP</th>
 <th style="width:60px">Discount</th>
 <th style="width:60px">Tax</th>
 <th style="width:90px">Unit SP</th>
 <th style="width:70px">Total</th>
 <th style="width:10px">Delete</th>
 <th style="width:20px"></th> -->
    </thead>
   
   <tbody class="tbody">
     
     
     
     
    </tbody>
 
  </table>
  
   
  </div>
    </div>
<br>
<div class="col-xs-1"></div>
	
	 <div class="col-xs-2">
	      
	      <div class="form-group"> 
	      
	      
    <button type="submit" class="btn btn-warning button1" id='gtot' onclick='totalIt()'>
	  <span class="fa fa-refresh fa-spin"></span> Generate Total</button>
	  </div>
	  </div>
  
	
	      <div class="col-xs-2">
	      
	      <div class="form-group"> 
    <input type="submit"  form="purchasesave" class="btn btn-warning button1" id='bouton-contact' onclick = "return verifyproAdd()"value="Save" >
	  </div>
	  </div>
  
    <div class="div6">
 
 <form  class="form-inline">
  <div class="col-xs-4"></div>
	  
	   <div class="col-xs-5">
	      
	      <div class="form-group">
	      <label class="sr-only" for="show">Total</label>
  <table id="meta2" class="buuton2">
  
   <tr>
                    
                    <td colspan="" class="total-line meta-head">Total Items</td>
		      <td style="width:10px" class="total-value"><div id="subtotal">&emsp;<input  form="pentry" style="border:thin solid;" value="0" class="form-control" readonly = "readonly" type= "text" name="totalItems" id="totalItems"> 
      </div>
      </td>
       </tr>
                
                    <br>          
                
             
                <tr>
                
                    <td  colspan="" class="total-line meta-head">Grand Total</td>

		      <td class="total-value balance">&emsp;<input form ="purchasesave" class="form-control" style="border:thin solid;" value="0.00" readonly = "readonly" type= "text" name="grandTotal" id="grandTotal" >
       </tr>
                
                  </table>
   </div>
   </div>  
   </form>
    </div>
 
  </div>
   
  <div class="col-xs-7">
 <div class="form-group">
	  <h7> Note: Click on "Generate Total" button each time any changes are done </h7>        
 </div>
 </div>  	      
 <input type=""  class="bouton-contact"   form="purchasesave" id="bouton-contact" class="btn btn-warning button1" ></input>
	  </div>
	  </div>
<c:forEach var="od"  items="${model.list2}">
  <script>
  check('<c:out value="${od.allocationid}" />')
  </script>
  </c:forEach>
	  
	  <script>
datasuccess('<%=request.getParameter("message")%>')
</script>



	  </body>
	   
	      
</html>  
