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
<title>CMS Wedge</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel='stylesheet' href='<c:url value="/resources/css/billgen.css" />' type='text/css' media='all' />
<link rel='stylesheet' href='<c:url value="/resources/css/print.css" />' type='text/css' media='print' />


<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
	<script type="text/javascript">
	
	var cuser;
	function checkhome2(user){
		cuser = user;
 
	      // document.getElementById("adbar").innerHTML = tpin; 
		        
		
		 if(user.includes("[ROLE_FDESK]")){
		
			var url = "/HMS/frontdesk" ;
			
//			 var element = document.getElementById('ho');
//			 element.setAttribute("href",url)
			 
			 
			 $('.ftype').prop('readonly', true);
			 $('.feet').prop('readonly', true);
			 
		}
		else if(user.includes("[ROLE_ASSISTANT]")){
		
			 var url = "/HMS/frontdesk" ;
				
		//	 var element = document.getElementById('ho');
		//	 element.setAttribute("href",url)
			
			document.getElementById("bouton-contact").disabled = false; 
			 $('.ftype').prop('readonly', true);
			 $('.feet').prop('readonly', true);
		}
		 
		else if(user.includes("[ROLE_Accounts Admin]")){
			
			 var url = "/HMS/frontdesk" ;
				
		//	 var element = document.getElementById('ho');
	//		 element.setAttribute("href",url)
			 document.getElementById("bouton-contact").disabled = false;
		}
		else{
			 var url = "/HMS/home" ;
			
	//		 var element = document.getElementById('ho');
		//	 element.setAttribute("href",url)
		}
	}
	
function deleteRow(r,fee,charge) {

	var myname = document.getElementById(fee).value//+","+document.getElementById(charge).value;
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("items").deleteRow(i);
    totalIt();
    console.log(oldarr)
    oldarr.splice(oldarr.indexOf(myname), 1);
    //alert(myname)
    console.log(myname)
    
    $("#select1 option[value='" + myname + "']").removeAttr("selected");
    $("#select1").selectpicker('refresh');
  
    console.log(oldarr)
    
}

function disp(id,fr){
	/*
	$("#htr").hide();
	 document.getElementById("prgen").style.visibility = "hidden";
	$("#items th:eq(5), #items td:last-child").hide();
	document.getElementById("disp").style.visibility = "hidden";
	document.getElementById("hds").style.visibility = "block";
	window.print();
	document.getElementById("disp").style.visibility = "visible";
	document.getElementById("hds").style.visibility = "none";
	$("#items th:eq(5), #items td:last-child").show();
	 document.getElementById("prgen").style.visibility = "visible";
	 $("#htr").show();
*/



	if(fr == "pr"){
		var url = "/HMS/billpdf?location="+$("#invoice").val()+"" ;
		$(id).attr("href",url)
		return true;
	}
	else{
		var url = "/HMS/billint?location="+$("#fileno").val()+"" ;
		$(id).attr("href",url)
		return true;
	}

}
		
	function check(str){
		var n = moment().format("DD-MM-YYYY");
		
		if (str == "" || str == null){
	    	
			
			
			var id = 1; 
			var str1 = "IN-";
		    var m = moment().format("DDMMYYYY-");
		   
	
			var res = str1.concat(m);
	
			var res1 = res.concat(id);

		
			document.getElementById("invoice").value = res1;
			document.getElementById("invoicedate").value = n;
			document.getElementById("disdate").value = n;
	    	
		}
		else {
	
			
			str = Number(str) + 1;
			var str1 = "IN-";
			var m = moment().format("DDMMYYYY-");
			var str3 = str;
		
			var res = str1.concat(m);
			var res1 = res.concat(str3);
			
			document.getElementById("invoice").value = res1;
			document.getElementById("invoicedate").value = n;
			document.getElementById("disdate").value = n;
		//	alert(res1);
		}
	}

	function addcname(){
		var cid = document.getElementById("pname1").value; 
		var str = cid.split(',');
		
		document.getElementById("pname").value=str[0];
		document.getElementById("pid").value=str[1];
		
		document.getElementById("pnameH").value=str[0];
		document.getElementById("pidH").value=str[1];
		
		document.getElementById("address").value=str[2];   
		document.getElementById("wardno").value=str[3];
		 document.getElementById("formab").disabled = false;
	//	days_between(str[4],document.getElementById("disdate").value);
		GetFormattedDate(str[4]);
		
		calc(charge1,qty);
		totalIt();
	}
	
	var pricea;
	function calc(tid,qty) {
		
	
        
        	
		  pricea = diffDays *  parseFloat(document.getElementById(tid).value);
		   
		  
		  document.getElementById(qty).value= pricea.toFixed(2);//isNaN(price)?"0.00":price.toFixed(2);
		 
		  
		}

	
		// from http://www.mediacollege.com/internet/javascript/number/round.html
	
		
			var charge1;
         var strSplit;
		var qty;
		
		var oldarr = [];
        var newarr = [];
function myFunction1(getval) {

	
    if ($("#select1 option").length == 1) {
        
    	oldarr = [];
        oldarr.push($("#select1 option:selected").attr('data-value'));
      
        addc($("#select1 option:selected").attr('data-value'));
    }
    else {
        newarr = [];
     //   console.log(oldarr)
        $("#select1 option:selected").each(function(i){
           
        	newarr.push($(this).attr('data-value'));
         //   console.log(newarr)
          
        });
        newitem = $(newarr).not(oldarr).get();
    
        if (newitem.length > 0) {
         
            addc(newitem[0]);
            oldarr.push(newitem[0]);
        }
        else {
            oldarr = newarr;
           
        }
    }
    
}
  
var count;



var pricea;
var diffDays
function calc(tid,qty) {
/*
	var admspl = document.getElementById("admdate").value.split(' ');
	var disspl = document.getElementById("disdate").value.split(' ');
	
	 days_between(admspl[0],disspl[0])
	
	//alert(diffDays);
           if(diffDays == 0 ){
        	 diffDays = 1;
        	
         }    
        
    	
	  pricea = diffDays *  parseFloat(document.getElementById(tid).value);
	 
	 
	  
	  document.getElementById(qty).value= pricea.toFixed(2);//isNaN(price)?"0.00":price.toFixed(2);
	 
	*/  
	}
		 
function auto_grow(element) {
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
}
	
function addc(option) {
	
	
	count=0;
//	var options = document.getElementById("select1").options;
//	alert(option);
//	for (var i=0; i < options.length; i++) {
	   
	//	if (options[i].selected) {
		//	count++;
	    
	//	}

//	}


	 strSplit = option.split(',');
 
    
    
	
 	//  alert(idx);
   //  qty = Math.random();
     var tableRef = document.getElementById('items').getElementsByTagName('tbody')[0];
 	//var rowsAdd = tableRef.insertRow(tableRef.rows.length-1);

 	 var fid = Math.random();
	 var charg = Math.random();
	 var pric = 'price'+ Number(tableRef.rows.length);
	 var qant = "quant"+Number(tableRef.rows.length);
	 
 	var markup = "<tr><td style='width:250px;'><textarea rows='1' wrap='hard' oninput='auto_grow(this)' class='form-control input-sm feet' id = '"+fid+"' name= 'feetype' form ='billsave' value = '"+strSplit[0]+"' required>"+strSplit[0]+"</textarea></td><td style='width:200px;'><input type='text'  form ='billsave' class='form-control input-sm ftype' id = '"+charg+"' name= 'charges'  value='"+strSplit[1]+"' onkeypress='return onlyNos(event,this);' required></td><td style='width:100px;'><input type='text' form='billsave' class='form-control input-sm qta' value='0' name='quantity' id = '"+qant+"' onkeypress='return onlyNos(event,this);'></td><td style='width:200px;'><input id = '"+pric+"' form ='billsave' type='text' name= 'price' class='form-control input-sm'  required></td><td><i class='fa fa-close' style='font-size:20px;color:red;'  onclick='deleteRow(this,"+fid+","+charg+")'></i></td></tr>"
 	 $('#items .tbody').append(markup);
 	 document.getElementById(fid).oninput();
 	checkhome2(cuser)
	/*
 	   var newCell = rowsAdd.insertCell();
	 
	  newCell.innerHTML="<tr class='item-row'><td class = 'item-name'><input style='width: 210px;' form ='billsave' class= 'form-control input-sm ftype'  type='text' id = 'feetype' name= 'feetype' value='"+strSplit[0]+"' required> </td></tr>";
	  
	
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td class = 'item-name'><input form ='billsave'  class= 'form-control input-sm button1 ftype' style='width: 180px;' type='text' id = '"+strSplit[1]+"'  name= 'charges' value='"+strSplit[1]+"'  required  ><i class='glyphicon glyphicon-list-alt button2' style='font-size:20px'  onclick='calc("+strSplit[1]+","+qty+"),totalIt()'></i></td></tr>";
	  
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr class='item-row'><td><input form ='billsave' readonly class= 'form-control input-sm' style='width: 200px;' type='text'  id = '"+qty+"' name= 'price'  required  ></td></tr>";
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td class=''><i class='fa fa-close' style='font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
	  
	 // validate1();
	  */
}	  

function billhist(feetype,charges,price){
			
			
			  $('#myModal').modal('show');
			  
			  
		}
	
var diffDays;
function days_between(datea, dateb) { 
	

	var toda;
		toda = new Date(datea.split('-')[2],datea.split('-')[1]-1,datea.split('-')[0]);
//	alert(dateb)
//		alert(datea)
		var date2;
		
		date2 = new Date(dateb.split('-')[2],dateb.split('-')[1]-1,dateb.split('-')[0]);
		var timeDiff = Math.abs(toda.getTime() - date2.getTime());
		
		diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
		

}
		
		var total;
		function totalIt() {
		    
			
			 
			   total=0;
			
			    var price = document.getElementsByName("price");
			    
			   
			    
				  for (var i=0;i<price.length;i++) {
				     
				   var sum =  price[i].value ;
				    
				    total += Number(sum) ;isNaN(sum)?0:sum;
				  }
				  document.getElementById("subtotal").value= total.toFixed(2);  //isNaN(total)?"0.00":total.toFixed(2);    
				  document.getElementById("total").value = total.toFixed(2);
				  
				  calctax()
				   
			  		
		}

		function calctax(){
		
			var tax = document.getElementById("tax").value;
			var discount = document.getElementById("discount").value;
			var taxp = tax/100;
		
			var disp = discount/100;
		
		var grand= Number( document.getElementById("subtotal").value) + Number(tax) - Number(discount);
		
		document.getElementById("total").value= grand.toFixed(2);
		}
		
		function clos(){
			window.location.reload();
		}

		function GetFormattedDate(date1) {
			var today = new Date(date1); 
			var dd = today.getDate(); 
			var mm = today.getMonth()+1; //January is 0! 
			var yyyy = today.getFullYear();
			if(dd<10){dd='0'+dd} 
			if(mm<10){mm='0'+mm} 
			var today = dd+'-'+mm+'-'+yyyy; 
			
			if(today=='NaN-NaN-NaN'){
				alert("You are generating a bill for outpatient!");
				today = Number(1);
				
				
				
			}


			document.getElementById("admdate").value = today;
			var yester =  yester1//document.getElementById("disdate").value;
//			alert("yesterday "+yester)
			//days_between(yester,today);

					}
					
	
function copy(pid,ft,ch,pr,quantity,prch){
	
     if(ft.length == 0 && ch.length == 0 && pr.length == 0 && quantity.length == 0){
    	 alert("No No previous bills generated for the selected patient")
     }
	document.getElementById("cdate").innerHTML = moment().format("DD-MM-YYYY hh:mm");
	//document.getElementById("hds").style.visibility = "none";

	var strSplit = pid.split('=');

 var feetype = ft.split('=');
 var charges = ch.split('=');
 var price = pr.split('=');
 var quantit = quantity.split('=');
 var prch = prch.split('=');	
 	
 for(var x=0; x<feetype.length; x++) {
	 var fid = Math.random();
	 var charg = Math.random();
	 var pric = 'price'+Number(x);
	 var qant = "quant"+Number(x);
	
		var tableRef = document.getElementById('items').getElementsByTagName('tbody')[0];
	//	var rowsAdd = tableRef.insertRow(tableRef.rows.length-1);
		
		var markup = "<tr><td style='width:250px;'><textarea rows='1' oninput='auto_grow(this)' class='form-control input-sm feet' id = '"+fid+"' name= 'feetype' form ='billsave' value = '"+feetype[x]+"' required>"+feetype[x]+"</textarea></td><td  style='width:200px;'><input type='text'  form ='billsave'  class='form-control input-sm ftype' id = '"+charg+"' name= 'charges'  value='"+charges[x]+"' onkeypress='return onlyNos(event,this);' required></td><td style='width:100px;'><input type='text' form='billsave' class='form-control input-sm qta' name='quantity' id='"+qant+"' value='"+quantit[x]+"' onkeypress='return onlyNos(event,this);'></td><td  style='width:200px;'><input id = '"+pric+"' form ='billsave' type='text' name= 'price' class='form-control input-sm' value='"+price[x]+"' required><input type='hidden' name='prch' id='prch' value='"+prch[x]+"' form='billsave' ></td><td><i class='fa fa-close' style='font-size:20px;color:red'  onclick='deleteRow(this,"+fid+","+charg+")'></i></td></tr>"
		$('#items .tbody').append(markup);
		
		document.getElementById(fid).oninput();
		checkhome2(cuser) 
      $("#select1 option").each(function(i){
     if(feetype[x] == $(this).val()){
    	 oldarr.push(feetype[x] +','+$(this).attr('titlea'))
     }       
    });		
		
		//alert(oldarr)

		var select = feetype[x]//+','+charges[x];
		

		$("#select1 option[value='"+ select +"']").attr("selected",true);
    $("#select1").selectpicker('refresh');

	/*	
  var newCell = rowsAdd.insertCell();
 
  newCell.innerHTML="<tr><td>"+feetype[x]+"</td></tr>";
  
  
  newCell = rowsAdd.insertCell();
  newCell.innerHTML="<tr><td>"+charges[x]+"</td></tr>";


  newCell = rowsAdd.insertCell();
  newCell.innerHTML="<tr><td>"+price[x]+"</td></tr>";
*/
 
 }

   document.getElementById("invoice").value = strSplit[0];
   
   document.getElementById("invoicedate").value= strSplit[1];
   
   document.getElementById("pname").value = strSplit[2];
  
   document.getElementById("pid").value = strSplit[3];
  
   document.getElementById("address").value =strSplit[4];
  
   document.getElementById("wardno").value = strSplit[5];

   document.getElementById("doctor").value = strSplit[6];
   
   document.getElementById("admdate").value = strSplit[7];
 
   document.getElementById("disdate").value = strSplit[8];
   
   document.getElementById("cashier").value = strSplit[9];
   
   document.getElementById("subtotal").value = strSplit[10];
   
   document.getElementById("tax").value = strSplit[11];
   
   document.getElementById("discount").value = strSplit[12];
   
   
   document.getElementById("total").value=strSplit[13];
  
   document.getElementById("admitno").value = strSplit[14];
   
   document.getElementById("mid").value = strSplit[15];
   document.getElementById("policyholder").value = strSplit[16];
  
   document.getElementById("policyno").value = strSplit[17];
   document.getElementById("insurancec").value = strSplit[18];
   
   document.getElementById("fileno").value = strSplit[20];

   cori(strSplit[19])
  cori1(strSplit[21])
   $('#myModal').modal('hide');  
  
}
	
function cori(value){
	
	if(value == "insurance"){
		$("#receipt").hide();
		document.getElementById("insurance").style.display ="block";
		document.getElementById("insurance1").checked = true;
		document.getElementById("pors").style.display ="block";
	}
	
	else{
		$("#receipt").show();
		document.getElementById("insurance").style.display ="none";
		document.getElementById("cash").checked = true;
		document.getElementById("pors").style.display ="none";
	}
	
}

function cori1(value){
	
	
	
	
	if(value.includes("Primary")){
     $("#ps").prop('checked','checked');
     $("#ss").hide();
     $("#sss").hide();
	}
	else{
	$("#ss").prop('checked','checked');
	$("#ps").hide();
	$("#ppp").hide();
	}
}

	
	</script>

<script type="text/javascript">
function validchk(){
	
	
	
	var d = document.getElementById("insurancec").value;
	var a = document.getElementById("mid").value;
	var b = document.getElementById("policyholder").value;
	var c = document.getElementById("policyno").value;
	
	
	if(document.getElementById("insurance1").checked == true){
		
	if((a == "NA" && b=="NA" && c=="NA" && d =="NA") || (a == "null" && b=="null" && c=="null" && d =="null") || (a.length == 0 && b.length== 0 && c.length==0 && d.length == 0) ){
		alert("Please enter Insurance details")
		return false;
	}
	else if(a == "NA" || a=="null" || a.length == 0){
		alert("Please fillout Membership ID details")
		return false;
	}
	else if(b == "NA" || b=="null" || b.length == 0){
		alert("Please fillout Policy Holder name")
		return false;
	}
	else if(c == "NA" || c == "null" || c.length == 0){
		alert("Please fillout Policy No")
		return false;
	}
	
	else if(d == "NA"|| d=="null" || d.length == 0) {
		alert("Please fillout Insurance Company details")
		return false;
	}
	else{
		
	}
	}
	

	var tableRef = document.getElementById('items').getElementsByTagName('tbody')[0];
	
	if(document.getElementById("pname").value.length == 0 ){
		alert("Please enter the Patient Name");
		return false;
	}
	
	else if(tableRef.rows.length == 0){
		alert("Please select Fee type")
		return false;
	}
	
	else{
		$input_val = true;
		$('.qta').each(function() {
		    if ($.trim($(this).val()) < 1){
		        $input_val = false;
		        return false;
		    } else {
		        // do something
		    }
		});

		if(!$input_val){
		    alert("Qty field cannot be zero");
		    return false;
		}
		else{
			doAjaxSave('billsave')
		}
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

function prec(val){
	var url = "/HMS/receipt?location="+$("#invoice").val()+"" ;
	$(val).attr("href",url)
	return true;	
}
	</script>
<script type="text/javascript">
       
       //td:nth-child(1)
       $(function () {
    	    $('#items .tbody').on('input','tr', function () {
    	    //	var id = $(this).next().text();
              var x=this.cells;
    	    
    	        //var id = $(this).closest("tr").find('td:eq(1)').attr('value');
                var string = x[1].innerHTML; 
                var string2 = x[2].innerHTML;
          //     console.log(string)
           //    console.log(string2)
    	    	 var tableRef = document.getElementById('items').getElementsByTagName('tbody')[0];
    	    	
    	     	  var pric = 'price'+ Number(tableRef.rows.length);
    	     	 var qant = "quant"+Number(tableRef.rows.length);
    	      //  var x=this.cells;
    	      
    	    
    	        //var id = $(this).closest("tr").find('td:eq(1)').attr('value');
               // var string = x[1].innerHTML;
             //alert(string)
         //    calc("0","+pric+"),totalIt()
    	    var tid =  this.getElementsByTagName('input')[0].value;
    	  //alert($(this).next('td').text()) 
    	
    	    var admspl = document.getElementById("admdate").value.split(' ');
    	   	var disspl = document.getElementById("disdate").value.split(' ');
    	  
    	   	 days_between(admspl[0],disspl[0])
    	   	
    	   	
    	              if(diffDays == 0 ){
    	           	 diffDays = 1;
    	           	
    	            }    
    	   	
    	  
    	   	  pricea = Number(x[1].getElementsByTagName('input')[0].value) *  Number(x[2].getElementsByTagName('input')[0].value);
    	   	
    	   //	var id = $(this).closest("tr").find('td:nth-child(3)').attr('value');
    	  
    	  x[3].getElementsByTagName('input')[0].value= Math.round(pricea);
    	   totalIt()
    	      
    	     });
    	    
    	});
       </script>	

<script>
function doAjaxSave(id){
	$.ajax({
   	  
		 type: $('#'+id).attr('method'),
	     url :  $('#'+id).attr('action'),
	     async : false,
	    data: $('#'+id).serialize(),
	    // dataType: "JSON",
         // contentType: "application/json; charset=UTF-8",
          
          success: function(response){
       	if(response.toString() == "success")   
          {
      	  alert("Data Saved Successfully")
      	 }
       
      	  unsaved = false;
          },
          error: function(e){
       	  
       	           alert('Error: ' + e);
       	  
       	           }
       	           });
	
	 $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
        
	       	unsaved = false;
	       });

	
	        	        }
</script>

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome2('<c:out value="${username}" />'),cori('cash')">
  <div class="wrapper">
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Invoice</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="" onclick="clos()">Home</a></li>
    </ul>
  </div>
</nav>
  <center>
</center>
	<div id="page-wrap">
        <h1>
  <a href="" target="_blank" class="btn btn-warning button2" id="disp"  onclick="disp(this,'pr')" >
	  <span class="glyphicon glyphicon-eye-open"></span> Print</a> 
<font size="5" color="#FFF">Invoice</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
		  </h1>
		<div class="form-group row" >
 <div class="col-xs-1"></div>
  <div class="col-xs-3">
    <figure>
       <img src="<c:url value='/Images/logocms.jpg'/>"/>
       </figure>
  </div>
  <div class="col-xs-3"></div>
  <div id="adbar" class="col-xs-5" contenteditable="true">
   <h4><b>LILAYI FAMILY CLINIC</b></h4>
   <h5>Plot 4014A,Lusaka-Zambia,P.O Box 32680,</h5>
   <h5>Contact: +260 962 151 935</h5>
   <h5>E-mail : lilayifamilyclinic@yahoo.com</h5>
   <h5>TPIN NO :LFC098</h5>

  
  </div>
 
</div>	

<div class="form-group row" >
		 <div class="col-xs-4"></div>
       <div class="col-xs-4">
	<b>Payment Mode: </b><input type="radio" name="type" id="cash" form="billsave" value="cash" onclick="cori(this.value)"> Cash
		 <input type="radio" name="type" form="billsave" id="insurance1" value="insurance" onclick="cori(this.value)">Insurance
		</div>
		</div>
 		
		<br>
		<form id="billsave" action ="billsave.html" method="post"></form>
		<form id="bill" action ="billhistory.html" method="get"></form>
		<div id="">
			     
		<div style="clear:both"></div>
		
		<div id="">

           <table id="meta1">
           
     
                <tr>
                    <td class="meta-head">Patient Name</td>
                    <td><input type="text" class="form-control input-sm" readonly="readonly" name="pname" id="pname" form="billsave" >
      </td>
                </tr>
                <tr>
    
                    <td class="meta-head">Patient Id</td>
                    <td><textarea id="pid" name="pid" form="billsave" readonly  required></textarea></td>
                </tr>
                <tr>
                    <td class="meta-head">Address</td>
                    <td><textarea id="address" name="address" readonly form="billsave"></textarea></td>
                </tr>
                <tr>
                    <td class="meta-head">Wardno/BedNo</td>
                    <td><textarea id="wardno" name="wardno" readonly form="billsave"></textarea></td>
                </tr>
                   <tr id="htr">
                    <td class="meta-head">Select Fee Types</td>
                    <td><select class="selectpicker form-control" id="select1" name="select1" data-width="200px" data-size="4" data-live-search="true" onchange=" myFunction1(this.options[this.selectedIndex])" multiple>
                        <option disabled>Select</option>
                         <c:forEach var="p"  items="${model.list1}">
                         <option value="${p.feetype}" data-value="${p.feetype},${p.charges}" titlea="${p.charges}">${p.feetype}</option>
                         </c:forEach>
                           </select>
                           </td>
                </tr>
                <tr>
                    <td class="meta-head">Time</td>
                    <td><span id="cdate"></span></td>
                </tr>
                

            </table>
		
 <input type="hidden" name="pname" id="pnameH" form="bill" >
 <input type="hidden" name="pid" id="pidH" form="bill" >
 <input type="hidden" name="fileno" id="fileno" form="billsave">
 
            <table id="meta">
                <tr>
                    <td class="meta-head">Invoice #</td>
                    <td><textarea id="invoice" readonly name="invoice" form="billsave" readonly></textarea></td>
                </tr>
                <tr>

                    <td class="meta-head">Invoice Date</td>
                    <td><textarea id="invoicedate" readonly  name="invoicedate" form="billsave" readonly></textarea></td>
                </tr>
                <tr>
                    <td class="meta-head">Doctor</td>
                    <td><textarea id="doctor" readonly name="doctor" form="billsave"></textarea></td>
                </tr>
                <tr>
                    <td class="meta-head">Admit Number</td>
                    <td><textarea id="admitno" readonly name="admitno" form="billsave"></textarea></td>
                </tr>
                <tr>
                    <td class="meta-head">Admission Date</td>
                    <td><textarea id="admdate" readonly name="admdate" form="billsave"></textarea></td>
                </tr>
                <tr>
                    <td class="meta-head">Discharge Date</td>
                    <td><textarea id="disdate" readonly name="disdate" form="billsave" readonly></textarea></td>
                </tr>
                <tr>
                    <td class="meta-head">Cashier</td>
                    <td><textarea id="cashier" readonly name="cashier" form="billsave"></textarea></td>
                </tr>

            </table>
		<br><br>
		</div>
		
		<br>	
			<div class="form-group row" id="pors">
		 <div class="col-xs-4"></div>
       <div class="col-xs-4">
	<input type="radio" name="ps" id="ps" form="billsave" value="Primary" ><span id="ppp">Primary</span>
	<input type="radio" name="ps"  id="ss" form="billsave" value="Secondary" ><span id="sss">Secondary</span>
		</div>
		</div>
		<div class="form-group row" id="insurance">
       <div class="col-xs-4">
        
		<table  style="width : 300px;">
		<tr>
		<td class="head">Insurance Company</td>
		<td>
		<input type="text" class="foc"  name="insurancec" id="insurancec" form="billsave">
		</td>
		</tr>
		<tr>
		<td class="head">Membership ID</td>
		<td><input type="text" class="foc"  name="mid" id="mid" form="billsave"></td>
		</tr>
		<tr>
		<td class="head">Policy Holder</td>
		<td><input type="text" class="foc" name="policyholder" id="policyholder" form="billsave"></td>
		</tr>
		<tr>
		<td class="head">Policy No</td>
		<td><input class="foc" type="text" name="policyno" id="policyno" form="billsave"></td>
		</tr>
		
		
		</table>
		</div>
		</div>
		
		<div class="container">    
		<table class="table table-striped table-bordered table-hover table-condensed" style="width: 780px; "  id="items">
		<thead>
		  <tr>
		      <th style="width:250px;">Fee Type</th>
		      <th style="width:200px;">Charges per Qty</th>
		      <th style="width:100px;">Qty</th>
		      <th style="width:200px;">Total Charges</th>
		      <th style="width:30px;"></th>
		      
		  </tr>
		  </thead>
		<tbody class="tbody">
		 
		</tbody>
	</table>
		</div>
		

	<table id="meta2">
	  <tr>
		      
		      <td colspan="" class="total-line">Subtotal</td>
		      <td class="total-value"><input type="text" readonly="readonly" style="width:200px" class="form-control input-sm" id="subtotal" name="subtotal" form="billsave"></td>
		  </tr>
		  <tr>

		      
		      <td colspan="" class="total-line">Tax</td>
		      <td class="total-value"><input type="number" min =0 max="100" class="form-control input-sm" style="width:200px" onkeyup='calctax()' value="0.00" name="tax" id="tax" form="billsave"></td>
		  </tr>
		  <tr>
		     
		      <td colspan="" class="total-line">Discount</td>

		      <td class="total-value"><input type="text" id="discount" name="discount" class="form-control input-sm" style="width:200px" onkeyup='calctax()' value="0.00" form="billsave"></td>
		  </tr>
		  <tr>
		     
		      <td colspan="" class="total-line balance">Total</td>
		      <td class="total-value balance"><input type="text"  readonly="readonly" id="total" style="width:200px" name="total" class="form-control input-sm due" form="billsave"></td>
		  </tr>
	</table>
	 <div class="col-xs-1"></div>
	<a href="#" id="intbill" target="_blank" class="btn btn-warning button1"  onclick="return disp(this,'ir')">Consolidated Invoice</a>
	<a href='#' id="receipt" target="_blank" class="btn btn-warning button2" style="margin-right:30px;"  onclick="return prec(this)">Print Receipt</a>
	
	<br><br>

<div class="form-group row" >
  <div class="col-xs-1"></div>
 
   <div class="col-xs-3">
   <!--  <span id="hds">Signature ____________</span>-->
</div>
</div>
  	
<button type="button"  id="bouton-contact" class="bouton-contact" onclick="return validchk();" form="billsave" ><span id="prgen">Generate Bill</span></button>

</div>
   
     <div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" data-backdrop="static">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
       <form id="form1" action="" method="get">  
  
        <h1> View Previous Bills
            <button type="button" id="close" class="btn btn-warning button2" onclick="window.close()">Close</button>    
      
        </h1>
        
       <br>
      <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 750px; "   id="myTable1">
    <thead class="thead1">
      <tr>
        <th width="150px;">Bill No</th>
        <th width="150px;">Bill Date</th>
        <th width="150px;">Patient Name</th>
        <th width="150px;">File No</th>
        <th width="150px;">View Bill</th>
        
       
      </tr>
    </thead>
    <tbody class="tbody1">
 <c:forEach var="p1"  items="${model.list4}">
    <tr>
    <td width="150px;">${p1.invoice}</td>
    <td width="150px;">${p1.invoicedate}</td>
    <td width="150px;">${p1.pname}</td>
     <td width="150px;">${p1.fileno}</td>
     <td width="150px;"><i class="fa fa-eye" style="color:#00b300" onclick="copy('${p1.invoice}=${p1.invoicedate}=${p1.pname}=${p1.pid}=${p1.address}=${p1.wardno}=${p1.doctor}=${p1.admdate}=${p1.disdate}=${p1.cashier}=${p1.subtotal}=${p1.tax}=${p1.discount}=${p1.total}=${p1.admitno}=${p1.mid}=${p1.policyholder}=${p1.policyno}=${p1.insurancec}=${p1.type}=${p1.fileno}=${p1.ps}','${p1.feetype}','${p1.charges}','${p1.price}','${p1.quantity}','${p1.prch}')"></i></td>
 
   </tr>
     </c:forEach>
    </tbody>
    </table>
    </div>
    
    
   
 <button type="" class="bouton-contact" onclick="" ></button>
       </form>
       </div>
       
       
  
       </div>
</div>
</div>
<c:forEach var="p"  items="${model.list2}">
<script>

check('<c:out value="${p.invoice}" />');
</script>
</c:forEach>


<c:forEach var="p"  items="${model.list1}">
<!--
<script>

add('<c:out value="${p.feetype}" />','<c:out value="${p.charges}" />');
</script>  -->
</c:forEach>
<c:forEach var="p"  items="${model.list4}">
<script>

billhist('<c:out value="${p.feetype}" />','<c:out value="${p.charges}" />','<c:out value="${p.price}" />');
</script>
</c:forEach>
 
</body>
</html>