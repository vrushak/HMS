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

<link rel='stylesheet' href='<c:url value="/resources/css/appointment.css" />' type='text/css' media='all' />
<link rel='stylesheet' href='<c:url value="/resources/css/print.css" />' type='text/css' media='print' />

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
/*
	 CSS-Tricks Example
	 by Chris Coyier
	 http://css-tricks.com
*/

* { margin: 0; padding: 0; }
body { font: 14px/1.4 Georgia, serif; }

.wrapper {
  height : auto;
  background: #eaeaea;  

  font-family: 'Open Sans', sans-serif;
}
#page-wrap { width: 800px; margin:auto; overflow: hidden; background: #fff;  }

textarea { border: 0; font: 14px Georgia, Serif; overflow: hidden; contenteditable:true; resize: none; }
table { border-collapse: collapse; }
table td, table th { border: 1px solid black; padding: 5px; }

#header { height: 15px; width: 100%; margin: 20px 0; background: #222; text-align: center; color: white; font: bold 15px; padding: 8px 0px; }

#address1 { width: 250px; height: 70px; float: left; }
#customer { overflow: hidden; }
#ftype{
	width : 600px;
}
#customer-title { font-size: 20px; font-weight: bold; float: left; }

#meta { margin-right:10px; bottom: 40px; width: 300px; float: right; }
#meta td { text-align: right;  }

#meta td.meta-head { text-align: left; background: #eee; }
#meta td textarea { width: 100%; height: 20px; text-align: right; }

#meta1 { margin-left:10px; margin-bottom: 40px; width: 300px; float: left; }
#meta1 td { text-align: right;  }
#meta1 td.meta-head { text-align: left; background: #eee; }
#meta1 td textarea { width: 100%; height: 20px; text-align: right; }
#meta1 td #address { width: 100%; height: 30px; text-align: right; }
#items { clear: both; margin: 30px 0 0 0; border: 1px solid black; }
#items th { background-color: #009999;   }
#items textarea { width: 300px; height: 50px; }
#items td.balance { background: #eee; }
#items td.blank { border: 0; }


#meta2 { margin-top: 0px; width: 300px; float: right; margin-right: 10px; }
#meta2 td .total-value { text-align: right;}
#meta2 td.meta-head { text-align: left; background: #eee;width: 70px; }
#meta2 td textarea { width: 100%; height: 20px; text-align: right; }




#terms { text-align: center; margin: 5px 0 0 0; width :500px; }
#terms h5 { text-transform: uppercase; font:24px Helvetica, Sans-Serif; letter-spacing: 10px; border-bottom: 1px solid black; padding: 0 0 8px 0; margin: 0 0 8px 0; }
#terms textarea { width: 100%; text-align: left;}

textarea:hover, textarea:focus, #items td.total-value textarea:hover, #items td.total-value textarea:focus, .deleter:hover { background-color:#EEFF88; }



#myTable {
	margin-left :10px;
    border-collapse: collapse;
  border : 1px ridge black;
    width: 100%;
     
    
    }
#myTable th {
    background-color: #009999;
    
    color: white;
  
}
 .tbody{
height:300px;
overflow-y:auto;
overflow-x:hidden;


 }
.thead, .tbody{
    
    display: block;
  }

#myTable tr td{
	
border : 1px ridge black;
}
span.slno{
	
	float : right;
}

span.killer {
    float: left;
    margin-left: 0.1em;
    color: red;
    font-weight: bold;
    font-size : 20px; 
}
#page-wrap h1 {
  font-size: 18px;
  background: #009999 none repeat scroll 0% 0%;
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
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
.button2{
	float : right;
}
.button1{
	float : left;
}

#gtot{
	margin-left  :10px;
}
#pname{
margin-left  :40px;
}
#treat{
margin-left  :40px;
}
#diagnosis{
margin-left  :40px;
}
#caseh{
margin-left  :40px;
}
#remarks{
margin-left  :40px;
}
#dname{
margin-left  :40px;
}
  #logotext{
  margin-left:80px; 
  }
  
   #logotext1{
  margin-left:80px; 
  }
  

  
  .underline{
   margin-left : 10px;
   margin-right : 10px;
    border-bottom: 1px solid black;
    
    display: block;
}
  #billed{
  margin-left : 10px;
  }

.notes {
  background-attachment: local;
  background-image:
    linear-gradient(to right, white 10px, transparent 10px),
    linear-gradient(to left, white 10px, transparent 10px),
    repeating-linear-gradient(white, white 30px, #ccc 30px, #ccc 31px, white 31px);
  line-height: 30px;
  padding: 8px 10px;
}
.notes1 {
  background-attachment: local;
  background-image:
    linear-gradient(to right, white 10px, transparent 10px),
    linear-gradient(to left, white 10px, transparent 10px),
    repeating-linear-gradient(white, white 30px, #ccc 30px, #ccc 31px, white 31px);
  line-height: 30px;
  padding: 8px 10px;
}

#cont{

  width :800px;  
  
  height : auto;
  }
  
  #cont2{
  height:auto;
  width :800px;  
  
 
  }
  
</style>


<script type="text/javascript">
function goBack() {
    window.history.back();
}

function checkhome(user){
	
	if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_ASSISTANT]")){
	
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_DOCTOR]")){
		
		 var url = "/HMS/doctor1" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}

	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
}

function disp(){
	AutoGrowTextArea(document.getElementById("pname"))
	AutoGrowTextArea(document.getElementById("remarks"))
	document.getElementById("fff").style.display = "none";
	document.getElementById("fn").style.display = "none";	
	document.getElementById("disp").style.display = "none";
	
	document.getElementById("sign").style.display = "hidden";
	
   document.getElementById("hideselect").style.display = "none";
	
	
	window.print();
	
	document.getElementById("hideselect").style.display = "block";
	document.getElementById("disp").style.display = "block";
	document.getElementById("redate").style.visibility = "visible";
	document.getElementById("pname").style.display = "visible";
	document.getElementById("treat").style.display = "visible";
	document.getElementById("diagnosis").style.display = "visible";
	document.getElementById("caseh").style.display = "visible";
	document.getElementById("remarks").style.display = "visible";
	document.getElementById("dname").style.display = "visible";
	document.getElementById("ss").style.display = "visible";
	
	document.getElementById("sign").style.display = "visible";
	document.getElementById("pid").style.display = "visible";
	
	//document.getElementById("myname").select.display = "hidden";

}


	

function clos(){
	window.location.reload();
}
		
		var diffDays;
		
		 function myKeyPress(e){
			    var keynum;

			    if(window.event) { // IE                    
			      keynum = e.keyCode;
			    } else if(e.which){ // Netscape/Firefox/Opera                   
			      keynum = e.which;
			    }
			   

			if(String.fromCharCode(keynum) == 'z'){
			addc();
			}
			
			else if (String.fromCharCode(keynum) == 't'){
				totalIt();
			}
			
			else if (String.fromCharCode(keynum) == 'r'){
				location.href = 'http://localhost:8085/shakthisteel/billgen.html'
			}
			    else{
			    
			    }
			  }
		
function GetFormattedDate(date1) {
	var today = new Date(date1); 
	var dd = today.getDate(); 
	var mm = today.getMonth()+1; //January is 0! 
	var yyyy = today.getFullYear();
	if(dd<10){dd='0'+dd} 
	if(mm<10){mm='0'+mm} 
	var today = dd+'-'+mm+'-'+yyyy; 
	document.getElementById("admdate").value = today
	var yester = document.getElementById("disdate").value;
	days_between(yester,today);
	
			}
			


function cpyfile(getval){
	
	
	var myname = getval.getAttribute('data-value'); 	
	//var str = document.getElementById("pname").getAttribute("data-value");
//	alert(str);
	
	

	var strSplit = myname.split('=');

	document.getElementById("fn").value = strSplit[0];
	document.getElementById("docid1").value = strSplit[1];
//	document.getElementById("pid").value = strSplit[2];
}



	function dispspan(){
	
		document.getElementById("inv").style.display = "none";
		document.getElementById("col-xs-5").style.display = "none";
		
	}
	
	function run() {
	    if(document.getElementById("myname").value == "new"){
	    	document.getElementById("saveref").reset();
	    	$("#pid").selectpicker("refresh");
	    }
	    else{
	 	   var str = document.getElementById("myname").value;
		   var strSplit = str.split('=');
		  //alert(strSplit);
		
		document.getElementById("redate").value = strSplit[0];
		document.getElementById("pname").value = strSplit[1];
		//alert(strSplit[2])
		if(strSplit[2] == "active") {
			
			document.getElementById('treat').checked=true;
		}
	//	document.getElementById("treat").value = strSplit[2];
				
		if(strSplit[3] == "active"){
					
					document.getElementById('diagnosis').checked=true;
				}
		document.getElementById("diagnosis").value = strSplit[3];
		
		if(strSplit[4] == "active"){
			
			document.getElementById('caseh').checked=true;
		}
		document.getElementById("caseh").value = strSplit[4];
		//document.getElementById('caseh').checked;
		
		document.getElementById("remarks").value = strSplit[5];
		document.getElementById("dname").value = strSplit[6];
		//document.getElementById("pincode").value = strSplit[7];
		document.getElementById("sign").value = strSplit[7];
	//	document.getElementById("pid").value = strSplit[8];
		document.getElementById("fn").value = strSplit[9];
		document.getElementById("docid1").value = strSplit[10];
	
		$("#pid").val(encodeURI(strSplit[8]));
		$("#pid").selectpicker("refresh");
		
		
	
		
		
	   }

		 $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
	            
	        	unsaved = false;
	        });
	
	}
	function test(){
		//alert(document.getElementById("pid").value);
	}
	function refer()
	{
		document.getElementById("redate").value= moment().format("DD-MM-YYYY hh:mm");
	}
	function datasuccess(data){
		
		if(data != "null"){
			
			alert(data)
	window.location = "/HMS/referral.html";
		}
	}
	</script>
	
	
	   <style>
hr { 
    display: block;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    margin-left: 6%;
    margin-right: 10%;
    border-style: inset;
    border-width: 2px; 
    width: 88%;
   
} 
@media print {
    #disp {
        display :  none;
        
    }
}
@media print {
    #fff {
        display :  none;
    }
}
@media print {
    #hideselect {
        display :  none;
       
    }
}
@media print {
    #remarks {
       height : 100px;
        
    }
}

@media print {
    #cont {
    overflow: hidden;
        height : auto;
       
    }
}

@media print {
    #cont2 {
    overflow: hidden;
        height : auto;
       
    }
}
::-moz-placeholder { 
    color: transparent;
  }



</style>
<script type="text/javascript">
// Auto-Grow-TextArea script.
// Script copyright (C) 2011 www.cryer.co.uk.
// Script is free to use provided this copyright header is included.
function AutoGrowTextArea(textField)
{
  if (textField.clientHeight < textField.scrollHeight)
  {
    textField.style.height = textField.scrollHeight + "px";
    if (textField.clientHeight < textField.scrollHeight)
    {
      textField.style.height = 
        (textField.scrollHeight * 2 - textField.clientHeight) + "px";
    }
  }
}
</script> 


</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload = "refer(),checkhome('<c:out value="${username}" />');">
  <div class="wrapper">
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Referral Note</a>
    </div>
    <ul class="nav navbar-nav">
          <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
    <br>
         <i class='fa fa-arrow-left button2 rightspace' style='font-size:20px;color : #f0ad4e'  onclick="goback()"></i>
  </div>
</nav>
  <center>
</center>
	<div id="page-wrap">
        <h1>
        
	     <button type="submit" form="saveref" class="btn btn-warning button1" id='bc'  value="submit">
	     
	  <span></span>Save</button>
<font size="5">Referral Note</font><span class="button2">
		<input type="button" id="disp" class="btn btn-warning button2" value="Print" onclick="disp()"  style="width:150px"/></span>
		
		 </h1>
		
		<br>
		<form id="saveref" action ="referrals.html" method="post"></form>
	
	<div class="form-group row" >
 <div class="col-xs-1"></div>
  <div class="col-xs-3">
    <figure>
       <img src="<c:url value='/Images/logocms.jpg'/>"/>
       </figure>
  </div>
  <div class="col-xs-2"></div>
  <div class="col-xs-5" contenteditable="true" id="dstxt">
   <h4><b>LILAYI FAMILY CLINIC</b></h4>
   <h5>Plot 4014A,Lusaka-Zambia,P.O Box 32680,</h5>
   <h5>Contact: +260 962 151 935</h5>
   <h5>E-mail : lilayifamilyclinic@yahoo.com</h5>

  
  </div>
 
</div>	
		<div id="">
		 
       <hr> 
		<br>
		<br>
		<div id="">
		 <div class="form-group row" id="hideselect">
	     <div class="col-xs-4"></div>
	       <div class="col-xs-4">
	        <div class="form-group">
	        
	        <select class="selectpicker form-control select"  data-live-search="true"  id = "myname" name="myname" onchange="run()" class="form-control input-sm" >
	        <option value="new">New</option>
<c:forEach var="mft"  items="${model.list3}">
<option value="${mft.redate}=${mft.pname}=${mft.treat}=${mft.diagnosis}=${mft.caseh}=${mft.remarks}=${mft.dname}=${mft.sign}=${mft.pid}=${mft.fn}=${mft.docid}" data-subtext="${mft.patient},${mft.redate}">${mft.fn}</option>
</c:forEach>
	        </select>
	        
	        </div>
	        </div>
	        </div>
	        </div>
	       
 
     <tr>
     <h5 align="center"><b>REFERRAL FOR TREATMENT PURPOSES</b></h5><br>
     
                    
                 <b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DATE:</b> &emsp;<input type="text" name="redate" id="redate"  style="border-style: none;alignment:center;position: absolute; width:20%; border-width:2px;"  class="meta-head"  form="saveref"/>
                 <br>
                 <br>
            <div id="cont">         
         <p> &emsp;&emsp;&emsp;<b>TO DR</b></p>
        <textarea class="notes" style="width :750px;" rows="4" id="pname" name="pname" form="saveref" onfocus="AutoGrowTextArea(this)" required></textarea> 
        
               </div>    
                   <hr> 
                   <br>
                    <p style="" align="left" "meta-head"><form="saveref" >&emsp;&emsp;&emsp; <b>This will introduce my patient ,</b>
                    
           <select class="selectpicker" data-size="10" data-live-search="true" name = "pid" id ="pid"  form="saveref" onchange="cpyfile(this.options[this.selectedIndex])" >
          <option value="" selected disabled>Patient Name</option>
         <c:forEach var="p"  items="${model.list2}">
        <option value="${p.pid}"  data-subtext="${p.fileno},${p.pid}" data-value="${p.fileno}=${p.docid}=${p.dname}">${p.pname}</option>
        
        </c:forEach>
      </select>
     
      
      
      
           <span id="fff" >&emsp;&emsp;<b>File Number</b></span>
       
      <input type="text"   style="width: 130px;"  name = "fn" id ="fn"  form="saveref" >
      <input type="hidden"  name="docid" id="docid1" form="saveref" >
          
              </form></p>  
                     
                     <br> 
                     
                     <center><font color="hotpink"><i>Health family, health nation.</i></font></center>
                     <hr>
               <br>
                    <p class="meta-head">&emsp;&emsp;&emsp;<b>For:</b></p>
                     &emsp;&emsp;&emsp;&emsp;&emsp;<input type="checkbox"  value="active" name="diagnosis" id="diagnosis"  form="saveref" />&emsp;<b>Diagnosis</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                     <input type="checkbox" align="right" value="active"  id="treat" name="treat" form="saveref" /><b>Treatment</b></tr><br>
                
                    
               &emsp;&emsp;&emsp;&emsp;&emsp;<input type="checkbox" name="caseh" id="caseh"  value="active"  form="saveref" >&emsp;<b>Case history been forwarded to you<b><br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</b>under separate cover</b><br>
               
               <br>
               <p><class="meta-head">&emsp;&emsp;&emsp;<b>Remarks</b></class></p>
               <div id="cont2">
                <textarea class="notes1" style="width :750px;" rows="2"  id="remarks" name="remarks" form="saveref" onfocus="AutoGrowTextArea(this)"  required></textarea>
          </div>
         <br>
         <tr>&emsp;&emsp;&emsp;<b>Doctor's Name:<input type="text" id="dname" name="dname" value="${pageContext.request.userPrincipal.name}"  style="border-style: none;margin-left:1%;width:30%;border-width:2px;" class="meta-head"  form="saveref"/></b>&emsp;&emsp;&emsp;<span id="ss" style="margin-left:-5px;" ><b>Doctor's Signature:</b></span> &emsp;<input type="text" id="sign"  name="sign" style="border-style: none; width:24%;border-width:2px;" class="meta-head"  form="saveref"></input> </tr><br>
               <br>
              
             </tr>
        
        
        
        
        
         </tr><br>
               <br>
              
             </tr>
             
      
             </div>
             <button type="" id="gbill" class="bouton-contact" form ="saveref" disabled></button>
</div>
    </div>
     
</div>








 
</body>

             
             
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
    


</html>