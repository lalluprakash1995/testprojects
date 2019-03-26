<cfinclude template="header.cfm">
<script type="text/javascript" src="../asset/js/home.js"></script>
<cfinclude template="navbar.cfm">
<cfparam name="alertMessage" default="">
<div class="container-fluid">
	<div class="container-fluid">
		<div class="mt-3"></div>
		<cfif structKeyExists(url, "insert") AND url.insert EQ 1>
			<cfset alertMessage="Suceessfully inserted.....!">
		<cfelseif structKeyExists(url, "update") AND url.update EQ 1>
			<cfset alertMessage="Suceessfully Updated.....!">
		<cfelseif structKeyExists(url, "delete") AND url.delete EQ 1>
			<cfset alertMessage="Suceessfully Deleted.....!">
		</cfif>
		<cfif len(trim(alertMessage))>
			<div class="alert alert-success" role="alert" id="insertAlert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span>
				</button>
				<cfoutput>
					#alertMessage#
				</cfoutput>
				<cfset alertMessage="">
			</div>
		</cfif>
		<h2 class="text-center mt-5 text-danger">WELCOME</h2>
	  <div>
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Order</a>
	    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Brands</a>
	    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">RAM</a>
	  </div>
	</div>
	<div class="tab-content" id="nav-tabContent">
	  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"><cfinclude template="vieworder.cfm"></div>
	  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab"><cfinclude template="viewbrand.cfm"></div>
	  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab"><cfinclude template="viewram.cfm"></div>
	</div>
	</div>
</div>
