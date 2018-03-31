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
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<style>
.wrapper {
  height : 700px;
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
  max-width:1280px;
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
  margin-top: 40px;
  font-size: 18px;
}


#myTable1 {
    border-collapse: collapse;
    width: 100%;
    
    
    }
#myTable1 th {
    background-color: #009999;
    color: white;
    width : 180px;
}

.table-fixed{
 
}
  #myTable1 .tbody1{
    height:200px;
    overflow-y:auto;
 }
 #myTable1 thead,.tbody1{
  
    display:block;
  }

modal-body{
	background-color: #eaeaea;
	height:auto;
	width: auto;
}  

.button1{
	float : left;
}
.button2{
	float : right;
}

.delete{
	width :50px;
}


.button3{
	margin-left :700px ;
}

.btn-block{
 width : 1250px;
}


#col3{
margin-left: 130px; 
border-style : groove;
border-radius : 10px;
width : 1000px;
}


</style>
<script type="text/javascript">


function deleteRow(r) {
	 
	   var i = r.parentNode.parentNode.rowIndex;
	  
	   document.getElementById("myTable1").deleteRow(i);
	  //   totalIt();
	  disbut();
	    
	}
function disbut(){
	//alert();
	if(document.getElementById("pname").value == "Select"){
		document.getElementById("pr").disabled = true;
		document.getElementById("bouton-contact").disabled = true;
	}
	else{
		document.getElementById("pr").disabled = false;	
		document.getElementById("bouton-contact").disabled = false;
	}
	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	 
	
	if(tableRef.rows.length == "0"){
		document.getElementById("bouton-contact").disabled = true;
	}
	else{
		document.getElementById("bouton-contact").disabled = false;	
	}
	
}
function checkhome(user){
	//alert(user)
	document.getElementById("curdate").value = new Date();
	if(user.includes("dbfdesk")){
		 var url = "/HMS/frontdesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_FDESK]")){
		
		var url = "/HMS/frontdesk" ;
		$("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	
	else if(user.includes("[ROLE_DOCTOR]")){
		
		var url = "/HMS/doctor1" ;
		$("#back").hide();
		
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_NURSE]")){
	
		 var url = "/HMS/nursedesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else if(user.includes("[ROLE_CHIEFNURSE]")){
		
		 var url = "/HMS/nursedesk" ;
		 $("#back").hide();
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	/*	 
		 if(bac.includes("dochome")){
			 $("#back").attr("href","/HMS/doctor1")
			 $("#tit").text("Back to Doctor Home")
		 }
		 else{
			 $("#back").attr("href","/HMS/nursedesk") 
			 $("#tit").text("Back to Nurse Desk")
		 }*/
	}
}

function visible(){
	 var pid = document.getElementById("pid").value ;
	 if(pid == "" || pid == null){
	 alert("Please select the patient!!");
	 return false;
	 }
	 else{
		 return true;
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
	
	var idp,namep,admdatep,datetimep,dailychartp,dnamed,commentsd;
	/*
	function check(name,id,admdate,datetime,dailychart,dname,comments){
		
		var idp = id.split(',');
        
		var namep = name.split(',');
        var admdatep = admdate.split(',');
        var datetimep = datetime.split(',');
        var dailychartp = dailychart.split(',');
        var dnamed = dname.split(',');
        var commentsd = comments.split(',');
        
        
  
        
        $('select[name=pname]').val(name);
 	   $('#pname').selectpicker('refresh');
 	   
 	   document.getElementById("pid").value = id; 
 	   document.getElementById("admdate").value = admdatep; 
       
 	 
    	
    	  for(var x=0; x<dnamed.length; x++) {
    		  
    		  var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[1];
    	    	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
    		  
    	    
    		 
    		  var newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td><input  form ='forma' class= 'form-control input-sm'  type='text' id = 'datetime' name= 'datetime' value='"+datetimep[x]+"' > </td></tr>";
    		  newCell.style.width ='100px';
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td ><input form ='forma'   class= 'form-control input-sm'  rows='1'  id = 'dailychart'  name= 'dailychart' value ='"+dailychartp[x]+"' >"+dailychartp[x]+"></td></tr>";
    		  newCell.style.width ='100px';
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm'  type='text'  id = 'dname' name= 'dname' value='"+dnamed[x]+"'  ></td></tr>";
    		  newCell.style.width ='100px';
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' rows='1'  id = 'comments'  name= 'comments' value='"+commentsd[x]+"'> "+commentsd[x]+"></td></tr>";
    		  newCell.style.width ='100px';
    		  
    		  var newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td ><input  form ='forma' class= 'form-control input-sm'  type='text' id = 'datetime' name= 'datetime' value='"+datetimep[x]+"' > </td></tr>";
    		  newCell.style.width ='100px';
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td ><input form ='forma'   class= 'form-control input-sm'  rows='1'  id = 'dailychart'  name= 'dailychart' value ='"+dailychartp[x]+"' >"+dailychartp[x]+"></td></tr>";
    		  newCell.style.width ='100px';
    		  
    		 
              newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' rows='1'  id = 'comments'  name= 'comments' value='"+commentsd[x]+"'  >"+commentsd[x]+"></td></tr>";
    		  newCell.style.width ='150px';
    		  
    		  newCell = rowsAdd.insertCell();
    		  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' rows='1'  id = 'comments'  name= 'comments' value='"+commentsd[x]+"'  >"+commentsd[x]+"></td></tr>";
    		  newCell.style.width ='150px';
    		 

    	  }
    	  
	}

*/

function display(){ 
//	alert( $.now())
	
//	document.getElementById("aid").value = ;
 var m = moment().format("h:mm:ss a");
		 
	if(document.getElementById("date").value != moment().format("DD-MM-YYYY") && document.getElementById("date").value !="select"){
		alert("You are about to edit the records entered on "+document.getElementById("date").value +". Please click on clear table and click on plus sign to add new records for current date" )
               return false;		
	}
	
	
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	  
var nursesig;
	 if(user2a == "[ROLE_NURSE]" ||user2a == "[ROLE_CHIEFNURSE]" ){
 		nursesig = user2c;
 	}
 	else{
 		nursesig = user2c;
 	}
	 var rowa = "taba"+ tableRef.rows.length;      
	 var markup = "<tr id='"+rowa+"'><td style='width:100px;'><select class='form-control input-sm' form ='forma'  style='border:groove;'  id = 'tabid'   name= 'tabid'  required><option value='Bowels'>Bowels</option><option value='Urine'>Urine</option><option value='Temperature' selected>Temperature</option><option value='Day of disease'>Day of disease</option><option value='Pulse'>Pulse</option><option value='Respire'>Respire</option><option value='BP'>BP</option><option value='Diet'>Diet</option></select></td><td style='width:150px;'><input  form ='forma' class= 'form-control input-sm' style='border:groove;' value='0'  type='text' id = 'time' name= 'time'  > </td><td style='width:150px;'><input form ='forma'   class= 'form-control input-sm'  style='border:groove;' value='0' id = 'oraltype'  name= 'oraltype'></td><td style='width:150px'><input form ='forma'  class= 'form-control input-sm' style='border:groove;' value='0'   type='text'  id = 'oralamt' name= 'oralamt'    ></td><td style='width:150px'><input form ='forma'  class= 'form-control input-sm' style='border:groove;' value='0' id = 'oralcommence'  name= 'oralcommence'  ></td><td style='width:150px;'><input form ='forma'  class= 'form-control input-sm' style='border:groove;' value='0' id = 'amtgiv'  name= 'amtgiv'></td><td style='width :150px'><input  form ='forma'  class= 'form-control input-sm' style='border:groove;' type='text' value='0' id = 'urine' name= 'urine' > </td><td style='width:100px;'><input  form ='forma'  class= 'form-control input-sm' style='border:groove;' type='text' value='"+user2c+"' id = 'nsign' name= 'nsign' > </td><td style='width:70px;'><input type='text' name='aid1'  class= 'form-control input-sm' readonly style='border:groove;' id='aid1' value= "+m+"  form='forma'></td></tr>";
	 $('#myTable1 .tbody1').append(markup);
	  var elmnt = document.getElementById(rowa);
	     elmnt.scrollIntoView();
	     $(rowa).focus(); 
	  disbut();       
	 
	
}
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
	    window.location = "/HMS/hourchart"
	}
	
}
var user2c;
function crtab(userr,usern){
	user2a = userr;
	user2b = usern;
    user2c = usern;
	if(document.getElementById("date").value == "select"){

		doAjaxPost1(moment().format('DD-MM-YYYY')) 
	}
	else{
	//doAjaxPost1(document.getElementById("date").value)
	}
	 unsaved = false;

	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	   if(tableRef.rows.length == 0){
		
		   display()
	   }
	   else{
		   
	   }
	   $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
           
	       	unsaved = false;
	       });
}
function cleartab1(){
	$("#myTable1 .tbody1 tr").remove();
	$("#date").val('select');
	$("#date").selectpicker("refresh");
	
	disbut()
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
	    
function addname(getval){
	

	var myname = getval.getAttribute('data-value'); 	
		//var str = document.getElementById("pname").getAttribute("data-value");
	//	alert(str);
		
		
	
		var strSplit = myname.split(',');
//	alert(strSplit[1]);
		document.getElementById("name").value = strSplit[0];
		document.getElementById("pid").value = strSplit[1];
		document.getElementById("age").value = strSplit[2];	
		document.getElementById("gender").value = strSplit[3];
		document.getElementById("fileno").value = strSplit[4];	
		document.getElementById("admdate").value = strSplit[5];	
		document.getElementById("wardno").value = strSplit[6];	
//		document.getElementById("doctsig").value = strSplit[7];	
		document.getElementById("nursesig").value = strSplit[8];
		document.getElementById("admitno").value = strSplit[9];
		
		document.getElementById("id").innerHTML = strSplit[1];
		document.getElementById("nm").innerHTML = strSplit[0];
		document.getElementById("flno").innerHTML = strSplit[4];
		$('#myTable1 .tbody1 tr').remove();
	   $('select[name=daten]').val('select');
   	   $('#date').selectpicker('refresh');
		
	disbut();

	//onclick="crtab('<c:out value="${username}" />','<c:out value="${pageContext.request.userPrincipal.name}" />')"
}
function validmess(){
	
	var stop;
	  var count=0;
	 $('#myTable1 .tbody1 tr td:not(:nth-child(1), :nth-child(8), :nth-child(9))').each(function(){
		 
			var quantity=$(this).find('input').val();
			
			if(quantity == "0")
				{
					count++;
					
					if(count==6)
						{
						/* alert("All fields cannot be 0")
						stop=0; */
						count=0;
						return false;
						}
				}
			else if(quantity==='')
			{
				stop=0;
				return false;
			}
			else
				{
				stop=1;
				}
		});
	 
	 if(count==0)
		 {
		 alert("All fields cannot be 0")
			stop=0;
		 return false;
		 }
	 
		
	 if(stop == 0 || count>7)
		{
		alert("empty row cant be saved")
		return false;
		}
	 
	if(document.getElementById("pname").value == "Select"){
	alert("Please select patient name")
	return false;
	}
	else{
		return true;
	}
	
	
}

function hide(){
	document.getElementById("myInput").style.visibility = "hidden";
	
}

function setline(id){
     var a = document.getElementById('fileno').value;
     var b = document.getElementById('date').value;
	 var url = "/HMS/linechart2/"+a+"";
	document.getElementById(id).setAttribute('href',url);
	return true;
}

</script>
<script type="text/javascript">
var user2a;
       function doAjaxPost() {
    	   // get the form values
//alert();
    	      //  var name = $('#pname').val();
         
    	   var admitno = $('#admitno').val();
    
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/hourchart1.html",
	           data: "admitno=" + admitno,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        //   alert(response);
	        	   $.each(response.list5, function(index, datec) {
	                   //to print name of employee
	           //        alert(datec.date);
	        		    if ($("#date option[value="+datec.date+"]").length == 0){
	     	               
		                	   $("#date").append('<option value="'+datec.date+'">'+datec.date+'</option>');
		                   
		                   $("#date").selectpicker("refresh");
		                   unsaved = false;
		                   }

	                 //  $("#date").append('<option value="'+datec.date+'">'+datec.date+'</option>');
	                   
	                 //  $("#date").selectpicker("refresh");
	                   //'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	        	           });
    	 
    	   unsaved = false;
    	        	        }


      

       
       
       </script>
       <script type="text/javascript">

       function doAjaxPost1(id) {
    	   // get the form values

    	      //  var name = $('#pname').val();
           
    	   var admitno = $('#admitno').val();

    	   if(admitno.length == "0"){
    		   admitno = id;
    	   }

    	   var date = $('#date').val();
    
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/hochart2/"+admitno+"/"+id+"",
	         //  data: "admitno=" + admitno,
	         async: false,
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	        	
	     if(response.list5.length != 0){
	    	
	    	 $("#myTable1 .tbody1 tr").remove();
	     }
	        	   $.each(response.list5, function(index, datec) {
	                   //to print name of employee
	              //     $("#date").append('<option value="'+datec.time+'=.='+datec.oraltype+'=.='+datec.oralamt+'=.='+datec.oralcommence+'=.='+datec.amtgiv+'=.='+datec.urine+'=.='+datec.vomitus+'=.='+datec.remarks+'=.='+datec.doctord+'=.='+datec.doctsig+'=.='+datec.ratef+'=.='+datec.doctrmks+'">'+datec.date+'</option>');
	               //    $("#date").selectpicker("refresh");
	                   
	        		   if ($("#date option[value="+datec.date+"]").length == 0){
	     	               
	                	   $("#date").append('<option value="'+datec.date+'" selected="">'+datec.date+'</option>');
	                   
	                   $("#date").selectpicker("refresh");
	                  
	                   }
	        		   
	        		   else if(id != document.getElementById("date").value){
	                	   $('select[name=daten]').val(id);
	                	   $('#date').selectpicker('refresh');
	                	   
	                   }
	                   else{
	                	  
	                   }

	                   var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	       	    	var rowsAdd = tableRef.insertRow(tableRef.rows.length);  
	       		  
	       	    
	       	    
	       	     var newCell = rowsAdd.insertCell();
	       	  newCell.innerHTML="<tr><td><input type='text' class='form-control input-sm' readonly='readonly'  form ='forma'  style='width:100%;  border:groove;'  id = 'tabid'   name= 'tabid' value='"+datec.tabid+"'  required></td></tr>";
	       	  newCell.style.width ='100px';
	       	  newCell.style.overflow = 'hidden';
	       	


	    	  newCell = rowsAdd.insertCell();
	    	  newCell.innerHTML="<tr><td><input  form ='forma' class= 'form-control input-sm' style='width:100%;  border:groove;'  type='text' onkeypress='return onlyNos(event,this);' id = 'time' name= 'time' value='"+datec.time+"' > </td></tr>";
	    	  newCell.style.width ='150px';
	    	  newCell.style.overflow = 'hidden';
	       	  
	       	  newCell = rowsAdd.insertCell();
	       	  newCell.innerHTML="<tr><td><input form ='forma'  class= 'form-control input-sm' style='width:100%;  border:groove;' id = 'oraltype' value='"+datec.oraltype+"'  name= 'oraltype' required></td></tr>";
	       	  newCell.style.width ='150px';
	       	  newCell.style.overflow = 'hidden';
	       	  
	       	  newCell = rowsAdd.insertCell();
	       	  newCell.innerHTML="<tr><td ><input form ='forma' class= 'form-control input-sm'  style='width:100%;  border:groove;'  type='text'  id = 'oralamt' value='"+datec.oralamt+"' name= 'oralamt'  required  ></td></tr>";
	       	  newCell.style.width ='150px';
	       	  newCell.style.overflow = 'hidden';
	       	  
	       	  newCell = rowsAdd.insertCell();
	       	  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm' style='width:100%;  border:groove;'id = 'oralcommence' value='"+datec.oralcommence+"' name= 'oralcommence'  required></td></tr>";
	       	  newCell.style.width ='150px';
	       	  newCell.style.overflow = 'hidden';
	       	  
	       	  
	       	  newCell = rowsAdd.insertCell();
	       	  newCell.innerHTML="<tr><td width ='';><input form ='forma' class= 'form-control input-sm'  style='width:100%;  border:groove;' value='"+datec.amtgiv+"' id = 'amtgiv'  name= 'amtgiv'  required></td></tr>";
	       	  newCell.style.width ='150px';
	       	  newCell.style.overflow = 'hidden';
	       	  
	       	  newCell = rowsAdd.insertCell();
	       	  newCell.innerHTML="<tr><td><input  form ='forma'  class= 'form-control input-sm' style='width:100%;border:groove;' value='"+datec.urine+"' type='text' id = 'urine' name= 'urine'  required> </td></tr>";
	       	  newCell.style.width ='150px';
	       	  newCell.style.overflow = 'hidden';
	       	  
	       	  newCell = rowsAdd.insertCell();
	    	  newCell.innerHTML="<tr><td><input  form ='forma'  class= 'form-control input-sm' style='width:100%; border:groove;' type='text' value='"+datec.nsign+"' id = 'nsign' name= 'nsign' > </td></tr>";
	    	  newCell.style.width ='100px';
	    	  newCell.style.overflow = 'hidden';
	       	  
	    	  newCell = rowsAdd.insertCell();
	    	  newCell.innerHTML="<tr><td><input type='text' class= 'form-control input-sm' style='width:100%;'name='aid1' id='aid1' value= "+datec.aid1+" readonly form='forma'></td></tr>";
	    	  newCell.style.width ='70px';
	    	  newCell.style.overflow = 'hidden';   
	                   disbut();
	                   unsaved = false;
	       	  
	               });    
	           },
	           error: function(e){
	        	  
	        	           alert('Error: ' + e);
	        	  
	        	           }
	          
	        	           });
    	   
    	 
    	 
	        	        	   unsaved = false;
    	        	        }


    

       
       
       </script>
       
       <script type="text/javascript">
var user2a;
       function doAjaxPostChart(url) {
    	   // get the form values
//alert();
    	      //  var name = $('#pname').val();
    	      if(document.getElementById("pname").value == 'Select'){
    	    	  alert("Please select the Patient Name")
    	    	  return false;
    	      }
         var url1;
    	   var fileno = $('#fileno').val();
    	   var b = $('#date').val();
    	   
    	   if(url == "linechart"){
    		   url1 = "linechart/"+fileno+"/"+b+"";
    	   }
    	   
    	   else{
    		   url1 = "linechart2/"+fileno+"";
    	   }
    
    	   $.ajax({
         	  
	           type: "GET",
	   
	           url: "/HMS/"+url1+"",
	           
	           dataType: "JSON",
	           contentType: "application/json; charset=UTF-8",
	           
	           success: function(response){
	           
	           },
	           error: function(e){
	        	  
	        
	        	  
	        	           }
	        	           });
    	 
    	   unsaved = false;
    	        	        }


      

       
       function goBack() {
    	    window.history.back();
    	}
       
       $(document).ready(function() {
    	   $("a[href='#menu1']").on('shown.bs.tab', function (e) {
    		   crtab('<c:out value="${username}" />','<c:out value="${pageContext.request.userPrincipal.name}" />')
    		 });
       });   
       </script>
       
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />'),disbut()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Hour Chart</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
      <li class="dropdown back" id="back">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Quick Access
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/HMS/staff">Staff Details</a></li>
          <li><a href="/HMS/doctor1">Doctor View</a></li>
          <li><a href="/HMS/nursedesk">Nurse Station</a></li>
          <li><a href="/HMS/frontdesk">Front Desk</a></li>
        </ul>
      </li>
      
   <!--    <li class=""><a id="m2" href="">My Appointments</a></li>
        <li class=""><a  id="m3" href="">General Checkup</a></li>
          <li class=""><a id="m4" href="/HMS/discharge.html">Discharge Summary</a></li>
  
       <li class=""><a id="nob" href="/HMS/nursetr/"  onclick=' return visible();' target="_blank">Nurse observations</a></li>
    -->
    </ul>
     <ul class="nav navbar-nav navbar-right">
    </ul>
  </div>
</nav>
  <center>
</center>
  <div id="form1" >  
  
     <h1><button type="submit" id="bouton-contact" onclick="return validmess()" class="btn btn-warning button1" form="forma" >Save</button>
	
<font size="5">4 Hourly Temperature Chart</font><span class="button2"><i class="" style="color:#ff9900;margin: 4px 8px;"></i></span>
	
	<button type="button" id="pr" class="btn btn-warning button2"  onclick="return doAjaxPost()">Previous Records</button>
	
	</h1>

<form id="forma" name="forma" action="/HMS/savehour.html" method="post"></form>


	    <br>

  <div class="container" style="width:auto;height:auto">
 <button type="button" style="background:#81BDA4",  class="btn btn-primary btn-block"><span id="pi" style="float:left">Patient Information</span><span id="flno" style="float:right">Fileno</span><span id="id" style="float:right;margin-right:15px;">Id</span><span style="float:right;margin-right:25px;" id="nm">Name</span></button>
 <br>
  </div>  
	    <div class="container">
 
 
   <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Patient Details</a></li>
    <li><a data-toggle="pill"  href="#menu1">HOUR CHART</a></li>
     
     <li class="pull-right" style="margin-right: 170px;" ><button type="button" id="" class="btn btn-primary button2" onclick="location.reload(true);">
	  <span class="fa fa-refresh"></span> Refresh</button></li>
	 <!--    <li class="pull-right" id="ph"><button type="button" id="opener" class="btn btn-primary button2" onclick="unsaved = false;doAjaxPostChart('linechart2')">
	   Show Previous Charts</button></li>  -->
</ul>
</div>
<br>

<div class="tab-content">
    <div id="home" class="tab-pane fade in active">

      


	
	    
	    <div id="col3">
	    <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      <div class="col-xs-3">
  <div class="form-group">
            <p>Patient Name<span>*</span></p>
             <select class="selectpicker form-control" data-size="4" data-live-search="true"  name = "pname" id ="pname" onchange="addname(this.options[this.selectedIndex])">
         
          <option value='Select' selected disabled>Select</option>
      <c:forEach var="p"  items="${model.list3}">
        <option value="${p.name}" data-subtext="${p.fileno},${p.admdate}" data-value="${p.name},${p.pid},${p.age},${p.gender},${p.fileno},${p.admdate},${p.wardno},${p.doctsig},${p.nursesig},${p.admitno}">${p.name}</option>
        </c:forEach>
      </select>
       
	</div>
	  </div>

	<!--  
	  <button type="button" class="btn btn-warning button1" onclick="display()">
	  <span class="glyphicon glyphicon-plus"></span>Add Row</button> 
	
	  <button type="submit" class="btn btn-warning button2" id="formab" form="formb" disabled>
	  <span class="glyphicon glyphicon-eye-open"></span> View Records</button>
	
      <br><br>
      <button type="submit" class="btn btn-warning button1" form="forma"  >
	 <span class="fa fa-floppy-o"></span> Save</button>
     
	  -->


  
  <div class="col-xs-4">
  
  <div class="form-group">
         <p>Registration Id<span>*</span></p>
     <input type="text" name="pid" id="pid"  form="forma" class="form-control input-sm" readonly  required>
       
       
       
	</div>
  

    
    
	  
    </div>
    
      <div class="col-xs-3">
     <div class="form-group">
     
      <p>Admit No<span>*</span></p>
             <input type="text" name="admitno" id="admitno"  form="forma" class="form-control input-sm" readonly required>
             <input type="hidden" name="fileno" id="fileno" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         <input type="hidden" name="name" id="name" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         <input type="hidden" name="" id="" readonly="readonly" form="forma" class="form-control input-sm"  required>
	         
     
       
	</div>
     </div>
     
	      
	
    </div>
    
    
    
   
     <div class="form-group row" >
	     <div class="col-xs-1"></div>
	      
	      
	        <div class="col-xs-3">
  
  <div class="form-group">
     
            <p>Age<span>*</span></p>
     <input type="text" name="age" id="age"  form="forma" class="form-control input-sm"  readonly>
     </div>
 </div>
 
   <div class="col-xs-4">
  
  <div class="form-group">
          <p>Gender<span>*</span></p>
     <input type="text" name="gender" id="gender"  form="forma" class="form-control input-sm" readonly required>
       
     </div>
 </div>
 
 <div class="col-xs-3">
  
  <div class="form-group">
  
          <p>Admission Date<span>*</span></p>
     <input type="text" name="admdate" id="admdate"  form="forma" class="form-control input-sm" readonly required>
       
          
     </div>
 </div>
	      
	      </div>
	
	   <div class="form-group row" >
	     <div class="col-xs-1"></div>
	    <div class="col-xs-3">
  
  <div class="form-group">
     
           <p>Current Date<span>*</span></p>
     <input type="text" name="curdate" id="curdate"  form="forma" class="form-control input-sm" readonly required>
       
     </div>
 </div>       
	        
	        
      <div class="col-xs-4">
  
  <div class="form-group">
     
          <p>WardNo/BedNo<span>*</span></p>
     <input type="text" name="wardno" id="wardno"  form="forma" class="form-control input-sm" readonly required>
     </div>
 </div>
 
  <div class="col-xs-4">
  
  <div class="form-group">
     
          <p>Nurse Assigned<span></span></p>
     <input type="text" name="nursesig" id="nursesig"  form="forma" class="form-control input-sm" value="NA" readonly>
     </div>
 </div>
 
      
      </div>
      
      </div>
      
      </div>
       <div id="menu1" class="tab-pane fade">
            <div class="form-group row" >
	     <div class="col-xs-4"></div>
	       <div class="col-xs-3">
	        <div class="form-group">
	          
             <select class="selectpicker form-control" data-size="4" data-live-search="true" name = "daten" id ="date" onchange="doAjaxPost1(this.value);this.selectedindex = -1">
         <option value="select" selected="selected">Select date to fetch records</option>
          
      </select>
      </div>
	        </div>
	      </div>
	      
	      <div class="form-group row" >
	    
	      
	    <div class="container">
	        <div class="col-xs-9">
	     <div class="form-group">
	     
	     	    
  <table class="table table-striped table-bordered table-hover table-condensed" style="width: 1170px;float:left;"  id="myTable1">
    <thead>
       <tr colspan="5"  rowspan="10" style="border-bottom:1pt solid black;">
       <th style="width:100px;"></th>
       <th colspan="3"><center><font color="white">AM</font></center></th>
       <th colspan="3"><center><font color="white">PM</font></center></th>
       <th style="width:100px;"></th>
       <th style="width:70px;"></th>
       
      
       </tr>
       <tr style="border-bottom:1pt solid black;">
       <th style="width:100px;"><font color="white">Time</font></th>
       <th style="width:150px;"><font color="white">2</font></th>
       <th style="width:150px;"><font color="white">6</font></th>
       <th style="width:150px;"><font color="white">10</font></th>
       <th style="width:150px;"><font color="white">2</font></th>
       <th style="width:150px;"><font color="white">6</font></th>
       <th style="width:150px;"><font color="white">10</font></th>
        <th style="width:100px;"><font color="white">Nurse Signature</font></th>
        <th style="width:70px;">Time Recorded</th>
     </tr>
     
</thead>
    <tbody class="tbody1">

   
    </tbody>
    
  <tr id="hiderow">
		    <td><i class='fa fa-plus' style='font-size:20px; color : #ff9900;'  onclick="return display()"></i><a href=""  id="linechart" target="_blank"  class='button3'  style='color : #ff9900;' onclick="return setline(this.id)"><b>Show Temperature Chart</b></a><a href="#" class='button2' id="bouton-contact" style='color : #ff9900;'  onclick="cleartab1()"><b>Clear Table</b></a></td></tr>
		  
   </table>
	      </div>
	      
	      </div>
	      </div>
	      </div>
	      
       </div>
</div>
	
	      
    <button type="" class="bouton-contact"  ></button>
   </div>
     

   </div>
  <script>

datasuccess('<%=request.getParameter("message")%>')
</script>
<script>
//var bac = '<c:out value='${model.bac}'/>';
</script>    

</body>
</html>