$(document).ready(function(){
  $(".iconDelete1").click(function(){
  	var deleteLink=($(this).attr("data-deleteData"));
  	$("#deleteFrom1").attr("href", deleteLink);
  });
});