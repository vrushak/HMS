var isChange;
var unsaved = false;
var tpin;

    $(document).ready(function () {
    	
       
        
      //  var unsaved = false;

        $(":input").change(function(){ //trigers change in all input fields including text type
            unsaved = true;
        });
        $('#bc').click(function() {
            unsaved = false;
        });
        $('#bouton-contact').click(function() {
            unsaved = false;
        });
       
     
 
        
        $(window).bind('beforeunload', function() {
            if(unsaved){
               
            	return "You have unsaved changes on this page. Do you want to leave this page and discard your changes or stay on this page?";
            }
        });
        $(document).on('click', '#bouton-contact', function(){ //triggers change in all input fields including text type
            
        	unsaved = false;
        });
     
    
        // Monitor dynamic inputs
        
        
        $(document).on('input', ':input', function(){ //triggers change in all input fields including text type
            
        	unsaved = true;
        });
        
      $(document).on('change', '#myInp', function(){ //triggers change in all input fields including text type
            
        	unsaved = false;
        });
        
        $('#myInp').on('input',function(){ //triggers change in all input fields including text type
            
        	unsaved = false;
        });
    });
   /*
    $("input[type='text']").change(function () {
        
    	isChange = true;
    });
    
    $("select").change(function () {
        
    	isChange = true;
    });
   
    */