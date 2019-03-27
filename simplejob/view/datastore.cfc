<cfcomponent>
	<cffunction name="init" output="false" returntype="datastore">
		<cfargument name="dataSourceName" type="string" required="true">
		<cfset variables.dataSourceName=arguments.dataSourceName>
		<cfreturn this>
	</cffunction>
	<cffunction name="selectCountry" output="false" returntype="query">
		<cfquery name="countries" datasource="#variables.dataSourceName#">
			SELECT * FROM COUNTRY ORDER BY COUNTRYNAME
		</cfquery>
		<cfreturn countries>
	</cffunction>
	<cffunction name="selectJobType" output="false" returntype="query">
		<cfquery name="jobTypes" datasource="#variables.dataSourceName#">
			SELECT * FROM JOBTYPE
		</cfquery>
		<cfreturn jobTypes>
	</cffunction>
	<cffunction name="insertJob" output="false" returntype="string">
		<cfargument name="jobname" type="string" required="true">
		<cfargument name="jobwebsite" type="string" required="true">
		<cfargument name="jobtitle" type="string" required="true">
		<cfargument name="jobtype" type="numeric" required="true">
		<cfargument name="cityState" type="string" required="true">
		<cfargument name="country" type="numeric" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="description" type="string" required="true">
		<cfset jobId=#createUUID()#>
		<cfquery name="insertJobs" datasource="#variables.dataSourceName#">
			INSERT INTO JOB (JOBID,JOBNAME,WEBSITE,TITLE,TYPEID,CITY,STATE,COUNTRYID,EMAIL,DESCRIPTION,ADDDATE)
			VALUES(
				<cfqueryparam value="#jobId#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.jobname#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.jobwebsite#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.jobtitle#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.jobtype#" cfsqltype="cf_sql_integer">,
				<cfqueryparam value="#listFirst(arguments.cityState,",")#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#listLast(arguments.cityState,",")#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.country#" cfsqltype="cf_sql_integer">,
				<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#now()#" cfsqltype="cf_sql_date">
				)
		</cfquery>
		<cfreturn jobId>
	</cffunction>
	<cffunction name="selectJob" output="false" returntype="query">
		<cfargument name="jobId" type="string" default="">
		<cfquery name="jobs" datasource="#variables.dataSourceName#">
			SELECT * FROM JOB WHERE 1=1
			<cfif len(trim(arguments.jobId))>
				AND JOBID=<cfqueryparam value="#arguments.jobId#" cfsqltype="cf_sql_varchar">
			</cfif>
		</cfquery>
		<cfreturn jobs>
	</cffunction>
		<cffunction name="updateStatus" output="false" returntype="struct">
		<cfargument name="jobId" type="string" required="true">
		<cfargument name="jobstatus" type="numeric" required="true">
		<cfquery name="updteqry" datasource="#variables.dataSourceName#" result="updatedrows">
			UPDATE JOB SET STATUS =<cfqueryparam value="#arguments.jobstatus#" cfsqltype="cf_sql_integer">
			WHERE  JOBID =<cfqueryparam value="#arguments.jobId#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn updatedrows>
	</cffunction>
	<cffunction name="selectAllJob" output="false" returntype="query">
		<cfargument name="argID" type="string" required="true" default="">
		<cfargument name="argCountry" type="numeric" required="true" default=0>
		<cfargument name="argJobType" type="numeric" required="true" default=0>
		<cfargument name="argOptions" type="string" required="true" default="">
		<cfquery name="selectdata" datasource="#variables.dataSourceName#">
		 	SELECT * FROM job 
			INNER JOIN jobtype ON jobtype.jobid=job.typeid 
			INNER JOIN country ON country.id=job.countryid
			WHERE 1=1
			<cfif len(trim( arguments.argID))>
				AND job.jobid=<cfqueryparam value="#arguments.argID#" cfsqltype="cf_sql_varchar">
			</cfif>
			<cfif arguments.argCountry GT 0>
				AND id=<cfqueryparam value="#arguments.argCountry#" cfsqltype="cf_sql_integer">
			</cfif>
			<cfif arguments.argJobType GT 0>
				AND typeid=<cfqueryparam value="#arguments.argJobType#" cfsqltype="cf_sql_integer">
			</cfif>
			<cfif len(trim(arguments.argOptions))>
				AND 
					(title like <cfqueryparam value="%#arguments.argOptions#%" cfsqltype="cf_sql_varchar">
					OR
					city like <cfqueryparam value="%#arguments.argOptions#%" cfsqltype="cf_sql_varchar">
					OR
					state like <cfqueryparam value="%#arguments.argOptions#%" cfsqltype="cf_sql_varchar">
					OR
					jobname like <cfqueryparam value="%#arguments.argOptions#%" cfsqltype="cf_sql_varchar">)
			</cfif>
			ORDER BY status DESC,AddDate DESC 
		</cfquery>
		<cfreturn selectdata>
	</cffunction> 
	<cffunction name="getCount" output="false" returntype="query">
		<cfargument name="argCountry" type="numeric" required="true" default=0>
		<cfargument name="argJobType" type="numeric" required="true" default=0>
		<cfargument name="argOptions" type="string" required="true" default="">
		<cfquery name="selectdataCount" datasource="#variables.dataSourceName#">
		 	SELECT count(distinct job.typeid)as jobs,count(distinct jobname)as company  ,count (distinct countryid)as countries,COUNT(distinct title)as jobtitle,count(distinct state) as location FROM job 
			INNER JOIN jobtype ON jobtype.jobid=job.typeid 
			INNER JOIN country ON country.id=job.countryid
			WHERE 1=1
			<cfif arguments.argCountry GT 0>
				AND id=<cfqueryparam value="#arguments.argCountry#" cfsqltype="cf_sql_integer">
			</cfif>
			<cfif arguments.argJobType GT 0>
				AND typeid=<cfqueryparam value="#arguments.argJobType#" cfsqltype="cf_sql_integer">
			</cfif>
			<cfif len(trim(arguments.argOptions))>
			AND 
				(title like <cfqueryparam value="%#arguments.argOptions#%" cfsqltype="cf_sql_varchar">
				OR
				city like <cfqueryparam value="%#arguments.argOptions#%" cfsqltype="cf_sql_varchar">
				OR
				state like <cfqueryparam value="%#arguments.argOptions#%" cfsqltype="cf_sql_varchar">
				OR
				jobname like <cfqueryparam value="%#arguments.argOptions#%" cfsqltype="cf_sql_varchar">)
			</cfif>
		</cfquery>
		<cfreturn selectdataCount>
	</cffunction>
</cfcomponent>