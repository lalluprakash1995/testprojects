$(document).ready(function(){
	var status="";
	allData();
	if(setCount('completed')==0){
		$('#deleteAll').hide();
	}
	else{
		$('#deleteAll').show();
	}
	if( ($("ul#savedContents").has("li").length === 0) ) {
  		$('#selectall').hide();
		$(".footr").hide();
	}
	$(document).on('mouseover', '#savedContents li',function () {
		 $(this).children().find('i').show();
	});
	$(document).on('mouseout', '#savedContents li',function () {
		 $(this).children().find('i').hide();
	});
	$(document).on('click', 'input:checkbox',function () {
		var idToUpdate=$(this).parent().parent().find('i').attr('data-delete');
		var mark= ($(this).parent()).siblings().prop('id');
		var ststusTochange="active";
		if($(this).prop("checked") == true){
			$("#"+mark).children().wrap("<del></del>");
			ststusTochange="completed";
		}
		else if($(this).prop("checked") == false){
			if ($("#"+mark).children().is( "del" ) ) {
				$("#"+mark).children().children().unwrap();
			}
		}
		forUpdate(idToUpdate,ststusTochange);
		if($('#footerWrap').prop('class')=='active'){
			$.each($("input[type='checkbox']:checked"), function(){ 
            	$('#'+$(this).parents('li').prop('id')).remove();
        	});
		}
		else if($('#footerWrap').prop('class')=='complete'){
			if($(this).prop("checked") == false){
				$('#'+$(this).parents('li').prop('id')).remove();
			}
		}
		if(setCount('completed')==0){
			$('#deleteAll').hide();
		}
		else{
			$('#deleteAll').show();
		}
	});
	
	$(document).on('click', '.deletered',function () {
		$('#'+$(this).parents("li").prop('id')).remove();
		$.ajax({
			url : "dataStore.cfc",
			type : "POST" ,
			data : {"method" :'deleteOne',"dataId":$(this).attr('data-delete')},
			async : false,
			success : function(data){
			}
		});
		displayItemLeft(setCount('active'));
		if(setCount('completed')==0){
			$('#deleteAll').hide();
		}
		else{
			$('#deleteAll').show();
		}
	});
	$(document).on('click', '#activeList',function () {
		$('ul').empty();
		selectByStatus("active");
		$("#footerWrap").attr('class', 'active');
		$("#activeList").toggleClass("active border");
		$("#allList").removeClass("active border");
		$("#completedList").removeClass("active border");
	});
	$(document).on('click', '#completedList',function () {
		$('ul').empty();
		selectByStatus("completed");
		$("#footerWrap").attr('class', 'complete');
		$("#completedList").toggleClass("active border");
		$("#allList").removeClass("active border");
		$("#activeList").removeClass("active border");
	});
	$(document).on('click', '#allList',function () {
		$('ul').empty();
		allData();
		$("#footerWrap").attr('class', 'all');
		$("#allList").toggleClass("active border");
		$("#completedList").removeClass("active border");
		$("#activeList").removeClass("active border");
	});
	$(document).on('click', '#deleteAll',function () {
		$.ajax({
			url : "dataStore.cfc",
			type : "POST" ,
			async :false,
			data : {method :'deleteData'},
			success : function(data){
				obj = JSON.parse(data);
			}
		});
		$.each($("input[type='checkbox']:checked"), function(){ 
             $('#'+$(this).parents('li').prop('id')).remove();
        });
        if(setCount('completed')==0){
			$('#deleteAll').hide();
		}
		else{
			$('#deleteAll').show();
		}
	});	
	
	$(document).on('click', '#selectall',function () {
		var status=0;
		if($(".select").length == $(".select:checked").length) {
			$("input:checkbox").prop('checked', false);
			forUpdateStatus("active");
		 	$('.itemContainer').find('del').children().unwrap();
		} else {
			$("input:checkbox").prop('checked', true);
			forUpdateStatus("completed");
	    	if ($('.itemContainer').children('.contentSpan').children().is( "div" ) ){
	    		$('.itemContainer').children('.contentSpan').children().wrap('<del></del>');
	    	}
		}
		if($('#footerWrap').prop('class')=='active'){
			if( ($("ul#savedContents").has("li").length === 0) ) {
		  		forUpdateStatus("active");
		  		selectByStatus("active");
			}
			else{
				forUpdateStatus("completed");
				$('ul').empty();
			}
		}
		else if($('#footerWrap').prop('class')=='complete'){
			if( ($("ul#savedContents").has("li").length === 0) ) {
		  		forUpdateStatus("completed");
		  		selectByStatus("completed");
			}
			else{
				forUpdateStatus("active");
				$('ul').empty();
			}
		}
		if(setCount('completed')==0){
			$('#deleteAll').hide();
		}
		else{
			$('#deleteAll').show();
		}
	});	
});
function allData(){
	$.ajax({
		url : "dataStore.cfc",
		type : "POST" ,
		data : {method :'selectTodos'},
		async : false,
		success : function(data){
			obj = JSON.parse(data);
			for (var i=0; i < obj.DATA.length; i++){
				if(obj.DATA[i][2] == "active"){
					$("#savedContents").append('<li class="h3 closest" id="itemcontents'+i+'"><div class="row border-bottom itemContainer" id="itemDiv'+i+'"><div class="col-md-1 mt-2" id="checkboxContainer'+i+'"><input type="checkbox" class="select" id="checkBox'+i+'" name="todocheck"></div><div class="col-md-10 contentSpan pb-3" id="todoData'+i+'"><div id="wrap'+i+'">'+obj.DATA[i][1] +'</div></div><div class="col-md-1"><a class="text-danger h5 btn deletebtn " id="closebtn'+i+'"><i class="fas fa-times deletered" data-delete="'+obj.DATA[i][0]+'"></i></a></div></div></li>');
					
				}
				else{
					$("#savedContents").append('<li class="h3 closest" id="itemcontents'+i+'"><div class="row border-bottom itemContainer" id="itemDiv'+i+'"><div class="col-md-1 mt-2" id="checkboxContainer'+i+'"><input type="checkbox" class="select" id="checkBox'+i+'" name="todocheck" checked></div><div class="col-md-10 contentSpan pb-3" id="todoData'+i+'" ><del><div id="wrap'+i+'">'+obj.DATA[i][1] +'</div></del></div><div class="col-md-1"><a class="text-danger h5 btn deletebtn " id="closebtn'+i+'"><i class="fas fa-times deletered" data-delete="'+obj.DATA[i][0]+'"></i></a></div></div></li>');
				}
				$('.deletered').hide();
			}
		}
	});
	displayItemLeft(setCount('active'));
}
function selectByStatus(dataStatus){
	$.ajax({
		url : "dataStore.cfc",
		type : "POST" ,
		async : false,
		data : {method :'selectTodos',argStruct:dataStatus},
		success : function(data){
			obj = JSON.parse(data);
				for (var i=0; i < obj.DATA.length; i++){
				if(obj.DATA[i][2] == "active"){
				$("#savedContents").append('<li class="h3 closest" id="itemcontents'+i+'"><div class="row border-bottom itemContainer" id="itemDiv'+i+'"><div class="col-md-1 mt-2" id="checkboxContainer'+i+'"><input type="checkbox" class="select" id="checkBox'+i+'" name="todocheck"></div><div class="col-md-10 contentSpan pb-3" id="todoData'+i+'"><div id="wrap'+i+'">'+obj.DATA[i][1] +'</div></div><div class="col-md-1"><a class="text-danger h5 btn deletebtn " id="closebtn'+i+'"><i class="fas fa-times deletered" data-delete="'+obj.DATA[i][0]+'"></i></a></div></div></li>');
				}
				else{
					$("#savedContents").append('<li class="h3 closest" id="itemcontents'+i+'"><div class="row border-bottom itemContainer" id="itemDiv'+i+'"><div class="col-md-1 mt-2" id="checkboxContainer'+i+'"><input type="checkbox" class="select" id="checkBox'+i+'" name="todocheck" checked></div><div class="col-md-10 contentSpan pb-3" id="todoData'+i+'" ><del><div id="wrap'+i+'">'+obj.DATA[i][1] +'</div></del></div><div class="col-md-1"><a class="text-danger h5 btn deletebtn " id="closebtn'+i+'"><i class="fas fa-times deletered" data-delete="'+obj.DATA[i][0]+'"></i></a></div></div></li>');
				}
			}
			$('.deletered').hide();
		}
	});
	displayItemLeft(setCount('active'));
}
function forUpdate(dataID,status){
	$.ajax({
		url : "dataStore.cfc",
		type : "POST" ,
		data : {"method" :'updateData',"id":dataID,"argstatus":status},
		async : false,
		success : function(data){
		}
	});
	displayItemLeft(setCount('active'));
}
function forUpdateStatus(status){
	$.ajax({
		url : "dataStore.cfc",
		type : "POST" ,
		data : {"method" :'updateData',"argstatus":status},
		async : false,
		success : function(data){
		}
	});
	displayItemLeft(setCount('active'));
}
function setCount(status){
	$.ajax({
            url: "dataStore.cfc",
            'async': false,
            type: 'POST',
            data:{method:'getcount',statusActive:status},
            success: function(data){
            	obj = JSON.parse(data);
            }    
    });
    return obj;
}
function displayItemLeft(item){
	if(item == 0){
		$("#itemLeft").html("0 items left");	
	}
	else{
		$("#itemLeft").html(obj+" items left");
	}
}
