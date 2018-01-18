<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMS Wedge</title>

<link rel='stylesheet' href='<c:url value="/resources/css/myapps.css" />' type='text/css' media='all' />

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.min.js"></script>


<style type="text/css">

.tab-pane{
width : auto;
border-style : groove;
border-radius : 10px;
height : 400px;
overflow-y : auto;

}

#menu4{
width : 820px;
border-style : groove;
border-radius : 10px;
height : 300px;
}
.btn btn{

 padding: 15px 15px;
   
        /* All browsers since IE 5.5+ */

    max-width:170px;
    cursor: default;
}
.btn-block{
 width : 1050px;
}

.remove{

}
table.beta .tbody2{
    
    height:300px;
    overflow-y :auto;
}


table.beta .thead2 th{
	background-color: #009999;
    color: white;
}
  
  #mc1{
height : 300px;

} 
  
 
</style>
<script type="text/javascript">
var adminusr;
var admnme;
function checkhome(user){
	document.getElementById("print").style.display = "none";	
adminusr = user;
document.getElementById("adr").style.visibility ="hidden";
if(adminusr.includes("[ROLE_ADMIN]")){
		document.getElementById("docid").value = admnme;
		document.getElementById("dname").value = admnme;
		
	}
    	
		if(user.includes("[ROLE_DOCTOR]") ){
		 var url = "/HMS/doctor1" ;
		 $("#back").hide();
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		
		  var url1 = "/HMS/prescription" ;
			
		 var element1 = document.getElementById('hc');
		 element1.setAttribute("href",url1)
		 
		 var url2 = "/HMS/treatment" ;
			
		 var element = document.getElementById('m2');
		 element.setAttribute("href",url2)
	}

	else{
		
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		 var url1 = "/HMS/prescription";
		
		 var element1 = document.getElementById('hc');
		 element1.setAttribute("href",url1)
		 
		  var url2 = "/HMS/treatment" ;
			
		 var element = document.getElementById('m2');
		 element.setAttribute("href",url2)
	}
}

function hide(user){
	
	
		if (user.includes("[ROLE_DOCTOR]")){
			document.getElementById("dh").style.display="none";
			var no = document.getElementsByClassName("trunk");
			for(var i=0;i<no.length;i++){
				no[i].style.display="none";
				
			}
			
			document.getElementById("myTable").setAttribute("style","border:0;"); 
		  document.getElementById("formab").style.width ='760px'; 
		}
		
		
	else{
		document.getElementById("dh").style.display="visible";
		document.getElementById("tr").style.display="visible";	
		document.getElementById("myTable").setAttribute("style","border:0;");
	}
	}
	
function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    tda = tr[i].getElementsByTagName("td")[2];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } 
	      else if(tda.innerHTML.toUpperCase().indexOf(filter) > -1){
	    	  tr[i].style.display = "";
	      }
	      else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}

function disp(){
	
	$('#myModal').modal('show');
}
var id1;
function check(id,name,spec){
	
	id1 = id;
	
	  
	document.getElementById("docid").value = id;
	document.getElementById("dname").value = name;
	//document.getElementById("specialization").value = Id;
	           
}
function addcname(){
	var cid = document.getElementById("pname").value; 
	var str = cid.split(',');
	
	 var res5 = $('select[name=pname1]').val();
 	   $('select[name=pid1]').val(res5);
	   $('#pid').selectpicker('refresh');
	   
	document.getElementById("pid").value=str;
	document.getElementById("pid1").value =str[0];
	document.getElementById("pname1").value = str[1];
	document.getElementById("cause").value = str[2];
	
	
}
function rem(remdata){
//	alert(remdata);
	  $(remdata).remove();
}

function callevent(e){
	addpe = e;
	  $('#myModal2').modal('show');
}
var sav;
function copyval2(name){
	
	var a = $("#fileno").val();
	var b = $("#pname1").val();
	var c = $("#pid1").val();
	var d = document.getElementById("pname").value;
	var e = $('#docid').val();
	if(name == "menucd" && d =="Select"){
		alert("Please select Patient Name")
		return false;
	
	}
	else if(name == "menucd" && d !="Select"){
	
		  var url = "/HMS/diagnosegc?location="+a+"&location1="+b+"&location2="+c+"&&location3="+e+"&&location4="+sav+"";
		    var element = document.getElementById(name);
			element.setAttribute("href",url);
		
			
			return true;
	}
	
	else{
		
	}
	
}
function display(){ 
	
	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	
	//    var m = moment().format('YYYY-MM-DD h:mm a');

	  var newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input type='text'  form ='form1' class= 'form-control input-sm' value=' ' id = 'typeofdr' name= 'typeofdr'  ></td></tr>";
	  newCell.style.width ='100px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm button1' value=' ' style='width: 100px;' type='text' id = '"+tableRef.rows.length+"' name= 'drugname'  ><a title='Click to View Available drugs'><i class='glyphicon glyphicon-list-alt button2' style='font-size:20px'  onclick= callevent('"+tableRef.rows.length+"')></i></a> </td></tr>";
	  newCell.style.width ='140px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' id = 'strdrug' name= 'strdrug' > </td></tr>";
	  newCell.style.width ='80px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value=' ' type='text' id = 'dosage' name= 'dosage'> </td></tr>";
	  newCell.style.width ='50px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><select  form ='form1' class= 'form-control input-sm'   id = 'dm'  name= 'dm'  ><option value='PRN'>PRN</option><option value='OD'>OD</option><option value='BD'>BD</option><option value='TDS'>TDS</option><option value='QID'>QID</option><option value='OTHERS'>OTHERS</option></select> </td></tr>";
	  newCell.style.width ='20px';
	  /*
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='NA' type='text' id = 'da' name= 'da' required > </td></tr>";
	  newCell.style.width ='120px';
	  */
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input type='text'  form ='form1' class= 'form-control input-sm' value=' ' id = 'baf' name= 'baf'  ></td></tr>";
	  newCell.style.width ='100px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' id = 'totn' name= 'totn' > </td></tr>";
	  newCell.style.width ='70px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' id = 'nofdays' name= 'nofdays'> </td></tr>";
	  newCell.style.width ='50px';
		 
	 
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
	  newCell.style.width ='30px';
		 

	disbut();
}

var tabid;
function copyval1(id,name,fileno,docid,val){
	alert(docid)
	  var url = "/HMS/diagnosegc?location="+fileno+"&location1="+name+"&location2="+id+"&&location3="+docid+"";
	console.log(url)
	  $(val).attr("href",url);
	}
function copyval(tabi){
	tabid = tabi;
	var a = $("#fileno").val();
	var b = $("#pname1").val();
	var c = $("#pid1").val();
	var d = document.getElementById("pname").value;
	
	if(tabi == "menu4a" && d =="Select"){
		alert("Please select Patient Name")
		return false;
	}
	var url = "/HMS/labup2?location="+a+"&location1="+b+"&location2="+c+"";
    var element = document.getElementById(tabi);
	element.setAttribute("href",url);
	
	if(tabi == "menu4"){
		document.getElementById("adr").style.visibility ="visible";
		var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
		if(tableRef.rows.length == 0){
			display()
		}
	}
	else{
		document.getElementById("adr").style.visibility ="hidden";
		document.getElementById("addButton").style.visibility = "visible";
		//document.getElementById("print").style.visibility = "hidden";
	}
	
	if(tabi == "home1"){
		document.getElementById("addButton").style.visibility = "hidden";
		document.getElementById("showdrugs").style.visibility = "hidden";
	//	document.getElementById("print").style.visibility = "hidden";
	}
	else if(tabi == "menu3a"){
		document.getElementById("addButton").style.visibility = "hidden";
		document.getElementById("showdrugs").style.visibility = "hidden";
	//	document.getElementById("print").style.visibility = "hidden";
	}
	else if(tabi == "menu4"){
		document.getElementById("addButton").style.visibility = "hidden";	
		document.getElementById("showdrugs").style.visibility = "visible";
	//	document.getElementById("print").style.visibility = "visible";
	}
	else{
		document.getElementById("addButton").style.visibility = "visible";	
		document.getElementById("showdrugs").style.visibility = "hidden";
	//	document.getElementById("print").style.visibility = "hidden";
	}

	
} 

function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable1").deleteRow(i);
    disbut();
    
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
     //   alert(charCode);
        if ((charCode == 44)){
        	
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
var arr = [];
function getvalue(myname) {
	
	
	
	
	if (document.getElementById(myname).selected){
	
		arr.push(myname);
	    
	}
	else 
		{
		
	    arr.splice( arr.indexOf(myname), 1 );
		
		}
       console.log(arr);
      
	document.getElementById("medicine").value = arr.join("\n");
		
	
	
	}
	
function calculateBmi() {
	var weight = document.getElementById("weightw").value;
	var height = document.getElementById("height").value;
	
	if(weight > 0 && height > 0){	
		
		if(document.getElementById("unitw").value == "pounds"){
			weight = weight/0.0022046;
		}
		else if(document.getElementById("unith").value == "feet"){
		
			height = 	height/0.032808;
		}
		else if(document.getElementById("unith").value == "inches"){
			height = height/0.39370;
		}
		else if(document.getElementById("unith").value == "meters"){
			height = height/0.01;
		}
		else{
		//	alert("please select the correct unit");
		}
		  var BMI = Math.round(weight / Math.pow(height, 2) * 10000);

		var finalBmi = Math.round(BMI * 100) / 100
	document.getElementById("bmi").value = finalBmi;
	}
	
	}

function clos(){
	window.location.reload();
}
function autodisp(pid,pname,specialization,fileno){

/*
$("#pid").append('<option value="'+pid+'"selected="">'+pid+'</option>');
$("#pid").selectpicker("refresh");

$("#pname").append('<option value="'+pname+'"selected="">'+pname+'</option>');
$("#pname").selectpicker("refresh");
	
	document.getElementById("pid1").value  = pid;
	document.getElementById("pname1").value  = pname;
	document.getElementById("pid").disabled = true;
	document.getElementById("pname").disabled = true;
	document.getElementById("id").innerHTML = pid;
	document.getElementById("nm").innerHTML = pname;
	document.getElementById("flno").innerHTML = fileno;
	document.getElementById("fileno").value = fileno;
	
	document.getElementById("rdate").valueAsDate = new Date();
	doAjaxPost2();
	doAjaxPost(fileno,pid)

	
*/	
	
	
}
function copy(pid){


   
   
   document.getElementById("t1").style.display= 'hidden';
   document.getElementById("t2").style.display='visible';
   
   
  
 
   $('#myModal').modal('show');

}

function checklen(){
var len = document.getElementById("fileno").value;
	
	if(len.length== 0){
		alert("Please select Patient Name")
		return false;
	}
	var tableRef = document.getElementById('myTable3').getElementsByTagName('tbody')[0];
	
	   if(tableRef.rows.length == 0){
	  		   alert("Selected patient does not have previous records")
	  	return false;
	   }
	   else{
		   
		   $('#myModal1').modal('show');
	   }
	  
}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/doctor1.html";
	}
}
function disbut(){
var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	 
	/*
	if(tableRef.rows.length == "0"){
		document.getElementById("#bouton-contact").disabled = true;
	}
	else{
		document.getElementById("#bouton-contact").disabled = false;	
	}
	*/
}

function addp(){
	if(document.getElementById("drugn").value == "select"){
		alert("Drug Name is not selected")
		return false;
	}
	else{
	document.getElementById(addpe).value = document.getElementById("drugn").value;
	  $('select[name=drugn]').val("select");
	   $('#drugn').selectpicker('refresh');
	   
	$('#myModal2').modal('hide');
	}
}

function verpr(){
	var d = document.getElementById("pname").value;
	var a = $("#fileno").val();
//	var b = $("#pds").val();
	var c = $("#pid1").val();
	var e = document.getElementById("typeofdr").value;
	
	if(d =="Select"){
		alert("Please select Patient Name")
		return false;
	}
	else if(e == " "){
	alert("Cannot print empty Prescription!")	
	return false;
	}
	else{
		var url = "/HMS/prprs1";
				    var element = document.getElementById("print");
					element.setAttribute("href",url);
				return true;
		
		
	}
}	


</script>
<script type="text/javascript">




       function doAjaxPost(fileno,pid) {
    	   // get the form values
    	   
    	  var counter = 1;
    	         //  var name = $('#pname').val();
    	            //var docid = $('#docid').val();
    	             $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/prescription1/"+fileno+"/"+pid+"",
    	        	         
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           
    	        	          
    	        	           
    	        	          
    	             
    	             success: function(response){
    	            	 if(response.list17.length == 0){
    	            		 
    	            	   document.getElementById("height").value = document.getElementById("height").defaultValue;
  	              	       document.getElementById("unith").value =  document.getElementById("unith").defaultValue;
  	              		   document.getElementById("weightw").value = document.getElementById("weightw").defaultValue;
  	              		   document.getElementById("unitw").value =  document.getElementById("unitw").defaultValue;
  	              		   document.getElementById("temperature").value = document.getElementById("temperature").defaultValue;
  	              		   document.getElementById("unitt").value =  document.getElementById("unitt").defaultValue;
  	              		   document.getElementById("ac").value =  document.getElementById("ac").defaultValue;
  	              		   document.getElementById("bp").value = document.getElementById("bp").defaultValue;
  	              		   document.getElementById("bmi").value = document.getElementById("bmi").defaultValue;
  	              		   document.getElementById("fi").value = document.getElementById("fi").defaultValue;
  	              		   document.getElementById("fe").value =  document.getElementById("fe").defaultValue;
  	              		   document.getElementById("rest").value =  document.getElementById("rest").defaultValue;
  	              		   document.getElementById("pulse").value = document.getElementById("pulse").defaultValue;
  	              		   
  	  }
    	            	  $.each(response.list17, function(index, datec) {
    	         	  		   
    	             	  	   document.getElementById("height").value = datec.height;
    	              	       document.getElementById("unith").value = datec.unith;
    	              		   document.getElementById("weightw").value = datec.weight;
    	              		   document.getElementById("unitw").value = datec.unitw;
    	              		   document.getElementById("temperature").value = datec.temperature;
    	              		   document.getElementById("unitt").value = datec.unitt;
    	              		   document.getElementById("ac").value =datec.ac;
    	              		   document.getElementById("bp").value =datec.bp;
    	              		   document.getElementById("bmi").value = datec.bmi;
    	              		   document.getElementById("fi").value = datec.fi;
    	              		   document.getElementById("fe").value = datec.fe;
    	              		   document.getElementById("rest").value = datec.rest;
    	              		   document.getElementById("pulse").value = datec.pulse;
    	              		   
    	             	  		   
    	             	  	   }),
      	        	   
      	        	   $.each(response.list3, function(index, addn) {
      	                    //to print name of employee
      	                   
      	                 $("#pid").append('<option value="'+addn.pid+'"selected="">'+addn.pid+'</option>');
      	               $("#pid").selectpicker("refresh");
      	               
      	               $("#pname").append('<option value="'+addn.pname+'"selected="">'+addn.pname+'</option>');
      	               $("#pname").selectpicker("refresh");
      	               
      	             //  document.getElementById("docid").value = strSplit[0];
      	                document.getElementById("pname").disabled = true; 
      	                document.getElementById("pid").disabled = true;
      	              if( addn.admit == "Yes"){
      	   		          $('#yes').click();
      	   		        }
      	   	          else{
      	   		           $('#no').click();
      	   		          }
      	             
      	                 document.getElementById("id").innerHTML = addn.pid;
      	      	         document.getElementById("nm").innerHTML = addn.pname;
      	      	         document.getElementById("flno").innerHTML = addn.fileno;
      	      	
  	            	   document.getElementById("fileno").value = addn.fileno;
  	            	   document.getElementById("rdate").value = addn.date;
  	               
  	                 /*  document.getElementById("pc").value =addn.pc;
      	           
  	            	   document.getElementById("pmsh").value=addn.pmsh;
  	            	  
  	            	   document.getElementById("ph").value = addn.ph;
  	            	   document.getElementById("dhr").value = addn.dh;
  	            	   document.getElementById("fh").value = addn.fh;
  	            	   document.getElementById("ogh").value = addn.ogh;
  	            	   document.getElementById("psh").value = addn.psh;
  	            	   document.getElementById("sge").value= addn.sge;
  	            	   document.getElementById("scv").value = addn.scv;
  	            	   document.getElementById("sres").value= addn.sres;
  	                   document.getElementById("sgas").value =addn.sgas;
  	                   document.getElementById("smusc").value =addn.smusc;
	            	   document.getElementById("sgenit").value=addn.sgenit;
	            	   document.getElementById("sendoc").value = addn.sendoc;
	            	   document.getElementById("sskin").value= addn.sskin;
	            	   document.getElementById("scns").value = addn.scns;
	            	   document.getElementById("pge").value = addn.pge;
	            	   document.getElementById("poc").value = addn.poc;
	            	   document.getElementById("pns").value= addn.pns;
	            	   document.getElementById("pcv").value = addn.pcv;
	            	   document.getElementById("prs").value= addn.prs;
	                   document.getElementById("pas").value =addn.pas;
	                   document.getElementById("pds").value =addn.pds;
	            	   document.getElementById("pir").value=addn.pir;
	            	  */
	            	  
	            	
	            	  
	            	
	            	  if(addn.tabidc == "home"){
	            		  $(document).ready(function(){

	            		  var newTextBoxDiv0 = $(document.createElement('div'))
	            		    .attr("class", 'form-group row')
	            		    .attr("id",'form1ac' + counter);
	            		  
	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><input type="button" onclick= rem(form1ac'+counter+') value="delete" ></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:45px;background-color:#dcdcdc;color:black;">"'+addn.buttonl+'"</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df">'+addn.df+'</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
	            		    
	            		    counter++;
	            		    
	            		  });
	            	
	            	
	            	  }
	            	  
                       if(addn.tabidc == "menu1"){
                    		  $(document).ready(function(){

        	            		  var newTextBoxDiv0 = $(document.createElement('div'))
        	            		    .attr("class", 'form-group row')
        	            		    .attr("id",'form1ac' + counter);
        	            		  
        	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><input type="button" value="delete" onclick= rem(form1ac'+counter+')></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:45px;background-color:#dcdcdc;color:black;">"'+addn.buttonl+'"</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df">'+addn.df+'</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
        	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
        	            		    
        	            		    counter++;
        	            		    
        	            		  });
	            	  }
                       if(addn.tabidc == "menu2"){
                    		  $(document).ready(function(){

        	            		  var newTextBoxDiv0 = $(document.createElement('div'))
        	            		    .attr("class", 'form-group row')
        	            		    .attr("id",'form1ac' + counter);
        	            		  
        	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><input type="button" value="delete" onclick= rem(form1ac'+counter+')></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:45px;background-color:#dcdcdc;color:black;">"'+addn.buttonl+'"</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df">'+addn.df+'</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
        	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
        	            		    
        	            		    counter++;
        	            		    
        	            		  });
 	            	  }
                       if(addn.tabidc == "menu3"){
                    		  $(document).ready(function(){

        	            		  var newTextBoxDiv0 = $(document.createElement('div'))
        	            		    .attr("class", 'form-group row')
        	            		    .attr("id",'form1ac' + counter);
        	            		  
        	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><input type="button" value="delete" onclick= rem(form1ac'+counter+')></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:45px;background-color:#dcdcdc;color:black;">"'+addn.buttonl+'"</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df">'+addn.df+'</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
        	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
        	            		    
        	            		    counter++;
        	            		    
        	            		  });		    
 	            	  }
 	            	  
	            	  
	            	   document.getElementById("#bouton-contact").disabled=true;
	            	   $('#myModal').modal('show');
	            	
      	               }),
      	               
      	             $.each(response.list4, function(index, datec) {
      	            	
  	                 $("#typeofdr").append('<option value="'+datec.gtest+'"selected="">'+datec.gtest+'</option>');
    	               $("#typeofdr").selectpicker("refresh");
    	              
      	             }),
      	             
      	           $.each(response.list5, function(index, drug) {
      	        	 
	                  
    	               
    	              

    	           	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
    	           	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
    	           	
    	           	//    var m = moment().format('YYYY-MM-DD h:mm a');

    	           	  var newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input type='text' class='form-control input-sm'  form ='form1'   id = 'typeofdr' value='"+drug.typeofdr+"' name= 'typeofdr'  required> </td></tr>";
    	           	  newCell.style.width ='100px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.drugname+"' type='text' id = 'drugname' name= 'drugname'  required> </td></tr>";
    	           	  newCell.style.width ='100px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.strdrug+"' type='text' id = 'strdrug' name= 'strdrug'  required> </td></tr>";
    	           	  newCell.style.width ='100px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= ''  type='checkbox' id = 'dm' name= 'dm'  ><input type='hidden' value='off' form='form1' name='dm'> </td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= ''   type='checkbox' id = 'da' name= 'da' ><input type='hidden' name='da' form='form1' value='off' ></td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= ''  type='checkbox' id = 'de' name= 'de'  ><input type='hidden' name='de' form='form1' value='off'> </td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= ''  type='checkbox' id = 'dn' name= 'dn'  ><input type='hidden' name='dn' form='form1' value='off'> </td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><select  form ='form1' class= 'form-control input-sm' value='"+drug.baf+"' id = 'baf' name= 'baf'  required><option>Before</option><option>After</option></select> </td></tr>";
    	           	  newCell.style.width ='90px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' value='"+drug.totn+"' id = 'totn' name= 'totn'  required> </td></tr>";
    	           	  newCell.style.width ='80px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' id = 'nofdays' value='"+drug.nofdays+"'name= 'nofdays'  required> </td></tr>";
    	           	  newCell.style.width ='50px';
    	           		 
    	           	 
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
    	           	  newCell.style.width ='50px';
    	           		 
    	           	 if(drug.dm == "on"){
  	        		   document.getElementById("dm").checked = true;
  	        		
  	        	   }
  	               if(drug.da == "on"){
  	        		   document.getElementById("da").checked = true;
  	        		
  	        	   }
  	               if(drug.de == "on"){
  	        		   document.getElementById("de").checked = true;
  	        		
  	        	   }
  	               if(drug.dn == "on"){
  	        		   document.getElementById("dn").checked = true;
  	        		
  	        	   }
  	          
  	            	  
	            	  
      	           });
    	            	  
    	            	  var rows ="";
    	      	        	 $.each(response.list18, function(index, drug) {
    	      	        		
    	      	  	        	 rows += "<tr><td>" + drug.fileno + "</td><td>" + drug.height + "</td><td>" + drug.weight + "</td><td>" + drug.temperature + "</td><td>"+drug.ac+"</td><td>"+drug.bp+"</td><td>"+drug.pulse+"</td><td>"+drug.bmi+"</td><td>"+drug.fi+"</td><td>"+drug.time+"</td></tr>";
    	      	     	     	       	     
    	      	  	     
    	      	  	         
    	      	 	          
    	      	 	            	  
    	      	 	            	 
    	      	    	           });
    	      	       	   $( rows ).appendTo( "#myTable3 tbody" );
      	           },
      	           error: function(e){
      	        	  
      	        	           alert('Error: ' + e);
      	        	  
      	        	           }
      	        	           });
      	        	   
      	        	           }
    	        	        	   
    	        	        	           


      

       
       
       </script>
<script type="text/javascript">
       function doAjaxPost12q(fileno) {
    	   // get the form values
    	   
    	  
    	         //  var name = $('#pname').val();
    	            //var docid = $('#docid').val();
    	             $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/prescription1/"+fileno+"",
    	        	           async : false,
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           
    	        	          
    	        	           
    	        	          
    	             
    	             success: function(response){
      	        	   
      	        	   $.each(response.list3, function(index, addn) {
      	                    //to print name of employee
      	                   
      	                 $("#pid").append('<option value="'+addn.pid+'"selected="">'+addn.pid+'</option>');
      	               $("#pid").selectpicker("refresh");
      	               
      	               $("#pname").append('<option value="'+addn.pname+'"selected="">'+addn.pname+'</option>');
      	               $("#pname").selectpicker("refresh");
      	               
      	             //  document.getElementById("docid").value = strSplit[0];
      	                document.getElementById("pname").disabled = true; 
      	                document.getElementById("pid").disabled = true;
      	              if( addn.admit == "Yes"){
      	   		          $('#yes').click();
      	   		        }
      	   	          else{
      	   		           $('#no').click();
      	   		          }
      	             
  	            	   document.getElementById("fileno").value = addn.fileno;
  	            	   document.getElementById("rdate").value = addn.date;
  	               
  	                   document.getElementById("pc").value =addn.pc;
      	           
  	            	   document.getElementById("pmsh").value=addn.pmsh;
  	            	  
  	            	   document.getElementById("ph").value = addn.ph;
  	            	   document.getElementById("dhr").value = addn.dh;
  	            	   document.getElementById("fh").value = addn.fh;
  	            	   document.getElementById("ogh").value = addn.ogh;
  	            	   document.getElementById("psh").value = addn.psh;
  	            	   document.getElementById("sge").value= addn.sge;
  	            	   document.getElementById("scv").value = addn.scv;
  	            	   document.getElementById("sres").value= addn.sres;
  	                   document.getElementById("sgas").value =addn.sgas;
  	                   document.getElementById("smusc").value =addn.smusc;
	            	   document.getElementById("sgenit").value=addn.sgenit;
	            	   document.getElementById("sendoc").value = addn.sendoc;
	            	   document.getElementById("sskin").value= addn.sskin;
	            	   document.getElementById("scns").value = addn.scns;
	            	   document.getElementById("pge").value = addn.pge;
	            	   document.getElementById("poc").value = addn.poc;
	            	   document.getElementById("pns").value= addn.pns;
	            	   document.getElementById("pcv").value = addn.pcv;
	            	   document.getElementById("prs").value= addn.prs;
	                   document.getElementById("pas").value =addn.pas;
	                   document.getElementById("pds").value =addn.pds;
	            	   document.getElementById("pir").value=addn.pir;
	            	   $('#myModal').modal('show');
	            	
      	               }),
      	               
      	             $.each(response.list4, function(index, datec) {
      	            	
  	                 $("#typeofdr").append('<option value="'+datec.gtest+'"selected="">'+datec.gtest+'</option>');
    	               $("#typeofdr").selectpicker("refresh");
    	              
      	             }),
      	             
      	           $.each(response.list5, function(index, drug) {
      	        	 
	                   $("#typeofdr").append('<option value="'+drug.typeofdr+'"selected="">'+drug.typeofdr+'</option>');
    	               $("#typeofdr").selectpicker("refresh");

    	           	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
    	           	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
    	           	
    	           	//    var m = moment().format('YYYY-MM-DD h:mm a');

    	           	  var newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><select class='selectpicker form-control' data-live-search='true'  form ='form1'   id = 'typeofdr' name= 'typeofdr'  required></option> </td></tr>";
    	           	  newCell.style.width ='100px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.drugname+"' type='text' id = 'drugname' name= 'drugname'  required> </td></tr>";
    	           	  newCell.style.width ='100px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.strdrug+"' type='text' id = 'strdrug' name= 'strdrug'  required> </td></tr>";
    	           	  newCell.style.width ='100px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  value='"+drug.dm+"' type='text' id = 'dm' name= 'dm'  > </td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value= '"+drug.da+"'  type='text' id = 'da' name= 'da'  > </td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+ drug.de+"' type='text' id = 'de' name= 'de'  > </td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.dn+"' type='text' id = 'dn' name= 'dn'  > </td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><select  form ='form1' class= 'form-control input-sm' value='"+drug.baf+"' id = 'baf' name= 'baf'  required><option>Before</option><option>After</option></select> </td></tr>";
    	           	  newCell.style.width ='90px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' value='"+drug.totn+"' id = 'totn' name= 'totn'  required> </td></tr>";
    	           	  newCell.style.width ='80px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' id = 'nofdays' value='"+drug.nofdays+"'name= 'nofdays'  required> </td></tr>";
    	           	  newCell.style.width ='50px';
    	           		 
    	           	 
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
    	           	  newCell.style.width ='50px';
    	           		 

  	            	  
	            	  
      	           });
      	        	
      	           },
      	           error: function(e){
      	        	  
      	        	           alert('Error: ' + e);
      	        	  
      	        	           }
      	        	           });
      	        	   
      	        	           }
    	        	        	   
    	        	        	           


      

       
       
       </script>
           <script>
       
       function doAjaxPost2() {
    	   // get the form values
    	   sav = 0;
    	  var counter = 1;
    	 
    	         //  var name = $('#pname').val();
    	            //var docid = $('#docid').val();
    	             $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/prescription4",
    	        	         async : false,
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           success: function(response){
    	          	        	
    	          	        	   $.each(response.list4, function(index, addn) {
    	          	                    //to print name of employee
    	          	                
    	    	            	
    	    	            	  
    	    	            	
    	    	            	  if(addn.tabidc == "home"){
    	    	            		  $(document).ready(function(){

    	    	            		  var newTextBoxDiv0 = $(document.createElement('div'))
    	    	            		    .attr("class", 'form-group row')
    	    	            		    .attr("id",'form1ac' + counter);
    	    	            		  
    	    	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;cursor: default;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" onkeypress="return onlyAlphabets(event,this);" name="df" id="df" value=" place"> &#13;&#10 </textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
    	    	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
    	    	            		    
    	    	            		    counter++;
    	    	            		    
    	    	            		  });
    	    	            	
    	    	            	
    	    	            	  }
    	    	            	  
    	                           if(addn.tabidc == "menu1"){
    	                        		  $(document).ready(function(){

    	            	            		  var newTextBoxDiv0 = $(document.createElement('div'))
    	            	            		    .attr("class", 'form-group row')
    	            	            		    .attr("id",'form1ac' + counter);
    	            	            		  
    	            	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;cursor: default;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" onkeypress="return onlyAlphabets(event,this);" name="df" id="df" value=" place" >&#13;&#10 NA</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
    	            	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
    	            	            		    
    	            	            		    counter++;
    	            	            		    
    	            	            		  });
    	    	            	  }
    	                           if(addn.tabidc == "menu2"){
    	                        		  $(document).ready(function(){

    	            	            		  var newTextBoxDiv0 = $(document.createElement('div'))
    	            	            		    .attr("class", 'form-group row')
    	            	            		    .attr("id",'form1ac' + counter);
    	            	            		  
    	            	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;cursor: default;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df" onkeypress="return onlyAlphabets(event,this);" >&#13;&#10 NA</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
    	            	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
    	            	            		    
    	            	            		    counter++;
    	            	            		    
    	            	            		  });
    	     	            	  }
    	                           if(addn.tabidc == "menu3"){
    	                        		  $(document).ready(function(){

    	            	            		  var newTextBoxDiv0 = $(document.createElement('div'))
    	            	            		    .attr("class", 'form-group row')
    	            	            		    .attr("id",'form1ac' + counter);
    	            	            		  
    	            	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;cursor: default;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df" >&#13;&#10 NA</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
    	            	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
    	            	            		    
    	            	            		    counter++;
    	            	            		    
    	            	            		  });		    
    	     	            	  }
    	     	            	  
    	    	            	  
    	    	            	   
    	    	            	 
    	          	               });
    	          	               
         },
         error: function(e){
      	  
      	           alert('Error: ' + e);
      	  
      	           }
      	           });
    	             document.getElementById("rdate").valueAsDate = new Date();
    	         	
    	             $('#myModal').modal({
	     	     			backdrop: 'static'
	     	     		});
    	             
    	             
    	             $('#ppe').hide()
  	            	$('#pe').hide()
  	            	$('#sr').hide()
 	            	
      	           }    
    	        	          
    	        	           
    	        	          
       
       
       </script>
<script type="text/javascript">

$(document).ready(function(){

    var counter = 1;
    var val;

    $("#addButton").click(function () {

    	var person = prompt("Please enter the Field name:", "");
    	 if (person == null || person == " " || person.length == "0") {
    	       
    	  		return false;
  	    } else {
  	       
  	        val = person;
  	    }

	if(tabid == "menu4"){
		return false;
	}
  	var newTextBoxDiv0 = $(document.createElement('div'))
    .attr("class", 'form-group row')
    .attr("id",'form1ac' + counter);
  	
    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px; color :#ff9900;" onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;cursor: default;">'+val+'</button><input type="hidden" name="buttonl" form="form1" value="'+val+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df" onkeypress="return onlyAlphabets(event,this);"></textarea></div><input form="form1" type="hidden" name="tabid" value='+tabid+'></div>');
    newTextBoxDiv0.appendTo('#'+tabid);
    
    counter++;
     });

 
  
    
    $("#removeButton").click(function () {
    	if(counter==1){
              alert("No more textbox to remove");
              return false;
           }

    	counter--;
    	
            $("#form1ac" + counter).remove();

         });

    
  });
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('.modal-content').resizable({
	    //alsoResize: ".modal-dialog",
	    minHeight: 300,
	    minWidth: 400
	});
	$('#myModal1 .modal-dialog').draggable();

	$('#myModal1').on('show.bs.modal', function () {
	    $(this).find('.modal-body').css({
	    	'max-height':'100%'
	    });
	});

});

</script>

<script type="text/javascript">
$(document).ready(function(){
	$('#mc1').resizable({
	    //alsoResize: ".modal-dialog",
	   
	    minWidth: 100
	});
	$('#myModal2 .modal-dialog').draggable();

	$('#myModal2').on('show.bs.modal', function () {
	    $(this).find('.modal-body').css({
	    	'max-height':'100%'
	    });
	});

});

</script>
<script type="text/javascript">
$(document).ready(function(){
$('#form1').draggable();
});
</script>

</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />',admnme='<c:out value="${pageContext.request.userPrincipal.name}" />'),hide('<c:out value="${username}" />')">

<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >My Appointments</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id ="ho" href="">Home</a></li>
        <li class=""><a id="hc" href="">General Checkup</a></li>
         <li class=""><a id="m2" href="">Treatment Records</a></li>  
           <li class=""><a  href="/HMS/discharge">Discharge Summary</a></li>
         
         </ul>
         <br>
         <i class='fa fa-arrow-left button2 rightspace' id="back" style='font-size:20px;color : #f0ad4e' onclick="window.location.href='/HMS/doctor1';"></i>
     <!--      
      <ul class="nav navbar-nav navbar-right">
       <li style ="color:#ff9900;"><span class="glyphicon glyphicon-log-in"></span> Welcome : ${pageContext.request.userPrincipal.name}</li>
      </ul>
      -->
  </div>
</nav>
  <center>
</center>
 <form id="formab" action="" method="post">  
  <h1>
	 <!--   <button type="button" class="btn btn-warning button1" onclick="disp()">
	 <span class="glyphicon glyphicon-plus"></span>New Prescription</button> -->
<font size="5">My Appointments</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Patient Name or Id"  style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed gamma" style="width: 1000px; " id="myTable">
    <thead class="thgamma">
      <tr>
        <th style="width:240px;">Patient Id</th>
        <th style="width:240px;">Patient Name</th>
        <th style="width:240px;" id="dh">Doctor Name</th>
        <th style="width:240px;" class="">Appointments</th>
       
      </tr>
    </thead>
    <tbody class="tbgamma">
   
    <c:forEach var="p1"  items="${model.list1}">
    <tr>
    <td width="240px;" ><a href="" target="_blank" onclick="copyval1('${p1.pid}','${p1.pname}','${p1.fileno}','${p1.docid}',this)" >${p1.pid}</a></td>
    <td width="240px;">${p1.pname}</td>
    <td width="240px;" class="trunk">${p1.dname}</td>
    <td width="240px;">${p1.appointment}</td>

    
  
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    <button type="" class="bouton-contact"></button>
     </form>

 <div class="container">
 
  <!-- Trigger the modal with a button -->
 

 
    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
 <form id="form1" action="/HMS/saveprs.html" method="post"> 
  <h1 id="">Out Patient-Primary Survey
        <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>    
      
        </h1>
  <br>
  
   
  <div class="container">

 
    
 <button type="button" class="btn btn-primary btn-block"><span style="float:left">Gathering Patient Information</span><span id="flno" style="float:right">Fileno</span><span id="id" style="float:right;margin-right:15px;">Id</span><span style="float:right;margin-right:25px;" id="nm">Name</span></button>
 <br>
  <ul class="nav nav-pills nav-stacked col-md-2">
    <li class="active"><a data-toggle="pill" onclick = "return copyval('home1')" href="#home1">Patient Details</a></li>
    <li><a data-toggle="pill" onclick = "return copyval('menu3a')" href="#menu3a">Patient Vitals</a></li>
    <li id="ppe"><a data-toggle="pill"  onclick = "return copyval('home')" href="#home">Presenting Problems/Complaints</a></li>
    <li id="sr"><a data-toggle="pill" onclick = "return copyval('menu1')" href="#menu1">Systems Review</a></li>
    <li id="pe"><a data-toggle="pill" onclick = "return copyval('menu2')" href="#menu2">Patient Examination</a></li>
    <li><a onclick = "return copyval2('menucd')" id="menucd" href="" target="_blank">Clinical Diagnosis</a></li>
    <li><a data-toggle="pill" onclick = "return copyval('menu3')" href="#menu3">Provisional Diagnosis</a></li>
  <li><a onclick = "return copyval1('menu4a')" id="menu4a" href="" target="_blank">Lab</a></li>
    <li><a data-toggle="pill" onclick = "return copyval('menu4')" href="#menu4">Prescription</a></li>
   
   
  </ul>
  
    
  <div class="tab-content col-md-8">
  <!-- Home1-->
   <div id="home1" class="tab-pane fade in active">
    <br><br>
    <div class="form-group row" >
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input readonly="readonly"  type="" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black; cursor: default;" value="Patient Name">
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
       <select class="selectpicker form-control btn btn" data-live-search="true" name = "pname1" id ="pname" onchange="addcname()"   >
          <option disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.fileno}">${p.pname}</option>
        </c:forEach>
      </select></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
      <div class="col-xs-1">
      <button type="button" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" >Patient Id</button>
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
             <select class="selectpicker form-control" data-width="100%"  data-live-search="true"  name = "pid1" id ="pid"  required>
      <option disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value="${p.pid},${p.pname},${p.fileno}">${p.pid}</option>
        </c:forEach>
      </select></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Date">
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
       
         <input type="date" name="date" id="rdate" class="form-control input-sm" form="form1" readonly="readonly" required>
        </div>
      </div></div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="File No">
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
       <input type="text" name="fileno" id="fileno" class="form-control input-sm" form="form1"  required>
        </div>
      </div>
     </div>
     <input type="hidden" name="pname" form="form1" id="pname1">
  <input type="hidden" name="pid" form="form1" id="pid1" >
  <input type="hidden" name="docid" id="docid" form = "form1">
  <input type="hidden" name="dname" id="dname" form = "form1">
     </div>
   
  <!-- Home -->
    <div id="home" class="tab-pane fade">
    <br><br>
    <div class="form-group row" id="#co1">
    
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input  readonly="readonly" type="button" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Presenting Complaints">
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="pc" id="pc" rows="5" form="form1"></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
      <div class="col-xs-1">
      <button type="button" class="btn btn" style="width: 170px;height:45px;background-color:#dcdcdc;color:black;cursor: default;" >Past Medical & <br>Surgical History</button>
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="pmsh" id="pmsh" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Pain History">
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
       
      <textarea name="ph" id="ph" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
           <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Drug History">
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
       
      <textarea name="dh" id="dhr" rows="5" form="form1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value = "Family History">
     </div>
     <div class="col-xs-1"></div>
     
      <div class="col-xs-4">
       <div class="form-group">
        <textarea name="fh" id="fh" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <button type="button" class="btn btn" style="width: 170px;height :45px;background-color:#dcdcdc;color:black;cursor: default;">Obstetrics and <br>Gynaecology History</button>
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
           <textarea name="ogh" id="ogh" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Personal/Social History">
     </div>
      <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="psh" id="psh" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div></div>
    
  </div>
      
      <!-- Menu1 -->
    <div id="menu1" class="tab-pane fade">
    <br><br>
    <!--  
     <div class="form-group row" >
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input type="button" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="General Examination">
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="sge" id="sge" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      -->
      <div class="form-group row" >
      <div class="col-xs-1"></div>
      <div class="col-xs-1">
      <button type="button" class="btn btn" style="width: 170px;height:40px;background-color:#dcdcdc;color:black;cursor: default;" >Cardiovascular</button>
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="scv" id="scv" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" type="button" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Respiratory">
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
       
      <textarea name="sres" id="sres" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Gastrointestinal">
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
         
      <textarea name="sgas" id="sgas" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value = "Musculoskeletal">
     </div>
     <div class="col-xs-1"></div>
     
      <div class="col-xs-4">
       <div class="form-group">
        <textarea name="smusc" id="smusc" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Genito-Urinary">
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
           <textarea name="sgenit" id="sgenit" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Endocrine">
     </div>
      <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="sendoc" id="sendoc" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div></div>
       <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Skin">
     </div>
      <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="sskin" id="sskin" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div></div>
      
       <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <button type="button" class="btn btn" style="width: 170px;height:45px;background-color:#dcdcdc;color:black;cursor: default;">Central Nervous <br> System</button>
     </div>
      <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="scns" id="scns" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      
      </div>
      
      <!-- Menu 2 -->
    <div id="menu2" class="tab-pane fade">
     <br><br>
   <div class="form-group row" >
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input readonly="readonly" type="button" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="On Examination">
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="pge" id="pge" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
      <div class="col-xs-1">
      <button type="button" class="btn btn" style="width: 170px;height:40px;background-color:#dcdcdc;color:black;cursor: default;" >Oral Cavity</button>
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="poc" id="poc" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Nervous System">
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
       
      <textarea name="pns" id="pns" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Cardiovascular">
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
         
      <textarea name="pcv" id="pcv" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value = "Respiratory System">
     </div>
     <div class="col-xs-1"></div>
     
      <div class="col-xs-4">
       <div class="form-group">
        <textarea name="prs" id="prs" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Abdominal System">
     </div>
     <div class="col-xs-1"></div>
      <div class="col-xs-4">
       <div class="form-group">
           <textarea name="pas" id="pas" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
</div>

<!-- Menu 3 -->
    <div id="menu3" class="tab-pane fade">
     <br><br>
      <div class="form-group row" >
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input readonly="readonly" type="" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Provisional Diagnosis">
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="pds" id="pds" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
      <div class="col-xs-1">
      <button type="button" class="btn btn" style="width: 170px;height:45x;background-color:#dcdcdc;color:black;cursor: default;" >Pathology Investigation <br> Recommended</button>
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="pir" id="pir" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      
  
      <div class="form-group row" >
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input readonly="readonly" type="" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Admit Patient">
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
      <div class="form-group">
       <div class="btn-group" data-toggle="buttons">
     <label class="btn btn-default"><input class="form-control input-sm"  style="width: 0px;" value="Yes" id="yes" type="radio" form="form1" name="admit" />Yes</label>
 		<label class="btn btn-default"><input class="form-control input-sm" style="width: 0px;" type="radio" value="No" id="no" form="form1" name="admit" />No</label>
 		</div>
      </div>
      </div></div>
   </div>
      
      <div id="menu3a" class="tab-pane fade">
     <br>


  
   <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Height<span></span></p>
             <input type="text" class="form-control" form="form1" onkeypress='return onlyNos(event,this);'  oninput="calculateBmi()" value="0" name="height" id="height" >
	</div>
  </div>
  
        <div class="col-xs-2">
  <div class="form-group">
            <p> Unit<span></span></p>
            
             <select class="form-control" form="form1" onchange="calculateBmi()" name="unith" id="unith" >
             <option value="" selected disabled>Select Unit</option>
             <option value="feet">feet</option>
             <option value="inches">inches</option>
             <option value="cm">cm</option>
              <option value="meters">meters</option>
             </select>
	</div>
  </div>
  
   <div class="col-xs-3">
  <div class="form-group">
            <p>Weight<span></span></p>
           <input type="text" class="form-control" form="form1" onkeypress='return onlyNos(event,this);'  oninput="calculateBmi()"value="0" name="weight" id="weightw" >
	</div>
  </div>
   <div class="col-xs-2">
  <div class="form-group">
            <p> Unit<span></span></p>
         <select class="form-control" form="form1" onchange="calculateBmi()" name="unitw" id="unitw" >
             <option value="" selected disabled>Select Unit</option>
              <option value="kilogram">kilogram</option>
             <option value="pounds">pounds</option>
             
             </select>
	</div>
  </div>
  </div>
  
  <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Temperature<span></span></p>
             <input type="text" class="form-control" form="form1" onkeypress='return onlyNos(event,this);'  name="temperature" id="temperature" >
	</div>
  </div>
  
        <div class="col-xs-2">
  <div class="form-group">
            <p>Unit<span></span></p>
            
             <select class="form-control" form="form1" name="unitt" id="unitt">
             <option value="" selected disabled>Select Unit</option>
             <option value="celsius">celsius</option>
             <option value="fahrenheit">fahrenheit</option>
           
             </select>
	</div>
  </div>
  
   <div class="col-xs-5">
  <div class="form-group">
            <p>Abdominal Circumference<span></span></p>
           <input type="text" form="form1" onkeypress='return onlyNos(event,this);' class="form-control"  name="ac" id="ac">
	</div>
  </div>
   
  </div>
  <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Blood Pressure<span></span></p>
             <input type="text" form="form1" class="form-control" size="2" onkeypress='return onlyNos1(event,this);' name="bp" id="bp" value="">
	</div>
  </div>
  
        <div class="col-xs-2">
  <div class="form-group">
           
            <p>Pulse<span></span></p>
             <input type="number" form="form1" class="form-control" min="0" name="pulse" id="pulse" value="72">
           
	</div>
  </div>
  
     <div class="col-xs-5">
  <div class="form-group">
           
            <p>Body Mass Index<span></span></p>
             <input type="text" form="form1" class="form-control" onkeypress="return onlyAlphabets(event,this);" readonly="readonly" name="bmi" id="bmi" value="">
           
	</div>
  </div>
  </div>
  
  
  <div class="form-group row" >
        <div class="col-xs-1"></div>
   <div class="col-xs-8">
  <div class="form-group">
            <p>Chest Circumference<span></span></p>
           <input type="text" form="form1" class="" size="16" onkeypress='return onlyNos(event,this);' placeholder="Full Inspiration" name="fi" id="fi">
            <input type="text" form="form1" class="" size="16" onkeypress='return onlyNos(event,this);' placeholder="Full Expiration" name="fe" id="fe">
             <input type="text" form="form1" class="" size="12" onkeypress='return onlyNos(event,this);' placeholder="At Rest" name="rest" id="rest">
	</div>
  </div>
  <div class="col-xs-1">
  <br>
  <button id="get" type="button" class="btn btn-warning btn-sm" onclick="return checklen()">View Previous Records</button>
  
  </div>
  
  </div>
  
  
     
    
   </div>
   <!-- Menu $4 -->   
 <div id="menu4" class="tab-pane fade">
     <br><br>
       <div class="table-responsive">
	     
	     
	     	    
  <table class="table table-striped table-bordered table-fixed table-hover table-condensed alpha" id="myTable1">
    <thead class="thalpha">
    <tr>
        <th style="">Category of Drug</th>
        <th style="">Name of Drug</th>
        <th style="">Strength of Drug</th>
        <th style="">Dosage</th>
        <th  style="" >Frequency</th>
        
        <th  style="">Remarks</th>
        <th> Number of Quantity dispensed</th>
        <th >No. of Days</th>
        <th >Delete Row</th>
        
        </tr>
    
    </thead>
    <tbody class="tbalpha">

   
    </tbody>
    <!--  
     <tr id="hide">
		    <td><i class='fa fa-plus' style='font-size:20px; color : #ff9900;'  onclick="display()"></i></td>
		  </tr>
	-->	  
    </table>
   
	      
	      
	      
	      </div>
      </div>

<div class="form-group row" >
  
    <div class="col-xs-2">
    <p><b>Advice</b></p>
    <textarea name="advice" id="advice" form="form1"></textarea>
    </div>
     <div class="col-xs-3"></div>
     <div class="col-xs-7">
     <br><br>
    <input type='button' class="btn btn-info btn-sm"  value='Add Row' onclick="display()" id='adr'>
         <input type='button' class="btn btn-info btn-sm" value='Add Field' id='addButton'>
         <input type='button' class="btn btn-info btn-sm" value='Show Available Drugs' id='showdrugs' data-toggle="modal" data-target="#myModal2">
  <!-- open2 unique class name -->
            <button class="btn btn-info btn-sm" form="form1" id ="bouton-contact" type="submit" >Save <span class="fa fa-save"></span></button>
    <a class="btn btn-info btn-sm" style="float:right;margin-right:-70px;" id ="print" onclick="return verpr();" href="" target="_blank" >Print Prescription</a>
          
                 
    
    </div>
  </div>
</div>
</div>
     <br>
        <div class="col-lg-10 col-lg-offset-2">
          <!-- back2 unique class name  -->
          <center>
       
          </center>
        </div>
   
    
 
  <!-- id will be unique, but class name will be same -->
 
 
  <button type="" class="bouton-contact" onclick=""></button>
  
</form>
</div>
</div>
 </div>
 
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">View Previous Vitals</h4>
      </div>
      <div class="modal-body">
      <div class="table-responsive">  
    
        <table class="table table-striped table-bordered table-fixed table-hover table-condensed beta"  id="myTable3">
          
        
    <thead class="thead2">
      <tr>
        <th width="">FileNo</th>
        <th width="">Height</th>
        <th width="">Weight</th>
        <th width="">Temper<br>-ature</th>
        <th width="">Abdominal Circumference</th>
        <th width="">Blood Pressure</th>
        <th width="">Pulse</th>
        <th width="">BMI</th>
        <th width="">Chest Circumference<br>(Full Inspiration/Full Expiration/At Rest)</th>
        <th width="">Time Recorded</th>
       
      </tr>
    </thead>
    <tbody class="tbody2">
   
    </tbody>
    </table>
    </div>
    
    </div>
    </div>
      </div>
      <div class="modal-footer">
        
        </div>
        </div>
        
                
       <!-- Pharmacy products load -->
       
       <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog  modal-sm" role="document">
    <div class="modal-content" id="mc1">
      <div class="modal-header" id="mh">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Pharmacy Products</h4>
      </div>
      <div class="modal-body" id="mb">
       
     <div class="form-group row" >
        <div class="col-xs-8">
        <p>Drug Name<span></span></p>
       <div class="form-group">
      
       <select class="selectpicker form-control input-sm" data-size="5" data-live-search="true" name = "drugn" id ="drugn" onchange=""   >
          <option value="select" disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list4}">
        <option data-subtext="Stocks -${p.pstock1}" value="${p.drugn}">${p.drugn}</option>
        </c:forEach>
      </select></div>
      </div>
      <div class="col-xs-2">
       <br><br>
      <button type="button" class="btn btn-warning" onclick="return addp()">ADD</button></div>
      </div>
      </div>
 
    </div>
    </div>
      </div>
     
        </div>
        
 <c:forEach var="p"  items="${model.list1}">
<script>
//check('<c:out value="${p.docid}" />','<c:out value="${p.dname}" />','<c:out value="${p.specialization}" />');
check('<c:out value="${p.docid}" />','<c:out value="${p.dname}" />');
//checkhome('<c:out value="${p.docid}" />','<c:out value="${p.idc}" />');

</script>
</c:forEach>
</body>
<script>

function filterTable(event) {

	var filter = event.target.value.toUpperCase();
    var rows = document.querySelector("#myTable tbody").rows;
    
    for (var i = 0; i < rows.length; i++) {
        var firstCol = rows[i].cells[0].textContent.toUpperCase();
        var secondCol = rows[i].cells[1].textContent.toUpperCase();
        var thirdCol = rows[i].cells[2].textContent.toUpperCase();
        if (firstCol.indexOf(filter) > -1 || secondCol.indexOf(filter) > -1 || thirdCol.indexOf(filter) > -1) {
            rows[i].style.display = "";
        } else {
            rows[i].style.display = "none";
        }      
    }
}

document.querySelector('#myInp').addEventListener('input', filterTable, false);
</script>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</html>