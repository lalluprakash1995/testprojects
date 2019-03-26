<cfinclude template="header.cfm">
<cfinclude template="navbar.cfm">
<cfset insert=0>
<cfset message="">
<cfparam name="getRam.size" default="">
<cfparam name="getRam.price" default="">
<cfparam name="form.capacity" default="">
<cfparam name="form.price" default="">
<cfoutput>
	<cfset dataconnection=createObject("component", "dataStore").init(this.datasource)>
	<cfif structKeyExists(url, "ramid")>
		<cfset getRam=dataconnection.selectRAM(url.ramid)>
		<cfset form.capacity=getRam.size>
		<cfset form.price=getRam.price>
	</cfif>
	<cfif structKeyExists(form, "save")>
    	<cfif NOT len(trim(form.capacity)) OR NOT len(trim(form.price))>
    		<cfset message="Please fill all the fields.!">
    	<cfelseif NOT isNumeric(form.price)>
    		<cfset message="Please enter numeric values.!">
    	<cfelse>
    		<cfif structKeyExists(url, "ramid")>
    			<cfset updaterow=dataconnection.updateRam(url.ramid,1,form.capacity,form.price)>
    			<cflocation url="home.cfm?update=#updaterow.recordcount#&rm" addtoken="false">
    		<cfelse>
    			<cfset insert=dataconnection.insetRAM(form.capacity,form.price)>
    			<cflocation url="home.cfm?insert=#insert#&rm" addtoken="false">
    		</cfif>
    	</cfif>
    </cfif>
	<div class="container">
		<cfif insert EQ 1>
			<div class="alert alert-success mt-5" role="alert" id="insertAlert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span>
				</button>
				Suceessfully inserted.....!
			</div>
		</cfif>
		<div class="row">
			<div class="col-md-6 mx-auto mt-5">
				<div class="border">
					<h2 class="text-center">RAM</h2>
					<div>
				        <form class="form-horizontal" method="POST" action="" id="formAddPage">
				          <div class="row ml-2">
				            <label class="col-md-3 control-label">Storage</label>
				            <div class="col-md-6">
				              <input type="text" id="capacity" class="form-control" name="capacity" value="#form.capacity#">
				            </div>
				          </div>
				          <div class="row ml-2 mt-3">
				            <label class="col-md-3 control-label">Price</label>
				            <div class="col-md-6">
				              <input type="text" id="price" class="form-control" name="price" value="#getRam.price#">
				            </div>
				          </div>
				          <div class="row mt-3">
				            <div class="col-md-9 text-center">
				              <input type="submit" class="btn btn-primary" name="save" value="Submit">
				            </div>
				          </div>
				        </form>
				       <p class="text-danger ml-4" id="message">#message#</p>
				    </div>
				</div>
			</div>
		</div>
	</div>
</cfoutput>
