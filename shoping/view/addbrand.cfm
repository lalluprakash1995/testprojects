<cfinclude template="header.cfm">
<script type="text/javascript" src="../asset/js/addbrand.js"></script>
<cfinclude template="navbar.cfm">
<cfparam name="message" default="">
<cfparam name="selectBrands.name" default="">
<cfparam name="selectBrands.price" default="">
<cfoutput>
	<cfset dbconnect=createObject("component", "dataStore").init(this.datasource)>
	<cfif structKeyExists(url, "brandid")>
		<cfset selectBrands=dbconnect.selectBrand(url.brandid)>
	</cfif>
	<cfif structKeyExists(form, "save")>
		<cfif NOT len(trim(form.brandName)) OR NOT len(trim(form.price)) >
			<cfset message="All fields should be fill.......!">
		<cfelseif len(trim(form.price)) AND NOT isNumeric(form.price)>
			<cfset message="Price field is numeric value.......!">
		<cfelse>
			<cfif structKeyExists(url, "brandid")>
				<cfset updateBrnd=dbconnect.updateBrand(url.brandid,1,form.brandName,form.price)>
				<cflocation url="home.cfm?update=#updateBrnd.recordcount#&brd" addtoken="false">
			</cfif>
			<cfset insert=dbconnect.insetBrand(form.brandName,form.price)>
			<cflocation url="home.cfm?insert=#insert#&brd" addtoken="false">
		</cfif>
	</cfif>
	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto mt-5">
				<div class="border">
					<h2 class="text-center">BRANDS</h2>
					<div>
				        <form class="form-horizontal" method="POST" action="" id="formAddPage">
				          <div class="row ml-2">
				            <label class="col-md-3 control-label">Name</label>
				            <div class="col-md-6">
				              <input type="text" id="brandName" class="form-control" name="brandName" value="#selectBrands.name#">
				            </div>
				          </div>
				          <div class="row ml-2 mt-3">
				            <label class="col-md-3 control-label">Price</label>
				            <div class="col-md-6">
				              <input type="text" id="price" class="form-control" name="price" value="#selectBrands.price#">
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