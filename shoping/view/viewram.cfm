<cfinclude template="header.cfm">
<script type="text/javascript" src="../asset/js/modal1.js"></script>
<cfset dbconnect=createObject("component", "dataStore").init(this.datasource)>
<cfoutput>
<div class="container">
	<div class="row">
		<div class="col-md-4 mx-auto">
			<cfset RAMdata=dbconnect.selectRAM()>
			<div class="mt-5"></div>
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>Storage</th>
						<th>Price(Rs.)</th>
						<th></th>
					</tr>
				</thead>
				<cfloop query="#RAMdata#">
					<tr>
						<td>#RAMdata.size#</td>
						<td>#RAMdata.price#</td>
						<td class="text-center">
							<a href="addram.cfm?ramid=#RAMdata.ramid#" class="btn"><span><i class="far fa-edit"></i></span></a>
							<span class="text-danger" data-toggle="modal" data-target="##deleteUserModal1">
								<i class="fas fa-trash-alt btn iconDelete1" data-deleteData="delete.cfm?ramid=#RAMdata.ramid#"></i>
							</span>
						</td>
					</tr>
				</cfloop>
				<!-- Modal -->
				<div class="modal fade" id="deleteUserModal1" role="dialog">
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
				        <a href="" id="deleteFrom1" class="btn">
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