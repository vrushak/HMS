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
  height : auto;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
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
  max-width:1300px;
  width:100%;
  margin: 5% auto;
  background-color: #FFFFFF;
  overflow: hidden;
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
p {
  margin: 0px;
  font-weight: 500;
  line-height: 2;
  color:#333;
}
p span {
  color: #F00;
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

.button2{
	float : right;
}
.button1{
	float : left;
}
.tab-pane{
width : 1120px;
border-style : groove;
border-radius : 10px;
height : 330px;
overflow-y : auto;
}

.reduce>li>a{

padding-top : 2px;
padding-bottom :2px;
font-size:12px;
}

.btn btn{
  padding: 15px 15px;
   
        /* All browsers since IE 5.5+ */

    max-width:170px;
  
}
.btn-block{
 width : 1270px;
}
</style>
<script type="text/javascript">
var obj = {};

var arr = [];
var children;
var prvrec;
var newrec;
var pid;
var didd;
var flag;
var fgr;
function checkdiv(id,val,tab){

var title = $(val).attr("title");
var value = $(val).val();
var temp = title;


/*
var a = arr.indexOf($(val).val());
if(a < 0){
	arr.push($(val).val(),$(val).prop("checked") == true)
}
else{
	
	arr[a+1] = ($(val).prop("checked") == true);
}
console.log(a)
console.log(arr)
	*/

newrec = 	$("#"+tab).find(".divin").eq(0).find(":checkbox[name='radio']:checked").val();

pid = title
var pid1 = "." + title;

if(val.checked == true){
if(newrec != prvrec){

	obj[newrec] = [];

}

var len = obj[newrec].length;
obj[newrec].push({});

 obj[newrec][len][title]= value;



 prvrec = newrec;
}
else if(newrec == undefined){
	$('div.divin').not(':first').remove();
	$('div.divot').not(':first').remove();
}
else{
	obj[newrec].splice(obj[newrec].indexOf($(val).val()),1)
	var diva = Number(id)+1;
	var divb =  Number(id)+1;
$(pid1).prev('br').remove();
$(pid1).next("span").andSelf().remove();


  
	//$(".divin").eq(diva).find(":checkbox[name='radio']").prev("br").remove();		
    //$(".divin").eq(diva).find(":checkbox[name='radio']").next("span").andSelf().remove();
    $(".divot").eq(divb).empty();
	
}

var json = JSON.stringify(obj);
console.log(json)
//arr.push(obj)

if ($("#"+fgr).find(".divin").eq(0).find(":checkbox[name='radio']:checked").length == 1){
	$("#"+fgr).find(".divin").eq(0).find(":checkbox[name='radio']:not(:checked)").prop('disabled', true);
	 }  
	else{
		$("#"+fgr).find(".divin").eq(0).find(":checkbox[name='radio']:not(:checked)").prop('disabled', false);
		}
//	$(":radio[name='radio']:not(:checked)").prop('disabled', true);  

		var diva = Number(id)+1;
		var divb =  Number(id)+1;
	//if(id.length != 0){
		if(val.checked == true){
	      if(diva < 4 && divb < 4){
	    	
	    		if($("#"+tab).find(".divin").eq(diva).length < 1){
	    			flag = true;
	    			creatediv(tab)
	    		}
	    		else{
	    	
	    			loadval(diva,tab)
	    		}
	    	  
	    }
	     
	  }	
//	} 
		/*
	else{
		var diva = Number(id)+1;
		var divb =  Number(id)+1;

		if(id == 0){
		$('div.divin').not(':first').remove();
		$('div.divot').not(':first').remove();
		// creatediv('maindiv')
		}
		else{
	   $(".divin").eq(diva).find(":checkbox[name='radio']").prev("br").remove();		
	   $(".divin").eq(diva).find(":checkbox[name='radio']").next("span").andSelf().remove();
//	    $("#"+diva).empty();
		$(".divot").eq(divb).empty();
		}
	}*/
}

function addcheck(div){
	var person = prompt("Please enter the Field name:");
	if (person == null || person == " " || person.length == "0") {
	       
  		return false;
  	    } else {
  	      var div1 = "<br><input type='checkbox'  name='radio' title='' class='' onchange=''><span>"+person+"</span></input>";
          $("#"+div).append(div1); 
  	         
  	    }
}

function createTabs(){
	var person = prompt("Please enter the Tab Name:");
	if (person == null || person == " " || person.length == "0") {
	       
  		return false;
  	    } 
	else{
	var nextTab = $('#pills li').size()+1;
	var no = $('#li').size();
   /*
	fgr = $.now();
	$('<li><a href="#tab'+nextTab+'" id="li"'+no+'  data-toggle="tab"  onclick="fgr = '+fgr+'">'+person+'</a></li>').appendTo('#pills');
		
    	// create the tab content
    $('<div class="tab-pane fade" id="tab'+nextTab+'"><div class="form-group row" id='+fgr+'></div></div>').appendTo('.tab-content');
 
*/
	 var uri = "/HMS/loadtab/"+person+"";
	 var data1 = person; 
    
	 
	  var successFn =  function(response){
		  
		  if(response.toString() == "success")   {
		//  loadtabvalues()	  
	  }
	
	  /*
	  $.each(response, function(index, datec) {
    	
    	
    	$('<li><a href="#tab'+nextTab+'" id="li'+no+'" class='+datec.tabid+' data-toggle="tab"  onclick="fgr = '+fgr+'">'+datec.tabvalue+'</a></li>').appendTo('#pills');
		
    	// create the tab content
    	$('<div class="tab-pane fade" id="tab'+nextTab+'"><div class="form-group row" id='+datec.tabid+'></div></div>').appendTo('.tab-content');
   
   
    	fgr = datec.tabid;	

         });    */
     }
	    
	  var errorFn = function(e){
     	 // alert('Error: ' + e);
     	  
     	 loadtabvalues()
	  }
	  
		var get = "POST";
 doAjaxPostNew(get,uri,data1,successFn,errorFn,"application/json; charset=UTF-8");
	
	//create the tab
creatediv(fgr)
}
}
function creatediv(main){

var	divid =  $('#'+main).find(".divin" ).length;
var	divid1 = $('#'+main).find(".divot" ).length;

	var div = "<div class='col-xs-2 divin' title='"+divid+"' id='"+divid+"' style='border:1px solid;height:200px;overflow-Y:auto;'><center><font class='header' size='4' style='text-align:center;'></font><i class='fa fa-plus button2' style='font-size:20px;color:#ff9900;' aria-hidden='true' onclick='return addcheck("+divid+")'></i></center></div><div class='col-xs-1 divot'></div>";
 //   console.log(div)
	$('#'+main).append(div);
  
    
   
 
     loadval(divid,main)
  
}
/*
function loadval(div){
	
	var div1 = "<div class='checkbox'><label><input type='checkbox' name='radio' value='Head' onchange='checkdiv("+div+",this)'>Head</label><br><label><input type='checkbox' name='radio' value='Hand' onchange='checkdiv("+div+",this)'>Hand</label></div>";
	$("#"+div).append(div1)
	}
*/

function checkempty(value){
	 if ($('#'+value).is(':empty')){
		  creatediv(value)
		}
}
function loadtabvalues(){
	var nextTab = $('#pills li').size()+1;
	var no = $('#li').size();
	
	 var uri = "/HMS/loadtab";
	 var data1 = 0;
    

	  var successFn =  function(response){
		  
	  $.each(response, function(index, datec) {
		 
		  fgr = datec.tabid;
	
		  if($("."+fgr).size() < 1){
    	$('<li><a href="#tab'+nextTab+'" id="li'+no+'" class='+datec.tabid+' data-toggle="tab" onclick="checkempty('+fgr+')">'+datec.tabvalue+'</a></li>').appendTo('#pills');
		
    	// create the tab content
    	$('<div class="tab-pane fade" id="tab'+nextTab+'"><div class="form-group row" id='+datec.tabid+'></div></div>').appendTo('.tab-content');
		  }	

         });    
     }
	    
	  var errorFn = function(e){
     	  alert('Error: ' + e);
	  }
	  
		var get = "POST";
  doAjaxPostNew(get,uri,data1,successFn,errorFn,"application/json; charset=UTF-8");
 if(fgr == undefined){
	  creatediv(1)	 
 }

}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/diagnose.html";
	}
}
</script>
      <script type="text/javascript">
       function  doAjaxPostNew(met,uri,data1,successFn,errorFn,ctype) {
                   
    	              $.ajax({
    	        	  
    	        	           type: met,
    	        	   
    	        	           url: uri,
    	        	           data: "tabvalue="+data1,
    	        	           dataType: "JSON",
    	        	           contentType: ctype,
    	        	           success: successFn,
    	                       error: errorFn
    	                      
    	        	        	           });
    	             
    	        	        	  }
      


function loadval(div,min){

	var check = $(".checkbox" ).length;	

	if(pid == undefined){
		pid =0;
	}
	var res = parseInt(min);
	

	  var uri = "/HMS/loaddiv1/"+pid+"";
	  
	  var data = div;
	 
   var successFn =  function(response){
     $.each(response.list, function(index, datec) {
    	 
       var div1 = "<br><input type='checkbox' value='"+datec.checkval+"' name='radio' title='"+datec.did+"' class='"+datec.pid+"' onchange='checkdiv("+div+",this,"+min+")'><span>"+datec.checkval+"</span></input>";
        $("#"+min).find("#"+div).append(div1);
        $("#"+min).find(".header").eq(div).text(datec.header)
          });    
      }
	    
	  var errorFn = function(e){
      	  alert('Error: ' + e);
	  }
	  
		var get = "GET";
   doAjaxPostNew(get,uri,data,successFn,errorFn,"application/json; charset=UTF-8");
	}

       </script>
       <script type="text/javascript">
       function preview(){
    	   var i,j,x
    	   $(".divin").eq(0).find(":checkbox[name='radio']").each(function() {
    		   if(obj.hasOwnProperty($(this).val())){
    			   var retobj = $(this).val();
    		  createbr(retobj)	
    		  createbr("\n")
    		  createbr("\n")
    		          for(i in obj[retobj]){
    		           for(var key in obj[retobj][i]) {
    		        	    if (obj[retobj][i].hasOwnProperty(key)) {
    		        	        console.log(obj[retobj][i][key]);
    		        	        var res = obj[retobj][i][key];
    		        	        createbr(res)
    		        	        createbr("\n")
    		        	       }
    		        	}
    		          }
    		     }
    	      
    	     });
    	  
    	
    	}
       
       function createbr(retobj){
    	       var head = document.getElementById("text1");
	           var head1 = document.createTextNode(retobj);
	           head.appendChild(head1);
       }
       
       function addcname(getval){
    		
    		var myname = getval.getAttribute('data-value'); 	
//    		var cid = document.getElementById("pname").value; 
    		var str = myname.split(',');
    		
    		// var res5 = $('select[name=pname1]').val();
    	 	   $('select[name=ppid]').val(str[0]);
    		   $('#ppid').selectpicker('refresh');
    		   
    	
//    		document.getElementById("pid").value=str;

    			document.getElementById("id").innerHTML = str[0];
    			document.getElementById("nm").innerHTML = str[1];
    			document.getElementById("flno").innerHTML = str[2];
     			document.getElementById("fileno").value = str[2];

    			$("#docid").val(str[3]); 
    			$("#datetime").val(moment().format("DD-MM-YYYY hh:mm"));
    			
    	}
       
       function addcname1(getval){
   		
   		var myname = getval.getAttribute('data-value'); 	
//   		var cid = document.getElementById("pname").value; 
   		var str = myname.split(',');
   		
   		// var res5 = $('select[name=pname1]').val();
   	 	   $('select[name=ppid]').val(str[0]);
   		   $('#ppid').selectpicker('refresh');
   		   
   		   $('select[name=pname]').val(str[1]);
		   $('#pname').selectpicker('refresh');
   		   
//   		document.getElementById("pid").value=str;

   			document.getElementById("id").innerHTML = str[0];
   			document.getElementById("nm").innerHTML = str[1];
   			document.getElementById("flno").innerHTML = str[2];
    			document.getElementById("fileno").value = str[2];

   			$("#docid").val(str[3]); 
   			$("#datetime").val(str[5]);
   			$("#text1").val(str[4]);
   	}

       </script>
 
</head>
<body onload="loadtabvalues()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Doctor</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="">Home</a></li>
    </ul>
  </div>
</nav>
 <div id ="form2">
    <h1><button class="btn btn-warning btn-sm button1" class="form-control input-sm" onclick="return createTabs()">Add new Tab</button>
  <font size="5"> Doctor </font><button class="btn btn-warning btn-sm button2" class="form-control input-sm" onclick="preview()">Preview</button>
  </h1>
<br>
 <form id = "formc" action="savediag.html" method = "post"></form>
 <div class="container" style="width:auto;">
 <button type="button" class="btn btn-primary btn-block"><span style="float:left">Patient Information</span><span id="flno" style="float:right">Fileno</span><span id="id" style="float:right;margin-right:15px;">Id</span><span style="float:right;margin-right:25px;" id="nm">Name</span></button>
 <br>
         <ul class="nav nav-pills nav-stacked col-md-2 reduce" id="pills" style="height:400px;width:140px;overflow : auto;">
        <li class="active"><a data-toggle="pill"  href="#home1">PATIENT DETAILS</a></li>
        </ul>
        
        <div class="tab-content col-md-10">
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
      
       <select class="selectpicker form-control btn btn" data-live-search="true" form="formc" name = "pname" id ="pname" onchange="addcname(this.options[this.selectedIndex])"   >
          <option value="select" disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value ="${p.pname}" data-value="${p.pid},${p.pname},${p.fileno},${p.docid}">${p.pname}</option>
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
      
             <select class="selectpicker form-control" data-width="100%"  form="formc" data-live-search="true"  name = "ppid" id ="ppid"  required>
      <option value="select" disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value = "${p.pid}" data-value="${p.pid},${p.pname},${p.fileno},${p.docid}">${p.pid}</option>
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
       
         <input type="text" name="datetime" id="datetime" class="form-control input-sm" form="formc" readonly="readonly" required>
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
    <div class="form-group row" >
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input type="" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Saved Patients">
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
       <select class="selectpicker form-control btn btn" data-live-search="true" form="formc" name = "pname1" id ="vpid" onchange="addcname1(this.options[this.selectedIndex])"   >
          <option value="select" disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list3}">
        <option value ="${p.pname}" data-value="${p.ppid},${p.pname},${p.fileno},${p.docid},${p.diagnose},${p.datetime}">${p.pname}</option>
        </c:forEach>
      </select></div>
      </div>
      </div>
  <input type="hidden" name="docid" id="docid" form = "formc">
  <input type="hidden" name="dname" id="dname" form = "formc">
 
   
     </div>
     
        </div>
      
</div>
 <div class="form-group row" >
    <div class="col-xs-1"></div>
    <div class="col-xs-5">
    <p>TextArea 1</p>
    <textarea name='diagnose' id='text1' rows='5' cols='60' form="formc">
    
    </textarea>
    </div>
    
    <div class="col-xs-5">
    <p>TextaArea 2</p>
    <textarea name='text2' id='text2' rows='5' cols='60' form="formc">
    
    </textarea>
    </div>
    
  </div> 
 <button type="submit" class="bouton-contact" id ="bouton-contact" form="formc" >Save</button>
     
 </div>
</div>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>