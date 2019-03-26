<cfinclude template="header.cfm">
<script type="text/javascript" src="../asset/js/modal2.js"></script>
<cfset dbconnect=createObject("component", "dataStore").init(this.datasource)>
<cfoutput>
<div class="container">
	<div class="row">
		<div class="col-md-4 mx-auto">
			<cfset brandData=dbconnect.selectBrand()>
			<div class="mt-5"></div>
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>Brand Name</th>
						<th>Price(Rs.)</th>
						<th></th>
					</tr>
				</thead>
				<cfloop query="#brandData#">
					<tr>
						<td>#brandData.name#</td>
						<td>#brandData.price#</td>
						<td class="text-center">
							<a href="addbrand.cfm?brandid=#brandData.brandid#" class="btn"><span><i class="far fa-edit"></i></span></a>
							<span class="text-danger" data-toggle="modal" data-target="##deleteUserModal">
								<i class="fas fa-trash-alt iconDelete btn" data-deleteData="delete.cfm?brandid=#brandData.brandid#"></i>
							</span>
						</td>
					</tr>
				</cfloop>
				<!-- Modal -->
				<div class="modal fade" id="deleteUserModal" role="dialog">
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
				        <a href="" id="deleteFrom" class="btn">
				       		<button type="button" class="btn btn-success">Delete</button>
				   		 </a>
				          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!--- end modal --->
			</table>
		</div>
	</div>
</div>
</cfoutput>