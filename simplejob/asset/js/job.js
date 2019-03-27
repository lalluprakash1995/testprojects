$(document).ready(function(){
	var flag=0;
	$("#companyName").focusout(function(){
	 	if($(this).val()==null || $(this).val()=='' ){
	 		$('#errorMessage').html("Company name is required");
	 		flag=0;
	 	}
	 	else{
	 		$('#errorMessage').html("");
	 		flag=1;
	 	}
	});
	$("#website").focusout(function(){
	 	if($(this).val()==null || $(this).val()=='' ){
	 		$('#errorMessage').html("Website name is required");
	 		flag=0;
	 	}
	 	else if($(this).val().trim().length > 0){
	 		if(isUrl("https://"+$(this).val())==false){
	 			$('#errorMessage').html("Invalid url");
	 			flag=0;
	 		}
	 		else{
	 			$('#errorMessage').html("");
	 			flag=1;
	 		}
	 	}
	 	else{
	 		$('#errorMessage').html("");
	 		flag=1;
	 	}
	});
	$("#title").focusout(function(){
	 	if($(this).val()==null || $(this).val()=='' ){
	 		$('#errorMessage').html("Title is required");
	 		flag=0;
	 	}
	 	else{
	 		$('#errorMessage').html("");
	 		flag=1;
	 	}
	});
	$("#type").focusout(function(){
	 	if($(this).val()==null || $(this).val()=='' ){
	 		$('#errorMessage').html("Please select job type");
	 		flag=0;
	 	}
	 	else{
	 		$('#errorMessage').html("");
	 		flag=1;
	 	}
	});
	$("#city").focusout(function(){
	 	if($(this).val()==null || $(this).val()=='' ){
	 		$('#errorMessage').html("City,state is required");
	 		flag=0;
	 	}
	 	else{
	 		$('#errorMessage').html("");
	 		flag=1;
	 	}
	});
	$("#country").focusout(function(){
	 	if($(this).val()==null || $(this).val()=='' ){
	 		$('#errorMessage').html("Please select country");
	 		flag=0;
	 	}
	 	else{
	 		$('#errorMessage').html("");
	 		flag=1;
	 	}
	});
	$("#emailId").focusout(function(){
	 	if($(this).val()==null || $(this).val()=='' ){
	 		$('#errorMessage').html("Email name is required");
	 		flag=0;
	 	}
	 	else if($(this).val().trim().length > 0){
	 		if(isEmail($(this).val())==false){
	 			$('#errorMessage').html("Invalid email");
	 			flag=0;
	 		}
	 		else{
	 			$('#errorMessage').html("");
	 			flag=1;
	 		}
	 	}
	 	else{
	 		$('#errorMessage').html("");
	 		flag=1;
	 	}
	});
	$("#description").focusout(function(){
	 	if($(this).val()==null || $(this).val()=='' ){
	 		$('#errorMessage').html("Please enter the Description");
	 		flag=0;
	 	}
	 	else{
	 		$('#errorMessage').html("");
	 		flag=1;
	 	}
	});
	$('form').submit(function(){
		if (flag==0) {
			alert("All fields are required");
			return false;
		}
	});
	window.setTimeout(function() {
		$("#updateAlert").fadeTo(500, 0).slideUp(500, function(){
			$(this).remove(); 
		});
	}, 2000);
});
function isUrl(urlString) {
  var regex = /^((https?|ftp|smtp):\/\/)?(www.)?[a-z0-9]+(\.[a-z]{2,}){1,3}(#?\/?[a-zA-Z0-9#]+)*\/?(\?[a-zA-Z0-9-_]+=[a-zA-Z0-9-%]+&?)?$/;
  return regex.test(urlString);
}
function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}