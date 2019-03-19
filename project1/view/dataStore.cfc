<cfcomponent>
	<cffunction name="init" output="false" returntype="dataStore">
		<cfargument name="dataSourceName" type="string" required="true">
		<cfset variables.dataSourceName=arguments.dataSourceName>
		<cfreturn this>
	</cffunction>
	<cffunction name="insertTodos" output="false" returntype="struct">
		<cfargument name="todoActivity" type="string" required="true">
		<cfquery name="insertQuery" datasource="#variables.dataSourceName#" result="insertRow">
			INSERT INTO todoTable VALUES (
				<cfqueryparam value="#createUUID()#" cfsqltype="cf_sql_varchar"> ,
				<cfqueryparam value="#arguments.todoActivity#" cfsqltype="cf_sql_varchar"> ,
				<cfqueryparam value="active" cfsqltype="cf_sql_varchar">
				)
		</cfquery>
		<cfreturn insertRow>
	</cffunction>
	<cffunction name="selectTodos" output="false" returntype="string" returnformat="JSON" access="remote">
		<cfargument name="argStruct" type="string" required="false" default="">
		<cfquery name="selectQuery" datasource="simpleCrud">
			SELECT * FROM todoTable WHERE 1=1
			<cfif NOT len(trim(arguments.argStruct))>
				AND STATUS =
				<cfqueryparam value="#arguments.argStruct#" cfsqltype="cf_sql_varchar">
			</cfif>
		</cfquery>
		<cfreturn serializeJSON(selectQuery)>
	</cffunction>
	<cffunction name="updateData" output="false" access="remote">
		<cfargument name="id" type="string" required="false" default="">
		<cfargument name="argstatus" type="string" required="true">
		<cfquery name="updateQuery" datasource="simpleCrud">
			UPDATE TODOTABLE SET STATUS =
			<cfqueryparam value="#arguments.argstatus#" cfsqltype="cf_sql_varchar">
			 WHERE 1=1
			 <cfif NOT len(trim(arguments.id))>
				AND id=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_varchar">
			 </cfif>
		</cfquery>
	</cffunction>
	<cffunction name="deleteData" output="false" returntype="numeric" access="remote" returnformat="plain">
		<cfquery name="deleteQueryCompleted" datasource="simpleCrud">
			DELETE FROM TODOTABLE WHERE STATUS=
			<cfqueryparam value="completed" cfsqltype="cf_sql_varchar">
		</cfquery>
	</cffunction>
	<cffunction name="deleteOne" output="false" access="remote">
	 	<cfargument name="dataId" type="string" required="true" >
	 	<cfquery name="deleteQry" datasource="simpleCrud" result="deletedRecord">
	 		DELETE FROM todoTable WHERE id =
	 		<cfqueryparam value="#arguments.dataId#" cfsqltype="cf_sql_varchar">
	 	</cfquery>
	 	<cfreturn deletedRecord.recordcount>
	</cffunction>
	<cffunction name="getcount" output="false" access="remote" returntype="numeric" returnformat="plain">
		<cfargument name="statusActive" type="string" required="false" default="">
		<cfquery name="countRows" datasource="simpleCrud" result="numOfRows">
			SELECT COUNT(id) AS COUNT FROM todoTable 
			WHERE STATUS =
			<cfqueryparam value="#arguments.statusActive#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn countRows.count>
	</cffunction>
</cfcomponent>
