$(document).ready(function(){
	if($('#test').hasClass("showlink")){
 
    $("#myModalalert").modal();
  }
	$('form').submit(function(){
		 var ram = $('#ramSelect').val();
	   if ($('input[name="brand"]:checked').length == 0) {
	     alert('please choose Brand...');
	     return false; } 
	     else if(ram==null || ram==""){
	     	alert("please choose RAM");
	     	return false;
	     }
	     else if($('#name').val()==null || $('#name').val()==""){
	     	alert("Please enter the name");
	     	return false;
	     }
	     else if($('#address').val()==null || $('#address').val()==""){
	     	alert("Please enter the address");
	     	return false;
	     }
	      else if($('#phn').val()==null || $('#phn').val()==""){
	     	alert("Please enter phone number");
	     	return false;
	     } 
	    if($.isNumeric($('#phn').val())==false){
	     	alert("Please enter valid phone number");
	     	return false;
	     }
	});
});
