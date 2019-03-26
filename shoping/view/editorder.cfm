<cfinclude template="header.cfm">
<cfinclude template="navbar.cfm">
<cfoutput>
<cfset statuslist="UnderProcess,Shipped,Assembly">
<cfset dbconnect=createObject("component", "dataStore").init(this.datasource)>
	<div class="container">
		<div clsass="row">
			<div class="mt-5"></div>
			<div class="col-md-6 mx-auto border">
				<cfif structKeyExists(url, "orderid")>
					<cfset orderItem=dbconnect.userData(url.orderid)>
					<div class="row">
						<div class="col-md-12 text-right mt-4">
							<span class="btn btn-danger font-weight-bold" data-toggle="modal" data-target="##deleteUserModal3">Delete</span>
						</div>
					</div>
					<h3 class="text-center">ORDER DETAILS</h4>
						<form method="POST">
							<div class="font-weight-bold">
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Name</div>
									<div class="col-md-6">#orderItem.name#</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Address</div>
									<div class="col-md-6">#orderItem.address#</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Phone No</div>
									<div class="col-md-6">#orderItem.phone#</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Status</div>
									<div class="col-md-4">
										<select name="status" class="form-control">
											<cfloop list="#statuslist#" item="items">
												<option value="#items#" <cfif NOT compare(items, orderItem.status)> selected </cfif>>#items#</option>
											</cfloop>
										</select>
									</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Brand</div>
									<div class="col-md-6">
										#orderItem.brandname#
										<span class="ml-1">(Rs. #orderItem.brandprice#)</span>
									</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">RAM</div>
									<div class="col-md-6">
										#orderItem.size#
										<span class="ml-1">(Rs. #orderItem.ramprice#)</span>
									</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Include Product</div>
									<div class="col-md-6">
										<cfif len(trim(orderItem.Includeproduct))>
											#orderItem.Includeproduct#<span class="ml-1"> (Rs. 3000)</span>
										<cfelse>
											No Item Included
										</cfif>
									</div>
								</div>
								<div class="row p-3 text-danger">
									<div class="col-md-6 text-right">Total Price</div>
									<div class="col-md-6">#orderItem.total#</div>
								</div>
								<div class="row p-3 text-danger">
									<div class="col-md-12 text-center">
										<input type="submit" class="btn btn-primary" name="update" value="Change Status">
									</div>
								</div>
							</div>
						</form>
					<cfif structKeyExists(form, "update")>
						<cfset updaterow=dbconnect.updateStatus(url.orderid,form.status)>
						<cflocation url="home.cfm?update=#updaterow.recordcount#&ord" addtoken="false">
					</cfif>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="deleteUserModal3" role="dialog">
				  <div class="modal-dialog">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				      	<h3>Confirm Delete...!</h3>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				      <div class="modal-body">
				        <p>Do you want to Delete.....?</p>
				      </div>
				      <div class="modal-footer">
				        <a href="delete.cfm?orderid=#url.orderid#" id="deleteFrom1" class="btn">
				       		<button type="button" class="btn btn-success">Delete</button>
				   		 </a>
				          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!--- end modal --->
			</cfif>
		</div>
	</div>
</cfoutput>