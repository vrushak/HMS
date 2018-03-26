<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">

<link rel='stylesheet' href='<c:url value="/resources/css/printsales.css" />' type='text/css' media='print' />
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>

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
  max-width:1300px;
  width:100%;
  margin: 5% auto;
  margin-top :  1cm;
  background-color: #FFFFFF;

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
  margin-top: 20px;
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



.button1{
	float : left;
}
.button2{
	float : right;
}



#col3{
margin-left: 25px; 
border-style : groove;
border-radius : 10px;
width : 1250px;
height : auto;
}

#span2{

}

#meta2 { border : 0.1pt solid; width: 300px; float: right; margin-right: 10px; }
#meta2 td .total-value { text-align: right;}
#meta2 td.meta-head { text-align: left; background: #eee;width: 70px; }
#meta2 td textarea { width: 100%; height: 20px; text-align: right; }

tr.duplicate td{
	   background-color: red;
 }
  
</style>


<script type="text/javascript">
/*
 *tr.duplicate td{
	   background-color: red;
 }
 */
  
 
 
 

var cuser;
function checkhome2(user){
	cuser = user;

	     
	
	 if(user.includes("[ROLE_SALESMANAGER]")){
	
		var url = "/HMS/hmspharma1" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
		
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
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginRight = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginRight= "0";
    document.body.style.backgroundColor = "white";
}
function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
var x = document.getElementById('myTable').getElementsByTagName('tbody')[0];

   document.getElementById("totalItems").value=x.rows.length;
   // document.getElementById("subTotal").value=x;
//   highlightDuplicates() 
   }
   
function disp(){
	
	if(document.getElementById("sinvoice").value == "Select" ){
		alert("Please select the Invoice")
		return false;
	}
	$(".ft").hide();
	$("#ch").text("Sales Invoice");
	$("#chbox").next("span").andSelf().hide(); 
	$('.table-responsive').removeClass('table-responsive');
	$("#myTable th:eq(13), #myTable td:last-child").hide();
	$("#myTable th:eq(0), #myTable td:nth-child(1)").show();
	$("#myTable th:eq(1), #myTable td:nth-child(2)").hide();
	$("#myTable th:eq(4), #myTable td:nth-child(5)").hide();
	$("#myTable th:eq(6), #myTable td:nth-child(7)").hide();
	$("#myTable th:eq(7), #myTable td:nth-child(8)").hide();
	$("#myTable th:eq(8), #myTable td:nth-child(9)").hide();
	$("#myTable th:eq(10), #myTable td:nth-child(11)").hide();

	document.getElementById("addbt").style.display = "none";
	//document.getElementById("pr").style.display = "block";
	document.getElementById("gtot").style.visibility = "hidden";
	document.getElementById("bouton-contact").style.visibility = "hidden";
	document.getElementById("close").style.display = "none";
	document.getElementById("hiden").style.display = "none";
	//document.getElementById("di").style.display = "none";
	window.print();
	
	$(".ft").show();
	$("#ch").text("Sales");	
	$("#chbox").next("span").andSelf().show(); 
	$('.table-responsive').addClass('table-responsive');
	document.getElementById("addbt").style.display = "block";
	document.getElementById("gtot").style.visibility = "visible";
	document.getElementById("bouton-contact").style.visibility = "visible";
	document.getElementById("close").style.display = "block";
	document.getElementById("hiden").style.display = "block";
	//document.getElementById("pr").style.display = "block";
	 $("#myTable th:eq(0), #myTable td:nth-child(1)").hide();
	 $("#myTable th:eq(1), #myTable td:nth-child(2)").show();
	 $("#myTable th:eq(4), #myTable td:nth-child(5)").show();
	 $("#myTable th:eq(6), #myTable td:nth-child(7)").show();
	 $("#myTable th:eq(7), #myTable td:nth-child(8)").show();
	 $("#myTable th:eq(8), #myTable td:nth-child(9)").show();
	 $("#myTable th:eq(10), #myTable td:nth-child(11)").show();
	$("#myTable th:eq(13), #myTable td:last-child").show();
//	document.getElementById("di").style.display = "block";
}

function check(id){
	
	if (id == "" || id == null){
   //	alert(id);
		id = 1;
		var str1 = "PHIN-";
	    var m = moment().format("DDMMYYYY-");
		var str3 = id;
		var res = str1.concat(m);
		var res1 = res.concat(str3);

	//	alert(res1);
		document.getElementById("invoice").value = res1;

	
      
		//alert(res1);
	}
	else {
	//	alert("now"+id);
		id = Number(id) + 1;
	//	alert(id);
		var str1 = "PHIN-";
		var m = moment().format("DDMMYYYY-");
		var str3 = id;
		var res = str1.concat(m);
		var res1 = res.concat(str3);
		
	//	alert(res1);
		document.getElementById("invoice").value = res1;
		
    	
	//	alert(res1);
	}
}

function getSum(result){
	document.getElementById("subTotal").value = result;
	document.getElementById("sub").value = result;
}
function getSum1(result,x){
	var y = document.getElementById("sub").value;
	//alert(result);
	//alert(y);
	
	document.getElementById("subTotal").value = Number(y) + Number(result);
}

function caluclate(qty,stks,total){
    var arr = [];
	//alert(qty);
	//alert(stks);
	//alert(total);
    var cnt = document.getElementById(qty).value;
    //alert(cnt);
	var gtStock = document.getElementById("stkHd").value;
	//alert(gtStock);
	var res = gtStock - cnt;
	//alert(res);
	document.getElementById(stks).value = res;
	var x = document.getElementById("upSale").value;
	//alert(x);
    var result = cnt * x;
   
	document.getElementById(total).value = result;
	
	var x = document.getElementById("myTable").rows.length-1;
	//alert(x);
	if(x == 1){
		
	getSum(result);
	}
	else{
		getSum1(result,cnt);
	} 
}


function verifyproAdd(){
	if(document.getElementById("customer").value == "new"){
		   alert("Please select customer")
		   return false;
	}
	//var x = ;
	//var x1 =document.getElementById("saleCustId").value;
	//var x2 = document.getElementById("saleCustName").value;
	//var x3 = document.getElementById("saleCustPhone").value;
	//var x4 = document.getElementByName("quantity").value;
	
	var x5 =document.getElementsByName("unit");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Quantity sold cannot be equal to 0")
			return false;
		}
	}
	
	var x5 =document.getElementsByName("qty[]");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Selling Pack Size cannot be zero")
			return false;
		}
	}

	
	
	var x5 =document.getElementsByName("spsize");
	for(var i = 0;i<x5.length;i++){
		if(x5[i].value == 0){
			alert("Selling Pack Size cannot be 0")
			return false;
		}
	}


	if((document.getElementById("myTable").rows.length-1) == 0 )
	{
		alert("No products added.")
	   return false;
	}
	
   
    
	else{
  totalIt()
		return true;
	}
	
}

function verifyproAdd1(){
	 if((document.getElementById("gTotal").value) == 0)  {
			alert("Please click on Generate Total button to calculate total"); 
		return false;
		  }
	 else{return true;}
}
function getCount(){
	var x = document.getElementById("myTable").rows.length-1;
    document.getElementById("totalItems").value=x;
    
  //  document.getElementById("invoiceDate").valueAsDate = new Date();
  
}
/*
function copyCustId(id,name,phone,sex,age,dId,dname,dphone){
	
	alert(dId);
	
	document.getElementById("customer").value=id;
	alert(id);
	document.getElementById("phone").value = phone;
	document.getElementById("name").value = name;
	document.getElementById("sex").value = sex;
	document.getElementById("age").value = age;
	
	document.getElementById("saleCustId").value=dId;
	alert(dId);
	
	document.getElementById("saleCustName").value = dname;
    alert(dname);
	document.getElementById("saleCustPhone").value =dphone;
    alert(dphone);

}

function copyCustName(id,name,phone,sex,age){
	document.getElementById("customer").value=id;
	document.getElementById("phone").value = phone;
	document.getElementById("name").value = name;
	document.getElementById("sex").value = sex;
	document.getElementById("age").value = age;
}

function copyCustPhone(id,name,phone,sex,age){
	document.getElementById("customer").value=id;
	document.getElementById("phone").value = phone;
	document.getElementById("name").value = name;
	document.getElementById("sex").value = sex;
	document.getElementById("age").value = age;
}
*/
function addcid(){
	

	   var str = document.getElementById("customer").value;
	   var strSplit = str.split(',');
	  
		document.getElementById("phone").value = str;
		document.getElementById("name").value = str;
		document.getElementById("sex").value = strSplit[3];
		document.getElementById("age").value = strSplit[4];
		
		document.getElementById("saleCustId").value=strSplit[0];
		
		document.getElementById("saleCustName").value = strSplit[1];
	   
		document.getElementById("saleCustPhone").value =strSplit[2];
	 
		
		  
		   
	   	   $('select[name=name]').val(str);
		   $('#name').selectpicker('refresh');
		   
		   
     //   var res4 = $('select[name=ean]').val();
	  
		   
	   	   $('select[name=phone]').val(str);
		   $('#phone').selectpicker('refresh');
		   if(strSplit[5].includes("Fileno")){
			   $("#fileno").val(strSplit[5])
		   }
		   else{
			   
		 
		 var custDisc = strSplit[5].toLowerCase();
		 
		// alert(custDisc);
		
		 for(var i = 0; i<cust.length; i++){
			 
			 if(custDisc == cust[i].ctype){
				// alert("cust" +custDisc);
				 document.getElementById("med").value = custDisc;
				// alert("in" +document.getElementById("med").value );
				 document.getElementById("cdiscount").value = cust[i].value;
		 }
		  }		
	 
		 }
	
}

function addcname(){
	

	   var str = document.getElementById("name").value;
	   var strSplit = str.split(',');
	   
		document.getElementById("phone").value = str;
		document.getElementById("customer").value = str;
		document.getElementById("sex").value = strSplit[3];
		document.getElementById("age").value = strSplit[4];
	 
		document.getElementById("saleCustId").value=strSplit[0];
		
		document.getElementById("saleCustName").value = strSplit[1];
	   
		document.getElementById("saleCustPhone").value =strSplit[2];
		
		 $('select[name=phone]').val(str);
		   $('#phone').selectpicker('refresh');
		   
		   $('select[name=customer]').val(str);
		   $('#customer').selectpicker('refresh');
		
		   if(strSplit[5].includes("Fileno")){
			   $("#fileno").val(strSplit[5])
		   }
		   else{
		var custDisc = strSplit[5].toLowerCase();
		 
	
		
		// alert(custDisc);
		

		 for(var i = 0; i<cust.length; i++){
			 
			 if(custDisc == cust[i].ctype){
			//	 alert("cust" +custDisc);
				 document.getElementById("med").value = custDisc;
			//	 alert("in" +document.getElementById("med").value );
				 document.getElementById("cdiscount").value = cust[i].value;
		 }
		 }
	 
		 }
	
}

function addcphone(){
//	alert("code reaching here");

	   var str = document.getElementById("phone").value;
	   var strSplit = str.split(',');
	   
		document.getElementById("name").value = str;
		document.getElementById("customer").value = str;
		document.getElementById("sex").value = strSplit[3];
		document.getElementById("age").value = strSplit[4];
		
		document.getElementById("saleCustId").value=strSplit[0];
		
		document.getElementById("saleCustName").value = strSplit[1];
	    
		document.getElementById("saleCustPhone").value =strSplit[2];
	
		 $('select[name=name]').val(str);
		   $('#name').selectpicker('refresh');
		   
		   $('select[name=customer]').val(str);
		   $('#customer').selectpicker('refresh');
		   
		   if(strSplit[5].includes("Fileno")){
			   $("#fileno").val(strSplit[5])
		   }
		   else{ 
		var custDisc = strSplit[5].toLowerCase();
		 
		// alert(custDisc);
		
		 for(var i = 0; i<cust.length; i++){
			 
			 if(custDisc == cust[i].ctype){
				
				 document.getElementById("med").value = custDisc;
				
				 document.getElementById("cdiscount").value = cust[i].value;
		 }
		 }
	 
		 }
	
	
	
}

function add1(){
	

	   var str = document.getElementById("ean").value;
	  
	   var strSplit = str.split(',');
	  
	// alert(str);
	
		 
	       document.getElementById("pname").value = str;  
	       document.getElementById("eanHd").value = strSplit[0];
	       document.getElementById("pnameHd").value = strSplit[1];
		  
		   
		   document.getElementById("batchHd").value  = strSplit[2] ;
		   
		   document.getElementById("expHd").value  = strSplit[3];
		  
		   document.getElementById("uHd").value = strSplit[4];
		   
		   document.getElementById("upHd").value = strSplit[5];

      //     document.getElementById("freeHd").value =strSplit[5];
		   
		   document.getElementById("stkHd").value=strSplit[6];
		 
		   var res4 = $('select[name=ean]').val();
	  
		   
	   	   $('select[name=pname]').val(str);
		   $('#pname').selectpicker('refresh');
	   
	   
}


function add2(){
	
	   var str = document.getElementById("pname").value;
	  
	       var strSplit = str.split(',');
	  
	       document.getElementById("ean").value = str;
	       document.getElementById("eanHd").value = strSplit[0];
		   document.getElementById("pnameHd").value = strSplit[1];
		   
		   document.getElementById("batchHd").value  = strSplit[2] ;
		   
		   document.getElementById("expHd").value  = strSplit[3];
		   
		   document.getElementById("uHd").value = strSplit[4];
		   
		   document.getElementById("upHd").value = strSplit[5];
		   
		 //  document.getElementById("freeHd").value =strSplit[5];
		   
		   document.getElementById("stkHd").value=strSplit[6];
		 
		   var res4 = $('select[name=pname]').val();
	   	  // alert(res4)
		   
	   	   $('select[name=ean]').val(str);
		   $('#ean').selectpicker('refresh');
	
}

function calc(idx) {
	


/*
else if(document.getElementById("sk"+idx).value < document.getElementById("quantity"+idx).value ){
	alert("Sales quantity cannot exceed product stock")
	return false;
}
*/

	
	  var price = parseFloat(document.getElementById("up"+idx).value) *  parseFloat(document.getElementById("quantity"+idx).value);
	// alert(document.getElementById("stkHd").value)
	  var res =  document.getElementById("sk"+idx).value - document.getElementById("quantity"+idx).value;
	   //  alert(idx+":"+price);  
	   document.getElementById("stock"+idx).value = res;
	   
	  document.getElementById("total"+idx).value= price.toFixed(2);//isNaN(price)?"0.00":price.toFixed(2);
	  
	}
	function setdefault(){
	//  document.getElementById("medicine").value = "new";
	    //alert(document.getElementById("medicine").value);
	}

var cust = [];

function checkCust(ctype,dtype,value){
	cust.push({ctype : ctype, dtype : dtype, value : value });
}

var sp =[];

function checkSp(type,value){
  
	sp.push({type : type,value : value});
	

}



	function totalIt() {
		
		$("#myTable .tbody tr").each(function(){
			
			var x=this.cells;
	      
			var qty = document.getElementById("unitSale").value;
			var spsize = document.getElementsByName("spsize").value;
			var up1 = document.getElementsByName("up1").value;
			
			if(spsize<1){
	   			alert("Selling Pack Size cannot be equal to 0")
	   			return false;
	   		}
			
	   		if(qty<1){
	   			alert("Quantity sold cannot be equal to 0")
	   			return false;
	   		}	
	   		
	   		if(up1<1){
	   			alert("Unit SP cannot be equal to 0")
	   			return false;
	   		}
			
	      if(Number(x[7].getElementsByTagName('input')[0].value) < Number(x[9].getElementsByTagName('input')[0].value))
		    {
	    	  
		       //$(this).find("td:eq(2) span").text("matched");
		      alert("Sales quantity cannot exceed product stocks for Product Name "+x[1].getElementsByTagName('input')[0].value+" and Batch no "+x[2].getElementsByTagName('input')[0].value)
		      document.getElementById("bouton-contact").disabled = true;

		      return false;
		    		    }   
		    else{
		    	  document.getElementById("bouton-contact").disabled = false;
		    return true;	  
		    }
		});
		
	var no = highlightDuplicates();
	
	if(no == 1){
		return false;
	}  
	
		
	var qtys = document.getElementsByName("price[]");
	 
	  var total=0;
	  for (var i=0;i<qtys.length;i++) {
	   // calc(i);  
	   total += Number(qtys[i].value)//isNaN(price)?0:price;
	  }
	  document.getElementById("subTotal").value= total.toFixed(2);  //isNaN(total)?"0.00":total.toFixed(2);    
	  
	  var tax = document.getElementById("tax").value;
	  var taxab = Number(tax/100) * Number(total.toFixed(2));
	  
	  
	  var discount = document.getElementById("cdiscount").value;
      var discountab = Number(discount/100) * Number(total.toFixed(2));
	 
	  
	  var gtotal = Number(total.toFixed(2)) + Number(taxab.toFixed(2)) - Number(discountab.toFixed(2));
	  document.getElementById("gTotal").value = gtotal.toFixed(2);
	  //product discount caluclation
	/* var sum =0;
	  var pdiscount = 0;
	  for(var i=0; i<sp.length;i++){
		  
		  if(sp[i].type= "amount"){
			  
			 pdiscount =  Number(sp[i].value);
	//		  document.getElementById("disc").value = pdiscount;
		  
			//  ptax = Number(document.getElementById("subTotal").value) - Number(sp[i].value);
		  
			  
		  }
		  else{
			  var ptotal = Number(document.getElementById("subTotal").value) * (Number(sp[i].value)/100);
				pdiscount = Number(ptotal);
		//		 document.getElementById("disc").value = pdiscount; 
				//	ptax = document.getElementById("subTotal").value - Number(ptotal);	
				
		  }
		      sum = Number(sum) + Number(pdiscount);  
		    //  alert("sum" + sum);
	  }
	  
	  //cust Disc ccaluclation
      var subTax = 0;
	  var cdiscount =0;
	  for(var i=0;i<cust.length;i++){
	
		if(document.getElementById("med").value == cust[i].ctype){
		//	 alert(cust[i].dtype);
			if(cust[i].dtype == "Amount"){
				
				cdiscount= Number(cust[i].value);
			//	document.getElementById("disc").value = cdiscount;
				//	subTax =	parseFloat(ptax) - (parseFloat(cust[i].value));
			}
			else{
			
				var subtotal = Number(document.getElementById("subTotal").value) * (Number(cust[i].value)/100);
				
				 cdiscount = Number(subtotal);
			//	 document.getElementById("disc").value = cdiscount;
				 
				
			   // subTax = ptax - (parseFloat(subtotal));	
			}
		}  
	  }
	  
	  document.getElementById("disc").value = Number(cdiscount) + Number(sum);
	  
	  var sum =0;	
	  for(var i =0; i<nam.length;i++){
		  
		  sum = Number(sum) + Number(nam[i].per);
		  
	  }
	
	 
	  var arr1 = sum/100;
	 
	//  alert("arr1" + arr1);
	  arr = Number(arr1) * Number(total);
	  //alert("arr"+arr);
	/*  
	  var x = document.getElementsByName("addtax");
	  for(var i = 0;i<x.length;i++){
		  alert(x.length);
		  x[i].id = per; 
	  }
	 */
	 /*	  for(var i =0; i<nam.length;i++){
		  var per = Number(nam[i].per)/100;
		  var name = 0;
		  var x = document.getElementById("myTable").rows.length-1;
		  
		  
		  
		  document.getElementById(nam[i].name).value = per;  
	  
	  }
	*/
//	  document.getElementById("gTotal").value  = Number(arr) + Number(document.getElementById("subTotal").value) -Number(pdiscount)- Number(cdiscount);
	  
	 
	  
	}      

	var nam = [];	
	
	
	function totalIt1(name,per){
		
		nam.push({name : name, per : per});
		
	}
	
	function date(){
		 document.getElementById("invoicedate").valueAsDate = new Date();
		 $("#myTable th:eq(0), #myTable td:nth-child(1)").hide();
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
//alert()
    var row = 1;
 
    var textean = document.getElementById("eanHd").value;
    var text = document.getElementById("pnameHd").value;
    var text1 = document.getElementById("batchHd").value;
    var text2 = document.getElementById("expHd").value;
    var text2a = document.getElementById("uHd").value
    var text3 = document.getElementById("upHd").value;
    //var text5 = document.getElementById("freeHd").value;
    var text4 = document.getElementById("stkHd").value;
  //if (text4 < 10){
    //	alert("no stock");
   // }
   // else{
	   
	 
    for(var x=0; x<row; x++) {
    	
    	var stks= Math.random().toString(36).substr(2, 10);
 	  
 	   var qty = Math.random().toString(36).substr(4, 10);
 	  
 	   
 	  var total = Math.random().toString(36).substr(5, 10);
	
 	var un =  Math.random().toString(36).substr(3, 10);
	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody1')[0];
    var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
  
    	getCount();
          
           var idx = document.getElementById("myTable").rows.length-1;
           var quantity =  "quantity"+idx;
           
          
           var stks = "stock"+idx;
           
           var total = "total" + idx;
           
           var unitp = "up" + idx;
         
        var newCell = rowsAdd.insertCell();
       
        newCell.innerHTML="<tr><td ><input form ='saveSales' class='form-control input-sm' readonly = 'readonly' type='text' id = 'productSale' name= 'pname' value = '"+text+"'required> </td></tr>";
        newCell.style.width ='310px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class = 'pc'><input form ='saveSales'  class='form-control input-sm' readonly = 'readonly' type='text' id = 'batchSale' name= 'batch' value = '"+text1+"'></td></tr>";
        newCell.style.width ='100px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' class='form-control input-sm'  readonly= 'readonly' type='text' id = 'expSale' name= 'expDate' value = '"+text2+"'></td></tr>";
        newCell.style.width ='150px';

        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class = 'pc'><input  form ='saveSales' type='text' class='form-control input-sm' name= 'unit' id = 'unitSale' value= "+text2a+"></td></tr>";
        newCell.style.width ='100px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' required onkeypress='return onlyNos(event,this);' class='form-control input-sm' type='number' min='1' value='0' id = '"+unitp+"' name= 'unitprice' value = '"+text3+"'></td></tr>";
        newCell.style.width ='90px'; 
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form='saveSales'  onkeypress='return onlyNos(event,this);' class='form-control input-sm' type='number' min='1' style='width: 100px;' id = '"+quantity+"'  name='quantity'  oninput = calc('"+idx+"),totalIt()  value = '0' required ></td></tr>";
        newCell.style.width ='100px';
        
       // newCell = rowsAdd.insertCell();
       // newCell.innerHTML="<tr><td><input form ='saveSales' type='text' style='width: 100px;' id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
       // newCell.style.width ='90px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' required class='form-control input-sm'readonly = 'readonly' type='text' id = '"+stks+"' name='stk[]'  value = '"+text4+"'></td></tr>";
        newCell.style.width ='90px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td ><input  class='form-control input-sm' required form ='saveSales' readonly = 'readonly' type='text' id = '"+total+"'  name='price[]'  value = '0'></td></tr>";
        newCell.style.width ='90px';
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><span class='fa'><i class='fa fa-trash-o' style='font-size:20px'onclick='deleteRow(this)'></i></span></td></tr>";
        newCell.style.width ='50px';
       
  //onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
       
          //calc('"+idx+"')
//}
    }
    
}  
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/saleho.html";
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

function auto_grow(element) {
	
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
}
	
	

</script>
<script>
var a1 = 0;
var a2 = 0;
function highlightDuplicates() {
 $('#myTable .tbody tr').each(function(index1){
          var row = $(this)
          var row_val1 = row.find("td:nth-child(2) input").val()
          var row_val2 = row.find("td:nth-child(3) input").val()
        
          $('#myTable .tbody tr').each(function(index2){
              
             var compare_row = $(this)
             var compare_row_val1 = compare_row.find("td:nth-child(2) input").val()
             var compare_row_val2 = compare_row.find("td:nth-child(3) input").val()
        
             if(index1!=index2 && row_val1==compare_row_val1 && row_val2==compare_row_val2){
            	
                row.addClass('duplicate')
                compare_row.addClass('duplicate')
             }
             else{
            	 if(row.hasClass('duplicate')){
            		 row.removeClass('duplicate')
            	 }
            	 if(compare_row.hasClass('duplicate')){
            		 compare_row.removeClass('duplicate')
            	 }
             }
          })
       })
       
       if($('tr.duplicate').length>0){
          alert('Duplicates found for same product name and batch.Please remove  the duplicate products')
          return 1;
       }else{
    	   return 0;
       }
       

    // loop over all input fields in table
    /*
    $('#myTable td:nth-child(2)').find('input').each(function() {
        // check if there is another one with the same value
   
        if ($('#myTable td:nth-child(2)').find('input[value="' + $(this).val() + '"]').size() > 1) {
            // highlight this
            a1+= 1;
        } 
    });
    $('#myTable td:nth-child(3)').find('input').each(function() {
        if ($('#myTable td:nth-child(3)').find('input[value="' + $(this).val() + '"]').size() > 1) {
            // highlight this
               a2+= 1;
        } 
        
    });
    */
}


</script>
<script>
 function doAjaxPost(user2) {
    	   // get the form values

    	      //  var name = $('#pname').val();
        
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/getinvoice.html",
	          data: "invoice=" + user2,
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	       //    alert(response);
	        	   $.each(response.list2, function(index, datec) {
	                   //to print name of employee
	                   alert(datec.invoicedate);
	                   if ($("#ean option[value="+datec.invoicedate+"]").length == 0){
	               
	                	   $("#ean").append('<option value="'+datec.ean+','+datec.productName+'">'+datec.ean+'</option>');
	                   
	                   $("#ean").selectpicker("refresh");
	                   }
	                   
	                   if ($("#pname option[value="+datec.productName+"]").length == 0){
	    	               
	                	   $("#pname").append('<option value="'+datec.ean+','+datec.productName+'">'+datec.productName+'</option>');
	                   
	                   $("#pname").selectpicker("refresh");
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

    	      //  var name = $('#pname').val();
    	    var userean = document.getElementById("eanHd").value;
       var user3 = document.getElementById("pnameHd").value;
       if(document.getElementById("pname").value == "new"){
    	   alert("Please select products")
    	   return false;
       }
       $('select[name=ean]').val("new");
       $('#ean').selectpicker('refresh');	
   	 		   
   	   $('select[name=pname]').val("new");
       $('#pname').selectpicker('refresh');	
       $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/getinvprds.html",
	          data: "pname=" + user3,
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	            
	        	   if(response.length == 0){
	        		   alert("Product Cannot be added. Current Stock has expired");
	        	   }
	        	   $.each(response, function(index, datec) {
	                   //to print name of employee
	       var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
           var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
      
    	getCount();
         
           var idx = document.getElementById("myTable").rows.length-1;
           var quantity =  "quantity"+idx;
           
          
           var stks = "stock"+idx;
           
           var total = "total" + idx;
           
           var unitp = "up" + idx;
           
           var sk = "sk"+idx;
          
         if(datec.unitprice == 0){
        	 datec.unitprice = Number(datec.free) + (Number(datec.free)*(0.7));
         }
           
        var newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input type = 'text' class='form-control input-sm' form ='saveSales' readonly = 'readonly' name = 'ean' id='eans' value='"+userean+"'></td></tr>";
          
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' class='form-control input-sm' readonly = 'readonly' type='text' id = 'productSale' name= 'pname' value = '"+user3+"'required> </td></tr>";
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class = 'pc'><input form ='saveSales'  class='form-control input-sm' readonly = 'readonly' type='text' id = 'batchSale' name= 'batch' value = '"+datec.batch+"'></td></tr>";
      
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' class='form-control input-sm'  readonly= 'readonly' type='date' id = 'expSale' name= 'expDate' value = '"+datec.expDate+"'></td></tr>";
        

        // sales pack desc
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class = 'pc'><input class='form-control input-sm' form='saveSales'   type='text'  id = 'spack'' name='spack' required value ='"+datec.sdesc+"' required></td></tr>";
        
   // single pack size
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' form='saveSales' onkeypress='return onlyNos(event,this);'   type='number' min='1' id = 'spsize' name='spsize' value = '"+datec.spsize+"' required></td></tr>";
        
 
        //single unit pack size
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm ' form ='saveSales'  type='text' id = 'sudesc'   name= 'sudesc' required value = '"+datec.sudesc+"' ></td></tr>";
       
        // current stock
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales'  class='form-control input-sm'readonly = 'readonly' type='text' id = '"+stks+"' name='stk[]'  value = '"+Math.round(Number(datec.quantity))+"'></td></tr>";
       
        //quantity sold
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class = 'pc'><input onkeypress='return onlyNos(event,this);' form ='saveSales' type='number' min='1' class='form-control input-sm' name= 'unit' id = 'unitSale' value= '0'></td></tr>";
       
        //tot quantity in single unit  
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form='saveSales'  class='form-control input-sm' type='text' readonly style='width: 100px;' id = '"+quantity+"'  name='qty[]' name='quantity'   value = '0' ></td></tr>";
     
        
        
        //unit sp 
      
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class='pc'><input form ='saveSales' onkeypress='return onlyNos1(event,this);' class='form-control input-sm' type='text' id = '"+unitp+"' name= 'unitprice' required value = '"+Number(datec.unitprice).toFixed(2)+"'></td></tr>";
       
       
       // newCell = rowsAdd.insertCell();
       // newCell.innerHTML="<tr><td><input form ='saveSales' type='text' style='width: 100px;' id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
       // newCell.style.width ='90px';
        
        //price
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td ><input  class='form-control input-sm' form ='saveSales' readonly = 'readonly' type='text' id = '"+total+"'  name='price[]'  value = '0'></td></tr>";
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px'onclick='deleteRow(this)'></i><input type='hidden' id='"+sk+"' value='"+Number(datec.quantity)+"'></td></tr>";
        
         
  //onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
       
          //calc('"+idx+"')
//}
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
       function doAjaxPost3(supplier) {
    	   // get the form values
if(supplier == "Select"){
	location.href = "saleho.html"
	
}
else{
    	      //  var name = $('#pname').val();
      // var user3 = document.getElementById("sinvoice").value;
   $("#fileno").val('')
   
   var url = "/HMS/salespdf1?invoice="+supplier+"" ;
   var element = document.getElementById('close');
   element.setAttribute("href",url)
      $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/gtinvoice.html",
	          data: "invoice=" + supplier,
	        
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	  
	     
	     $("#myTable tbody tr").remove();
	        	   $.each(response, function(index, datec) {
	        		   $("#fileno").val(datec.fileno)
	        	   
                             	document.getElementById("chbox").disabled = true;
	        		   document.getElementById("invoicedate").value = datec.invoiceDate;
	        
	        		   document.getElementById("author").value = datec.author;
	        		   document.getElementById("sex").value  = datec.gender ;
	        		   document.getElementById("age").value = datec.age;
	        		  
	        		   document.getElementById("totalItems").value = datec.titems;
	        		  
	        		   document.getElementById("subTotal").value = datec.subt;
	        		   document.getElementById("cdiscount").value = datec.cdiscount;
	        		   document.getElementById("tax").value = datec.tax;
	        		   document.getElementById("gTotal").value = datec.gtotal;
	        		   document.getElementById("cdiscount").value = datec.cdiscount;
	        		
	        		   
	        		   $("#customer").append('<option value="'+datec.custId+'" selected="">'+datec.custId+'</option>');
	                   $("#customer").selectpicker("refresh");
	        		   
	                   $("#name").append('<option value="'+datec.custName+'" selected="">'+datec.custName+'</option>');
	        		   $("#name").selectpicker("refresh");
	        		   
	        		   $("#phone").append('<option value="'+datec.custPhone+'" selected="">'+datec.custPhone+'</option>');
	        		   $("#phone").selectpicker("refresh");
	        		 
	        		   document.getElementById('bouton-contact').disabled = true;
	        		   document.getElementById('customer').disabled = true;
	        		   document.getElementById('name').disabled = true;
	        		   document.getElementById('phone').disabled = true;
	        		   document.getElementById('ean').disabled = true;
	        		   document.getElementById('pname').disabled = true;
	        		   document.getElementById('addbt').disabled = true;
	        		   document.getElementById('gtot').disabled = true;
	        		   $('#tax').prop('readonly',true)
	                   //to print name of employee
	       var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
     //      var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
       
    	//getCount();
         
           var idx = document.getElementById("myTable").rows.length;
           var quantity =  "quantity"+idx;
           
          var pr = "productSale"+idx;
       
          var stks = "stock"+idx;
           
           var total = "total" + idx;
           
           var unitp = "up" + idx;
           
           var sk = "sk"+idx;
        /* 
        var newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class='pc'><input type = 'text' class='form-control input-sm' form ='saveSales' name = 'ean' id='eans' value='"+datec.ean+"'></td></tr>";
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' class='form-control input-sm' readonly = 'readonly' type='text' id = 'productSale' name= 'pname' value = '"+datec.pname+"'required> </td></tr>";
    
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class='pc'><input form ='saveSales'  class='form-control input-sm' readonly = 'readonly' type='text' id = 'batchSale' name= 'batch' value = '"+datec.batch+"'></td></tr>";
       
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class='pc'><input form ='saveSales' class='form-control input-sm'  readonly= 'readonly' type='text' id = 'expSale' name= 'expDate' value = '"+datec.expDate+"'></td></tr>";
       

        // sales pack desc
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input class='form-control input-sm' form='saveSales'   type='text'  id = 'spack'' name='spack' required value ='"+datec.sdesc+"' required></td></tr>";
        
   // single pack size
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class='pc'><input class='form-control input-sm' form='saveSales'   type='text'  id = 'spsize' name='spsize' required   value = '"+datec.spsize+"' required></td></tr>";
        
 
        //single unit pack size
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class='pc'><input class='form-control input-sm ' form ='saveSales'  type='text' id = 'sudesc'   name= 'sudesc' required value = '"+datec.sudesc+"' ></td></tr>";
       
        // current stock
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class='pc'><input form ='saveSales'  class='form-control input-sm'readonly = 'readonly' type='text' id = '"+stks+"' name='stk[]'  value = '"+datec.stock+"'></td></tr>";
       
        //quantity sold
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input  form ='saveSales' type='text' class='form-control input-sm' name= 'unit' id = 'unitSale' value= "+datec.unit+"></td></tr>";
       
        //tot quantity in single unit  
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form='saveSales'  class='form-control input-sm' type='number'  id = '"+quantity+"'  name='qty[]' name='quantity' value='"+datec.quantity+"' ></td></tr>";
     
        
        
        //unit sp 
      
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class='pc'><input form ='saveSales' onkeypress='return onlyNos(event,this);' class='form-control input-sm' type='text' id = '"+unitp+"' name= 'unitprice' value = '"+datec.unitprice+"'></td></tr>";
       
       
       // newCell = rowsAdd.insertCell();
       // newCell.innerHTML="<tr><td><input form ='saveSales' type='text' style='width: 100px;' id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
       // newCell.style.width ='90px';
        
        //price
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class='pc'><input  class='form-control input-sm' form ='saveSales' readonly = 'readonly' type='text' id = '"+total+"'  name='price[]'  value = '"+datec.total+"'></td></tr>";
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px'onclick='deleteRow(this)'></i><input type='hidden' id='"+sk+"' value='"+datec.quantity+"'></td></tr>";
        
  //onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
       
          //calc('"+idx+"')
//}
	        	   */
	        	   
	        	   var markup = "<tr><td class='pc'>"+idx+"</td><td class='pc'><input type = 'text' class='form-control input-sm' form ='saveSales' disabled name = 'ean' id='eans' value='"+datec.ean+"'></td><td><textarea rows='1' cols='30' form ='saveSales' disabled class='form-control input-sm' id = '"+pr+"' name= 'pname' value = '"+datec.pname+"' oninput='auto_grow(this)' required>"+datec.pname+"</textarea></td><td class='pc'><input form ='saveSales'  class='form-control input-sm' disabled type='text' id = 'batchSale' name= 'batch' value = '"+datec.batch+"'></td><td class='pc'><input form ='saveSales' class='form-control input-sm'  readonly= 'readonly' type='date' id = 'expSale' name= 'expDate' value = '"+datec.expDate+"'></td><td><input class='form-control input-sm' form='saveSales'   type='text'  id = 'spack' name='spack' disabled required value ='"+datec.sdesc+"' required></td><td class='pc'><input class='form-control input-sm' form='saveSales'   type='text'  id = 'spsize' name='spsize' disabled value = '"+datec.spsize+"' required></td><td class='pc'><input class='form-control input-sm ' form ='saveSales'  type='text' id = 'sudesc'   name= 'sudesc' disabled required value = '"+datec.sudesc+"' ></td><td class='pc'><input form ='saveSales'  class='form-control input-sm' disabled type='text' id = '"+stks+"' name='stk[]'  value = '"+datec.stock+"'></td><td><input  form ='saveSales' type='text' class='form-control input-sm' disabled name= 'unit' id = 'unitSale' value= "+datec.unit+"></td><td><input form='saveSales'  class='form-control input-sm' type='number'  id = '"+quantity+"'  name='qty[]' name='quantity' value='"+datec.quantity+"'disabled ></td><td class='pc'><input form ='saveSales' onkeypress='return onlyNos(event,this);' disabled class='form-control input-sm' type='text' id = '"+unitp+"' name= 'unitprice' value = '"+datec.unitprice+"'></td><td class='pc'><input  class='form-control input-sm' form ='saveSales' disabled type='text' id = '"+total+"'  name='price[]'  value = '"+datec.total+"'></td><td><i class='fa fa-trash-o' style='font-size:20px'onclick='deleteRow(this)'></i><input type='hidden' id='"+sk+"' value='"+datec.quantity+"'></td></tr>";
        $('#myTable .tbody').append(markup);   
    
        $("#myTable th:eq(0), #myTable td:nth-child(1)").hide();
        document.getElementById(pr).oninput();
	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
	        	        	   
    	        	        }
$(document).on('change', ':input', function(){ //triggers change in all input fields including text type
	  
 	unsaved = false;
 });

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
	   
	   var m,n;
	  
	    $('#myTable').on('focusout','.tbody tr', function () {
	   // 	$('.success').removeClass('success');
	   //     $(this).addClass('success');
	        
	        var x=this.cells;
	        var a = x[5].getElementsByTagName('input')[0].value;
	        var b = x[8].getElementsByTagName('input')[0].value;
	        
	    
	        x[9].getElementsByTagName('input')[0].value = (Number(a) * Number(b)).toFixed(0);
	        x[11].getElementsByTagName('input')[0].value =   Math.round(Number(x[9].getElementsByTagName('input')[0].value) * Number(x[10].getElementsByTagName('input')[0].value));
	       
	    });
	   
   });
   
   function goBack() {
	    window.history.back();
	}
		
   function disppat(){
	   $(".sp").val($(".sp option:first").val());
	   
	   $("#age").val('');
	   $("#sex").val('');
	   $("#fileno").val('');
	   
	   if(document.getElementById("chbox").checked == true){
	   $('#customer').find('.cust').hide();
	   $('#customer').selectpicker('refresh');
	   $('#name').find('.cust').hide();
	   $('#name').selectpicker('refresh');
	   $('#phone').find('.cust').hide();
	   $('#phone').selectpicker('refresh');
	   
	   $('#customer').find('.pat').show();
	   $('#customer').selectpicker('refresh');
	   $('#name').find('.pat').show();
	   $('#name').selectpicker('refresh');
	   $('#phone').find('.pat').show();
	   $('#phone').selectpicker('refresh');
	   }
	   
	   else{
		   
	
		   $('#customer').find('.pat').hide();
		   $('#customer').selectpicker('refresh');
		   $('#name').find('.pat').hide();
		   $('#name').selectpicker('refresh');
		   $('#phone').find('.pat').hide();
		   $('#phone').selectpicker('refresh');
		   
		   $('#customer').find('.cust').show();
		   $('#customer').selectpicker('refresh');	   
		   $('#name').find('.cust').show();
		   $('#name').selectpicker('refresh');
		   $('#phone').find('.cust').show();
		   $('#phone').selectpicker('refresh');	   
		   
		   
	   }
   }
   
   function chid(id){
	   if($('#sinvoice').val() == "Select"){
		   alert("Please select Invoice Id")
		   return false;
	   }
	   else{
		   return true;
	   }
   }
   </script>    
</head>


<sec:authentication property="principal.authorities" var="username" />
<body onload="date(),checkhome2('<c:out value="${username}" />'),disppat()">

<div class = "wrapper">
<div class="container1">
 <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Sales</a>
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
   <!--  <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="goBack()"></i> -->
</div>
</nav>
</div>

<div id="main">
 <div id="form1" >  
  
     <h1> <font id="ch" size="5">Sales </font> <span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i></span>
      <a href="#" id="close" onclick="return chid(this)" target="_blank" class="btn btn-warning button2" >Print</a>    
     
     </h1>
     
   <div class="form-group row" >
 <div class="col-xs-1"></div>
  <div class="col-xs-3">
    <figure>
       <img src="<c:url value='/Images/logocms.jpg'/>"/>
       </figure>
  </div>
  <div class="col-xs-4"></div>
  <div class="col-xs-4" contenteditable="true">
   <h4><b>LILAYI FAMILY CLINIC</b></h4>
   <h5>Plot 4014A,Lusaka-Zambia,P.O Box 32680,</h5>
   <h5>Contact: +260 962 151 935</h5>
   <h5>E-mail : lilayifamilyclinic@yahoo.com</h5>
   <h5>TPIN NO :</h5>

  
  </div>
 
</div>	
     <div class = "head">
 
 
 <form id ="saveSales" action="saleho2.html" method="post">
 </form>
 <form id = "searchSales" action = "gtinvoice.html" method="post">
 </form>

 <div class="container">
</div>
<br>

 

      <div id="col3">
      <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-2">
	      
	      <div class="form-group">
            <p>Select Invoice :<span>*</span></p>
          <select class="selectpicker form-control"  data-size="6" data-live-search="true" name = "sinvoice" id ="sinvoice"  onchange="doAjaxPost3(this.value);this.selectedindex = -1"" required>
    <option value="Select">New</option>
       <c:forEach var="q"  items="${model.list9}">
       <option value="${q.invoice}">${q.invoice}</option>
       </c:forEach>
</select>
      <input readonly = "readonly" type = "hidden" class="form-control input-sm"  name="invoice" id="invoice" form="saveSales" >
<!-- <input type="hidden" id = "invoice" name="invoice"  form ="saveSales">  -->
</div>
 <c:forEach var="in"  items="${model.list5}">
 
  <script>
  check('<c:out value="${in.invoice}" />');
  </script>
  </c:forEach>
	
	      </div>

	 <div class="col-xs-3">
	      <div class="form-group">
	     
         <p>Invoice Date :<span>*</span></p> 
      <input type= "date" name="invoiceDate"  id = "invoicedate" class="form-control"  form ="saveSales" required>
       
       </div>
	
	      </div>
	      
       <div class="col-xs-2"> 
  
  <div class="form-group">
  
   <p>Created By :<span>*</span></p>
<input  readonly = "readonly"  type = "text" name="author" id="author" value="${pageContext.request.userPrincipal.name}" class="form-control input-sm"  form ="saveSales" >
</div>
  </div>
  
  <div class="col-xs-2">
	       <div class="form-group">

   <p>Cust Discount(%) : <span>*</span></p>
<input  type="text" class="form-control input-sm" maxlength="3" name="cdiscount" id="cdiscount"  onkeypress='return onlyNos(event,this);' value="0" form ="saveSales" >
<input  type="hidden"  id="med" name = "med" >
     </div>
	      </div>
  
	  <div class="col-xs-2">
	 <br></br>
	  <input type="checkbox" id = "chbox" onclick="disppat(this)"><span>Show Patients</span>
	  </div>      
	  </div>
	  
	   <div class="form-group row" >
  <div class="col-xs-1"></div>
	     
	      <div class="col-xs-2">
	       <div class="form-group">

   <form action="sale1.html" method = "get">
            <p>Customer Id:<span></span></p>
       <select class="selectpicker form-control sp"  data-size="6"  data-live-search="true" name = "customer" type="text" id ="customer" class="form-control input-sm"  onchange="addcid()">
    <option value="new">new</option>
  <c:forEach var="sale"  items="${model.list}">
  <option class="cust"   value = "${sale.customer},${sale.name},${sale.phone},${sale.sex},${sale.age},${sale.medical}">${sale.customer}</option>
 </c:forEach>
 
  <c:forEach var="sale1"  items="${model.list11}">
  <option class="pat"  value = "${sale1.pid},${sale1.fname},${sale1.mobile},${sale1.gender},${sale1.age},${sale1.dob}">${sale1.pid}</option>
 </c:forEach>
 </select>
 </form>
     </div>
	      </div>
	      
	       <div class="col-xs-3">
	      <div class="form-group">
	      <form action="sale1.html" method = "get">
            <p>Customer Name:<span></span></p>
   <select class="selectpicker form-control sp"  data-size="6" data-live-search="true" name = "name" type="text" id ="name" class="form-control input-sm"  onchange="addcname()">
    <option value="new">new</option>
  <c:forEach var="sale"  items="${model.list}">
 <option class="cust" value = "${sale.customer},${sale.name},${sale.phone},${sale.sex},${sale.age},${sale.medical}">${sale.name}</option>
 </c:forEach>
 
   <c:forEach var="sale1"  items="${model.list11}">
  <option class="pat" data-subtext="${sale1.dob}" value = "${sale1.pid},${sale1.fname},${sale1.mobile},${sale1.gender},${sale1.age},${sale1.dob}">${sale1.fname}</option>
 </c:forEach>
 
 </select>
 </form>
     </div>
	      </div>
	      
	       <div class="col-xs-2">
	      <div class="form-group">
	    
   <form action="sale1.html" method = "get">
 <p>Customer Phone:<span></span></p>
   <select class="selectpicker form-control sp"  data-size="6" data-live-search="true" name = "phone" type="text"  id ="phone"  class="form-control input-sm"  onchange="addcphone()">
    <option value="new">new</option>
  <c:forEach var="sale"  items="${model.list}">
   <option class="cust" value = "${sale.customer},${sale.name},${sale.phone},${sale.sex},${sale.age},${sale.medical}">${sale.phone}</option>
 </c:forEach>
 
   <c:forEach var="sale1"  items="${model.list11}">
  <option class="pat" value = "${sale1.pid},${sale1.fname},${sale1.mobile},${sale1.gender},${sale1.age},${sale1.dob}">${sale1.mobile}</option>
 </c:forEach>
 </select>
 </form>
      
</div>
	        
	      </div>
	      <input form ="saveSales" type = "hidden" name = "custId" id="saleCustId">
 <input form ="saveSales" type = "hidden" name = "custName" id="saleCustName">
 <input form ="saveSales" type = "hidden" name = "custPhone" id="saleCustPhone">
 
	      <div class="col-xs-1">
	      <div class="form-group">
	      
            <p>Gender:<span></span></p>
   <input form ="saveSales"  type="text" name="gender" id="sex" class="form-control input-sm"  readonly="readonly">
 </div>
   </div>
   
  
   
  
	     
	      <div class="col-xs-2">
	       <div class="form-group">

   
            <p>Age:<span></span></p>  
  <input form ="saveSales"  readonly = "readonly"  class="form-control input-sm"  type ="text" name="age" id ="age">
     </div>
	   </div>  
   </div> 
   <input form="purchasesave" type="hidden" name="orderid" id="orderid">
  <input form="purchasesave" type="hidden" name="supplier" id="supplier">
	   
	     <div class="form-group row" >
  <div class="col-xs-1"></div>
	      
	      <c:forEach var="q"  items="${model.list2}">
   <script>
   checkSupply('<c:out value="${q.supplier}" />','<c:out value="${q.quantity}" />','<c:out value="${q.unit}" />','<c:out value="${q.up}" />');
   </script>
   </c:forEach>
	     
	     
	      <div class="col-xs-3">
	       <div class="form-group ft">
	       
	        <p>Code(EAN):<span></span></p>
      <select class="selectpicker"  data-show-subtext="true" data-size="6" data-live-search="true" name = "ean" id ="ean"  onchange="add1()" required>
    <option value="new">New</option>
   <c:forEach var="sale"  items="${model.list10}">
  <option value ="${sale.ean},${sale.productName},${sale.batch},${sale.expDate},${sale.unit},${sale.unitPrice},${sale.quantity}">${sale.ean}</option>

 </c:forEach>
 </select>
   
	       </div>
	       </div>
	       
	       
	      <div class="col-xs-3">
	      <div class="form-group ft">
	       
   <p>Product:<span></span></p>
     <select class="selectpicker" data-size="6" data-show-subtext="true" data-live-search="true" name = "pname" id ="pname"  onchange="add2()" required>
      <option value="new">New</option>
  <c:forEach var="sale"  items="${model.list10}">
   <option value = "${sale.ean},${sale.productName},${sale.batch},${sale.expDate},${sale.unit},${sale.unitPrice},${sale.quantity}">${sale.productName}</option>
   
 </c:forEach>
 </select>
 </div>
	       </div>
	       
	       
	       
	       <div class="col-xs-1">
	       <div class="form-group">
	      
<br>

	       <button type="button" id="addbt" style="width:80px;" class="form-control input-sm button1 btn btn-warning"  onclick="return doAjaxPost1()"> ADD</button>
	       </div>
	       </div>
	         
	       <div class="col-xs-1"></div>
	       <div class="col-xs-2">
	      <div class="form-group">
	       
   <p>File No:</p>
   <input type="text" readonly name="fileno" id="fileno" form="saveSales" class="form-control input-sm">
    </div>
    </div>
	       </div>
	       <input type="hidden" name="eanHd" id="eanHd" >       
	       <input type="hidden" name="pnameHd" id="pnameHd" >
  <input type="hidden" name="batchHd" id="batchHd" >
 <input type="hidden" name="expHd" id="expHd">
  <input type = "hidden" name= "uHd" id= "uHd">
 <input type="hidden" name="upHd" id="upHd" >

 <input type="hidden" name="freeHd" id ="freeHd">
 <input type="hidden" name="stkHd" id="stkHd">
	       <div class="container">
	   <input form="purchasesave" type="hidden" name="ean" id="ean">
    
  <div class="container" id="span2">
  	   <div class="table-responsive">   
  <table class="table table-striped table-bordered table-hover table-condensed " style="" id="myTable">
    <thead class="thead">
    <tr>
    <th id="slno">Sl No</th>
    <th>Product Code</th>
    <th>Product Name</th>
    <th class='pc'>Batch</th>
    <th>Exp Date</th>
    <th class='pc'>Selling Pack Desc</th>
    <th>Selling Pack Size</th>
     <th>Single Unit Desc</th>
    <th>Current Stock in Single Units</th>
    <th class='pc'>Qty Sold</th>
    <th>Total Quantity in Single unit</th>
   
    <th class='pc'>Unit SP</th>
    <th class='pc'>Price</th>
    <th>Delete</th>
      </tr>
    </thead>
   <tbody class="tbody">
     
    </tbody>
    
  </table>
  
  
                  
  </div>
</div>
<div class="form-group row" >
      
	 <div class="col-xs-1"></div>
	    
<div class="col-xs-2">
 <div class="form-group">
 <button type="button" class="btn btn-warning button1" id='gtot' onclick='return verifyproAdd()'>
	  <span class="fa fa-refresh fa-spin"></span> Generate Total</button></div>
	 
 </div>
	  
	  <div class="col-xs-2"></div>
	  
	      <div class="col-xs-3">
	      
	      <div class="form-group">
    <input type="submit" form="saveSales" class="btn btn-warning button1" id='bouton-contact' value="Save" onclick="return verifyproAdd1()">
	  </div>
	  
	  </div>
	  
	   <div class="col-xs-3"></div>
	  
	   <div class="col-xs-3">
	      
	      <div class="form-group">
  <table id="meta2" class="buuton2">
  
   <tr>
                    
                    <td  colspan="" class="total-line meta-head">Total Items</td>
		      <td style="width:10px" class="total-value"><div id="subtotal"><input form ="saveSales" class="form-control input-sm rem" value="0" readonly = "readonly" type= "text" name="titems"  id="totalItems"></div></td>
                </tr>
                <tr>
                <tr>
                    
                    <td  colspan="" class="total-line meta-head">Sub Total</td>
		      <td style="width:10px" class="total-value"><div id="subtotal"><input form ="saveSales" class="form-control input-sm rem" value="0.00" readonly = "readonly" type= "text" name="subt"  id="subTotal" ></div></td>
                </tr>
             

                    
                  
                <tr>
                    <td colspan="" class="total-line meta-head">Tax(%)</td>
		      <td class="total-value"><div id=""><input form ="saveSales" value="0" type="text" class="form-control input-sm rem" name="tax" onkeypress='return onlyNos(event,this);' min="0"  id="tax" onmouse="alert("please click on generate total");"></div></td>
                </tr>
                <tr>
             
                <tr>
                    <td colspan="" class="total-line meta-head">Grand Total</td>

		      <td class="total-value balance"><input value="0.00" form ="saveSales"readonly = "readonly" class="form-control input-sm rem" type= "text" name="gtotal"  id="gTotal" ></td>
                </tr>
                
                  </table>
           </div>
  
   </div>
   <div class="col-xs-1"></div>
	    
<div class="col-xs-7">
 <div class="form-group" id="hiden">
	  <h7> Note: Click on "Generate Total" button each time any changes are done </h7>        
 </div>
 </div>
	    
	  </div>
  
	  

 

 
 


  </div> 
  </div>
   
      
	      
 <input type=""  class="bouton-contact" >
 
 
</div>
  </div>
 </div>
 </div>
 
  <c:forEach var="sp"  items="${model.list8}">
<script>
checkSp('<c:out value="${sp.spDtype}" />','<c:out value="${sp.spDvalue}" />');
</script>

 </c:forEach>
<c:forEach var="custD"  items="${model.list7}">
<script>
checkCust('<c:out value="${custD.custType}" />','<c:out value="${custD.discType}" />','<c:out value="${custD.discValue}" />');
</script>
 </c:forEach>
 <script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>  
               
