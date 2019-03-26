<cfinclude template="header.cfm">
<cfoutput>
<cfset dbconnect=createObject("component", "dataStore").init(this.datasource)>
	<div class="container">
		<div clsass="row">
			<div class="mt-5"></div>
			<div class="col-md-6 mx-auto border">
				<cfif structKeyExists(url, "id")>
					<cfset orderDetails=#dbconnect.userData(url.id)#>
					<!--- <cfdump var="#orderDetails#">
					<cfabort> --->
					<h3 class="text-center">ORDER DETAILS</h3>
					<div class="font-weight-bold">
						<div class="row p-3 text-primary">
							<div class="col-md-6 text-right">Name</div>
							<div class="col-md-6">#orderDetails.name#</div>
						</div>
						<div class="row p-3 text-primary">
							<div class="col-md-6 text-right">Address</div>
							<div class="col-md-6">#orderDetails.address#</div>
						</div>
						<div class="row p-3 text-primary">
							<div class="col-md-6 text-right">Phone No</div>
							<div class="col-md-6">#orderDetails.phone#</div>
						</div>
						<div class="row p-3 text-primary">
							<div class="col-md-6 text-right">Status</div>
							<div class="col-md-6">
								#orderDetails.status#
							</div>
						</div>
						<div class="row p-3 text-primary">
							<div class="col-md-6 text-right">Brand</div>
							<div class="col-md-6">#orderDetails.brandname#<span class="ml-1"> (Rs. #orderDetails.brandprice#)</span></div>
						</div>
						<div class="row p-3 text-primary">
							<div class="col-md-6 text-right">RAM</div>
							<div class="col-md-6">#orderDetails.size#<span class="ml-1"> (Rs. #orderDetails.ramprice#)</span></div>
						</div>
						<div class="row p-3 text-primary">
							<div class="col-md-6 text-right">Include Product</div>
							<div class="col-md-6">
								<cfif len(trim(orderDetails.includeproduct))>
									#orderDetails.includeproduct#<span class="ml-1"> (Rs. 3000)</span>
								<cfelse>
									No Item Included
								</cfif>
							</div>
						</div>
						<div class="row p-3 text-danger">
							<div class="col-md-6 text-right">Total Price</div>
							<div class="col-md-6">#orderDetails.total#</div>
						</div>
					</div>
				</div>
			</cfif>
		</div>
	</div>
</cfoutput>