$(document).ready(function(){

	$('form').submit(function(){
		if($('#brandName').val()==null || $('#brandName').val()==""){
			$('#message').html("Please enter brand name...!");
			return false;
		}
		if($('#price').val()==null || $('#price').val()==""){
			$('#message').html("Please enter brand Price...!");
			return false;
		}
		if($.isNumeric($('#price').val())==false ){
			$('#message').html("Please enter numeric value...!");
			return false;
		}
		else{
			$('#message').html("");
		}
	});
});