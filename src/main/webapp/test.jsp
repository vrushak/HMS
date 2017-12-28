<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Dialog - Animation</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#result" ).dialog({
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
 
    $( "#opener" ).on( "click", function() {
      $( "#result" ).dialog( "open" );
    });
    $('#result').dialog({height: 500});
    
  });
  </script>
<style>
#result.ui-dialog-content{
 width: 600;
 overflow :auto;   
}

</style>
</head>
<body>
 
<div id="result" class ="red" title="Basic dialog">
    <div class="form-group row" >
    <div class="col-xs-1"></div>
     <div class="col-xs-1">
      <input type="" class="btn btn" style="width: 170px;background-color:#dcdcdc;color:black;" value="Patient Name">
     </div>
     
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
 
<button id="opener">Open Dialog</button>
 
 
</body>
</html>