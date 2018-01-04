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

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>

<style>
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

}
.btn btn{
  padding: 15px 15px;
   
        /* All browsers since IE 5.5+ */

    max-width:170px;
  
}
.btn-block{
 width : 1050px;
}

.remove{

}
#myTable1 th {
    background-color: #009999;
    color: black;
} 
   
#myTable1 .tbody{
    height:200px;
    overflow :auto;
 }
 #myTable1 .thead1,.tbody{
  
    display:block;
  }
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
  max-width:1100px;
  width:100%;
  margin: 5% auto;
  background-color: #FFFFFF;
  overflow: hidden;
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
  max-width:1000px;
  width:100%;
  margin: 5% auto;
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
  width: 400px;
  height: 50px; 
  float: left;
  padding: 0px 15px;
}
#symptoms {
  border-radius: 0px 5px 5px 0px;
  border: 1px solid #cccccc;
  margin: 0;
  width: 570px;
  height: 50px; 
  float: left;
  padding: 0px 15px;
}
#systemic{
	 border-radius: 0px 5px 5px 0px;
  border: 1px solid #cccccc;
  margin:0;
  width: 400px;
  height: 110px; 
  float: left;
  padding: 0px 15px;
  margin-bottom : 0.5cm; 
}


#mt{
	margin-top : 2cm;
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




#myTable th {
    background-color: #009999;
    color: white;
    width : 192px;
}



.table-fixed{
 
}
#myTable  tbody{
    height:300px;
    overflow-y:auto;
 }
 
 #myTable thead,tbody{
  
    display:block;
  }
  

  

#myTable3 th {
    background-color: #009999;
    color: white;
    
}



.table-fixed{
 
}



.button1{
	float : left;
}
.button2{
	float : right;
}
</style>




<script type="text/javascript">

function checkhome(user){

	
		if(user.includes("[ROLE_DOCTOR]")){
			var url = "/HMS/doctor1" ;
			
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url);
			 
			 var url1 = "/HMS/myapps" ;
	
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
		 
		   var url1 = "/HMS/myapps" ;
			
			 var element1 = document.getElementById('hc');
			 element1.setAttribute("href",url1)
			 
			  var url2 = "/HMS/treatment" ;
			
		 var element = document.getElementById('m2');
		 element.setAttribute("href",url2)
	}
}

function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable1").deleteRow(i);
    disbut();
    
}
function deleteRow1(r) {
	
    
    document.getElementById("myTable1").deleteRow(i);
    
}
function hide(user){
	
		if(user.includes("ROLE_DOCTOR")){
			document.getElementById("dh").style.display="none";
			var no = document.getElementsByClassName("trunk");
			for(var i=0;i<no.length;i++){
				no[i].style.display="none";
				
			}
			
			document.getElementById("myTable").setAttribute("style","border:0;"); 
		  document.getElementById("form2").style.width ='800px'; 
			
		}
		
		
	else{
		document.getElementById("dh").style.display="visible";
		document.getElementById("tr").style.display="visible";
		
	}
	}
function myFunction() {
	
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	 
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
	
function disp(){
	$('#myModal').modal('show');
}
function check(id,name){

	document.getElementById("docid").value = id;
	document.getElementById("dname").value = name;
	
	
}

var tabid;
function copyval(tabi){
	tabid = tabi;
	
} 

function display(){ 
	
	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	
	//    var m = moment().format('YYYY-MM-DD h:mm a');

	  var newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<input type='text'  form ='form1'  class= 'form-control input-sm' value=' ' id = 'typeofdr' name= 'typeofdr'  required>";
	  newCell.style.width ='100px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value=' '  type='text' id = 'drugname' name= 'drugname'  required> </td></tr>";
	  newCell.style.width ='100px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value=' ' type='text' id = 'strdrug' name= 'strdrug'  required> </td></tr>";
	  newCell.style.width ='100px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value=' ' type='text' id = 'dosage' name= 'dosage'  required> </td></tr>";
	  newCell.style.width ='50px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= ''  type='checkbox' id = 'dm' value= 'on' name= 'dm'  ><input type='hidden' name='dm' value='off' form='form1'> </td></tr>";
	  newCell.style.width ='37.5px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= ''  type='checkbox' id = 'da' name= 'da' value='on'  ><input type='hidden' name='da' value='off' form='form1'> </td></tr>";
	  newCell.style.width ='37.5px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= ''  type='checkbox' id = 'de' name= 'de' value='on' ><input type='hidden' name='de' value='off' form='form1'> </td></tr>";
	  newCell.style.width ='37.5px';
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= ''  type='checkbox' id = 'dn' name= 'dn' value='on' ><input type='hidden' name='dn' value='off' form='form1'> </td></tr>";
	  newCell.style.width ='37.5px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><select  form ='form1' class= 'form-control input-sm' value=' ' id = 'baf' name= 'baf'  required><option>Before</option><option>After</option></select> </td></tr>";
	  newCell.style.width ='90px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value=' ' type='text' id = 'totn' name= 'totn'  required> </td></tr>";
	  newCell.style.width ='70px';
		 
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value=' ' type='text' id = 'nofdays' name= 'nofdays'  required> </td></tr>";
	  newCell.style.width ='50px';
		 
	 
	  
	  newCell = rowsAdd.insertCell();
	  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
	  newCell.style.width ='50px';
		 

	disbut();
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
	
	document.getElementById("id").innerHTML = str[0];
	document.getElementById("nm").innerHTML = str[1];
	document.getElementById("flno").innerHTML = str[2];
	document.getElementById("fileno").value = str[2];
	doAjaxPost(str[2])
	
	
	
	
}

var arr = [];
function getvalue(myname) {
	
	
	
	
	if (document.getElementById(myname).selected){
	
		arr.push(myname);
	 //   alert(arr);
	}
	else 
		{
		alert(arr);
	    arr.splice( arr.indexOf(myname), 1 );
		
		}
       console.log(arr);
       alert(arr);
	document.getElementById("medicine").value = arr.join("\n");
		
	
	
	}
function disbut(){
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
		 
		/*
		if(tableRef.rows.length == "0"){
			document.getElementById("bgh").disabled = true;
		}
		else{
			document.getElementById("bgh").disabled = false;	
		}
		*/
	}
	
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/prescription.html";
	}
}

function clos(){
	window.location.reload();
}

function rem(remdata){
	//alert(remdata);
	  $(remdata).remove();
}
function rem1(remdata){
	  alert(remdata);
	  $('#co1').remove();
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
      
        if ((charCode == 44)){
            alert("Please use any other charachter! ");
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

function copy(pid,sym,treat,diag,ka,pm,systemic,gtest,gvalue){

	var strSplit = pid.split(',');

	 document.getElementById("#bouton-contact").disabled = true;
   document.getElementById("pid").value = strSplit[0];
   
   $("#pid").append('<option value="'+strSplit[0]+'"selected="">'+strSplit[0]+'</option>');
   $("#pid").selectpicker("refresh");
   
   $("#pname").append('<option value="'+strSplit[1]+'"selected="">'+strSplit[1]+'</option>');
   $("#pname").selectpicker("refresh");
   
 //  document.getElementById("docid").value = strSplit[0];
    document.getElementById("pname").disabled = true; 
    document.getElementById("pid").disabled = true;
  
   
  
   
 //  document.getElementById("pid").value= strSplit[3];
   
   document.getElementById("pname").value = strSplit[4];
   
   if( strSplit[5] == "Yes"){
	     $('#yes').click();
	     
	   }
 else{
	     $('#no').click();
	    
	    }
   /*
   document.getElementById("symptoms").value = sym; 
   
   document.getElementById("treatment").value = treat;
   
  
   document.getElementById("medicine").value = diag;
   
   document.getElementById("rdate").value = strSplit[6];
   
  // document.getElementById("admit").value = strSplit[8];
   

     document.getElementById("ka").value = ka;
     document.getElementById("pm").value = pm;
     document.getElementById("systemic").value = systemic;
     
 	var gt = gtest.split(',');
    
	var gv = gvalue.split(',');
   

	  for(var x=0; x<gt.length; x++) {
		  
		  var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	    	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
		  
	    
		 
		  var newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='190px';><input style='width: 140px;' form ='forma' class= 'form-control input-sm'  type='text' id = 'gtest' name= 'gtest' value='"+gt[x]+"' required> </td></tr>";
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td width ='190px';><textarea form ='forma'  style='width: 140px;' class= 'form-control input-sm'  rows='1'  id = 'gvalue'  name= 'gvalue' value ='"+gv[x]+"' required>"+gv[x]+"</textarea></td></tr>";
		 
		
		  
		  newCell = rowsAdd.insertCell();
		  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' style='width: 85px;font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
		  

	  }

  */
 
   $('#myModal').modal('show');

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
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('.launch-modal').click(function(){
		$('#myModal').modal({
			backdrop: 'static'
		});
	}); 
});
</script>
<script type="text/javascript">




       function doAjaxPost(fileno) {
    	   // get the form values
    	   
    	  var counter = 1;
    	 
    	         //  var name = $('#pname').val();
    	           var pid = $('#pid1').val();
    	             $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/prescription1/"+fileno+"/"+pid+"",
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
      	              document.getElementById("pname1").value = addn.pname;
      	              document.getElementById("pid1").value = addn.pid;
      	            document.getElementById("dname").value = addn.dname;
    	              document.getElementById("docid").value = addn.docid;
      	              
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
	            		  
	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" onkeypress = ""  name="df" id="df" >'+addn.df+'</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
	            		    
	            		    counter++;
	            		    
	            		  });
	            	
	            	
	            	  }
	            	  
                       if(addn.tabidc == "menu1"){
                    		  $(document).ready(function(){

        	            		  var newTextBoxDiv0 = $(document.createElement('div'))
        	            		    .attr("class", 'form-group row')
        	            		    .attr("id",'form1ac' + counter);
        	            		  
        	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df" onkeyup="" > '+addn.df+'</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
        	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
        	            		    
        	            		    counter++;
        	            		    
        	            		  });
	            	  }
                       if(addn.tabidc == "menu2"){
                    		  $(document).ready(function(){

        	            		  var newTextBoxDiv0 = $(document.createElement('div'))
        	            		    .attr("class", 'form-group row')
        	            		    .attr("id",'form1ac' + counter);
        	            		  
        	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df" onkeyup="" >'+addn.df+'</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
        	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
        	            		    
        	            		    counter++;
        	            		    
        	            		  });
 	            	  }
                       if(addn.tabidc == "menu3"){
                    		  $(document).ready(function(){

        	            		  var newTextBoxDiv0 = $(document.createElement('div'))
        	            		    .attr("class", 'form-group row')
        	            		    .attr("id",'form1ac' + counter);
        	            		  
        	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df" >'+addn.df+'</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
        	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
        	            		    
        	            		    counter++;
        	            		    
        	            		  });		    
 	            	  }
 	            	  
                    
	            	  document.getElementById("bouton-contact").disabled=false;
	            	     $('#myModal').modal({
	     	     			backdrop: 'static'
	     	     		});
	            	     unsaved = false;
      	               }),
      	               
      	             $.each(response.list6, function(index, addn) {
      	            	 
      	            	 document.getElementById("pc").value =addn.pc;
            	           
    	            	   document.getElementById("pmsh").value=addn.pmsh;
    	            	  
    	            	   document.getElementById("ph").value = addn.ph;
    	            	   document.getElementById("dhr").value = addn.dh;
    	            	   document.getElementById("fh").value = addn.fh;
    	            	   document.getElementById("ogh").value = addn.ogh;
    	            	   document.getElementById("psh").value = addn.psh;
    	            	 //  document.getElementById("sge").value= addn.sge;
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
  	            	   
  	            	   unsaved = false;
      	           }),
       	          
      	               
      	             $.each(response.list4, function(index, datec) {
      	            	
  	                 $("#typeofdr").append('<option value="'+datec.gtest+'"selected="">'+datec.gtest+'</option>');
    	               $("#typeofdr").selectpicker("refresh");
    	              unsaved = false;
      	             }),
      	             
      	           $.each(response.list5, function(index, drug) {
      	        	 
	                

    	           	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
    	           	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
    	            var cnt = tableRef.rows.length;
       	     	   var dmc= "dm"+cnt;
       	     	   var dac = "da"+cnt;
       	     	   var dec = "de"+cnt;
       	     	   var dnc = "dn"+cnt;
       	     	   var baf = "baf"+cnt;
     	              
       	     
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
   	           	     newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.dosage+"' type='text' id = 'dosage' name= 'dosage'  required> </td></tr>";
   	           	     newCell.style.width ='50px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= ''  type='checkbox' id = '"+dmc+"' value='on' name= 'dm'  ><input type='hidden' value='off' form='form1' name='dm'> </td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= '' value='on'  type='checkbox' id = '"+dac+"' name= 'da' ><input type='hidden' name='da' form='form1' value='off' ></td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= '' value='on' type='checkbox' id = '"+dec+"' name= 'de'  ><input type='hidden' name='de' form='form1' value='off'> </td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= '' value='on' type='checkbox' id = '"+dnc+"' name= 'dn'  ><input type='hidden' name='dn' form='form1' value='off'> </td></tr>";
    	           	  newCell.style.width ='37.5px';
    	           		
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><select form ='form1' class= 'form-control input-sm'  id = '"+baf+"' name= 'baf'><option  value='before'>Before</option><option value='after'>After</option></select></td></tr>";
    	           	  newCell.style.width ='90px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' value='"+drug.totn+"' id = 'totn' name= 'totn'  required> </td></tr>";
    	           	  newCell.style.width ='70px';
    	           		 
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' id = 'nofdays' value='"+drug.nofdays+"'name= 'nofdays'  required> </td></tr>";
    	           	  newCell.style.width ='50px';
    	           		 
    	           	 
    	           	  
    	           	  newCell = rowsAdd.insertCell();
    	           	  newCell.innerHTML="<tr><td class='tds'><i class='fa fa-trash-o' font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
    	           	  newCell.style.width ='50px';
    	           	  
    	           	document.getElementById(baf).value = drug.baf;
    	           		 
    	           	 if(drug.dm == "on"){
  	        		   document.getElementById(dmc).checked = true;
  	        		
  	        	   }
    	           	if(drug.da == "on"){
  	        		   document.getElementById(dac).checked = true;
  	        		
  	        	   }
    	             if(drug.de == "on"){
  	        		   document.getElementById(dec).checked = true;
  	        		
  	        	   }
    	           	 if(drug.dn == "on"){
  	        		   document.getElementById(dnc).checked = true;
  	        		
  	        	   }
    	           	 
  	          
  	            	  
	            	 
      	           });
      	           
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
       		   
      	  		   
      	  	   });
      	  	   
      	  	   var rows ="";
      	     $.each(response.list18, function(index, drug) {
  	        	 
	                

 	          // 	var tableRef = document.getElementById('myTable3').getElementsByTagName('tbody')[0];
 	          // 	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
 	          //  var cnt = tableRef.rows.length;
 	            
 	           rows += "<tr><td>" + drug.fileno + "</td><td>" + drug.height + "</td><td>" + drug.weight + "</td><td>" + drug.temperature + "</td><td>"+drug.ac+"</td><td>"+drug.bp+"</td><td>"+drug.pulse+"</td><td>"+drug.bmi+"</td><td>"+drug.fi+"</td><td>"+drug.time+"</td></tr>";
    	     	       	     
 	           	//    var m = moment().format('YYYY-MM-DD h:mm a');
/*
 	           	  var newCell = rowsAdd.insertCell();
 	           	  newCell.innerHTML="<tr><td><input type='text' class='form-control input-sm'  form ='form1'   id = 'typeofdr' value='"+drug.fileno+"' name= 'typeofdr'  required> </td></tr>";
 	           	newCell.style.width ='50px';
 	           		 
 	           	  newCell = rowsAdd.insertCell();
 	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.height+"' type='text' id = 'drugname' name= 'drugname'  required> </td></tr>";
 	           	newCell.style.width ='50px';
 	           		 
 	           	  newCell = rowsAdd.insertCell();
 	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.weight+"' type='text' id = 'strdrug' name= 'strdrug'  required> </td></tr>";
 	           	newCell.style.width ='50px';
 	           	  
 	           	 newCell = rowsAdd.insertCell();
	           	 newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.temperature+"' type='text' id = 'dosage' name= 'dosage'  required> </td></tr>";
	           	newCell.style.width ='50px';
 	           		 
	           	 newCell = rowsAdd.insertCell();
	           	 newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.ac+"' type='text' id = 'dosage' name= 'dosage'  required> </td></tr>";
	           	newCell.style.width ='50px';
 	           	  
	           	 newCell = rowsAdd.insertCell();
	           	 newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.bp+"' type='text' id = 'dosage' name= 'dosage'  required> </td></tr>";
	           	newCell.style.width ='50px';
 	           	  
 	           	  
	           	 newCell = rowsAdd.insertCell();
	           	 newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.pulse+"' type='text' id = 'dosage' name= 'dosage'  required> </td></tr>";
	           	newCell.style.width ='50px';
 	           		
	           	 newCell = rowsAdd.insertCell();
	           	 newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm' value='"+drug.bmi+"' type='text' id = 'dosage' name= 'dosage'  required> </td></tr>";
	           	newCell.style.width ='50px';
 	           		 
 	           	  newCell = rowsAdd.insertCell();
 	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' value='"+drug.fi+"' id = 'totn' name= 'totn'  required> </td></tr>";
 	           	newCell.style.width ='50px';
 	           		 
 	           	  newCell = rowsAdd.insertCell();
 	           	  newCell.innerHTML="<tr><td><input  form ='form1' class= 'form-control input-sm'  type='text' id = 'nofdays' value='"+drug.time+"'name= 'nofdays'  required> </td></tr>";
 	           	newCell.style.width ='50px';
 	           		 
 */	           	 
 	           	  
 	           	  
 	         
	          
	            	  
	            	 
   	           });
      	   $( rows ).appendTo( "#myTable3 tbody" );
   	           
      	           },
      	           error: function(e){
      	        	  
      	        	           alert('Error: ' + e);
      	        	  
      	        	           }
      	        	           });
      	        
    	             unsaved = false;
    	          
      	        	           }
    	        	        	   
    	        	        	           


      

       
       
       </script>
       <script>
       
       function doAjaxPost2() {
    	   // get the form values
    	   
    	  var counter = 1;
    	 
    	         //  var name = $('#pname').val();
    	            //var docid = $('#docid').val();
    	             $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: "/HMS/prescription4",
    	        	         
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
    	    	            		 // var dup = document.getElementById('buttonl').value;
    	    	            		//  if(dup.length == 0){
    	    	            			  newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" onkeypress="return onlyAlphabets(event,this);" name="df" id="df" value=" place"> &#13;&#10 </textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
      	    	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
      	    	            		    
      	    	            		    counter++;
    	    	            		 // }
    	    	            		  
    	    	            		    
    	    	            		  });
    	    	            	
    	    	            	
    	    	            	  }
    	    	            	  
    	                           if(addn.tabidc == "menu1"){
    	                        		  $(document).ready(function(){

    	            	            		  var newTextBoxDiv0 = $(document.createElement('div'))
    	            	            		    .attr("class", 'form-group row')
    	            	            		    .attr("id",'form1ac' + counter);
    	            	            		  
    	            	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" onkeypress="return onlyAlphabets(event,this);" name="df" id="df" value=" place" >&#13;&#10</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
    	            	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
    	            	            		    
    	            	            		    counter++;
    	            	            		    
    	            	            		  });
    	    	            	  }
    	                           if(addn.tabidc == "menu2"){
    	                        		  $(document).ready(function(){

    	            	            		  var newTextBoxDiv0 = $(document.createElement('div'))
    	            	            		    .attr("class", 'form-group row')
    	            	            		    .attr("id",'form1ac' + counter);
    	            	            		  
    	            	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df" onkeypress="return onlyAlphabets(event,this);" >&#13;&#10</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
    	            	            		    newTextBoxDiv0.appendTo('#'+addn.tabidc);
    	            	            		    
    	            	            		    counter++;
    	            	            		    
    	            	            		  });
    	     	            	  }
    	                           if(addn.tabidc == "menu3"){
    	                        		  $(document).ready(function(){

    	            	            		  var newTextBoxDiv0 = $(document.createElement('div'))
    	            	            		    .attr("class", 'form-group row')
    	            	            		    .attr("id",'form1ac' + counter);
    	            	            		  
    	            	            		    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px;color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;">'+addn.buttonl+'</button><input type="hidden" name="buttonl" form="form1" value="'+addn.buttonl+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df" >&#13;&#10</textarea></div><input form="form1" type="hidden" name="tabid" value='+addn.tabidc+'></div>');
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
 	            	
    	             unsaved = false;
      	           }    
    	        	          
    	        	           
    	        	          
       
       
       </script>

<script type="text/javascript">

$(document).ready(function(){

    var counter = 1;
    var val;

    $("#addButton").click(function () {

    	var person = prompt("Please enter the Field name:");
  	  if (person == null || person == " " || person.length == "0") {
  	       
  		return false;
  	    } else {
  	       
  	        val = person;
  	    }
if(tabid == "menu4" || tabid == "home1"){
	return false;
}

	//alert(tabid);
  	var newTextBoxDiv0 = $(document.createElement('div'))
    .attr("class", 'form-group row')
    .attr("id",'form1ac' + counter);
  	
    newTextBoxDiv0.after().html('<div class="col-xs-1"><i class="fa fa-close" style="margin-left:2px;font-size:30px; color :#ff9900; "  onclick="rem(form1ac'+counter+')"></i></div><div class="col-xs-1"><button type="button" class="btn btn"  name="" id="buttonl"  style="width: 170px;height:auto;background-color:#dcdcdc;color:black;white-space: normal;word-wrap: break-word;">'+val+'</button><input type="hidden" name="buttonl" form="form1" value="'+val+'"></div><div class="col-xs-2"></div><div class="col-xs-4"><div class="form-group"><textarea form="form1" name="df" id="df" class="" onkeypress="return onlyAlphabets(event,this);"></textarea></div><input form="form1" type="hidden" name="tabid" value='+tabid+'></div>');
    newTextBoxDiv0.appendTo('#'+tabid);
    
    counter++;
     });

 
  
    
 

    
  });
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('.modal-content').resizable({
	    //alsoResize: ".modal-dialog",
	    minHeight: 300,
	    minWidth: 600
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
	
	var $table = $('table #myTable3'),
    $bodyCells = $table.find('tbody tr:first').children(),
    colWidth;

// Adjust the width of thead cells when window resizes
$(window).resize(function() {
    // Get the tbody columns width array
    colWidth = $bodyCells.map(function() {
        return $(this).width();
    }).get();
    
    // Set the width of thead columns
    $table.find('thead tr').children().each(function(i, v) {
        $(v).width(colWidth[i]);
    });    
}).resize(); // Trigger resize handler
});
</script>
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />'),disbut()" >

<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Patients History </a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href ="">Home</a></li>
   <li class=""><a id="hc" href="">My Appointments</a></li>
 <li class=""><a id="m2" href="">Treatment Records</a></li>
           <li class=""><a  href="/HMS/discharge">Discharge Summary</a></li>
         
    </ul>
    <!-- 
    <ul class="nav navbar-nav navbar-right">
       <li style ="color:#ff9900;"><span class="glyphicon glyphicon-log-in">Welcome : ${pageContext.request.userPrincipal.name}</span></li>
      </ul> 
       -->
  </div>
</nav>
  <center>
</center>
 <form id="form2" action="" method="post">  
  <h1>
	  <button type="button" class="btn btn-warning button1" onclick="doAjaxPost2()">
	  <span class="glyphicon glyphicon-plus"></span>General Checkup</button>
<font size="5">Patient History</font><span class="button2"><i class="glyphicon glyphicon-search" style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Patient Name or Id"  style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 1000px;border:0px; " id="myTable">
    <thead>
      <tr>
        <th width="192px;">Patient Name</th>
        <th width="192px;">Patient Id</th>
        <th width="192px;">Date</th>
        <th width="192px;" id="dh">Doctor Name</th>
        <!--  <th class="">Treatment</th>
        <th class="">Medicines</th>
        <th class="">Admission</th> -->
        <th width="20px;">View More</th>
      </tr>
    </thead>
    <tbody class="tbody">
    <c:forEach var="p1"  items="${model.list3}">
    <tr>
    <td width="192px;">${p1.pname}</td>
    <td width="192px;">${p1.pid}</td>
    <td width="192px;">${p1.date}</td>
    <td width="192px;" class="trunk">${p1.dname}</td>
 
    <td width="192px;"><i class="fa fa-eye" style="color:#00b300" onclick="doAjaxPost('${p1.fileno}')"></i></td>
  
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
    <li><a data-toggle="pill"  onclick = "return copyval('home')" href="#home">Presenting Problems/Complaints</a></li>
    <li><a data-toggle="pill" onclick = "return copyval('menu1')" href="#menu1">Systems Review</a></li>
    <li><a data-toggle="pill" onclick = "return copyval('menu2')" href="#menu2">Patient Examination</a></li>
    <li><a data-toggle="pill" onclick = "return copyval('menu3')" href="#menu3">Provisional Diagnosis</a></li>
    <li><a data-toggle="pill" onclick = "" href="#menu3a">Patient Vitals</a></li>
    <li><a data-toggle="pill" onclick = "return copyval('menu4')" href="#menu4">Prescription</a></li>
   
   
  </ul>
  
    
  <div class="tab-content col-md-8">
  <!-- Home1-->
   <div id="home1" class="tab-pane fade in active">
    <br><br>
    <div class="form-group row" >
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input type="" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Patient Name">
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
      <button type="button" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" >Patient Id</button>
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Date">
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="File No">
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
      <input type="button" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Presenting Complaints">
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
      <button type="button" class="btn btn" style="width: 170px;height:45px;background-color:#dcdcdc;color:black;" >Past Medical & <br>Surgical History</button>
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Pain History">
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Drug History">
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value = "Family History">
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
      <button class="btn btn" style="width: 170px;height :45px;background-color:#dcdcdc;color:black;">Obstetrics and <br>Gynaecology History</button>
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Personal/Social History">
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
      <input type="button" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="General Examination">
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
      <button type="button" class="btn btn" style="width: 170px;height:40px;background-color:#dcdcdc;color:black;" >Cardiovascular</button>
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
      <input class="btn btn" type="button" style="width: 170px;background-color:#dcdcdc;color:black;" value="Respiratory">
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Gastrointestinal">
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value = "Musculoskeletal">
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Genito-Urinary">
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Endocrine">
     </div>
      <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="sendoc" id="sendoc" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div></div>
       <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Skin">
     </div>
      <div class="col-xs-1"></div>
       <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="sskin" id="sskin" rows="5" form="form1" data-rule="" data-msg="address1" ></textarea></div>
      </div></div>
      
       <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-2">
      <button class="btn btn" style="width: 170px;height:45px;background-color:#dcdcdc;color:black;">Central Nervous <br> System</button>
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
      <input type="button" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="On Examination">
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
      <button type="button" class="btn btn" style="width: 170px;height:40px;background-color:#dcdcdc;color:black;" >Oral Cavity</button>
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Nervous System">
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Cardiovascular">
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value = "Respiratory System">
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
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Abdominal System">
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
      <input type="" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Provisional Diagnosis">
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
      <button type="button" class="btn btn" style="width: 170px;height:45x;background-color:#dcdcdc;color:black;" >Pathology Investigation <br> Recommended</button>
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
      <input type="" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Admit Patient">
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
  
  </div>
     
    <button id="get" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1" >View previous records</button>
   </div>
      
   <!-- Menu $4 -->   
 <div id="menu4" class="tab-pane fade">
     <br><br>
       <div class="container">
	      
	     
	     
	     	    
  <table class="table table-striped table-bordered table-responsive table-hover table-condensed" style="width: 760px; " id="myTable1">
    <thead class="thead1">
      <tr>
        <th rowspan = "2" style="width:100px;">Type of Drug</th>
        <th rowspan = "2" style="width:100px;">Name of Drug(Generic Name)</th>
        <th rowspan = "2" style="width:100px;">Strength of Drug</th>
        <th rowspan = "2" style="width:50px;">Dosage</th>
        <th colspan = "4"style="width:150px;" >Frequency</th>
        <th rowspan = "2" style="width:90px;">Before /After Food</th>
        <th rowspan = "2" style="width:70px;">Total No. of Tablets to be dispensed</th>
        <th rowspan = "2" style="width:50px;">No. of Days</th>
        <th rowspan = "2" style="width:30px;">Delete Row</th>
        </tr>
      <tr>
      <th>M</th>
      <th>A</th>
      <th>E</th>
      <th>N</th>
      </tr>
    </thead>
    <tbody class="tbody">

   
    </tbody>
     <tr id="hide">
		    <td><i class='fa fa-plus' style='font-size:20px; color : #ff9900;'  onclick="display()"></i></td>
		  </tr>
		  
    </table>
   
	      
	      
	      
	      </div>
      </div>


</div>
</div>
     <br>
        <div class="col-lg-10 col-lg-offset-2">
          <!-- back2 unique class name  -->
          <center>
         <input type='button' class="btn btn-info" value='Add Field' id='addButton'>
<!--  <input type='button' class="btn btn-info" value='Remove Field' id='removeButton'>-->
            <!-- open2 unique class name -->
            <button class="btn btn-info" form="form1" id ="bouton-contact" type="submit" >Save <span class="fa fa-save"></span></button>
            
          </center>
        </div>
   
    
 
  <!-- id will be unique, but class name will be same -->
 
 
  <button type="" class="bouton-contact" onclick=""></button>
  
</form>
</div>
</div>


</div>

<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">View Previous Vitals</h4>
      </div>
      <div class="modal-body">
      <div class="table-responsive">  
      <div class="row clearfix">
      	<div class="col-md-12 column">
        <table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="border:0px; " id="myTable3">
    <thead>
      <tr>
        <th width="">FileNo</th>
        <th width="">Height</th>
        <th width="">Weight</th>
        <th width="">Temperature</th>
        <th width="">Abdominal Circumference</th>
        <th width="">Blood Pressure</th>
        <th width="">Pulse</th>
        <th width="">BMI</th>
        <th width="">Chest Circumference</th>
        <th width="">Time Recorded</th>
       
      </tr>
    </thead>
    <tbody class="tbody">
   
    </tbody>
    </table>
    </div>
    </div>
    </div>
      </div>
      <div class="modal-footer">
        
        </div>
        </div>
        </div>
        </div>
        
<c:forEach var="p"  items="${model.list1}">
<script>
check('<c:out value="${p.docid}" />','<c:out value="${p.dname}" />');
//checkhome('<c:out value="${p.docid}" />','<c:out value="${p.idc}" />');
hide('<c:out value="${username}" />');
</script>
</c:forEach>
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
</body>
</html>
