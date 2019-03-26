<cfcomponent>
	<cffunction name="init" output="false" returntype="dataStore">
		<cfargument name="dataSourceName" type="string" required="true">
		<cfset variables.dataSourceName=arguments.dataSourceName>
		<cfreturn this>
	</cffunction>
	<!--- INSERT RAMCRUD --->
	<cffunction name="insetRAM" output="false" returntype="numeric">
		<cfargument name="storage" type="string" required="true">
		<cfargument name="price" type="numeric" required="true">
		<cfquery name="inertramQry" datasource="#variables.dataSourceName#" result="insertrow">
			INSERT INTO RAMCRUD (RAMID,SIZE,PRICE) VALUES(
				<cfqueryparam value=#createUUID()# cfsqltype="cf_sql_varchar">,
				<cfqueryparam value=#arguments.storage# cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.price#" cfsqltype="cf_sql_numeric">
				)
		</cfquery>
		<cfreturn insertrow.recordcount> 
	</cffunction>
	<!--- INSERT BRANDCRUD --->
	<cffunction name="insetBrand" output="false" returntype="numeric">
		<cfargument name="brandName" type="string" required="true">
		<cfargument name="price" type="numeric" required="true">
		<cfquery name="inertramQry" datasource="#variables.dataSourceName#" result="insertrow">
			INSERT INTO BRANDCRUD (BRANDID,NAME,PRICE) VALUES(
				<cfqueryparam value=#createUUID()# cfsqltype="cf_sql_varchar">,
				<cfqueryparam value=#arguments.brandName# cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.price#" cfsqltype="cf_sql_numeric">
				)
		</cfquery>
		<cfreturn insertrow.recordcount> 
	</cffunction>
	<!--- SELECT RAMCRUD --->
	<cffunction name="selectRAM" output="false" returntype="query">
		<!--- <cfargument name="argStruct" type="struct" required="true" default="#structNew()#"> --->
		<cfargument name="argStruct" type="string" required="true" default="">
		<cfquery name="selectramQry" datasource="#variables.dataSourceName#">
			SELECT * FROM RAMCRUD WHERE ACTIVE=1
			<cfif len(trim(arguments.argStruct))>
				AND RAMID=
				<cfqueryparam value="#arguments.argStruct#">
			</cfif>
			ORDER BY SIZE ASC
		</cfquery>
		<cfreturn selectramQry>
	</cffunction>
	<!--- SELECT BRAND CRUD --->
	<cffunction name="selectBrand" output="false" returntype="query">
		<cfargument name="argId" type="string" required="true" default="">
		<cfquery name="selectbrandQry" datasource="#variables.dataSourceName#">
			SELECT * FROM BRANDCRUD WHERE ACTIVE=1
			<cfif len(trim(arguments.argId))>
				AND BRANDID=<cfqueryparam value="#arguments.argId#" cfsqltype="cf_sql_varchar">
			</cfif>
		</cfquery>
		<cfreturn selectbrandQry>
	</cffunction>
	<!--- UPDATE RAM CRUD --->
	<cffunction name="updateRam" output="false" returntype="struct">
		<cfargument name="ramId" type="string" required="true">
		<cfargument name="ramActive" type="numeric" required="true">
		<cfargument name="ramszie" type="string" required="false" default="">
		<cfargument name="ramprize" type="numeric" required="false" default=0>
		<cfquery name="updteQuery" datasource="#variables.dataSourceName#" result="updatedrow">
			UPDATE RAMCRUD SET
				ACTIVE=<cfqueryparam value="#arguments.ramActive#" cfsqltype="cf_sql_numeric">
				<cfif len(trim(arguments.ramszie)) AND len(trim(arguments.ramprize))>
					,SIZE=<cfqueryparam value="#arguments.ramszie#" cfsqltype="cf_sql_varchar">
					,PRICE=<cfqueryparam value="#arguments.ramprize#" cfsqltype="cf_sql_numeric">
				</cfif>
			 WHERE RAMID=
			<cfqueryparam value="#arguments.ramId#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn updatedrow>
	</cffunction>
	<!--- UPDATE BRAND CRUD --->
	<cffunction name="updateBrand" output="false" returntype="struct">
		<cfargument name="brandId" type="string" required="true">
		<cfargument name="brandActive" type="numeric" required="true">
		<cfargument name="brandName" type="string" required="false" default="">
		<cfargument name="brandPrize" type="numeric" required="false" default=0>
		<cfquery name="updteQuery" datasource="#variables.dataSourceName#" result="updatedrow">
			UPDATE BRANDCRUD SET
				ACTIVE=<cfqueryparam value="#arguments.brandActive#" cfsqltype="cf_sql_numeric">
				<cfif len(trim(arguments.brandName)) AND len(trim(arguments.brandPrize))>
					,NAME=<cfqueryparam value="#arguments.brandName#" cfsqltype="cf_sql_varchar">
					,PRICE=<cfqueryparam value="#arguments.brandPrize#" cfsqltype="cf_sql_numeric">
				</cfif>
			 WHERE BRANDID=
			<cfqueryparam value="#arguments.brandId#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn updatedrow>
	</cffunction>
	<cffunction name="insertOrder" output="false" returntype="string">
		<cfargument name="userName" type="string" required="true">
		<cfargument name="address" type="string" required="true">
		<cfargument name="phnnumbr" type="string" required="true">
		<cfargument name="brandid" type="string" required="true">
		<cfargument name="ramid" type="string" required="true">
		<cfargument name="extraFitting" type="string" required="false" default="">
		<cfargument name="total" type="numeric" required="true">
		<cfset orderid=createUUID()>
		<cfquery name="placeOrder" datasource="#variables.dataSourceName#">
			INSERT INTO USERORDER (ID,NAME,ADDRESS,PHONE,STATUS,BRANDID,RAMID,INCLUDEPRODUCT,TOTAL)
			VALUES(
					<cfqueryparam value="#orderid#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.phnnumbr#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="UnderProcess" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.brandid#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.ramid#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.extraFitting#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.total#" cfsqltype="cf_sql_numeric">
				)
		</cfquery>
		<cfreturn orderid>
	</cffunction>
	<cffunction name="selectOrder" output="false" returntype="query">
		<cfargument name="userid" type="string" required="true" default="">
		<cfquery name="selectorderQry" datasource="#variables.dataSourceName#">
			SELECT * FROM USERORDER WHERE ACTIVE=1
			<cfif len(trim(arguments.userid))>
				AND ID=
				<cfqueryparam value="#arguments.userid#">
			</cfif>
		</cfquery>
		<cfreturn selectorderQry>
	</cffunction>
	<cffunction name="updateStatus" output="false" returntype="struct">
		<cfargument name="orderID" type="string" required="true">
		<cfargument name="orderstatus" type="string" required="true">
		<cfquery name="updteqry" datasource="#variables.dataSourceName#" result="updatedrows">
			UPDATE USERORDER SET STATUS =<cfqueryparam value="#arguments.orderstatus#" cfsqltype="cf_sql_varchar">
			WHERE ACTIVE=1 
			AND id =<cfqueryparam value="#arguments.orderID#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn updatedrows>
	</cffunction>
	<cffunction name="deleteOrder" output="false" returntype="struct">
		<cfargument name="orderId" type="string" required="true">
		<cfquery name="deleteqry" datasource="#variables.dataSourceName#" result="deleterow">
			DELETE FROM USERORDER WHERE ID=
			<cfqueryparam value="#arguments.orderId#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn deleterow> 
	</cffunction>
	<cffunction name="userData" output="false" returntype="query">
		<cfargument name="userID" type="string" required="true">
		<cfquery name="joinData" datasource="#variables.dataSourceName#">
			SELECT
			    USERORDER.NAME,ADDRESS,PHONE,STATUS,BRANDCRUD.NAME AS BRANDNAME,SIZE,RAMCRUD.PRICE AS RAMPRICE,BRANDCRUD.PRICE AS BRANDPRICE,INCLUDEPRODUCT,TOTAL
			FROM
			    USERORDER
			INNER JOIN
			    BRANDCRUD ON BRANDCRUD.BRANDID = USERORDER.BRANDID
			INNER JOIN
				RAMCRUD ON RAMCRUD.RAMID = USERORDER.RAMID
				WHERE ID=<cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn joinData>
	</cffunction>
</cfcomponent>
