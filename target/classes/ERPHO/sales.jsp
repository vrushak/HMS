<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' href='<c:url value="/resources/css/sales.css" />' type='text/css' media='all' />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
<script type="text/javascript">
function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
    var x = document.getElementById("myTable").rows.length-1;
    document.getElementById("totalItems").value=x;
   // document.getElementById("subTotal").value=x;
   
   if(x<=0){
	   document.getElementById("disc").value=0.00;
	   totalIt();
   }
   else{
	   totalIt();
	   
   }
}

function check(id){
	
	if (id == "" || id == null){
//		alert(id);
		id = 1;
		var str1 = "IN-";
	    var m = moment().format("DDMMYYYY-");
		var str3 = id;
		var res = str1.concat(m);
		var res1 = res.concat(str3);

		//alert(res1);
		document.getElementById("invoice").value = res1;
    	//alert(res1);
	}
	else {
	//	alert("now"+id);
		id = Number(id) + 1;
	//	alert(id);
		var str1 = "IN-";
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
	var x = document.getElementById("myTable").rows.length-1;
	var x1 =document.getElementById("saleCustId").value
	var x2 = document.getElementById("saleCustName").value
	var x3 = document.getElementById("saleCustPhone").value
	if(x ==0){
		alert("please add the products");
	}
	else if(x1 == "" || x2 == "" || x3 == ""){
		alert("please fill out the customer details");
	}
	else{
		alert("changes saved successfully!");
		document.getElementById("saveSales").submit();
	}
}

function getCount(){
	var x = document.getElementById("myTable").rows.length-1;
    document.getElementById("totalItems").value=x;
    
    document.getElementById("invoiceDate").valueAsDate = new Date();
  
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
	
	    
		var custDisc = strSplit[5].toLowerCase();
		 
		// alert(custDisc);
		
		 for(var i = 0; i<cust.length; i++){
			 
			 if(custDisc == cust[i].ctype){
				
				 document.getElementById("med").value = custDisc;
				
				 document.getElementById("cdiscount").value = cust[i].value;
		 }
			
	 
		 }
	
	
	
}

function add1(){
	

	   var str = document.getElementById("ean").value;
	  
	   var strSplit = str.split(',');
	  
	 
	
		 
	       document.getElementById("pname").value = str;  
		   
	       document.getElementById("pnameHd").value = strSplit[1];
		  
		   
		   document.getElementById("batchHd").value  = strSplit[2] ;
		   
		   document.getElementById("expHd").value  = strSplit[3];
		  
		   document.getElementById("uHd").value = strSplit[4];
		   
		   document.getElementById("upHd").value = strSplit[5];

      //     document.getElementById("freeHd").value =strSplit[5];
		   
		   document.getElementById("stkHd").value=strSplit[6];
		 
	   
	   
}


function add2(){
	
	   var str = document.getElementById("pname").value;
	  
	       var strSplit = str.split(',');
	  
	       document.getElementById("ean").value = str;
		   
		   document.getElementById("pnameHd").value = strSplit[1];
		   
		   document.getElementById("batchHd").value  = strSplit[2] ;
		   
		   document.getElementById("expHd").value  = strSplit[3];
		   
		   document.getElementById("uHd").value = strSplit[4];
		   
		   document.getElementById("upHd").value = strSplit[5];
		   
		 //  document.getElementById("freeHd").value =strSplit[5];
		   
		   document.getElementById("stkHd").value=strSplit[6];
		 
	  
	
}

function calc(tid) {
	
	  
	
	idx = tid;

	
	  var price = parseFloat(document.getElementById("unitprice").value) *  parseFloat(document.getElementById("quantity"+idx).value);
	 
	  var res =  document.getElementById("stkHd").value - document.getElementById("quantity"+idx).value;
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
	  var qtys = document.getElementsByName("qty[]");
	 
	  var total=0;
	  for (var i=1;i<=qtys.length;i++) {
	    calc(i);  
	    var price = parseFloat(document.getElementById("total"+i).value);
	    total += Number(price)//isNaN(price)?0:price;
	  }
	  document.getElementById("subTotal").value= total.toFixed(2);  //isNaN(total)?"0.00":total.toFixed(2);    
	  
	  //product discount caluclation
	 var sum =0;
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
			 alert(cust[i].dtype);
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
	  for(var i =0; i<nam.length;i++){
		  var per = Number(nam[i].per)/100;
		  var name = 0;
		  var x = document.getElementById("myTable").rows.length-1;
		  
		  
		  
		  document.getElementById(nam[i].name).value = per;  
	  
	  }
	  document.getElementById("gTotal").value  = Number(arr) + Number(document.getElementById("subTotal").value) -Number(pdiscount)- Number(cdiscount);
	  
	  
	}      

	var nam = [];	
	
	
	function totalIt1(name,per){
		
		nam.push({name : name, per : per});
		
	}
	
	

function add() {
	
    var row = 1;
  
   
    var text = document.getElementById("pnameHd").value;
    var text1 = document.getElementById("batchHd").value;
    var text2 = document.getElementById("expHd").value;
    var text2a = document.getElementById("uHd").value
    var text3 = document.getElementById("upHd").value;
    //var text5 = document.getElementById("freeHd").value;
    var text4 = document.getElementById("stkHd").value;
    
    if (text4 < 10){
    	alert("no stock");
    }
    else{
    for(var x=0; x<row; x++) {
    	
    	var stks= Math.random().toString(36).substr(2, 10);
 	  
 	   var qty = Math.random().toString(36).substr(4, 10);
 	  
 	   
 	  var total = Math.random().toString(36).substr(5, 10);
	
 	
    	var rowsAdd = document.getElementById('myTable').insertRow();
           getCount();
           var idx = document.getElementById("myTable").rows.length-1;
           var quantity =  "quantity"+idx;
           
          
           var stks = "stock"+idx;
           
           var total = "total" + idx;
         
        var newCell = rowsAdd.insertCell();
       
        newCell.innerHTML="<tr><td width ='30%'><input form ='saveSales' readonly = 'readonly' type='text' id = 'productSale' name= 'pname' value = '"+text+"'required> </td></tr>";
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td ><input form ='saveSales' readonly = 'readonly' type='text' id = 'batchSale' name= 'batch' value = '0as'></td></tr>";

        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' readonly= 'readonly' type='text' id = 'expSale' name= 'expDate' value = '"+text2+"'></td></tr>";


        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><select disabled form ='saveSales' name= 'unit' id = 'unitSale' ><option>"+text2a+"</option><option>Strip</option><option>Sheet</option><option>Box</option></select></td></tr>";
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' type='text' readonly='readonly' id = 'unitprice' name= 'unitprice' value = '"+text3+"'></td></tr>";
         
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form='saveSales'  type='number' style='width: 100px;' id = '"+quantity+"' name='qty[]' name='quantity'  onchange = calc('"+idx+"'),totalIt() value = '0' ></td></tr>";
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales' type='text' style='width: 100px;' id = 'freeSale' name= 'free'  value = '0'  ></td></tr>";
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><input form ='saveSales'readonly = 'readonly' type='text' id = '"+stks+"' name='stk[]'  value = '"+text4+"'></td></tr>";
          
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td class='count-me'><input  form ='saveSales' readonly = 'readonly' type='text' id = '"+total+"'  name='price[]'  value = '0'></td></tr>";
        
        
        newCell = rowsAdd.insertCell();
        newCell.innerHTML="<tr><td><i class='fa fa-trash-o' style='font-size:20px'onclick='deleteRow(this)'></i></td></tr>";
        
       
  //onclick= caluclate('"+qty+"','"+stks+"','"+total+"')
       
          //calc('"+idx+"')
}
    }
    
}  



</script>
</head>
<body onload="getCount(),setdefault()">
<div class = "wrapper">
 <div class="container1">
  <a href="home3.jsp">Home</a>
     <div class="dropdown">
    <button class="dropbtn">Masters</button>
    <div class="dropdown-content">
      <a href="http://localhost:8085/test1/hello.html">Manufacture Masters</a>
      <a href="http://localhost:8085/test1/viewemp.html">Supplier Masters</a>
      <a href="http://localhost:8085/test1/customer.html">Customer Masters</a>
      <a href="http://localhost:8085/test1/viewproduct.html">Product  Masters</a>
    </div>
  </div> 
  <a href="#news">Admin</a>
 
  <a href="#news">Invoice</a>
  <a href="#news">Reports</a>
</div>
 <div class = "head">
  Sales
 </div>
 <br>
 <form id ="saveSales" action="sale2.html" method="post">
 </form>
 <form id = "searchSales" action = "gtinvoice.html" method="post">
 </form>
<div class = "wrapperField">
<label>Invoice :</label>
<input readonly = "readonly" type = "text" name="invoice" id="invoice" form="saveSales" >
<!-- <input type="hidden" id = "invoice" name="invoice"  form ="saveSales">  -->
</div>
 <c:forEach var="in"  items="${model.list5}">
 
  <script>
  check('<c:out value="${in.invoice}" />');
  </script>
  </c:forEach>
<div class = "wrapperField">
<label>Invoice Date :</label>
<input  type ="date" name="invoiceDate" id = "invoiceDate" form ="saveSales" required>
</div>
<div class = "wrapperField">
<label>Created By :</label>
<input  readonly = "readonly" type = "text" name="author" id="author" value = "admin" form ="saveSales" >
</div>
<div class = "wrapperField">
<label>Cust Discount% : </label>
<input  readonly = "readonly" type="text" name="cdiscount" id="cdiscount" form ="saveSales" >
<input  type="hidden"  id="med" name = "med" >
</div>


 
 <br>


 <br>
  <div class= "wrapperField">
   <form action="sale1.html" method = "get">
 <label>Customer Id:</label>
   <select  name = "customer" id ="customer" onchange="addcid()">
    <option>new</option>
  <c:forEach var="sale"  items="${model.list}">
  <option value = "${sale.customer},${sale.name},${sale.phone},${sale.sex},${sale.age},${sale.medical}">${sale.customer}</option>
 </c:forEach>
 </select>
 </form>
 </div>

<div class= "wrapperField">
<form action="sale1.html" method = "get">
 <label>Customer Name:</label>
   <select name = "name" id ="name" onchange="addcname()">
    <option>new</option>
  <c:forEach var="sale"  items="${model.list}">
 <option value = "${sale.customer},${sale.name},${sale.phone},${sale.sex},${sale.age},${sale.medical}">${sale.name}</option>
 </c:forEach>
 </select>
 </form>
 </div>
 <div class= "wrapperField">
 <form action="sale1.html" method = "get">
 <label>Customer Phone:</label>
   <select name = "phone" id ="phone" onchange="addcphone()">
    <option>new</option>
  <c:forEach var="sale"  items="${model.list}">
   <option value = "${sale.customer},${sale.name},${sale.phone},${sale.sex},${sale.age},${sale.medical}">${sale.phone}</option>
 </c:forEach>
 </select>
 </form>
 </div>
 <input form ="saveSales" type = "hidden" name = "custId" id="saleCustId">
 <input form ="saveSales" type = "hidden" name = "custName" id="saleCustName">
 <input form ="saveSales" type = "hidden" name = "custPhone" id="saleCustPhone">
 <div class ="wrapperField1">
 
 
<label>Gender:
   <input form ="saveSales" type="text" name="gender" id="sex" readonly="readonly"></label>
 
 Age:
  
  <input form ="saveSales" readonly = "readonly" type ="text" name="age" id ="age">
  
 </div>
 

 <br>
 
 <!--  
 
 <c:forEach var="sale"  items="${model.list1}">
    
   <script>
    copyCustId('<c:out value="${sale.customer}" />','<c:out value="${sale.name}" />','<c:out value="${sale.phone}" />','<c:out value="${sale.sex}"/>','<c:out value="${sale.age}"/>','<c:out value="${sale.customer}" />','<c:out value="${sale.name}" />','<c:out value="${sale.phone}" />');
    
    </script>
  </c:forEach>
  <c:forEach var="sale"  items="${model.list2}">
 
   <script>
    copyCustName('<c:out value="${sale.customer}" />','<c:out value="${sale.name}" />','<c:out value="${sale.phone}" />','<c:out value="${sale.sex}"/>','<c:out value="${sale.age}"/>');
    
    </script>
  </c:forEach>
  <c:forEach var="sale"  items="${model.list3}">
 
   <script>
    copyCustPhone('<c:out value="${sale.customer}" />','<c:out value="${sale.name}" />','<c:out value="${sale.phone}" />','<c:out value="${sale.sex}"/>','<c:out value="${sale.age}"/>');
    
    </script>
  </c:forEach>
  -->
  <br>
  <div class="groove">
  
 <div class= "wrapperField3">
 
 <label>Code(EAN):</label>
   <select name = "ean" id ="ean" onchange = "add1()">
    <option>--N--</option>
   <c:forEach var="sale"  items="${model.list4}">
  <option value ="${sale.ean},${sale.productName},${sale.batch},${sale.expDate},${sale.unit},${sale.unitPrice},${sale.quantity}">${sale.ean}</option>

 </c:forEach>
 </select>
 

 </div>

 <div class= "wrapperField3">
 
 <label>Product:</label>
   <select name = "pname" id ="pname" onchange ="add2()">
    <option>--N--</option>
  <c:forEach var="sale"  items="${model.list4}">
   <option value = "${sale.ean},${sale.productName},${sale.batch},${sale.expDate},${sale.unit},${sale.unitPrice},${sale.quantity}">${sale.productName}</option>
   
 </c:forEach>
 </select>
  

  </div>
   <input type = "submit"  class = "button3" onclick="add()" value = "ADD">
   <div class = "wrapperField4">
<label>Search Invoice : </label>
<select form ="searchSales" name = "customer" id ="customer" onchange="this.form.submit">
<option>Select Invoice</option>
</select>
</div>
   
<input type="hidden" name="pnameHd" id="pnameHd" >
  <input type="hidden" name="batchHd" id="batchHd" >
 <input type="hidden" name="expHd" id="expHd">
  <input type = "hidden" name= "uHd" id= "uHd">
 <input type="hidden" name="upHd" id="upHd" >

 <input type="hidden" name="freeHd" id ="freeHd">
 <input type="hidden" name="stkHd" id="stkHd">

</div>
 

 
  
 
 <fieldset class="det">
 
 <table class ="table1" id="myTable">
       
      
      <tr><th>Product Name</th><th>Batch</th><th>Expiry Date</th><th>Unit</th><th>Unit Price</th><th>Quantity</th><th>Free</th><th>Stock</th><th formula="qty * unitprice"summary="sum">Total</th><th>Delete</th></tr>


 </table>

 </fieldset>
 <br> 
 
<table class="balance">
                <tr>
					<th>Total Items :</th>
					<td><span class ="item1"><input form ="saveSales" readonly = "readonly" type= "text" name="titems"  id="totalItems"  ></span></td>
				</tr>
				<tr>
					<th>SubTotal :</th>
					<td><span class ="item1"><input form ="saveSales"readonly = "readonly" type= "text" name="subt"  id="subTotal"  ></span></td>
				</tr>
				<input type="hidden" id="subTotal1">
				<tr>
					<th><span contenteditable>Discounts</span></th>
					<td><span class ="item1"><input form ="saveSales"readonly = "readonly" type= "text" name="discount"  id="disc"  value="0" ></span></td>
				</tr>
				<tr>
					<th><span contenteditable>Taxes</span></th>
					<c:forEach var="tax"  items="${model.list6}">
					<tr>
					<script>
					 totalIt1('<c:out value="${tax.taxName}" />','<c:out value="${tax.percentage}" />');
					</script>
					
					<td><label>${tax.taxName} :</label> <span class ="item1"><input form ="saveSales" readonly = "readonly" type="text" name="tax" id="${tax.taxName}" ></span></td>
					
					</tr>
					</c:forEach>
				</tr>
				<tr>
					<th>Grand Total</th>
			        <td><span class ="item1"><input form ="saveSales"readonly = "readonly" type= "text" name="gtotal"  id="gTotal"  ></span></td></td>
					</tr>
			</table>
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
<div class = "bottom">
 
 <input type="button" class = "button1 button2" form ="saveSales"  value = "Save" onclick = "verifyproAdd()">
  <input type="submit" value ="Print" class = "button1 button2"/>
  <input type="submit" class = "button1 button2" value = "Cancel">
  <input type="submit" value ="New" class = "button1 button2" form ="saveSales"/>
  <a href="http://localhost:8085/test1/return.html" class="button1 button2">Return Products</a>
</div>
  </div>
  </body>
  </html>