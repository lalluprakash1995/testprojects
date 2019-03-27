<cfinclude template="header.cfm">
<link rel="stylesheet" type="text/css" href="../asset/css/search.css">
<cfparam name="form.countries" default=0>
<cfparam name="form.jobtypes" default=0>
<cfparam name="form.keywords" default="">
<cfset getCountries=application.dbconnect.selectCountry()>
<cfset getJobtypes=application.dbconnect.selectJobType()>
<cfset getAllJob=application.dbconnect.selectAllJob()>
<cfset getcount=application.dbconnect.getCount()>
<cfset argStruct={}>
<cfset countryCount=0>
<cfset typeCount=0>
<cfoutput>
	<cfif structKeyExists(url, "country")>
		<cfset getAllJob=application.dbconnect.selectAllJob(argCountry=url.country)>
		<cfset getcount=application.dbconnect.getCount(argCountry=url.country)>
	<cfelseif structKeyExists(url, "jobType")>
		<cfset getAllJob=application.dbconnect.selectAllJob(argJobType=url.jobType)>
		<cfset getcount=application.dbconnect.getCount(argJobType=url.jobType)>
	</cfif>
	<cfif structKeyExists(form, "search")>
		<cfif len(trim(form.countries))> 
			<cfset argStruct.argCountry=form.countries>
		</cfif>
		<cfif len(trim(form.jobtypes))>
			<cfset argStruct.argJobType=form.jobtypes>
		</cfif>
		<cfif len(trim(form.keywords))>
			<cfset argStruct.argOptions=form.keywords>
		</cfif>
		<cfset getAllJob=application.dbconnect.selectAllJob(argumentCollection = argStruct)>
		<cfset getcount=application.dbconnect.getCount(argumentCollection = argStruct)>
	</cfif>
	<div class="container-fluid">
		<div class="mt-5"></div>
		<div class="row">
			<div class="col-md-8">
				<form method="POST">
					<div class="border p-3 bg-light rounded">
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-6">
										<select class="form-control" name="countries">
											<option value="">Search by country....</option>
											<cfloop query="#getCountries#">
												<option value="#getCountries.id#" <cfif getCountries.id EQ form.countries>selected </cfif> >#getCountries.countryname#</option>
											</cfloop>
										</select>
									</div>
									<div class="col-md-6">
										<select class="form-control" name="jobtypes">
											<option value="">Search by Job Type</option>
											<cfloop query="#getJobtypes#">
												<option value="#getJobtypes.jobid#" <cfif getJobtypes.jobid EQ form.jobtypes>selected </cfif>>#getJobtypes.type#</option>
											</cfloop>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<div class="input-group mb-3">
									<input type="text" class="form-control" name="keywords" placeholder="search by job title, keywords, company, city, state" value="#form.keywords#">
									<div class="input-group-append">
										<input type="submit" name="search" value="Search Jobs" class="btn btn-info">
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<div>
					<div class="alert alert-primary" role="alert">
						<div>
							#'Listing over '&' '& '<strong>' &getcount.jobs & ' positions</strong> from '&'<strong>'&getcount.company & ' companies</strong> Across '& '<strong>' & getcount.location&' locations </strong> in ' &'<strong>'& getcount.countries & ' countries</strong>'# 
						</div>
					</div>
				</div>
				<div>
					<h3 class="border-bottom pb-3">Latest Jobs</h3>
					<cfloop query="#getAllJob#">
						<div class="row">
							<div class="col-md-2">
								<span class="bg-success text-white pl-2 pr-2 rounded">#getAllJob.type#</span>
							</div>
							<div class="col-md-6 font-weight-bold text-primary">
								<cfif getAllJob.status EQ 0>
									<del>#getAllJob.title & '<span class="text-dark"> at </span>'& getAllJob.jobname &'<span class="text-dark"> in </span>' & getAllJob.city & ', ' & getAllJob.state#</del>
								<cfelse>
									#getAllJob.title & '<span class="text-dark"> at </span>'& getAllJob.jobname &'<span class="text-dark"> in </span>' & getAllJob.city & ', ' & getAllJob.state#
								</cfif>
							</div>
							<div class="col-md-2">#getAllJob.countryname#</div>
							<div class="col-md-2">#dateFormat(getAllJob.adddate,"dd-mmm")#</div>
						</div>
						<hr>
					</cfloop>
				</div>
			</div>
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-10 mx-auto text-center">
						<div class="border border-info p-4 rounded">
							<a href="index.cfm" class="btn btn-info">
								<span class="font-weight-bold h3">Post a Job</span><br>
								<span class="font-weight-bold mt-1">(No charge. Its completely free..!)</span>
								<p></p>
							</a>
						</div>
					</div>
				</div>
				<div class="mt-5"></div>
				<div class="row">
					<div class="col-md-10 mx-auto">
						<div class="border border-primary rounded">
							<div class="font-weight-bold p-3 mb-2 bg-info text-white">
								Latest Jobs
							</div>
							<div class="ml-3">
								<div class="row">
									<div class="col-md-6">
										<b>Country</b>
										<div class="text-info">
											<cfloop query="#getCountries#">
												<div><a href="search.cfm?country=#getCountries.id#">#getCountries.countryname#</a></div>
												<cfset countryCount=countryCount+1>
											</cfloop>
										</div>
									</div>
									<div class="col-md-6">
										<b>Job Types</b>
										<div class="text-info">
											<cfloop query="#getJobtypes#">
												<div><a href="search.cfm?jobType=#getJobtypes.jobid#">#getJobtypes.type#</a></div>
												<cfset typeCount=typeCount+1>
											</cfloop>
										</div>
									</div>
								</div>
								<div class="mt-2"></div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</cfoutput>