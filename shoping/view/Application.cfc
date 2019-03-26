<cfcomponent>
	<cfset this.name="Shopping App">
	<cfset this.datasource="simpleCrud">
	<cfset this.sessionmanagement = "true" >
 	<cffunction name="onRequest">
		<cfargument name="targetPage" type="string" required="true">
		<cfset local ={}> 
		<cfset local.withoutLogin=["/Training/testProject/shoping/view/index.cfm","/Training/testProject/shoping/view/admin.cfm","/Training/testProject/shoping/view/user.cfm"]>
		<cfset local.isRedirect=true>
		<cfif NOT structKeyExists(session, "name")>
			<cfif arrayContains(local.withoutLogin,arguments.targetPage)>
				<cfset local.isRedirect=false>
			</cfif>
			<cfif isRedirect>
				<cflocation url="index.cfm" addtoken="false">
			</cfif>
		</cfif>
		<cfinclude template="#arguments.targetPage#">
	</cffunction>
 	
	<cffunction name="onApplicationStart">

	</cffunction>
</cfcomponent>