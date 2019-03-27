<cfinclude template="header.cfm">
<cfparam name="form.status" default=0>
<cfoutput>
	<div class="container">
		<div clsass="row">
			<div class="mt-5"></div>
			<div class="col-md-6 mx-auto border">
				<cfif structKeyExists(url, "id")>
					<cfset getJob=application.dbconnect.selectAllJob(url.id)>
					<h3 class="text-center">JOB DETAILS</h4>
						<form method="POST">
							<div class="font-weight-bold">
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Company Name</div>
									<div class="col-md-6">#getJob.jobname#</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Website</div>
									<div class="col-md-6">#getJob.website#</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Job Title</div>
									<div class="col-md-6">#getJob.title#</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Status</div>
									<div class="col-md-4">
										<select name="status" class="form-control">
											<option value=1 <cfif form.status EQ getJob.status>selected </cfif> >Active</option>
											<option value=0 <cfif form.status EQ getJob.status>selected </cfif>>Filled</option>
										</select>
									</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Job Type</div>
									<div class="col-md-6">#getJob.type#</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Location</div>
									<div class="col-md-6">#getJob.city & ', '& getJob.state#</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Country</div>
									<div class="col-md-6">#getJob.countryname#</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Email</div>
									<div class="col-md-6">#getJob.email#</div>
								</div>
								<div class="row p-3 text-primary">
									<div class="col-md-6 text-right">Description</div>
									<div class="col-md-6">#getJob.description#</div>
								</div>
								<div class="row p-3">
									<div class="col-md-12 text-center">
										<input type="submit" class="btn btn-primary" name="update" value="Change Status">
									</div>
								</div>
							</div>
						</form>
					<cfif structKeyExists(form, "update")>
						<cfset updaterow=application.dbconnect.updateStatus(url.id,form.status)>
						<cflocation url="search.cfm" addtoken="false">
					</cfif>
				</div>
			</cfif>
		</div>
	</div>
</cfoutput>