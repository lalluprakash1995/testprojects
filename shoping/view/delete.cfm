<cfset dbconnect=createObject("component", "dataStore").init(this.datasource)>
<cfif structKeyExists(url, "ramid") AND len(trim(url.ramid))>
	<cfset argStruct={"ramId"=url.ramid,"ramActive"=0}>
	<cfset deleteResult=dbconnect.updateRam(argumentCollection = argStruct)>
	<cflocation url="home.cfm?delete=#deleteResult.recordcount#&rm" addtoken="false">
<cfelseif structKeyExists(url, "brandid") AND len(trim(url.brandid))>
	<cfset argStruct={"brandId"=url.brandid,"brandActive"=0}>
	<cfset deleteResult=dbconnect.updateBrand(argumentCollection = argStruct)>
	<cflocation url="home.cfm?delete=#deleteResult.recordcount#&brd" addtoken="false">
<cfelseif structKeyExists(url, "orderid") AND len(trim(url.orderid))>
	<cfset deleteResult=dbconnect.deleteOrder(url.orderid)>
	<cflocation url="home.cfm?delete=#deleteResult.recordcount#&ord" addtoken="false">
</cfif>