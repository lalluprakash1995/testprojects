$(document).ready(function(){
  $(".iconDelete").click(function(){
  	var deleteLink=($(this).attr("data-deleteData"));
  	$("#deleteFrom").attr("href", deleteLink);
  });
});