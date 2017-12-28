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

<link rel='stylesheet' href='<c:url value="/resources/css/lab.css" />' type='text/css' media='all' />
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
height : 330px;
overflow-y : auto;

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


.reduce>li>a{

padding-top : 2px;
padding-bottom :2px;
font-size:12px;
}





</style>
<script type="text/javascript">
var adminusr;
var admnme;
var us = 0;
function checkhome(user){
adminusr = user;
document.getElementById("print").style.display = "none";	
//document.getElementById("adr").style.visibility ="hidden";
document.getElementById("dname").value = admnme;	
document.getElementById("rdate").value = moment().format("DD-MM-YYYY");
document.getElementById("samplecol").value = moment().format("DD-MM-YYYY hh:mm");
$("#myTable .tbody tr").each(function(){
	var x=this.cells;
	var y = x[4].innerHTML;
	if(y.includes("No File Uploaded")){
		x[4].getElementsByTagName('a[href]')[0].setAttribute("href","#");
	}
});
		if(user.includes("[ROLE_DOCTOR]")){
			var url = "/HMS/doctor1" ;
			
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url);
			 document.getElementById("samplea").style.display = "block";
			}
		
		else if(user.includes("[ROLE_NURSE]")){
			
			 var url = "/HMS/nursedesk" ;
				
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
			 document.getElementById("samplea").style.display = "none";
			 $('.hip').hide();
			// document.getElementById("myInput").style.visibility ="hidden";
		}
		else if(user.includes("[ROLE_CHIEFNURSE]")){
			
			 var url = "/HMS/nursedesk" ;
				
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
			 
			 document.getElementById("samplea").style.display = "none";
			 $('.hip').hide();
		}
		else if(user.includes("[ROLE_ASSISTANT]")){
			
			 var url = "/HMS/frontdesk" ;
				
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
			 document.getElementById("samplea").style.display = "none";
			 $('.hip').hide();
			 
		}
		else if(user.includes("[ROLE_Accounts Admin]")){
			
			 var url = "/HMS/frontdesk" ;
				
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
			 document.getElementById("samplea").style.display = "none";
			 $('.hip').hide();
		}
		
	else{
		
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 document.getElementById("samplea").style.display = "block";
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

	//document.getElementById("docid").value = id;
	//document.getElementById("dname").value = name;
	
	
}

var tabid;
function copyval(tabi,eve){


	tabid = tabi;
	var tables = tabi+"myTable1";

	if((tabi != "home1") && (tabi != "fileupload")){
		
		if($("#"+tables).length == 0){
			   
		var markup = '<div class="table-responsive"><table class="table table-striped table-bordered table-fixed table-hover table-condensed"  id='+tables+' ><thead><tr><th></th><th>Code</th><th>Sub Category</th></tr></thead><tbody class="tbody"></tbody></table></div>';
	    $("#"+tabi).append(markup);
		}		
	}
	
var tableRef = document.getElementById(tables).getElementsByTagName('tbody')[0];

if(tableRef.rows.length == 0){
console.log(pc)
doAjaxPost(eve.innerHTML,tables)
}

	/*if(tabi == "menu4"){
		document.getElementById("adr").style.visibility ="visible";
		document.getElementById("addButton").style.visibility = "hidden";
		var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
		if(tableRef.rows.length == 0){
			display()
		}
	}

	else{
		document.getElementById("adr").style.visibility ="hidden";
		document.getElementById("addButton").style.visibility = "visible";
	}
	
	if(tabi == "home1"){
		document.getElementById("addButton").style.visibility = "hidden";
		document.getElementById("showdrugs").style.visibility = "hidden";
	}
	else if(tabi == "menu3a"){
		document.getElementById("addButton").style.visibility = "hidden";
		document.getElementById("showdrugs").style.visibility = "hidden";
	}
	else if(tabi == "menu4"){
		document.getElementById("addButton").style.visibility = "hidden";	
		document.getElementById("showdrugs").style.visibility = "visible";
	}
	else{
		document.getElementById("addButton").style.visibility = "visible";	
		document.getElementById("showdrugs").style.visibility = "hidden";
	}
	*/
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
	
	
	
	
	
	
}

var pc = [];
/*
function getPc(myname) {
	
    var text1 = myname;
    
    if (document.getElementById(myname).checked) {
        //alert(myname)
        pc.push(myname);
        //alert(pc)
    	
    } else {
    	//alert(myname)
    	//alert(pc)
        pc.splice(pc.indexOf(myname), 1);
    }
   
    console.log(pc);
    document.getElementById("tresult").value = pc.join("/");
}
	*/
function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/labup.html";
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
function validpf(){
	if(document.getElementById("pname").value == "select"){
		alert("Please select the Patient Name")
	}
}

function edit(a,b,c,d,f,g,h){
	us = 1;
	document.getElementById("print").style.display = "block";	
	 $("#pid").append('<option value="'+b+'"selected="">'+b+'</option>');
     $("#pid").selectpicker("refresh");
      	               
     $("#pname").append('<option value="'+d+'"selected="">'+d+'</option>');
     $("#pname").selectpicker("refresh");
     	               
      	             //  document.getElementById("docid").value = strSplit[0];
     document.getElementById("pname").disabled = true; 
     document.getElementById("pid").disabled = true;
      	                
	document.getElementById("fileno").value = a;
	document.getElementById("pid1").value = b;
	document.getElementById("rdate").value = c;
	document.getElementById("pname1").value = d;
//	document.getElementById("tresult").value = e;
	document.getElementById("dname").value = f;
	document.getElementById("samplecol").value = g;
	
	     document.getElementById("id").innerHTML = b;
         document.getElementById("nm").innerHTML = d;
         document.getElementById("flno").innerHTML = a;
         document.getElementById("iop").value = h;
	//document.getElementById("testname").value = g;
	  $('#myModal').modal('show');
}
function date(){
	
	var hid = document.getElementsByClassName("hidetd");
	for(var i =0;i<hid.length;i++){
		hid[i].style.display = "none";
	}
	}
function insertCh(){
	var ch = $('[name="category"]:checked').length;
	if(ch == 0){
		alert("Please select the Tests")
		return false;
	}
	else{
		
		$("input:checkbox[name=category]:checked").each(function(){
             		   
			pc.push(decodeURI($(this).val()));
		//	alert(pc)
		});
	
		$('#tresult').empty()
		
		document.getElementById("tresult").value = pc.join("\n");
		return true;
	}
}	

function openmd(a,b,c){
	$('#close').click(function(){
		window.close();
		});
		
	if(a.length != 0 && b.length!= 0 && c.length != 0){
	$("#pid").append('<option value="'+c+'"selected="">'+c+'</option>');
    $("#pid").selectpicker("refresh");
     	               
    $("#pname").append('<option value="'+b+'"selected="">'+b+'</option>');
    $("#pname").selectpicker("refresh");
    	               
     	             //  document.getElementById("docid").value = strSplit[0];
    document.getElementById("pname").disabled = true; 
    document.getElementById("pid").disabled = true;
     	                
    document.getElementById("pid1").value = c;
    document.getElementById("id").innerHTML = c;
	document.getElementById("pname1").value = b;
	document.getElementById("nm").innerHTML = b;
	document.getElementById("flno").innerHTML = a;
	document.getElementById("fileno").value = a;
	
	  $('#myModal').modal('show');
	}
	else{
		$('#close').click(function(){
			window.close();
			window.location.href = "/HMS/labup";
			});
	}
}
function change(e){
	document.getElementById("iop").value =e.target.files[0].name;
}

function sepaval(value,e){
	

		
}
function openm(){
	if(document.getElementById("tresult").value.length != 0){
		
	//alert(document.getElementById("tresult").value.length)
		$('#tresult').val('');
	}
	$('#myModal').modal({
		backdrop: 'static'
	});
}
	
function verpr(){

	var c = document.getElementById("pid1").value;
	var e = document.getElementById("tresult").value;

	if(c.length == 0){
		alert("Please select Patient Name")
		return false;
	}
	else if(e.length == 0){
	alert("Please select the tests!")	
	return false;
	}
	else{
		var url = "/HMS/labprint";
				    var element = document.getElementById("print");
					element.setAttribute("href",url);
				return true;
		
		
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
function doAjaxPost(category,table){
var rang;
	

		    console.log(pc)
	
	
    $.ajax({
  	  
        type: "GET",

        url: "/HMS/labup1",
      async : false,
      data: "category=" +category,
        dataType: "JSON",
        contentType: "application/json; charset=UTF-8",
        success: function(response){
       	
       	   $.each(response.list4, function(index, addn) {
       		console.log(pc);
       		var tableRef = document.getElementById(table).getElementsByTagName('tbody')[0];
       		
       		var chkbox = "chk"+category+tableRef.rows.length;
       		var catcode = "cat"+category+tableRef.rows.length;
       		var subcat = "sub"+category+tableRef.rows.length;
             rang = addn.range;   
           var markup = "<tr><td><input type='checkbox' class="+addn.range+"  id = '"+chkbox+"' name= 'category' form ='formc' value="+encodeURI(addn.category)+"/"+addn.range+"/"+encodeURI(addn.subcategory)+" onclick = 'checkbox(this)' ></td><td id='"+catcode+"'>"+addn.range+"</td><td id='"+subcat+"'>"+addn.subcategory+"</td></tr>"
               
       		 $('#'+table+' tbody').append(markup);
       	
          if(us != 0){
        	
    	       	var str = document.getElementById("tresult").value.split("\n");
    	       	 
    	       	for(var i = 0;i<str.length;i++){
    	       		if(str[i].length != 0){
    	       		var astr = str[i].split("/");
                  	      		
    	       	//	if(astr[1] == addn.range){
    	       		
    	       		
    	       	   pc.push(astr[0]+"/"+astr[1]+"/"+astr[2]);
    	       		$('input.'+astr[1]).prop('checked', true);
    	       	}
    	       		//}
    	       		
    	       	}
    	       
    	    	}
      
         
          console.log(pc)
	    
	    	   
    	    	
    	      });

       	 pc = $.unique(pc);
         console.log(pc);
        },
        error: function(e){
     	  
     	           alert('Error: ' + e);
     	  
     	           }
     	           });
   	          
   	             $('#myModal').modal({
   	     			backdrop: 'static'
   	     		});
   	         
   	             unsaved = false;
     	           }    
   	        	          

   	        	          
      
      
      </script>

               

<script>
function checkbox(table){
	
	if(us != 0){
		
    if(table.checked == true){
    	console.log(pc)
    	pc.push(decodeURI(table.value))
    	pc = $.unique(pc);
    	console.log(pc)
    	document.getElementById("tresult").value = pc.join("\n");
    }
    else{
    	
    	console.log(pc)
    	console.log(table.value)
    	var index = pc.indexOf(decodeURI(table.value));
    	pc.splice(index, 1);
    	console.log(pc)
    	document.getElementById("tresult").value = pc.join("\n");
    }
		/*
		$("input:checkbox[name=category]:checked").each(function(){
			
             pc.push(decodeURI($(this).val()));
             console.log(pc)
		});
		 pc = $.unique(pc);
		 console.log(pc)
		document.getElementById("tresult").value = pc.join("\n");
	*/
	}
	else{
		pc = [];
		$("input:checkbox[name=category]:checked").each(function(){
		var as = decodeURI($(this).val());
	
	    pc.push(as);
	});

	
document.getElementById("tresult").value = pc.join("\n");
	}
/*
	  $('.tbody').on('click','tr', function() {
		  document.getElementById("tresult").value = this.getElementsByTagName('input')[0].value +"/" + $(this).find('td:eq(1)').text();
		 });
	 */
}
  
  </script>
  <script>
   
   $(function () {
	   $("#myTable .tbgamma tr").each(function(){
			
			var x=this.cells;
			var asa = x[3].innerHTML;
		
			if(asa.includes("No File Uploaded")){
				
			}
				
			});
	    $(document).on('click','#myTable .tbgamma tr', function () {
	   // 	$('.success').removeClass('success');
	   //     $(this).addClass('success');
	       var x = this.cells;
	      var encodedStr = x[4].innerHTML;
var as1 = decodeURI(encodedStr);
var parser = new DOMParser;
var dom = parser.parseFromString(as1,'text/html');
var decodedString = dom.body.textContent;
	       
	     console.log(x[4].innerHTML) 
	       // console.log(x[4].innerHTML.replaceAll("&amp;","&"))
	        document.getElementById("tresult").value = decodedString;
	    
        
	       
	      
	     
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
<body onload="checkhome('<c:out value="${username}" />',admnme='<c:out value="${pageContext.request.userPrincipal.name}" />'),date()" >

<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Lab Tests </a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href ="">Home</a></li>
   
         
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
  
	  <button type="button" id="samplea" class="btn btn-warning button1" onclick="openm()">
	  <span class="glyphicon glyphicon-plus"></span>Lab Tests</button>
<font size="5">LAB</font><span class="button2"><i class="glyphicon glyphicon-search"  style="color:#ff9900;margin: 4px 8px;"></i>
		<input type="text" id="myInp" class="form-control input-sm button2" placeholder="Search by Patient Name or Id"  style="width:150px"/></span>
	</h1>

	    <br>
	    <div class="container">
   <table class="table table-striped table-bordered table-fixed table-hover table-condensed gamma" style="width: 1150px;border:1px solid;" id="myTable">
    <thead class="thgamma">
      <tr>
        <th width="250px;">Patient Name</th>
        <th width="250px;">Patient Id</th>
        <th width="250px;">Date</th>
        <th width="380px;">View Uploaded File</th>
        <th style="width:20px;"></th>
      </tr>
    </thead>
    <tbody class="tbgamma">
    <c:forEach var="p1"  items="${model.list3}">
    <tr>
    <td style="width:250px;"><a href="#" onclick="edit('${p1.fileno}','${p1.pid}','${p1.date1}','${p1.pname}','${p1.dname}','${p1.samplecol}','${p1.iop}')">${p1.pname}</a></td>
    <td style="width:250px;">${p1.pid}</td>
    <td style="width:250px;">${p1.date1}</td>
    <td style="width:380px;white-space: normal;word-wrap: break-word;"><a href="/HMS/downform?location=${p1.testname}&location1=${p1.iop}" onclick="return sepval(${p1.iop},this)" target="_blank">${p1.iop}</a></td>
    <td class="hidetd">${p1.tresult}</td>
 </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    <button type="button" class="bouton-contact"></button>
     </form>

<div class="container">
 
  <!-- Trigger the modal with a button -->
 

 
    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
 <!--   <div class="modal-dialog modal-lg">-->
 <form id="formc" action="/HMS/savefile.html" method="post" enctype="multipart/form-data"> 
  <h1 id=""><button class="btn btn-warning btn-sm button1" form="formc" onclick="return validpf()" id ="bc" type="submit" >Save <span class="fa fa-save"></span></button>Lab Tests
        <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>    
      
        </h1>
  <br>
  
   
  <div class="container">

 
    
 <button type="button" class="btn btn-primary btn-block"><span style="float:left">Patient Information</span><span id="flno" style="float:right">Fileno</span><span id="id" style="float:right;margin-right:15px;">Id</span><span style="float:right;margin-right:25px;" id="nm">Name</span></button>
 <br>
  <ul class="nav nav-pills nav-stacked col-md-2 reduce" style="height:400px;width:300px;overflow : auto;">
    <li class="active"><a data-toggle="pill"  onclick = "return copyval('home1',this)" href="#home1">PATIENT DETAILS</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('fileupload',this)" href="#fileupload">UPLOAD FILE</a></li>
    <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('lungkidneyskeleton',this)" class="hip" href="#lungkidneyskeleton">LUNG,KIDNEY,SKELETON</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('glucosemetabolism',this)"class="hip"  href="#glucosemetabolism">GLUCOSE METABOLISM</a></li>
     <li><a data-toggle="pill"  style="word-wrap: break-word;" onclick = "return copyval('lipidmetabolism',this)" class="hip" href="#lipidmetabolism">LIPID METABOLISM</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('heartmuscle',this)" class="hip" href="#heartmuscle">HEART,MUSCLE</a></li>
     <li><a data-toggle="pill"style="word-wrap: break-word;" onclick = "return copyval('ironstudies',this)" class="hip" href="#ironstudies">IRON STUDIES</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('liverpancreasgit',this)" class="hip" href="#liverpancreasgit">LIVER,PANCREAS,GIT</a></li>
   
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('urinefaecalotherchem',this)" class="hip" href="#urinefaecalotherchem">URINE,FAECAL,OTHER CHEM</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('immunology',this)" class="hip" href="#immunology">IMMUNOLOGY</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('pharmacology',this)" class="hip" href="#pharmacology">PHARMACOLOGY</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('generalendoctrine',this)" class="hip" href="#generalendoctrine">GENERAL ENDOCTRINE</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('thyrioid',this)" class="hip" href="#thyrioid">THYRIOID</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('pregnancy',this)" class="hip" href="#pregnancy">PREGNANCY</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('boneturnover',this)" class="hip" href="#boneturnover">BONE TURNOVER</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('autoimmunetests',this)" class="hip" href="#autoimmunetests">AUTO IMMUNE TESTS</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('allergy',this)" class="hip" href="#allergy">ALLERGY</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('hivtests',this)" class="hip" href="#hivtests">HIV TESTS</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('viralstudies',this)" class="hip" href="#viralstudies">VIRAL STUDIES</a></li>
     <li><a data-toggle="pill"style="word-wrap: break-word;" onclick = "return copyval('otherinfections',this)" class="hip" href="#otherinfections">OTHER INFECTIONS</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('tumourmarkers',this)" class="hip" href="#tumourmarkers">TUMOUR MARKERS</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('nutrition',this)" class="hip" href="#nutrition">NUTRITION</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('haematology',this)" class="hip" href="#haematology">HAEMATOLOGY</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('coagulation',this)" class="hip" href="#coagulation">COAGULATION</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('molecularbiologypcr',this)" class="hip" href="#molecularbiologypcr">MOLECULAR BIOLOGY PCR</a></li>
     <li><a data-toggle="pill" style="word-wrap: break-word;" onclick = "return copyval('microbiology',this)" class="hip" href="#microbiology">MICROBIOLOGY</a></li>
    
    
   
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
          <option value="select" disabled selected>Select</option>
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
       
         <input type="text" name="date1" id="rdate" class="form-control input-sm" form="formc" readonly="readonly" required>
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
       <input type="text" name="fileno" id="fileno" class="form-control input-sm" form="formc"  required>
       </div>
      </div>
     </div>
     <input type="hidden" name="pname" form="formc" id="pname1">
  <input type="hidden" name="pid" form="formc" id="pid1" >
  <input type="hidden" name="docid" id="docid" form = "formc">
  <input type="hidden" name="dname" id="dname" form = "formc">
  <input type="hidden" name="samplecol" id="samplecol" form="formc">
   
     </div>
     
     <!-- Home2 -->
    <div id="lungkidneyskeleton" class="tab-pane fade">
    <br><br>
    
      
    
    
  </div>
      
      <!-- Menu1 -->
    
<div id="glucosemetabolism" class="tab-pane fade">
    <br><br>
  
    
      </div>
     
 <div id="lipidmetabolism" class="tab-pane fade">
     <br><br>
   
   
</div>


    <div id="heartmuscle" class="tab-pane fade">
     <br><br>
    
    
   </div>
   <div id="ironstudies" class="tab-pane fade">
     <br><br>

     
     </div>
 <div id="liverpancreasgit" class="tab-pane fade">
     <br><br>
  </div>
 <div id="urinefaecalotherchem" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="immunology" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="pharmacology" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="generalendoctrine" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="thyrioid" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="pregnancy" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="boneturnover" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="autoimmunetests" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="allergy" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="hivtests" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="viralstudies" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="otherinfections" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="tumourmarkers" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="nutrition" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="haematology" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="coagulation" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="molecularbiologypcr" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="microbiology" class="tab-pane fade">
     <br><br>
    
    
   </div>
<div id="fileupload" class="tab-pane fade">
     <br><br>
  <div class="form-group row" >
        <div class="col-xs-1"></div>
        <div class="col-xs-4">
  <div class="form-group">
       <p><label for="image">Choose File</label></p>
      <input form="formc" class="form-control input-sm" name="file" id="upfile" type="file" onchange="change(event)"/>    
            </div>
            </div>
             <div class="col-xs-4">
             <input type="hidden" id="iop" name="iop" form="formc">
             <br><br>
              <button class="btn btn-info" form="formc" onclick="return validpf()" id ="bouton-contact" type="submit" >Save/Upload <span class="fa fa-save"></span></button>
   </div>
        </div>


<p>
        
<!--  <a href="downform.html" target="_blank">Download</a>-->
    
   </div>   
     </div>
     <div class="form-group row" >
    <div class="col-xs-1"></div>
    <div class="col-xs-4">
    <p><b>Tests Selected</b></p>
    <textarea name="tresult" id="tresult" form="formc" readonly></textarea>
    </div>
    <div class="col-xs-1"></div>
    <div class="col-xs-2">
    <br><br><br>
     <a class="btn btn-info btn-sm"  id ="print" onclick="return verpr();" href="" target="_blank" >Print</a>
          
    <br>
   <!--  <button class="btn btn-info btn-sm"  onclick="return insertCh()" id ="bouton-contact" type="button" >Add Selected Tests<span class="fa fa-save"></span></button>
    -->  </div>
  </div>
  </div>
  <button type="button" class="bouton-contact" ></button>
</form>
</div>
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
          <option disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list4}">
        <option value="${p.drugn}">${p.drugn}</option>
        </c:forEach>
      </select></div>
      </div>
      </div>
 
    </div>
    </div>
      </div>
     
        </div>
        
        
        
<c:forEach var="p"  items="${model.list1}">
<script>
//check('<c:out value="${p.docid}" />','<c:out value="${p.dname}" />');
//checkhome('<c:out value="${p.docid}" />','<c:out value="${p.idc}" />');
//hide('<c:out value="${username}" />');
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

openmd('<c:out value='${model.fileno}'/>','<c:out value='${model.pname}'/>','<c:out value='${model.pid}'/>')


</script>

<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>
