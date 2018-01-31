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
		document.getElementById("cdate").innerHTML = moment().format("DD-MM-YYYY hh:mm");
		
		    //   document.getElementById("adbar").innerHTML = tpin; 
		
		 if(user.includes("[ROLE_FDESK]")){
		
			var url = "/HMS/frontdesk" ;
			$("#back").hide();
			
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
			 
			 
			 $('.ftype').prop('readonly', true);
			
			 
		}
		else if(user.includes("[ROLE_ASSISTANT]")){
	
			 var url = "/HMS/frontdesk" ;
			 $("#back").hide();
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
			
			 
			 $('.ftype').prop('readonly', true);
			 document.getElementById("bouton-contact").disabled = false;
		}
		 
		else if(user.includes("[ROLE_Accounts Admin]")){
			
			 var url = "/HMS/frontdesk" ;
				
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
			 document.getElementById("bouton-contact").disabled = false;
		}
		else{
			 var url = "/HMS/home" ;
			
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
			 document.getElementById("bouton-contact").disabled = false;
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
	
	
	var oldarr = [];
    var newarr = [];
    

    function deleteRow(r,fee,charge) {
    	
    	var myname = document.getElementById(fee).value

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
        //validate1();
    }

	function check(str){
		
		var n = moment().format("DD-MM-YYYY");
		
		if (str == "" || str == null){
	    	
			
			
			var id = 1; 
			var str1 = "In-";
		    var m = moment().format("DDMMYYYY-");
		   
	
			var res = str1.concat(m);
	
			var res1 = res.concat(id);

		
			document.getElementById("invoice").value = res1;
			document.getElementById("invoicedate").value = n;
		//	document.getElementById("disdate").value = n;
	    	//validate1();
		}
		else {
	
			
			str = Number(str) + 1;
			var str1 = "In-";
			var m = moment().format("DDMMYYYY-");
			var str3 = str;
		
			var res = str1.concat(m);
			var res1 = res.concat(str3);
			
			document.getElementById("invoice").value = res1;
			document.getElementById("invoicedate").value = n;
		//	document.getElementById("disdate").value = n;
		//	alert(res1);
		
//		validate1();
		}
	}

	function addcname(){
		
		var cid = document.getElementById("pname1").value; 
		var str = cid.split('=');
	
		document.getElementById("pname").value=str[0];
		document.getElementById("pid").value=str[1];
		
		document.getElementById("pnameH").value=str[0];
		document.getElementById("pidH").value=str[1];
		
		//document.getElementById("address").value=str[2];
	
		document.getElementById("wardno").value=str[3];
		document.getElementById("admdate").value = str[4];
		document.getElementById("doctor").value=str[5];
		document.getElementById("fileno").value=str[6];
		document.getElementById("admitno").value=str[7];
		
		 document.getElementById("bc").disabled = false;
		
		 doAjaxPost(str[1],str[6]);
	
		 if(str[4].length == 0 ){
			 alert("You are generating a bill for Out Patient!");
			 document.getElementById("admdate").value =  moment().format("DD-MM-YYYY");
			 document.getElementById("disdate").value =  moment().format("DD-MM-YYYY");
		 }
		 
	
		 
		 
	//	days_between(str[4],document.getElementById("disdate").value);
	
	//GetFormattedDate(str[4]);
		
		//calc(charge1,qty);
		
	//	totalIt();
		
		
	}
	
	var count;
	

	
	var pricea;
	
	function calc(tid,qty,qant) {
		var admspl = document.getElementById("admdate").value.split(' ');
		var disspl = document.getElementById("disdate").value.split(' ');
		
		 days_between(admspl[0],disspl[0])
	
		//alert(diffDays);
	           if(diffDays == 0 ){
            	 diffDays = 1;
            	
             }    
             
      
		  pricea = Number(document.getElementById(qant).value) *  Number(document.getElementById(tid).value);
	
		  
		  document.getElementById(qty).value= Math.round(pricea);//isNaN(price)?"0.00":price.toFixed(2);
		 
		  
		}

	
		// from http://www.mediacollege.com/internet/javascript/number/round.html
	
		
		var charge1;
         var strSplit;
		var qty;
		
		
function myFunction1(getval) {
	var myname = getval.getAttribute('data-value'); 
    if ($("#select1 option").length == 1) {
        oldarr = [];
        oldarr.push($("#select1 option:selected").attr("data-value"));
      
        addc($("#select1 option:selected").attr("data-value"));
    }
    else {
        newarr = [];
        $("#select1 option:selected").each(function(i){
            newarr.push($(this).attr("data-value"));
            console.log(newarr)
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
		
	
			var tableRef = document.getElementById('items').getElementsByTagName('tbody')[0];
			var rowsAdd = tableRef.insertRow();
			
			var qant = 'quant'+Number(tableRef.rows.length - 1);
			
            strSplit = option.split(',');
         
         
            
			var fee1 = Math.random();
            var fee = 	Math.random();
           
		     qty = Math.random();
		     
			
		 	 var newCell = rowsAdd.insertCell();
	         newCell.innerHTML="<tr class='item-row'><td class = 'item-name'><textarea form ='billsave' class= 'form-control input-sm ftype feet' rows='1' id = '"+fee1+"' wrap='hard' name= 'feetype' value='"+strSplit[0]+"' oninput='auto_grow(this)' required>"+strSplit[0]+"</textarea></td></tr>";
			 newCell.style.width ='250px';
			 document.getElementById(fee1).oninput();
			 newCell = rowsAdd.insertCell();
			 newCell.innerHTML="<tr><td class =''><input form ='billsave' type='text' class= 'form-control input-sm ftype'  onkeypress='return onlyNos(event,this);' style='width: 150px;' type='text' id = '"+fee+"'  name= 'charges' value='"+strSplit[1]+"'  required oninput='calc(this.id,"+qty+","+Number(tableRef.rows.length - 1)+"),totalIt()' ></td></tr>";
			 newCell.style.width ='200px';
			  
			 newCell = rowsAdd.insertCell();
			 newCell.innerHTML="<tr class=''><td><input form ='billsave' class= 'form-control input-sm qta' onkeypress='return onlyNos(event,this);' type='text'  id = '"+Number(tableRef.rows.length - 1)+"' name= 'quantity' value ='0' oninput='calc("+fee+","+qty+",this.id),totalIt()' required ></td></tr>";
			 newCell.style.width ='100px';
			 
			 newCell = rowsAdd.insertCell();
			 newCell.innerHTML="<tr class=''><td><input form ='billsave' readonly class= 'form-control input-sm' type='text'  id = '"+qty+"' name= 'price'  required  ></td></tr>";
			 newCell.style.width ='200px';
			  
			 newCell = rowsAdd.insertCell();
			 newCell.innerHTML="<tr><td class=''><i class='fa fa-close' style='font-size:20px;color :red;'  onclick='deleteRow(this,"+fee1+","+fee+")'></i></td></tr>";		 
			 // validate1();
			 
			 checkhome2(cuser)
			  
		}
function billhist(feetype,charges,price){
			
			var tableRef = document.getElementById('items').getElementsByTagName('tbody')[0];
			var rowsAdd = tableRef.insertRow(tableRef.rows.length-1);
			var qant = "quant"+Number(tableRef.rows.length-1);
		 	  
		 
			
		 	  var newCell = rowsAdd.insertCell();
			 
			  newCell.innerHTML="<tr class='item-row'><td width ='';><input readonly='readonly' form ='billsave' class= 'form-control input-sm'  type='text' id = 'feetype' name= 'feetype' value='"+feetype+"' required> </td></tr>";
			  
			
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr class = 'item-row'><td width ='';><input form ='billsave' class= 'form-control input-sm cost ftype' style='width: 210px;' type='text'  id = '"+charges+"' onkeyup ='calc("+charges+","+qty+")' name= 'charges' readonly='readonly' value='"+charges+"'  required  ></td></tr>";
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr class='item-row'><td width ='';><input form ='billsave' readonly = 'readonly' class= 'form-control input-sm price ftype' style='width: 210px;' type='text'  id = '"+qty+"' name= 'price' value='"+price+"' required  ></td></tr>";
			  
			  $('#myModal').modal('show');
			  
			  
		}
		

function clos(){
	window.location.reload();
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
		
		var grand= Number(total) + Number(tax) - Number(discount);
		
		document.getElementById("total").value= grand.toFixed(2);
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
//	alert("yesterday "+yester)
	//days_between(yester,today);

			}
			
function copy(pid,ta){

	var strSplit = pid.split('=');
 
   
   
   document.getElementById("invoice").value = strSplit[0];
   
   document.getElementById("invoiceedate").value= strSplit[1];
   
   document.getElementById("pname").value = strSplit[2];
   
   document.getElementById("pid").value = strSplit[3];
  
   document.getElementById("address").value =strSplit[4];
  
   document.getElementById("ward").value = strSplit[5];
   
   document.getElementById("doctor").value = strSplit[6];
  
   document.getElementById("admdate").value = strSplit[7];
   
   document.getElementById("disdate").value = strSplit[8];
   
   document.getElementById("cashier").value = strSplit[9];
   
   document.getElementById("subtotal").value = strSplit[13];
   
   document.getElementById("tax").value = strSplit[14];
   
   document.getElementById("discount").value = strSplit[15];
   
   
   document.getElementById("total").value=strSplit[16];
   
 
	
	
   
}



function validate1(){
	

	
	//checkhome2(cuser)
}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/billgen.html";
	}
}

function cori(value){
	
	if(value == "insurance"){
		document.getElementById("insurance").style.display ="block";
		document.getElementById("pors").style.display ="block";
	}
	else{
		document.getElementById("cash").checked = true;
		document.getElementById("insurance").style.display ="none";
		document.getElementById("pors").style.display ="none";
	}
}

function cori1(value){
	
	if(mip[0]  == "NA" || insp[0] == "NA" || php[0] == "NA" || pnop[0] == "NA"||mip[0]  == "null" || insp[0] == "null" || php[0] == "null" || pnop[0] == "null"){
	  document.getElementById("ss").style.visibility ="hidden" ;
	  document.getElementById("sss").style.visibility = "hidden";
	  
	}
	else{ 
	  document.getElementById("ss").style.visibility = "visisble";
	  document.getElementById("sss").style.visibility = "visisble";
	}
	var ma,mb,mc,md;
	ma = document.getElementById("mid").value;
	mb = document.getElementById("insurancec").value;
	
	
	if(value == "Primary"){
      document.getElementById("mid").value = mip[0];
      document.getElementById("insurancec").value = insp[0];
      document.getElementById("policyholder").value = php[0];
      document.getElementById("policyno").value = pnop[0];
	}
	else{
		document.getElementById("mid").value = mip[1];
		document.getElementById("insurancec").value = insp[1];
		document.getElementById("policyholder").value = php[1];
		document.getElementById("policyno").value = pnop[1];
	}
}


function disp(id){
	
	
	var tableRef = document.getElementById('items').getElementsByTagName('tbody')[0];
	
	if(tableRef.rows.length == 0){
		alert("Please select Fee type")
		return false;
	}
	else{
		var url = "/HMS/billpdf?location="+$("#invoice").val()+"" ;
		$(id).attr("href",url)
		return true;
	}
	/*
	$("#htr").hide();
	
	$("#items th:eq(4), #items td:last-child").hide();
	//$('#items tbody tr td').find ('input:text').replaceWith(function(){
	//    return this.value;
//	});
	//$("#items td").css(" white-space","nowrap");
    document.getElementById("prgen").style.visibility = "hidden";
	document.getElementById("chb").innerHTML = "Invoice";
	document.getElementById("disp").style.visibility = "hidden";
	//document.getElementById("hds").style.visibility = "block";
	document.getElementById("newt").style.visibility = "hidden";
	window.print();
	document.getElementById("chb").innerHTML = "Bill Generation";
	document.getElementById("disp").style.visibility = "visible";
	//document.getElementById("hds").style.visibility = "none";
	document.getElementById("newt").style.visibility = "visible";
	$("#items th:eq(4), #items td:last-child").show();
	  document.getElementById("prgen").style.visibility = "visible";
	  $("#htr").show();
	  */
}

function openmd(value){
	
	if(value.length != 0 && value != "null"){
	alert(value)
	window.close();
		//window.location = "/HMS/billgen.html";
		}
}
	</script>
	
<script type="text/javascript">
var yester1;
var mip,mis,php,phs,pnop,pnos,insp,inss;

       function doAjaxPost(user2,file) {
    	   // get the form values

    	      // var file = $('#fileno').val();
           

    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/billgen4/"+user2+"/"+file+"",
	          
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	      
	        	   $.each(response.list6, function(index, datec) {
	                   //to print name of employee
	                 
	                   document.getElementById("address").value = datec.address;
	              
	               
	                   mip = datec.mid.split("=");
	                   php = datec.policyholder.split("=");
	                  
	                   pnop = datec.policyno.split("=");
	                  
	                   insp = datec.insurancec.split("=");
	            
	                   cori1('Primary')
	                
	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               }),   
	        
	        	   $.each(response.list8, function(index, datea) {
	        		//   alert("dc"+datea.disdate)
	                   //to print name of employee
	               
	               document.getElementById("disdate").value = datea.disdate ;
                      yester1 = datea.disdate;
                     
                     
                   
	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               }),   

	        	   $.each(response.list9, function(index, datea) {
	                   //to print name of employee
	           
	        		  // if(document.getElementById("doctor").length == 0){
	                         
	        			   document.getElementById("doctor").value = datea.dname;
	                    	  
	                    //  }
	                   

	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               });  
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
	        	        	   
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
		alert("Please fillout Policy Holder details")
		return false;
	}
	else if(c == "NA" || c == "null" || c.length == 0){
		alert("Please fillout Policy No details")
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
	
	if(document.getElementById("pname1").value =="select" ){
		alert("Please select the Patient Name");
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
function fill(id){
tpin = document.getElementById(id).innerHTML;

}
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
<style type="text/css">
input .ftype{
    word-wrap: break-word;
    word-break: break-all;
    height: 80px;
}


</style>

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome2('<c:out value="${username}" />'),cori('cash'),date()">


<sec:authorize access="hasRole('[ROLE_FDESK]')" var="haRoleUser"></sec:authorize>

  <div class="wrapper">
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Bill Generation</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
    <br>
    <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e' id="back"  onclick="window.location.href='/HMS/frontdesk';"></i>
  </div>
</nav>
  <center>
</center>
	<div id="page-wrap">
        <h1>
	    <button type="submit" formtarget ="_blank" class="btn btn-warning button1" id="bc" form="bill" disabled>
	  <span class="glyphicon glyphicon-eye-open"></span> View Previous Bills</button>
<font size="5" color="#FFF" style="margin-left:-50px; "><span id="chb">Bill Generation</span></font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i>
		  <a href="" target="_blank" class="btn btn-warning button2" id="disp"  onclick="return disp(this)" >
	  <span class="glyphicon glyphicon-eye-open"></span> Print</a> 
		 </h1>
		
		
		<form id="billsave" action ="billsave.html" method="post"></form>
		<form id="bill" target="_blank" action ="billhistory.html" method="get"></form>
		
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
		<div id="">
		
		<div style="clear:both"></div>
		
		
		<div id="">

           <table id="meta1">
           
     
                <tr>
                    <td class="meta-head">Patient Name</td>
                    <td><select class="selectpicker form-control" data-size="5" data-width="200px" data-live-search="true" name = "pname1" id ="pname1" onchange="addcname()" form ="billsave"   required>
                        <option value="select">Select</option>
                         <c:forEach var="p"  items="${model.list3}">
                          <option data-subtext="${p.fileno},${p.admitno}" value="${p.pname}=${p.pid}=${p.address}=${p.wardno}=${p.admdate}=${p.dname}=${p.fileno}=${p.admitno}" >${p.pname}</option>
                          </c:forEach>
                           </select>
      </td>
                </tr>
                <tr>
  
                    <td class="meta-head">Patient Id</td>
                    <td><textarea id="pid" name="pid" form="billsave" readonly required></textarea><input type="hidden" name="pname" id="pname" form="billsave" ></td>
                </tr>
                <tr>
                    <td class="meta-head">Address</td>
                    <td><textarea id="address" name="address" readonly form="billsave"></textarea></td>
                </tr>
                <tr>
                    <td class="meta-head">Wardno/BedNo</td>
                    <td><textarea readonly id="wardno" name="wardno" form="billsave"></textarea></td>
                </tr>
                <tr id="htr">
                    <td class="meta-head">Select Fee Types</td>
                    <td><select class="selectpicker form-control" id="select1" name="select1" data-width="200px" data-size="4" data-live-search="true" onchange=" myFunction1(this.options[this.selectedIndex])" multiple>
                        <option disabled>Select</option>
                         <c:forEach var="p"  items="${model.list1}">
                         <option value="${p.feetype}" data-value="${p.feetype},${p.charges}"  >${p.feetype}</option>
                         </c:forEach>
                           </select>
                           </td>
                </tr>
                  <tr>
                    <td class="meta-head">Time</td>
                    <td><span id="cdate"></span></td>
                </tr>

                <input type="hidden" name="fileno" id="fileno" form="billsave">

            </table>
		
       <input type="hidden" name="pname" id="pnameH" form="bill" >
 <input type="hidden" name="pid" id="pidH" form="bill" >

            <table id="meta">
                <tr>
                    <td class="meta-head">Invoice #</td>
                    <td><textarea id="invoice" name="invoice" form="billsave" readonly></textarea></td>
                </tr>
                <tr>

                    <td class="meta-head">Invoice Date</td>
                    <td><textarea id="invoicedate"  name="invoicedate" form="billsave" readonly></textarea></td>
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
                    <td><textarea id="disdate" name="disdate" readonly form="billsave" readonly></textarea></td>
                </tr>
                <tr>
                    <td class="meta-head">Cashier</td>
                    <td><textarea id="cashier" name="cashier"  form="billsave">${pageContext.request.userPrincipal.name}</textarea></td>
                </tr>

            </table>
		
		</div>
		<br>
		
		<div class="form-group row" id="pors">
		 <div class="col-xs-4"></div>
       <div class="col-xs-4">
	<input type="radio" name="ps" id="ps"  value="Primary" onclick="cori1(this.value)" checked> Primary
	<input type="radio" name="ps"  id="ss" value="Secondary" onclick="cori1(this.value)"><span id="sss">Secondary</span>
		</div>
		</div>
		
		<div class="form-group row" id="insurance">
       <div class="col-xs-4">
        
		<table  style="width : 300px;">
		<tr>
		<td class="head">Insurance Company</td>
		<td><input type="text" class="foc" name="insurancec" id="insurancec" form="billsave" required ></td>
		</tr>
		<tr>
		<td class="head">Membership ID</td>
		<td><input type="text" class="foc"  name="mid" id="mid" form="billsave" required></td>
		</tr>
		<tr>
		<td class="head">Policy Holder</td>
		<td><input type="text" class="foc" name="policyholder" id="policyholder" form="billsave" required></td>
		</tr>
		<tr>
		<td class="head">Policy No</td>
		<td><input class="foc" type="text" name="policyno" id="policyno" form="billsave" required></td>
		</tr>
		
		
		</table>
		</div>
		</div>
		
	
	</div>
	<br>
	<br>

	
	
		<div class="container">    
		<table class="table table-striped table-fixed table-bordered table-hover table-condensed" style="width: 780px;"  id="items">
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
	<button type="button" id="newt" class="btn btn-warning button1" onclick="clos()">New</button>
<button type="button"  disabled id="bouton-contact" class="bouton-contact" onclick="return validchk();" form="billsave" ><span id="prgen">Generate Bill</span></button>
</div>
   
     <div class="container">
 
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
    
      <!-- Modal content-->
    <!--  <div class="modal-content"> --> 
       
    <!--<div class="modal-body">-->
       <form id="form1" action="" method="get">  
  
        <h1> View Previous Bills
    <!--      <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button> -->
        </h1>
        
       <br>
      <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 750px; " id="myTable">
    <thead class="thead1">
      <tr>
        <th class="">Bill No</th>
        <th class="">Bill Date</th>
        <th class="">Patient Name</th>
        <th class="">View Bill</th>
        
       
      </tr>
    </thead>
    <tbody class="tbody1">
 <c:forEach var="p1"  items="${model.list4}">
    <tr>
    <td width="185px;">${p1.invoice}</td>
    <td width="185px;">${p1.invoicedate}</td>
    <td width="185px;">${p1.pname}</td>
    <td width="185px;"><i class="fa fa-pencil" style="color:#00b300" onclick="copy('${p1.invoice}=${p1.invoicedate}=${p1.pname}=${p1.pid}=${p1.address}=${p1.wardno}=${p1.doctor}=${p1.admdate}=${p1.disdate}=${p1.cashier}=${p1.subtotal}=${p1.tax}=${p1.discount}=${p1.total}','${p1.feetype},${p1.charges},${p1.price}')"></i></td>
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
<c:forEach var="p"  items="${model.list2}">
<script>

check('<c:out value="${p.invoice}" />');
</script>
</c:forEach>


<c:forEach var="p"  items="${model.list4}">
<script>

billhist('<c:out value="${p.feetype}" />','<c:out value="${p.charges}" />','<c:out value="${p.price}" />');
</script>
</c:forEach>
<script>

openmd('<c:out value='${model.note}'/>')


</script>
 
 <script type="text/javascript">
 
function myFunction(option) {
	
    
}
</script>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>

</body>
</html>