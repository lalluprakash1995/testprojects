<cfinclude template="header.cfm">
<cfset dbconnect=createObject("component", "dataStore").init(this.datasource)>
<cfoutput>
<div class="container">
	<div class="row">
		<div class="col-md-6 mx-auto">
			<cfset orderData=dbconnect.selectOrder()>
			<div class="mt-5"></div>
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>Name</th>
						<th>Address</th>
						<th>Phone No</th>
						<th>Status</th>
					</tr>
				</thead>
				<cfloop query="#orderData#">
					<tr>
						<td>#orderData.name#</td>
						<td>#orderData.address#</td>
						<td>#orderData.phone#</td>
						<td><a href="editorder.cfm?orderid=#orderData.id#">
							<cfif NOT len(trim(orderData.status))>
								null
							<cfelse>
								#orderData.status#
							</cfif>
						</a></td>
					</tr>
				</cfloop>
			</table>
		</div>
	</div>
</div>
</cfoutput>