<cfcomponent>
	<cfset this.name="Ajax Validation">
	<cfset this.datasource="simpleCrud">
	<cfset this.sessionmanagement = "true" >
	<cffunction name="onRequest">
		<cfargument name="targetPage" default="">
		<cfinclude template="#arguments.targetPage#">
	</cffunction>
 	
 	
	<cffunction name="onApplicationStart">

	</cffunction>
</cfcomponent>