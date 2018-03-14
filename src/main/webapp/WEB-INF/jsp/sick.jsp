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

.wrapper {
  height : auto;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
}
#page-wrap { width: 900px; margin: 0 auto; overflow: hidden; background: #fff;  }

#page-wrap { width: 800px; margin: 0 auto; overflow: hidden; background: #fff;  }




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
#sdate{
margin-left  :30px;
}

#reason{
margin-left  :40px;
}

  #logotext{
  margin-left:80px; 
  }
  
   #logotext1{
  margin-left:80px; 
  }
  
  #cont{
  height:150px;
  width :800px;  
  overflow-Y : auto;
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
</style>


<script type="text/javascript">

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
		$("#back").hide();
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
	AutoGrowTextArea(document.getElementById("reason"))
//	document.getElementById("fin").style.display = "none";
//	document.getElementById("ff").style.display = "none";
	document.getElementById("hideselect").style.display = "none";
	document.getElementById("disp").style.display = "none";
	
	window.print();
	document.getElementById("disp").style.display = "block";
	document.getElementById("myname").style.display = "none";
	//document.getElementById("ff").style.display = "none";
	
	document.getElementById("hideselect").style.display = "block";
	
	/*
	document.getElementById("pname").style.visibility = "visible";
	document.getElementById("sdate").style.display = "visible";
	document.getElementById("work").style.display = "visible";
	document.getElementById("other").style.display = "visible";
	document.getElementById("reason").style.display = "visible";
	document.getElementById("dates").style.display = "visible";
	document.getElementById("dat").style.display = "visible";
	document.getElementById("pn").style.display = "visible";
	document.getElementById("ic").style.display = "visible";
	document.getElementById("fin").style.display = "none";
	document.getElementById("ff").style.display = "none";
	*/
}

	

function vrf(){
	if($("#pn").val().includes("select")){
		alert("Please select a Patient Name")
		return false;
	}
	else{
		$("#timestamp").val('<c:out value="${pageContext.request.userPrincipal.name}" />  '+moment().format("DD-MM-YYYY hh:mm"))
         return true;	
	}
}
		
	
		

function clos(){
	window.location.reload();
}
		
		
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

		document.getElementById("fin").value = strSplit[0];
		document.getElementById("docid").value = strSplit[1];
		var useras = '<c:out value="${pageContext.request.userPrincipal.name}" />';
		
		
		document.getElementById("pname").value = strSplit[2];
    
}



	
	function dispspan(){
	
		document.getElementById("inv").style.display = "none";
		document.getElementById("col-xs-5").style.display = "none";
		
	}
	
	
	function run() {

	    if(document.getElementById("myname").value == "new"){
	    	document.getElementById("savesic").reset();
	    	   $('select[name=pn]').val("select");
	    	   $('#pn').selectpicker('refresh');
	    }
	    else{
	 	   var str = document.getElementById("myname").value;
		   var strSplit = str.split('=');
		  //alert(strSplit)
		   $("#pn").selectpicker("refresh");
		//alert( strSplit[7])
		document.getElementById("pname").value = strSplit[0];
       
		document.getElementById("sdate").value = strSplit[1];
		
		if(strSplit[2] == "active"){
			
			document.getElementById('work').checked=true;
		}
		document.getElementById("work").value = strSplit[2];
		  
		if(strSplit[3] == "active"){
			  
				document.getElementById('other').checked=true;
			}
	//	document.getElementById("other").value = strSplit[3];
		document.getElementById("reason").value = strSplit[4];
		document.getElementById("dates").value = strSplit[5];
		document.getElementById("dat").value = strSplit[6];
		//document.getElementById("pn").value = strSplit[7];
		document.getElementById("fin").value = strSplit[8];
		//alert(strSplit[7])
		
		$("#pn").val(encodeURI(strSplit[7]));
		$("#pn").selectpicker("refresh");
		document.getElementById("docid").value = strSplit[9];
	    $('#timestamp').val(strSplit[10])
		
		

		}	

		 $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
	            
	        	unsaved = false;
	        });
	
	}
	function sic()
	{
		document.getElementById("sdate").value= moment().format("DD-MM-YYYY hh:mm");
	}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/sick.html";
	}
}
	
	</script>
	
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
	   <style>
hr { 
    display: block;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    margin-left: 2%;
    margin-right: 80%;
    border-style: inset;
    border-width: 2px; 
    width: 95%;
   
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
    #cont {
        overflow : hidden;
        height : auto;
       
    }
}
</style>
 


</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload = "sic(),checkhome('<c:out value="${username}" />')">
  <div class="wrapper">
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Sick Note</a>
    </div>
    <ul class="nav navbar-nav">
         <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
      <ul class="nav navbar-nav navbar-right">
  <li><a href="/HMS/doctor1" id="back" ><span class="glyphicon glyphicon-user"></span><span id="tit">Back to Doctor Home </span></a></li>
    </ul> </div>
</nav>
  <center>
</center>
	<div id="page-wrap">
        <h1>
        
	     <button type="submit" form="savesic" class="btn btn-warning button1" onclick="return vrf()" id='bc'>Save</button>
<font size="5">Sick Note </font><span class="button2">
		<input type="button" id="disp" class="btn btn-warning button2" value="Print" onclick="disp()"  style="width:150px"/></span>
		
		 </h1>
		
		<br>
		<form id="savesic" action ="sicks.html" method="post"></form>
	
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
		<div style="clear:both"></div>
		


          
           
 <div id="">
		 <div class="form-group row"  id="hideselect">
	     <div class="col-xs-4"></div>
	       <div class="col-xs-4">
	        <div class="form-group">
	        
	        <select class="selectpicker form-control select" data-size="10"  data-live-search="true"  id = "myname" name="myname" onchange="run()"  class="form-control input-sm" required>
	        <option value="new">New</option>
<c:forEach var="mft"  items="${model.list3}">
<option  value="${mft.pname}=${mft.sdate}=${mft.work}=${mft.other}=${mft.reason}=${mft.dates}=${mft.dat}=${mft.pn}=${mft.fin}=${mft.docid}=${mft.timestamp}" data-subtext="${mft.patient},${mft.sdate}">${mft.fin}</option>

</c:forEach>
	        </select>
	        
	        </div>
	        </div>
	        </div>
	        </div>
	       
     <tr>
       <b>&emsp;&emsp;&emsp; Dr</b><input type="text"  style="border-style:none; width:80%; border-width:2px;"  id="pname" name="pname" form="savesic"  ></input>
          <br>
          <br>
         
     <b>&emsp;&emsp;&emsp;Date</b><input type="text" id="sdate" name="sdate"  style="border-style:none; width:40%;border-width:2px;"  form="savesic" ></input>
           
                 <br>    
                <br>
                 <div class="form-group row" style="margin-left:-38px;">
                 <div class="col-xs-1"></div>
                 
                 <div class="col-xs-2">
                <b>Please Excuse:</b>
                 </div>
                 
	    
     <div class="col-xs-3">
      <div class="form-group">
<select class="selectpicker form-control input-sm" data-size="10" data-live-search="true" name = "pn" id ="pn"  onchange="cpyfile(this.options[this.selectedIndex])" form="savesic">
          <option value="select" selected>Patient Name</option>
         <c:forEach var="p"  items="${model.list2}">
        <option value="${p.pid}" data-subtext="${p.fileno}"  data-value="${p.fileno}=${p.docid}=${p.dname}">${p.pname}</option>
       
        
        </c:forEach>
      </select>
      </div>
      </div>
      
     
            <div class="form-group" id="ff">
	    <label for="fin"  class="col-sm-2 control-label"></label>
       <div class="col-xs-3">
     <input type="hidden" class="form-control input-sm" name = "fin" id ="fin"  form="savesic" >
      <input type="hidden"  name="docid" id="docid" form="savesic"/>
          </div>
              </div>
             </div>
             
                    
                    
                   
                    <b>&emsp;&emsp;&emsp;From</b></p>
                       <div class="form-group row" >
	     <div class="col-xs-1"></div>
	
	      <div class="col-xs-3">
	      <div class="form-group">
	      <input type="checkbox" name="work" value="active" id="work" name="work" form="savesic" >&emsp;&emsp;<b>Work</b><br>
	         <input type="checkbox"  value="active" id="other" name="other" form="savesic" >&emsp;&emsp;<b>Other</b>
	   
	      </div>
        </div>
           </div>
           
               <div id="cont">
             <p> &emsp;&emsp;&emsp;<b>Due To:</b></p>
              <textarea class="notes" style="width :750px; overflow-Y : auto;" rows="4" id="reason" name="reason" form="savesic"  onfocus="AutoGrowTextArea(this)"></textarea>
             </div>
        
          
       
         
            
         
         
             
       </div>
       
     </tr>
<p>&emsp;&emsp;&emsp;<b>For the following dates:</b></p>
 <div class="form-group row" >
        <div class="col-xs-1"></div>
        
            <div class="col-xs-3">
  <div class="form-group">
            <p>&emsp;&emsp;&emsp;From<span></span></p>
       <input type="date" max="2999-12-31" class="form-control input-sm"  id="dates" name="dates" form="savesic" >    
       
	</div>
  </div>

   <div class="col-xs-3">
  <div class="form-group">
            <p>&emsp;&emsp;&emsp;To<span></span></p>
      <input  type="date" max="2999-12-31" class="form-control input-sm"  id="dat" name="dat" form="savesic"  >
	</div>
  </div>
        </div>
        <div class="form-group row" >
      
   <h><font size="2px"><center><b>Thank You</b></center></font></h>
     <div class="col-xs-10"></div>
     <div class="col-xs-1">
     <figure>
      <img src="<c:url value='/Images/Rx icon.png'/>"/>
       </figure>
   
    
   </div>
   </div>
   
 
   <hr>&emsp;&emsp;&emsp;<b>Last Modified : </b><input type="text" name="timestamp" id="timestamp" form="savesic" style="border:none;width:250px;" readonly="readonly">  
   
   <center><font color="hotpink"><i>Health family, health nation.</i></font></center>
   
   
   <button type="button" id="gbill" class="bouton-contact" form ="savesic" disabled></button>   
   
  </div>
  </div>

    </div>         
          


<script>
document.querySelector('input[list]').addEventListener('input', function(e) {
    var input = e.target,
        list = input.getAttribute('list'),
        options = document.querySelectorAll('#' + list + ' option'),
       
        label = input.value;

   

    for(var i = 0; i < options.length; i++) {
        var option = options[i];

        if(option.innerText === label) {
           var hiddenInput= option.getAttribute('data-value');
            alert(hiddenInput);
            break;
        }
    }
});
</script>



 
</body>
<script>
document.querySelector('input[list]').addEventListener('input', function(e) {
    var input = e.target,
        list = input.getAttribute('list'),
        options = document.querySelectorAll('#' + list + ' option'),
       
        label = input.value;

   

    for(var i = 0; i < options.length; i++) {
        var option = options[i];

        if(option.innerText === label) {
           var hiddenInput= option.getAttribute('data-value');
            alert(hiddenInput);
            break;
        }
    }
    });
	
</script>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>


</html>