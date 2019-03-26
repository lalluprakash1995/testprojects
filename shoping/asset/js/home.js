$(document).ready(function(){
		if($('#nav-home-tab').hasClass('active')){
			$('#addram').hide();
			$('#addbrand').hide();
		}
		$('#nav-home-tab').click(function(){
			$('#addram').hide();
			$('#addbrand').hide();
		});
		$('#nav-profile-tab').click(function(){
			$('#addram').hide();
			$('#addbrand').show();
		});
		$('#nav-contact-tab').click(function(){
			$('#addbrand').hide();
			$('#addram').show();
		});
		var urlParam=window.location.href.split("&").pop();
		if(urlParam=="rm"){
			$('#nav-home-tab').removeClass('active');
			$('#nav-profile-tab').removeClass('active');
			$('#nav-contact-tab').addClass('active');
			$('#nav-home').removeClass('show active');
			$('#nav-profile').removeClass('show active');
			$('#nav-contact').addClass('show active');
			$('#addbrand').hide();
			$('#addram').show();
		}
		else if(urlParam=="brd"){
			$('#nav-home-tab').removeClass('active');
			$('#nav-profile-tab').addClass('active');
			$('#nav-contact-tab').removeClass('active');
			$('#nav-home').removeClass('show active');
			$('#nav-profile').addClass('show active');
			$('#nav-contact').removeClass('show active');
			$('#addbrand').show();
			$('#addram').hide();
		}
		window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function(){
				$(this).remove(); 
			});
		}, 2000);

});