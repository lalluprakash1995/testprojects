<cfcomponent>
	<cfset this.name="test">
	<cfset this.datasource="simpleCrud">
	<cfset this.sessionManagement=true>
	<cfset application.dbconnect=createObject("component", "datastore").init(this.datasource)>
	<cffunction name="onRequest">
		<cfargument name="targetPage" default="">
		<cfinclude template="#arguments.targetPage#">
	</cffunction>
	<cffunction name="onApplicationStart">

	</cffunction>
</cfcomponent>