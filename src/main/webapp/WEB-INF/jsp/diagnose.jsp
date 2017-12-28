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

</style>
<script type="text/javascript">
var obj = {};

var arr = [];
var children;
var prvrec;
var newrec;
var pid;
var didd;
function checkdiv(id,val){

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

newrec = 	$(".divin").eq(0).find(":checkbox[name='radio']:checked").val();

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

if ($(".divin").eq(0).find(":checkbox[name='radio']:checked").length == 1){
		$(".divin").eq(0).find(":checkbox[name='radio']:not(:checked)").prop('disabled', true);
	 }  
	else{
	    $(".divin").eq(0).find(":checkbox[name='radio']:not(:checked)").prop('disabled', false);
		}
//	$(":radio[name='radio']:not(:checked)").prop('disabled', true);  

		var diva = Number(id)+1;
		var divb =  Number(id)+1;
	//if(id.length != 0){
		if(val.checked == true){
	      if(diva < 4 && divb < 4){
	    	
	    		if($(".divin").eq(diva).length < 1){
	    			creatediv('maindiv')
	    		}
	    		else{
	    		
	    			loadval(diva)
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

function creatediv(main){
	
var	divid =  $(".divin" ).length;
var	divid1 = $(".divot" ).length;

   
	var div = "<div class='col-xs-2 divin' title='"+divid+"' id='"+divid+"' style='border:1px solid;height:200px;overflow-Y:auto;'><center><font class='header' size='4' style='text-align:center;'></font></center></div><div class='col-xs-1 divot'></div>";
 //   console.log(div)
	$('#'+main).append(div);
  
    
   
    
     loadval(divid)
     
}
/*
function loadval(div){
	
	var div1 = "<div class='checkbox'><label><input type='checkbox' name='radio' value='Head' onchange='checkdiv("+div+",this)'>Head</label><br><label><input type='checkbox' name='radio' value='Hand' onchange='checkdiv("+div+",this)'>Hand</label></div>";
	$("#"+div).append(div1)
	}
*/


</script>
      <script type="text/javascript">
       function  doAjaxPostNew(uri,data,successFn,errorFn) {
    	   
    	              $.ajax({
    	        	  
    	        	           type: "GET",
    	        	   
    	        	           url: uri,
    	        	           data: "level=" + data,
    	        	           dataType: "JSON",
    	        	           contentType: "application/json; charset=UTF-8",
    	        	           success: successFn,
    	                       error: errorFn
    	        	        	           });
    	        	        	  }
      


function loadval(div){

	var check = $(".checkbox" ).length;	

	if(pid == undefined){
		pid =0;
	}

	  var uri = "/HMS/loaddiv1/"+pid+"";
	  
	  var data = div;
	 
   var successFn =  function(response){
     $.each(response.list, function(index, datec) {
    	 
       var div1 = "<br><input type='checkbox' value='"+datec.checkval+"' name='radio' title='"+datec.did+"' class='"+datec.pid+"' onchange='checkdiv("+div+",this)'><span>"+datec.checkval+"</span></input>";
        $("#"+div).append(div1);
    
          });    
      }
	    
	  var errorFn = function(e){
      	  alert('Error: ' + e);
	  }
		if(div == 0){
	    	$(".header").eq(div).text("Body Location");
	    }
	    else if(div == 1){
	    	$(".header").eq(div).text("Details of illness");
	    }
	    else if(div == 2){
	    	$(".header").eq(div).text("Chronology - Level 1");
	    }
	    else{
	    	$(".header").eq(div).text("Chronology - Level 2");
	    }
		
   doAjaxPostNew(uri,data,successFn,errorFn,div);
	}

       </script>
       <script type="text/javascript">
       function preview(){
    	   var i, j, x = "";	   
    	

    	   
       }
       </script>
</head>
<body onload="creatediv('maindiv')">
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
   <h1><font size="5"> Doctor </font><span class="button2"></h1>
<br>
 <div class="container">
  <div class="form-group row" id="maindiv">
        
       
        </div>
</div>
 <div class="form-group row" >
    <div class="col-xs-1"></div>
    <div class="col-xs-5">
    <p>TextArea 1</p>
    <textarea name='text1' rows='5' cols='60'>
    
    </textarea>
    </div>
    
    <div class="col-xs-5">
    <p>TextaArea 2</p>
    <textarea name='text2' rows='5' cols='60'>
    
    </textarea>
    </div>
    <button class="btn btn-warning" class="form-control input-sm" onclick="preview()">Preview</button>
  </div> 
 <button type="button" class="bouton-contact" onclick="" ></button>
     
 </div>
</div>
</body>
</html>