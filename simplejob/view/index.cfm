<cfinclude template="header.cfm">
<link rel="stylesheet" type="text/css" href="../asset/css/index.css">
<script type="text/javascript" src="../asset/js/job.js"></script>
<cfset getCountries=application.dbconnect.selectCountry()>
<cfset getJobtypes=application.dbconnect.selectJobType()>
<cfoutput>
	<cfif structKeyExists(form, "save")>
		<cfif structKeyExists(form, "companyName") AND len(trim(form.companyName)) AND structKeyExists(form, "website") AND len(trim(form.website)) AND structKeyExists(form, "jobtitle") AND len(trim(form.jobtitle)) AND structKeyExists(form, "jobtype") AND len(trim(form.jobtype)) AND structKeyExists(form, "stateAndCity") AND len(trim(form.stateAndCity)) AND structKeyExists(form, "country") AND len(trim(form.country)) AND structKeyExists(form, "email") AND len(trim(form.email)) AND structKeyExists(form, "description") AND len(trim(form.description))>

				<cfset getid=application.dbconnect.insertJob(form.companyName,form.website,form.jobtitle,form.jobtype,form.stateAndCity,form.country,form.email,form.description)>
				<cfif len(trim(getid))>
					<div class="alert alert-dark mx-auto alertBoxInsert" role="alert">
						<div class="text-center font-weight-bold">Visit this link to see your posted job details</div>
						<div class="text-center">
							<a href="http://127.0.0.1:8500/Training/testProject/simplejob/view/jobs.cfm?id=#getid#">http://127.0.0.1:8500/Training/testProject/simplejob/view/jobs.cfm?id=#getid#</a>
						</div>
					</div>
				</cfif>
		</cfif>
	</cfif>
	<div class="container">
		<div class="mt-5"></div>
		<h2 class="border-bottom pb-3">Post a new job- Job Details</h2>
		<div class="row">
			<div class="col-md-12">
				<form method="POST">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="font-weight-bold">Company name (Enter your company name)</label>
								<input type="text" id="companyName" name="companyName" class="form-control" value="">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="font-weight-bold">Website(Enter your website URL)</label>
								<div class="input-group">
									<div class="input-group-prepend">
									    <span class="input-group-text"> http:// </span>
									 </div>
									<input name="website" class="form-control" id="website" value="">
								</div> 
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="font-weight-bold">Job title</label>
								<input type="text" id="title" name="jobtitle" class="form-control" value="">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="font-weight-bold">Job type</label>
								<select class="form-control" name="jobtype" id="type">
									<option value="">Select jobtype</option>
									<cfloop query="#getJobtypes#">
										<option value="#getJobtypes.jobid#">#getJobtypes.type#</option>
									</cfloop>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label class="font-weight-bold">Job Location (City, State and Country)</label>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" name="stateAndCity" class="form-control" id="city" value="">
									</div>
								</div>
								<div class="col-md-6">
									<select class="form-control" name="country" id="country">
										<option value="">Select country</option>
										<cfloop query="#getCountries#">
											<option value="#getCountries.id#">#getCountries.countryname#</option>
										</cfloop>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="font-weight-bold">Email (To which applicants details where shared)</label>
								<input type="text" name="email" class="form-control" id="emailId" value="">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label class="font-weight-bold">Description (Give details about the position, such as responsibilities & experience)</label>
								<textarea class="form-control" id="description" name="description" rows="5"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-right">
							<input type="submit" value="Post & Preview Job" name="save" class="btn btn-primary">
						</div>
						<div class="col-md-12">
							<span id="errorMessage" class="text-danger font-weight-bold"></span>
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</cfoutput>