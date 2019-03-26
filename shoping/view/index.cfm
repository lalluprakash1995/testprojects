<cfinclude template="header.cfm">
<script type="text/javascript" src="../asset/js/index.js"></script>
<cfparam name="form.addProduct" default="">
<cfset extrafitting=0>
<cfoutput>
	<cfset dbconnect=createObject("component","dataStore").init(this.datasource)>
	<cfset selectRam=dbconnect.selectRAM()>
	<cfset selectBrand=dbconnect.selectBrand()>
	<cfif structKeyExists(form, "save")>
		<cfif structKeyExists(form, "brand") AND len(trim(form.brand)) AND structKeyExists(form, "ramSelect") AND len(trim(form.ramSelect)) AND structKeyExists(form, "username") AND len(trim(form.username)) AND structKeyExists(form, "address") AND len(trim(form.address)) AND structKeyExists(form, "phnnmbr") AND len(trim(form.phnnmbr))>
			<cfif structKeyExists(form, "addProduct") AND len(trim(form.addProduct))>
				<cfset extrafitting=3000>
			</cfif>
				<cfset total=dbconnect.selectRAM(form.ramSelect).price+dbconnect.selectBrand(form.brand).price+extrafitting>
				<cfset insertorder=dbconnect.insertOrder(form.username,form.address,form.phnnmbr,form.brand,form.ramSelect,form.addProduct,total)>
				 <span id="test" class="showlink"></span>
				  <!-- Modal -->
				  <div class="modal fade" id="myModalalert" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <h3 class="modal-title">Visit this link to see your order</h3>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        <div class="modal-body">
				          <a href="http://127.0.0.1:8500/Training/testProject/shoping/view/user.cfm?id=#insertorder#">http://127.0.0.1:8500/Training/testProject/shoping/view/user.cfm?id=#insertorder#</a>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
		</cfif>
	</cfif>
	<div class="container">
		<h2 class="text-center">ORDER ITEM</h2>
		<form action="" method="POST" id="myForm">
			<div class="row mt-5">
				<div class="col-md-6">
					<div class="border rounded">
						<h4 class="font-italic ml-2 pl-2 pr-2 d-inline">Make Your Computer</h4>
						<div class="ml-3 pb-4">
							<div>
								<div class="font-weight-bold">Brand of the computer</div>
								<cfloop query="#selectBrand#">
									<span class="d-block p-2 col-md-6"><input type="radio" name="brand" value="#selectBrand.brandid#"><span class="ml-1">#selectBrand.name&' (Rs.'&selectBrand.price&')'#</span></span>
								</cfloop>
							</div>	
							<div class="font-weight-bold pt-2 pb-1">
								RAM Memory
								<div class="col-md-6">
									<select class="form-control" id="ramSelect" name="ramSelect">
										<option value="">Select RAM</option>
										<cfloop query="#selectRam#">
											<option value="#selectRam.ramid#">#selectRam.size&' '&'(Rs. '&selectRam.price &')'#</option>
										</cfloop>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="font-weight-bold pt-2 col-md-6">Include DVD RW Drive (RS.3000)
								</div>
								<div class="col-md-2 mt-2 ">
									<input type="checkbox" class="dvdrw form-check-input" name="addProduct" value="DVD RW">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="border rounded">
						<h4 class="font-italic ml-2 pl-2 pr-2 d-inline">Contact Details</h4>
						<div class="row  ml-3 pb-4">
							<div class="col-md-6">
								<label class="font-weight-bold">Name</label>
								<input type="text" name="username" class="form-control" id="name">
								<label class="font-weight-bold">Address</label>
								<input type="text" name="address" class="form-control" id="address"> 
								<label class="font-weight-bold">Phone Number</label>
								<input type="text" name="phnnmbr" class="form-control" id="phn">
							</div>
						</div>
					</div>
					<div class="mt-3">
						<input type="submit" name="save" class="btn btn-primary" value="Place Order">
					</div>
				</div>
			</div>
		</form>
	</div>
</cfoutput>
