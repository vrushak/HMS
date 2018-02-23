<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
<link rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.css" />' >


<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/verifychange.js"></script>
<script type="text/javascript" src="/HMS/resources/js/jquery-ui.js"></script>

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
  margin: 1% auto;
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
width : 450px;
border-style : groove;
border-radius : 10px;
height : 390px;
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

#text1  
{  
   font-family:"Times New Roman", Times, serif;  
    
}
.divin{
margin-left:16px;
}

table.beta .tbody2{
    height:300px;
    overflow-y :auto;
}

table.beta .thead2 th{
	background-color: #009999;
    color: white;
}

table.gamma  .tbgamma{
    height:300px;
    overflow-y:auto;
 }
 
 table.gamma .thgamma,.tbgamma{
  
    display:block;
  }
  
.table-responsive{
  height:220px;
  overflow-y :auto;
}
  table.alpha .thalpha th{
    background-color: #009999;
    color: white;
}

table.alpha .tbalpha{
 
    overflow-y :auto;
    
    
 }
</style>
<script type="text/javascript">
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
	
	else if(user.includes("[ROLE_Accounts Admin]")){
		
		 var url = "/HMS/frontdesk" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
		 
		}
	
	else{
		 var url = "/HMS/home" ;
			
		 var element = document.getElementById('ho');
		 element.setAttribute("href",url)
	}

}

function copyval1(name){
	
	var a = $("#fileno").val();
	var b; 
	var c;
	  if($("#check").prop("checked") == true){
		  b = $("#vpid").val();
		  c = $("#vpid2").val();
	  }else{
		  b = $("#pname").val();
		  c = $("#ppid").val();
	  }

	if(name == "lb" && b == null){
		alert("Please select Patient Name")
		return false;
	
	}
	else if(name == "lb" && b !="select"){
	
		  var url = "/HMS/labup2?location="+a+"&location1="+b+"&location2="+c+"";
		
			$('#'+name).attr("href",url);
		
			
			return true;
	}
	
	else{
		
	}
	
}
function deleteRow(r) {
	
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable1").deleteRow(i);
    disbut();
    
}

function display(){
	var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
	
var markup = "<tr><td><input type='text'  form ='formc' class= 'form-control input-sm' value='NA' id = 'typeofdr' name= 'typeofdr' ></td><td><input  form ='formc' class= 'form-control input-sm button1' value='NA' type='text' id = '"+tableRef.rows.length+"' name= 'drugname'></td><td><input  form ='formc' class= 'form-control input-sm' value='NA' type='text' id = 'strdrug' name= 'strdrug'></td><td><input  form ='formc' class= 'form-control input-sm' value='NA' type='text' id = 'dosage' name= 'dosage'></td><td><select  form ='formc' class= 'form-control input-sm'   id = 'dm'  name= 'dm'  ><option value='PRN'>PRN</option><option value='OD'>OD</option><option value='BD'>BD</option><option value='TDS'>TDS</option><option value='QID'>QID</option><option value='OTHERS'>OTHERS</option></select></td><td><input  form ='formc' class= 'form-control input-sm' value='NA' type='text' id ='baf' name='baf'></td><td><input  form ='formc' class= 'form-control input-sm' value='NA' type='text' id = 'totn' name= 'totn'></td><td><input  form ='formc' class= 'form-control input-sm' value='NA' type='text' id = 'nofdays' name= 'nofdays' ></td><td><i class='fa fa-trash-o' font-size:20px'  onclick='deleteRow(this)'></i></td></tr>";
$('#myTable1 tbody').append(markup);   
   	
}
var obj = {};

var arr = [];
var children;
var prvrec;
var newrec;
var pid;
var didd;
var flag;
var fgr;
var flagval;
var partab;
var teethv;
function copytethval(teeth){
	teethv = $(teeth).attr("data-value");
	var title = $(teeth).attr("titlea").split('==');
	$("#tab"+title[1]).find(".main").find('div.divin').not(':first').remove();
	$("#tab"+title[1]).find(".main").find('div.divot').not(':first').remove();
	obj = {};
	  prvrec = 0;
	 
	
}
function checkdiv(val){
	

var myname = $(val).attr('data-value'); 
var title = $(val).attr("titlea").split('==');

//var value = $(val).val();
//var temp = title;


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

newrec = 	$("#tab"+title[1]).find(".main").find(".divin").eq(0).find('select option:selected').val();

pid = $(val).attr('value');


//var pid1 = "." + title;

//if(val == true){

if(newrec !='select' && $(val).attr('value')!='select'){
if(newrec != prvrec){
	
if(title[0] ==0){
	

	$("#tab"+title[1]).find(".main").find('div.divin').not(':first').remove();
	$("#tab"+title[1]).find(".main").find('div.divot').not(':first').remove();
}
	obj={};
	obj[newrec] = [];

}

var len = obj[newrec].length;

obj[newrec].push({});

 obj[newrec][len][$(val).attr('value')]= myname;



 prvrec = newrec;
// activechk(tab)
//
}
if(newrec == "select"){
	$("#tab"+title[1]).find(".main").find('div.divin').not(':first').remove();
	$("#tab"+title[1]).find(".main").find('div.divot').not(':first').remove();
}

else if($(val).attr('value')!='select' && title[0] != 0){
	
	
    obj={};
	
	prvrec = 0;
	newrec = 	$("#tab"+title[1]).find(".main").find(".divin").eq(0).find('select option:selected').val();
	

	if($(val).attr('value')!='select'){
	if(newrec != prvrec){
        
		obj[newrec] = [];

	}

	
	
	
//obj[newrec].splice(obj[newrec].indexOf($(val).val()),1)
	var diva = Number(title[0])+1;
	var divb =  Number(title[0])+1;
	var dic = Number(title[0]) - 1;
	var length = $("#tab"+title[0]).find(".main").find('.divin').eq(dic);
  
	for(var i=0; i<=Number(title[0]);i++){
		
		var titlec = $("#tab"+title[1]).find(".main").find('div.divin').eq(i).find('select option:selected').attr('value')
		var rem = $("#tab"+title[1]).find(".main").find('div.divin').eq(i).find('select option:selected').attr('data-value')
		
		var len = obj[newrec].length; 
		obj[newrec].push({});
	    obj[newrec][len][titlec]= rem;
	   	
		//obj[newrec].splice(obj[newrec].indexOf(rem),1)
//		$("#tab"+tab).find(".main").find('div.divin').eq(i).remove()
//		$("#tab"+tab).find(".main").find(".divot").eq(i).remove()
			}
	 prvrec = newrec;
	
	 var length1 = $("#tab"+title[1]).find(".main").find('div.divin').length;

	 for(var i=length1-1; i >= diva;i--){
	       		
			$("#tab"+title[1]).find(".main").find('div.divin').eq(i).remove()
			$("#tab"+title[1]).find(".main").find("div.divot").eq(i).remove()
				}
//$("#tab"+tab).find(".main").find(pid1).prev('br').remove();
//$("#tab"+tab).find(".main").find(pid1).next("span").andSelf().remove();


  
	//$(".divin").eq(diva).find(":checkbox[name='radio']").prev("br").remove();		
    //$(".divin").eq(diva).find(":checkbox[name='radio']").next("span").andSelf().remove();
    
}
}
else{}

var json = JSON.stringify(obj);
console.log(json)
//arr.push(obj)
/*
if ($("#tab"+title[1]).find(".main").find(".divin").eq(title[0]).find('select option:selected').length == 1){
	$("#tab"+title[1]).find(".main").find(".divin").eq(title[0]).find('select option:selected').prop('disabled', true);
	 }  
	else{
		$("#tab"+title[0]).find(".main").find(".divin").eq(title[0]).find("select option:selected").prop('disabled', false);
		}
//	$(":radio[name='radio']:not(:checked)").prop('disabled', true);  
*/
		var diva = Number(title[0])+1;
		var divb =  Number(title[0])+1;
	//if(id.length != 0){

	    //  if(diva < 4 && divb < 4){
	    	
	    	if($("#tab"+title[1]).find(".main").find(".divin").length < 4 && pid != "select" ){
	    		if($("#tab"+title[1]).find(".main").find(".divin").eq(diva).length < 1){
                      			
	    			creatediv(title[1])
	    		}
	    		else if($("#tab"+title[1]).find(".main").find(".divin").eq(diva).length == 1){
	    			$("#tab"+title[1]).find(".main").find(".divin").eq(diva).find('select').find('option').not(':first').remove().end();
	    		    
	    		   
	    		  
	    			loadval(diva,title[1])
	    		}
	    		else{
	    			$("#tab"+title[1]).find(".main").find(".divin").eq(diva).find('select').find('option').not(':first').remove().end();
		    		   loadval(title[0],title[1])
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

	function remove(){
		
	}
function addcheck(div,tab){
	
    var s = $("#tab"+tab).find(".main").find('.divin').eq(div).find(".header").text();
    var i;
    var level = Number(div) + 1;
  if(s.length == 0){
	var head1 =  prompt("Please enter the header name:");
	var head = $.trim(head1)
	if (head == null || head == " " || head.length == "0") {
	      return false;
  	    } 
	else {
  	    var uri = "/HMS/cloadhead?tab="+tab+"&&header="+head+"&&level="+Number(div+1)+"";
		var data = "0";
		 
	   var successFn =  function(response){
	     $.each(response, function(index, datec) {
	     
	       
	    	 $("#tab"+tab).find(".main").find('.divin').eq(div).find(".header").text(datec.header);
	    	 $("#tab"+tab).find(".main").find('.divin').eq(div).find(".header").attr("id",datec.hid);
	    	 // console.log($("#tab"+tab).find(".main").find('.divin').eq(div).find(".header").attr("id"));
	          });    
	      }
		    
		  var errorFn = function(e){
	      	  alert('Error: ' + e);
		  }
		  
			var get = "POST";
	   doAjaxPostNew(get,uri,data,successFn,errorFn,"application/json; charset=UTF-8");	         
  	    }
	
  }
  
  
  else{
	  

	var person1 = prompt("Please enter the Field name:");
	var person = $.trim(person1)
	if (person == null || person == " " || person.length == "0") {
	       
  		return false;
  	    } 
	
	  else {
		  
	  i = $("#tab"+tab).find(".main").find('.divin').eq(div).find(".header").attr("id");
	
 		
 		 var divc = div;
 	 	   divc = Number(divc) - 1;
 	 	 pid =  $("#tab"+tab).find(".main").find('.divin').eq(divc).find("select option:selected").attr("title");
 	 	
 	 	  if(divc == -1){
 	 		pid = 0;  
 	 	  }
  	      var uri = "/HMS/cloadchk?tab="+Number(tab)+"&&chkname="+person+"&&pid="+Number(pid)+"&&hid="+Number(i)+"&&level="+Number(level)+"";
  		var data = "0";
  		 
  	   var successFn =  function(response){
  	   if(response.length > 0){
  		   
  	   var tab1 = tab;
  	 
  	  loadval(div,tab)
  	  
  	if ($("#tab"+tab).find(".main").find(".divin").eq(div).find("select option:selected").length == 1){
  			$("#tab"+tab).find(".main").find(".divin").eq(div).find("select option:selected").prop('disabled', true);
  	}  
  		
  	  
  	   }
  	      }
  		    
  		  var errorFn = function(e){
  	      	  alert('Error: ' + e);
  		  }
  		  
  			var get = "POST";
  			
  	   doAjaxPostNew(get,uri,data,successFn,errorFn,"application/json; charset=UTF-8");	  
  	    	
  	   
  	     
  	         
  	    }
	
  }
}

function rebuildjs(){

	
}
function updheader(div,tab){
	
	var hid =  $("#tab"+tab).find(".main").find('.divin').eq(div).find(".header").attr("id");
	var head1 =  prompt("Please enter the header name:");
	 var head = $.trim(head1)
	if (head == null || head == " " || head.length == "0") {
	      return false;
  	    } 
	else {
  	    var uri = "/HMS/cupdhead?hid="+hid+"&&header="+head+"&&tabid="+tab+"&&level="+Number(div+1)+"";
		var data = "0";
		 
	   var successFn =  function(response){
	     $.each(response, function(index, datec) {
	       
	         
	    	 $("#tab"+tab).find(".main").find('.divin').eq(div).find(".header").text(datec.header);
	    	 $("#tab"+tab).find(".main").find('.divin').eq(div).find(".header").attr("id",datec.hid);
	          });    
	      }
		    
		  var errorFn = function(e){
	      	  alert('Error: ' + e);
		  }
		  
			var get = "POST";
	   doAjaxPostNew(get,uri,data,successFn,errorFn,"application/json; charset=UTF-8");	         
  	    }
	
}


function createTabs(){
	var person1 = prompt("Please enter the Tab Name:");
    var person = $.trim(person1)
  
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


	 var uri = "/HMS/cloadtab1?lab="+person+"";
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
	  
	  var rv = true;
		$('#pills li').each(function() {
		    var item = $(this);
		    var text = item.find('a').text();
		    if(text.toUpperCase() == person.toUpperCase()){
		    	alert("Tab already exists! Please try with a different name");
		    	return rv = false;
		    }
		  	  });
		if(rv == false){
		return rv;
		}
		 var get = "POST";	  
	   	  doAjaxPostNew(get,uri,data1,successFn,errorFn,"application/json; charset=UTF-8");
	   	 	
		
	//create the tab
//creatediv(fgr)
}
}

var $select;
var $select1;
function creatediv(main){
	
var	divid =  $('#tab'+main).find(".main").find(".divin" ).length;
var	divid1 = $('#tab'+main).find(".main").find(".divot" ).length;
if(flagval.includes("Dental Observations")){
	$select1 = $('<select/>', {
	    'class':"selectpicker form-control input-sm select1",
	    'data-live-search':'true',
	    'data-size':'5',
	    'onchange':'copytethval(this.options[this.selectedIndex])'
	  	});
	
	var diva = "<div style='margin-left:16px;'><div class='form-group row' style='height:70px;'><div class='col-xs-7'  id='doh' style='height:60px;'><p>Tooth Name</p></div></div>";
	if($('#tab'+main).find(".main").find("#doh" ).length < 1){
	$('#tab'+main).find(".main").append(diva);
	 $select1.append('<option value="select"  data-value="select" selected disabled>Select</option>')
	 $select1.appendTo($('#tab'+main).find(".main").find("#doh")).selectpicker('refresh');
	}
	
	 
}


var div = "<div class='form-group row divot' id='"+divid1+"' style='height:70px;'><div class='col-xs-7 divin' title='"+divid+"' id='"+divid+"' style='height:60px;'><p class='header' id=''></p></div></div>";
$('#tab'+main).find(".main").append(div);
$select = $('<select/>', {
     'class':"selectpicker form-control input-sm",
     'data-live-search':'true',
     'data-size':'5',
     'onchange':'return checkdiv(this.options[this.selectedIndex])'
});

$select.append('<option value="select" titlea="'+divid+'=='+main+'" data-value="select" selected disabled>Select</option>')
	

$select.appendTo($('#tab'+main).find(".main").find("#"+Number(divid+1))).selectpicker('refresh');
  openmd(cu)

 //console.log(div)  
 //console.log(divid)
     loadval(divid,main)
  
}
/*
function loadval(div){
	
	var div1 = "<div class='checkbox'><label><input type='checkbox' name='radio' value='Head' onchange='checkdiv("+div+",this)'>Head</label><br><label><input type='checkbox' name='radio' value='Hand' onchange='checkdiv("+div+",this)'>Hand</label></div>";
	$("#"+div).append(div1)
	}
*/

function checkempty(value,tval){
    flag = value;
    flagval = $(tval).text();
   
  // console.log($(tval).attr("href"))
    if ($('#tab'+value).find(".main").is(':empty')){
   pid = 0;
     
		  creatediv(value)
		}
    
}

function minimize(id){
  if(id == "pv" || id == "pd" || id == "pres"){
	  $('#dd').hide();
	  $('#text1').hide();
	  $('#prv').hide();
	  $(".tab-pane").width(1100)
  }
  else{
	  $('#dd').show();
	  $('#text1').show();
	  $('#prv').show();
	  $(".tab-pane").width(450) 
  }
}
function loadtabvalues(){
	var nextTab = $('#pills li').size()+1;
	var no = $('#li').size();
	
	 var uri = "/HMS/cloadtab";
	 var data1 = 0;
    

	  var successFn =  function(response){
		  
	  $.each(response, function(index, datec) {
		 
		  fgr = datec.tabid;
	    
		  var tab = 'tab'+nextTab;
	    
		  if($("."+datec.tabid).size() < 1){
			  
		  partab = datec.tabvalue;
    	$('<li><a href="#tab'+datec.tabid+'" id="li'+no+'" class='+datec.tabid+' data-toggle="tab" onclick="checkempty('+datec.tabid+',this),minimize(this.id)">'+datec.tabvalue+'</a></li>').appendTo('#pills');
    	
    	// create the tab content
    	$('<div class="tab-pane fade" id="tab'+datec.tabid+'"><div class="main"></div></div>').appendTo('.tab-content');
		  }	
	   

         });  
	  
	  $('<li><a href="" id="lb" class="lb" target="_blank" onclick = "return copyval1(this.id);">Lab</a></li>').appendTo('#pills');
	  $('<li><a href="#pd1" id="pd" class="pd" data-toggle="tab" onclick="minimize(this.id)">Provisional Diagnosis</a></li>').appendTo('#pills');
	  $('<li><a href="#pres1" id="pres" class="pres" data-toggle="tab" onclick="minimize(this.id)">Prescription</a></li>').appendTo('#pills');
     }
	    
	  var errorFn = function(e){
     	  alert('Error: ' + e);
	  }
	  
	 
		
		var get = "POST";
  doAjaxPostNew(get,uri,data1,successFn,errorFn,"application/json; charset=UTF-8");
 //if(fgr == undefined){
	//  creatediv(1)	 
 //}

}

function datasuccess(data){
	
	if(data != "null"){
		
		alert(data)
window.location = "/HMS/cdiagnose";
	}
}
/*
function activechk(flag){
	var i,j,x
	   $("#tab"+flag).find(".main").find(".divin").eq(0).find(":checkbox[name='radio']").each(function() {
		   
	if(obj.hasOwnProperty($(this).val())){
			   var retobj = $(this).val();
			   
		 
		          for(i in obj[retobj]){
		           for(var key in obj[retobj][i]) {
		        	    if (obj[retobj][i].hasOwnProperty(key)) {
		        	        console.log(obj[retobj][i][key]);
		        	        var res = obj[retobj][i][key];
		        	     
		        	    
		        	        //createbr(">")
		        	       }
		        	}
		          }
		     }
	      
	     });
	
}
*/
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
  var res;
	var check = $(".checkbox" ).length;	

	if(pid == undefined){
		pid =0;
	}


	 if(cu == "config"){
		
	$("#tab"+min).find(".main").find('.divin').eq(div).find(":checkbox[name='radio']").prev("br").remove();		
	$("#tab"+min).find(".main").find('.divin').eq(div).find(":checkbox[name='radio']").not(":checked").next("span").andSelf().remove();
	// var m =  $("#tab"+min).find(".main").find(".header").eq(div).text();
		//  $("#tab"+min).find(".main").find("#"+div).not('.header').empty();
		 
		 // $("#tab"+min).find(".main").find(".header").eq(div).text(m);
	  }
	  
	res = parseInt(min);
var uri;
	if(flagval.includes("Dental Observation")){
	 uri  = "/HMS/cloaddivv?level="+Number(div + 1)+"&&tab="+min+"";
	}else{
	 uri = 	"/HMS/cloaddiv1?pid="+pid+"&&tab="+min+"&&level="+Number(div + 1)+"";
	}
	  var data = div;
	 
   var successFn =  function(response){
	
	   $.each(response.list5, function(index, datec) {
		   
	  
if(flagval.includes("Dental Observation")){
	

    if($(".select1 option[value="+datec.teid+"]").length == 0){
	$select1.append('<option value='+datec.teid+' titlea="'+div+'=='+min+'" data-value="'+datec.teethval+'">'+datec.teethval+'</option>');
    $select1.appendTo($("#tab"+min).find(".main").find('#doh')).selectpicker('refresh');
    }
}
  });
	   
     $.each(response.list, function(index, datec) {

    	// var checkva = $("#tab"+min).find(".main").find('.divin').eq(div).find(":checkbox[name='radio']:checked").attr("title");
       //	if(checkva != datec.did){
    //	 var div1 = "<br><input type='checkbox' value='"+datec.checkval+"' name='radio' title='"+datec.did+"' class='"+datec.pid+"' onchange='return checkdiv("+div+",this,"+min+")'><span>"+datec.checkval+"</span></input>";
      
    	 $select.append('<option value='+datec.did+' titlea="'+div+'=='+min+'" oid='+datec.pid+' data-value="'+datec.checkval+'">'+datec.checkval+'</option>');
         $select.appendTo($("#tab"+min).find(".main").find('.divin').eq(div)).selectpicker('refresh');
    	 //  console.log(div1)      
     //   $("#tab"+min).find(".main").find('.divin').eq(div).append(div1);
       //	}
   	 	$("#tab"+min).find(".main").find(".header").eq(div).text(datec.header);
        $("#tab"+min).find(".main").find(".header").eq(div).attr("id",datec.hid);
       
          });
     
     
     $.each(response.list1, function(index, datec) {

    	 $("#tab"+min).find(".main").find('.divin').eq(div).find(".header").text(datec.header);
         $("#tab"+min).find(".main").find('.divin').eq(div).find(".header").attr("id",datec.hid);
      	
        
          });
     
    
    
     if($("#tab"+min).find(".main").find('.divin').eq(div).contents().length == 1){
      	
    	 $("#tab"+min).find(".main").find('.divin').eq(div).find(".header").remove();
    	 $("#tab"+min).find(".main").find('.divin').eq(div).remove(); 
    	 $("#tab"+min).find(".main").find(".divot").eq(div).remove();
    	
    	// alert("No data found")
    	// $("#tab"+min).find(".main").find('.divin').eq(Number(div)-1).find(":checkbox[name='radio']:checked").prop("checked",false)
    
     }
   	

    
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
    	   
    	  $("#tab"+flag).find(".main").find(".divin").eq(0).find("select").each(function() {
    		   
    	if(obj.hasOwnProperty($(this).val())){
    			   var retobj = $(this).val();
    			   
    		  if(retobj.length > 0){
    			  createbr("\n") 
    			  createbr("\n") 
    		  }
    				   
    		  createbr(flagval)	
    		if(flagval.includes("Dental Observations")){
    			
    			 createbr(">")
    			createbr(">")
    			createbr(">")
    			createbr(teethv)
    			
    		}
    		  createbr(">")
    		          for(i in obj[retobj]){
    		           for(var key in obj[retobj][i]) {
    		        	 
    		        	    if (obj[retobj][i].hasOwnProperty(key)) {
    		        	   
    		        	        var res = obj[retobj][i][key];
    		        	        createbr(">")
    		        	        createbr(res)
    		        	    
    		        	        //createbr(">")
    		        	       }
    		        	}
    		          }
    		     }
    	else{
    		createbr(teethv)
    	}
    	      
    	     });
    
    	  obj = {};
    	  prvrec = 0;
    	 
    	}
       
       function change(){
    	   
    	   	refresh()
   		  
    	   if($("#check").prop("checked") == true){
 
    	   $('#vpid2').attr('name','ppid')
    	   $('#ppid').removeAttr('name')

    		$('#fg').hide();
    		$('#fg1').show();
    		$('#id1').hide();
    		$('#id2').show();
    	
    		   
    	   }
    	   else{
    	
    		  
    		 $('#ppid').attr('name','ppid')
    		 $('#vpid2').removeAttr('name')
       		
       		
    		   $('#fg1').hide();
       		   $('#fg').show();
       		   $('#id2').hide();
     		   $('#id1').show();
    	      
     		  
     		 
    	   }
       }

function refresh(){
	
	  $('#formc').trigger("reset");
	     
      $('select[name=ppid]').val('select');
	   $('#ppid').selectpicker('refresh');
	   
	   $('select[name=pname]').val('select');
       $('#pname').selectpicker('refresh');
       
       $('select[name=pname]').val('select');
       $('#vpid').selectpicker('refresh');
      
       $('select[name=ppid]').val('select');
       $('#vpid2').selectpicker('refresh');
	 
		document.getElementById("id").innerHTML = "Id";
			document.getElementById("nm").innerHTML = "Name";
			document.getElementById("flno").innerHTML = "Fileno";
	
	}
       function createbr(retobj){
	       var head = document.getElementById("text1").value;
	      // var head2 = document.getElementById("text1").innerHTML; 
	      // var spl = head2.split('\n');
	
	   //   for(var  i= 0;i<spl.length;i++){
	    //	  if(retobj != spl[i]){
	    		 
	    //	  }
	   //   }
           $('#text1').val(head + retobj);  //document.createTextNode(retobj);
          // head.appendChild(head1);
   }
       
       function addcname(getval){
    	  
    		var myname = getval.getAttribute('data-value'); 	
//    		var cid = document.getElementById("pname").value; 
    		 
    		var str = myname.split('==');
    		
    		
            if(str[0] == ""){
         	   return false;
            }
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
    			getData(str[2],str[0])
    	}
       function addcid(getval){
    		var myname = getval.getAttribute('data-value'); 	

    		//var cid = document.getElementById("pid").value; 
    		var str = myname.split('==');
    		if(str[0] == ""){
          	   return false;
             }
//    		var res4 = $('select[name=pid1]').val();
    		  
    		 $('select[name=pname]').val(str[1]);
  		   $('#pname').selectpicker('refresh');
     		   
//     		document.getElementById("pid").value=str;

     			document.getElementById("id").innerHTML = str[0];
     			document.getElementById("nm").innerHTML = str[1];
     			document.getElementById("flno").innerHTML = str[2];
      			document.getElementById("fileno").value = str[2];

     			$("#docid").val(str[3]); 
     			$("#datetime").val(moment().format("DD-MM-YYYY hh:mm"));
     			getData(str[2],str[0])		
    	}

    
       function addcname1(getval){
    	   var myname = getval.getAttribute('data-value'); 	
   	
      
           var cid = document.getElementById("pname").value; 
   		   var str = myname.split("==");
   	
   		// var res5 = $('select[name=pname1]').val();
   	 	   $('select[name=ppid]').val(str[0]);
   		   $('#vpid2').selectpicker('refresh');
   		   /*
   		   $('select[name=pname]').val(str[1]);
		   $('#pname').selectpicker('refresh');
   		   */
//   		document.getElementById("pid").value=str;

   			document.getElementById("id").innerHTML = str[0];
   			document.getElementById("nm").innerHTML = str[1];
   			document.getElementById("flno").innerHTML = str[2];
    	    document.getElementById("fileno").value = str[2];

   			$("#docid").val(str[3]); 
   			$("#datetime").val(str[4]);
   			
   			$("#text1").val(getval.getAttribute('dv'));
   			getData(str[2],str[0])	   			
   		    $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
   	            
   	        	unsaved = false;
   	        });
   	}
       
       function sel(){
    	   var kl = $('#vpid').val();
    	   alert(kl)
       }
var cu;
       function openmd(value){
    	  cu = value;
    	
    	   if(value == "config"){
    		   document.getElementById("text1").style.display = "none";
    		   document.getElementById("home").style.display = "none"
    		   document.getElementById("home1").style.display = "none";
    		   document.getElementById("tx").style.display = "none";
    		  // $('.nav-pills a:first').tab('show');
    		   $('#pi').text("Configuration");
    		   $('#id').hide();
    		   $('#nm').hide();
    		   $('#flno').hide();
    		   document.getElementById("bouton-contact").disabled = true;
    		   $("#save").text('');
    		   $("#preview").hide();
    		   $('.navbar-brand').text('Dental Diagnosis Configuration');
    		   $('#cd').text('Dental Diagnosis Configuration');
    		   
    	   }
    	   else{
    		  // document.getElementById("adb").style.display = "none";
    		   $(".plus").hide();  
    	   }
       }
       
       var opm;
       function openmd1(a,b,c,e){
    
    	   $('#close').click(function(){
    			window.close();
    			});
    		
    		if(a.length != 0 && b.length!= 0 && c.length != 0 && e.length != 0){
    			  
       		 $('#ppid').attr('name','ppid')
       		 $('#vpid2').removeAttr('name')
          		
          		
       		   $('#fg1').hide();
          		   $('#fg').show();
          		   $('#id2').hide();
        		   $('#id1').show();
       	      
    			$("#datetime").val(moment().format("DD-MM-YYYY hh:mm"));
    			    		
    			   $('select[name=ppid]').val(c);
    			   $('#ppid').selectpicker('refresh');
    			   
    			   $('select[name=pname]').val(b);
    		       $('#pname').selectpicker('refresh');
    	   	               
    	   document.getElementById("docid").value = e;
    	    document.getElementById("id").innerHTML = c;
    		
    		document.getElementById("nm").innerHTML = b;
    		document.getElementById("flno").innerHTML = a;
    		document.getElementById("fileno").value = a;
    		$('#fileno').val(a);
    		$('#docid').val(e);
    		
    			if(f!=1){
    				
    		
    		   		}
    		
    			else{
    				/*
    				  $('#check').prop('disabled','disabled')
    				document.getElementById("nm").innerHTML = b;
    	    		document.getElementById("flno").innerHTML = a;
    	    		document.getElementById("fileno").value = a;
    	    		$('#fileno').val(a);
    	    		
    			    $('#check').prop("checked",true)
                     change()
     			   $('select[name=ppid]').val(c);
     			   $('#vpid2').selectpicker('refresh');
     			   
     			   $('select[name=pname]').val(b);
     		       $('#vpid').selectpicker('refresh');
     		     
     		 	 var uri = "/HMS/loadtxtvalues?location6="+a+"";
     			 var data1 = 0;
     		    

     			  var successFn =  function(response){
     				 
     			  $.each(response, function(index, datec) {
     				 
                   $('#datetime').val(datec.datetime);
                   $('#text1').val(datec.diagnose);
                   $('#docid').val(datec.docid);
                   

     		         });    
     		     }
     			    
     			  var errorFn = function(e){
     		     	  alert('Error: ' + e);
     			  }
     			  
     				var get = "GET";
     		  doAjaxPostNew(get,uri,data1,successFn,errorFn,"application/json; charset=UTF-8");
     		  //    sel()
     		  */
    			}
    		
    		}
    		else{
    			
    	        change()
    			$('#close').hide();
    		}
    	}
   
       </script>
       <script>
       var addpe;
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
       $( function() {
    		  $( "#vpv" ).dialog({
    		      
    		    	dialogClass: 'result',
    		      autoOpen: false,
    		      show: {
    		        effect: "blind",
    		        duration: 1000
    		      },
    		      hide: {
    		        effect: "explode",
    		        duration: 1000
    		      }
    		    });
    		  
    		  $( "#sad" ).dialog({
    		      
  		    	dialogClass: 'result',
  		      autoOpen: false,
  		      show: {
  		        effect: "blind",
  		        duration: 1000
  		      },
  		      hide: {
  		        effect: "explode",
  		        duration: 1000
  		      }
  		    });
    		 
    		 
    		  $('.tbalpha').on( 'click','tr td:nth-child(2)', function() {
    		    	var isOpen = $( "#sad" ).dialog( "isOpen" );
    		    addpe = this.getElementsByTagName('input')[0].id;
    		      if(isOpen == true){
    		    	  
    		    	  $( "#sad" ).dialog( "open" );
    		      }
    		      else{
    		    	
    		    
    		    	 $( "#sad" ).dialog( "open" );
    		      }
    		    
    		    });
    		  
    		  $('#sad').dialog({height: 300, width:300 });
    		    $(".ui-dialog").find(".ui-widget-header").css("background", "#009999","text-align","center");
    		    
    		    $('#get').on( 'click',function() {
    		    	var isOpen = $( "#vpv" ).dialog( "isOpen" );
    		   // 	 addpe = this.getElementsByTagName('input')[0].id;
    		      if(isOpen == true){
    		    	  
    		    	  $( "#vpv" ).dialog( "open" );
    		      }
    		      else{
    		    	
    		    
    		    	 $( "#vpv" ).dialog( "open" );
    		      }
    		    
    		    });
    		    
    		  
    		    
    		  $('#vpv').dialog({height: 300, width:1000 });
    		    $(".ui-dialog").find(".ui-widget-header").css("background", "#009999","text-align","center");
    		    
 	  });
       
       </script>
       <script type="text/javascript">
       
       function getData(fileno,pid){
    
    		  var uri = "/HMS/prescription1/"+fileno+"/"+pid+"";
    		  
    		  var data = 0;
    		 
    	   var successFn =  function(response){
    		   
    		   $("#myTable1 .tbalpha tr").remove();
    		   $.each(response.list5, function(index, drug) {
    			  
    			   document.getElementById("advice").value = drug.advice;
  var tableRef = document.getElementById('myTable1').getElementsByTagName('tbody')[0];
  var cnt = tableRef.rows.length;
var dmc = "dm"+cnt;
var baf = "baf"+cnt;
var id = Math.random();  
     
  var markup = "<tr><td><input type='text' class='form-control input-sm'  form ='formc'   id = '"+id+"' value='"+drug.typeofdr+"' name= 'typeofdr'></td><td><input  form ='formc' class= 'form-control input-sm button1' value='"+drug.drugname+"' type='text' id = '"+tableRef.rows.length+"' name= 'drugname'></td><td><input  form ='formc' class= 'form-control input-sm' value='"+drug.strdrug+"' type='text' id = 'strdrug' name= 'strdrug'></td><td><input  form ='formc' class= 'form-control input-sm' value='"+drug.dosage+"' type='text' id = 'dosage' name= 'dosage'></td><td><select  form ='formc' class= 'form-control input-sm'   id = '"+dmc+"'  name= 'dm'  ><option value='PRN'>PRN</option><option value='OD'>OD</option><option value='BD'>BD</option><option value='TDS'>TDS</option><option value='QID'>QID</option><option value='OTHERS'>OTHERS</option></select></td><td><input  form ='formc' class= 'form-control input-sm'  type='text' id = '"+baf+"' name= 'baf' value='"+drug.baf+"'></td><td><input  form ='formc' class= 'form-control input-sm' value='"+drug.totn+"' type='text' id = 'totn' name= 'totn'></td><td><input  form ='formc' class= 'form-control input-sm' value='"+drug.nofdays+"' type='text' id = 'nofdays' name= 'nofdays' ></td><td><i class='fa fa-trash-o' font-size:20px'  onclick='doAjaxDelete(this,"+tableRef.rows.length+","+id+")'></i></td></tr>";
  $('#myTable1 tbody').append(markup);   
  document.getElementById(dmc).value = drug.dm; 			 	   	   			 	
    			   
    		   });
    		
    		   $.each(response.list6, function(index, addn) {
    			$('#pds').val(addn.pds)
    			$('#pir').val(addn.pir)
    			   if( addn.admit == "Yes"){
   	   		          $('#yes').click();
   	   		        }
   	   	          else{
   	   		           $('#no').click();
   	   		          } 
    		   });
	                    //to print name of employee
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
    		   if(response.list18.length == 0){
    	  		   alert("Selected patient does not have previous records")
    	  	   }
rows += "<tr><td>" + drug.fileno + "</td><td>" + drug.height + "</td><td>" + drug.weight + "</td><td>" + drug.temperature + "</td><td>"+drug.ac+"</td><td>"+drug.bp+"</td><td>"+drug.pulse+"</td><td>"+drug.bmi+"</td><td>"+drug.fi+"</td><td>"+drug.time+"</td></tr>";
      	 });
  	  	 
  	   $(rows).appendTo( "#myTable3 tbody" );  	  	 
    	   }   		    
    		  var errorFn = function(e){
    	      	  alert('Error: ' + e);
    		  }
    		  
    		 
    			var get = "GET";
    	   doAjaxPostNew(get,uri,data,successFn,errorFn,"application/json; charset=UTF-8");
    	   
    	   unsaved = false;
       }
       
       
       
       </script>
       <script>
       
       function doAjaxDelete(r,drug,type){
    	   
    	   var a = document.getElementById(drug).value;
    		var b = document.getElementById(type).value;
    		var file = $('#fileno').val();
    		
    	   var uri = "/HMS/delpr/"+a+"/"+b+"/"+file+"";
 		  
 		  var data = 0;
 		 
 	   var successFn =  function(response){
 		  if(response.toString() == "success")   
          {
      	  alert("Record deleted Successfully")
          }
      	  unsaved = false;
          };
          

     	
         var errorFn =  function(e){
       	  
       	           alert('Error: ' + e);
       	  
                }
       	         
 var i = r.parentNode.parentNode.rowIndex;
 document.getElementById("myTable1").deleteRow(i);
 var get = "GET";
 doAjaxPostNew(get,uri,data,successFn,errorFn,"application/json; charset=UTF-8"); 	  
       }
       
       </script>
       
       <script>
       $( function() {
       $("input").on("keypress", function(e) {
    	   
       
	        if (e.which === 32 && !this.value.length)
	            e.preventDefault();
	    });
       });
       
       </script>
 
</head>
<sec:authentication property="principal.authorities" var="username" />
<body onload="checkhome('<c:out value="${username}" />'),loadtabvalues()">
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Dental Diagnosis</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active" id="act"><a id="ho" href="">Home</a></li>
    </ul>
  </div>
</nav>
 <div id ="form2">
    <h1><button id ="bouton-contact" form="formc" class="btn btn-warning btn-sm button1" class="form-control input-sm" >Save</button>
  <font size="5" id="cd"> Dental Diagnosis </font>
      <button type="button" id="close" class="btn btn-warning button2" onclick="clos()">Close</button>    
  </h1>
<br>
 <form id = "formc" action="/HMS/csavediag.html" method = "post"></form>
 <div class="container" style="width:auto;height:auto;">
 <button type="button" class="btn btn-primary btn-block"><span id="pi" style="float:left">Patient Information</span><span id="flno" style="float:right">Fileno</span><span id="id" style="float:right;margin-right:15px;">Id</span><span style="float:right;margin-right:25px;" id="nm">Name</span></button>
 <br>
         <ul class="nav nav-pills nav-stacked col-md-2 reduce" id="pills" style="height:auto;width:140px;max-height:390px;overflow : auto;">
        <li class="active"><a data-toggle="pill"  id="home" href="#home1" onclick="minimize(this.id)">Patient Details</a></li>
        <li><a data-toggle="pill"  id="pv" href="#pv1" onclick="minimize(this.id)">Patient Vitals</a></li>
        
        </ul>
       
         <div class="form-group row" >
        <div id="tabcontent" class="tab-content col-xs-4" style="height:auto;">
        <!-- Home1-->
   <div id="home1" class="tab-pane fade in active">
     <div class="form-group row" >
        <div class="col-xs-6"></div>
    <div class="col-xs-6">Diagnosed Patients : <input type="checkbox" name="check" id="check" onchange = "change()" ></div>
   
    </div>
    <br>
   
    <div class="form-group row" >
      <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input type="" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Patient Name">
     </div>
     <div class="col-xs-4"></div>
      <div class="col-xs-5">
       <div class="form-group" id="fg">
      
       <select class="selectpicker form-control btn btn"  data-live-search="true" data-size="5" form="formc" name = "pname" id ="pname" onchange="return addcname(this.options[this.selectedIndex])">
          <option value="select" selected disabled >Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value ="${p.pname}" data-subtext="${p.fileno}" data-value="${p.pid}==${p.pname}==${p.fileno}==${p.docid}">${p.pname}</option>
        </c:forEach>
      </select>
      </div>
      <div class="form-group" id="fg1">
       <select class="selectpicker form-control btn btn"  data-live-search="true" data-size="5" form="formc" name = "pname" id ="vpid" onchange='addcname1(this.options[this.selectedIndex])'>
          <option value="select" selected disabled >Select</option>
        <c:forEach var="p"  items="${model.list3}">
      
       <option value ="${p.pname}" data-subtext="${p.fileno}" data-value="${p.ppid}==${p.pname}==${p.fileno}==${p.docid}==${p.datetime}" dv="${fn:escapeXml(p.diagnose)}" >${p.pname}</option>
        </c:forEach>
      </select>
      
   
      
      </div>
      </div>
      </div>
      <div class="form-group row" >
       <div class="col-xs-1"></div>
      <div class="col-xs-1">
      <button type="button" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" >Patient Id</button>
     </div>
     <div class="col-xs-4"></div>
      <div class="col-xs-5">
       <div class="form-group" id="id1">
      <select class="selectpicker form-control btn btn" data-width="100%" data-size="5" form="formc" data-live-search="true"  name = "ppid" id ="ppid" onchange="return addcid(this.options[this.selectedIndex])" >
      <option value="select" disabled selected>Select</option>
        <c:forEach var="p"  items="${model.list1}">
        <option value = "${p.pid}" data-subtext="${p.fileno}" data-value="${p.pid}==${p.pname}==${p.fileno}==${p.docid}">${p.pid}</option>
        </c:forEach>
      </select>
     </div>
      
        <div class="form-group" id="id2">
        <select class="selectpicker form-control btn btn" data-width="100%" data-size="5" form="formc" data-live-search="true" id ="vpid2" >
      <option value="select" disabled selected>Select</option>
      <c:forEach var="p"  items="${model.list3}">
     
        <option value ="${p.ppid}" data-subtext="${p.fileno}" data-value='${p.ppid}==${p.pname}==${p.fileno}==${p.docid}==${p.datetime}' dv="${fn:escapeXml(p.diagnose)}">${p.ppid}</option>
        </c:forEach>
      </select>
      </div>
     
     
      </div>
      </div>
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-1">
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Date">
     </div>
     <div class="col-xs-4"></div>
      <div class="col-xs-5">
       <div class="form-group">
       
         <input type="text" name="datetime" id="datetime" class="form-control input-sm" form="formc" readonly="readonly" required>
        </div>
      </div></div>
      
      <div class="form-group row" >
      <div class="col-xs-1"></div>
       <div class="col-xs-1">
      <input class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="File No">
     </div>
     <div class="col-xs-4"></div>
      <div class="col-xs-5">
       <div class="form-group">
       <input type="text" name="fileno" id="fileno" readonly class="form-control input-sm" form="formc"  required>
       </div>
      </div>
     </div>
   
 
  <input type="hidden" name="docid" id="docid" form = "formc">
  <input type="hidden" name="dname" id="dname" form = "formc">
 
   
     </div>
     <!-- Patient Vitals -->
    <div id="pv1" class="tab-pane fade">
    <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Height<span></span></p>
             <input type="text" class="form-control" form="formc" onkeypress='return onlyNos(event,this);'  oninput="calculateBmi()" value="0" name="height" id="height" >
	</div>
  </div>
  
        <div class="col-xs-2">
  <div class="form-group">
            <p> Unit<span></span></p>
            
             <select class="form-control" form="formc" onchange="calculateBmi()" name="unith" id="unith" >
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
           <input type="text" class="form-control" form="formc" onkeypress='return onlyNos(event,this);'  oninput="calculateBmi()"value="0" name="weight" id="weightw" >
	</div>
  </div>
   <div class="col-xs-2">
  <div class="form-group">
            <p> Unit<span></span></p>
         <select class="form-control" form="formc" onchange="calculateBmi()" name="unitw" id="unitw" >
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
             <input type="text" class="form-control" form="formc" onkeypress='return onlyNos(event,this);'  name="temperature" id="temperature" >
	</div>
  </div>
  
        <div class="col-xs-2">
  <div class="form-group">
            <p>Unit<span></span></p>
            
             <select class="form-control" form="formc" name="unitt" id="unitt">
             <option value="" selected disabled>Select Unit</option>
             <option value="celsius">celsius</option>
             <option value="fahrenheit">fahrenheit</option>
           
             </select>
	</div>
  </div>
  
   <div class="col-xs-5">
  <div class="form-group">
            <p>Abdominal Circumference<span></span></p>
           <input type="text" form="formc" onkeypress='return onlyNos(event,this);' class="form-control"  name="ac" id="ac">
	</div>
  </div>
   
  </div>
  <div class="form-group row" >
        <div class="col-xs-1"></div>
       <div class="col-xs-3">
  <div class="form-group">
            <p>Blood Pressure<span></span></p>
             <input type="text" form="formc" class="form-control" size="2" onkeypress='return onlyNos1(event,this);' name="bp" id="bp" value="">
	</div>
  </div>
  
        <div class="col-xs-2">
  <div class="form-group">
           
            <p>Pulse<span></span></p>
             <input type="number" form="formc" class="form-control" min="0" name="pulse" id="pulse" value="72">
           
	</div>
  </div>
  
     <div class="col-xs-5">
  <div class="form-group">
           
            <p>Body Mass Index<span></span></p>
             <input type="text" form="formc" class="form-control" onkeypress="return onlyAlphabets(event,this);" readonly="readonly" name="bmi" id="bmi" value="">
           
	</div>
  </div>
  </div>
  
  
  <div class="form-group row" >
        <div class="col-xs-1"></div>
   <div class="col-xs-7">
  <div class="form-group">
            <p>Chest Circumference<span></span></p>
           <input type="text" form="formc" class="" size="10" onkeypress='return onlyNos(event,this);' placeholder="Full Inspiration" name="fi" id="fi">
            <input type="text" form="formc" class="" size="10" onkeypress='return onlyNos(event,this);' placeholder="Full Expiration" name="fe" id="fe">
             <input type="text" form="formc" class="" size="8" onkeypress='return onlyNos(event,this);' placeholder="At Rest" name="rest" id="rest">
	</div>
  </div>
  <div class="col-xs-1">
  <br>
  <button id="get" type="button" class="btn btn-warning btn-sm"  >View Previous Records</button>
  
  </div>
  </div>
    </div> 
    
    <!-- Provisional Diagnosis -->
      <div id="pd1" class="tab-pane fade">
     <div class="form-group row" >
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Provisional Diagnosis">
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
       <div class="form-group">
      
      <textarea name="pds" id="pds" rows="3" cols="90" form="formc" data-rule="" data-msg="address1" ></textarea></div>
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
      
      <textarea name="pir" id="pir" rows="3" cols="90" form="formc" data-rule="" data-msg="address1" ></textarea></div>
      </div>
      </div>
      
  
      <div class="form-group row" >
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input readonly="readonly" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;cursor: default;" value="Admit Patient">
     </div>
     <div class="col-xs-2"></div>
      <div class="col-xs-4">
      <div class="form-group">
       <div class="btn-group" data-toggle="buttons">
     <label class="btn btn-default"><input class="form-control input-sm"  style="width: 0px;" value="Yes" id="yes" type="radio" form="formc" name="admit" />Yes</label>
 		<label class="btn btn-default"><input class="form-control input-sm" style="width: 0px;" type="radio" value="No" id="no" form="formc" name="admit" />No</label>
 		</div>
      </div>
      </div></div>
      
    </div>
    
      <div id="pres1" class="tab-pane fade">
    <div class="table-responsive"> 
	      
	     
	     
	     	    
  <table class="table table-striped table-bordered table-fixed table-hover table-condensed alpha"  id="myTable1">
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
   
    <tbody  class="tbalpha">

   
    </tbody>
<!-- 
     <tr id="hide">
		    <td><i class='fa fa-plus' style='font-size:20px; color : #ff9900;'  onclick="display()"></i></td>
		  </tr>
		 -->  
    </table>
  </div>
    <div class="form-group row" >
  
    <div class="col-xs-1">
    <p><b>Advice</b></p>
    <textarea name="advice" rows="3" cols="80" id="advice" form="formc"></textarea>
    </div>
     <div class="col-xs-7"></div>
     <div class="col-xs-4">
     <br><br>
    <input type='button' class="btn btn-info btn-sm"  value='Add Row' onclick="display()" id='adr'>
    <a class="btn btn-info btn-sm" id ="print" onclick="return verpr();" href="prprs1" target="_blank" >Print Prescription</a>
          
    
    </div>
  </div>
      </div>
      
      
    </div>
      


    <div class="col-xs-1" style="height:350px;width:50px;margin-left:50px;"><i class="fa fa-angle-double-right btn btn-warning btn-sm" id="prv" onclick="preview()" style="margin-left:-13px;margin-top:150px;font-size:25px;" aria-hidden="true"></i></div>
   
    <div class="col-xs-4">
    <p id="tx" style="margin-top:-10px;"><b id='dd'>Diagnosis Details</b></p>
    <textarea name='diagnose' id='text1' required rows='18' cols='78' form="formc" ></textarea>
    </div>
    
    
</div>    
  </div> 
 <button type="submit" class="bouton-contact"  ><span id="save"></span></button>
     
 </div>
</div>
<!-- View Previous Vitals -->
<div id="vpv" title="View Previous Vitals">
 <div class="table-responsive">  
     
        <table class="table table-striped table-bordered table-fixed table-hover table-condensed beta"  id="myTable3">
    <thead class="thead2">
      <tr>
        <th width="">FileNo</th>
        <th width="">Height</th>
        <th width="">Weight</th>
        <th width="">Temperature</th>
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

<div id="sad" title="Pharmacy Products">
  <div class="form-group row" >
        <div class="col-xs-8">
        <p>Drug Name<span></span></p>
       <div class="form-group">
      
       <select class="selectpicker form-control input-sm" data-size="5" data-live-search="true" data-dropup-auto="false" name = "drugn" id ="drugn" onchange=""   >
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
<script>
openmd1('<c:out value='${model.fileno}'/>','<c:out value='${model.pname}'/>','<c:out value='${model.pid}'/>','<c:out value='${model.docid}'/>','<c:out value='${model.sav}'/>')
</script>
<script>
datasuccess('<%=request.getParameter("message")%>')
</script>
</body>
</html>