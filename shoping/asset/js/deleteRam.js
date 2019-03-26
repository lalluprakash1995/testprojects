$(document).ready(function(){
  $(".iconDelete").click(function(){
  	var deleteLink=($(this).attr("data-deleteData"));
  	alert(deleteLink);
  	$("#deleteFrom").attr("href", deleteLink);
  });
});