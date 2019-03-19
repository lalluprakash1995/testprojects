<cfinclude template="header.cfm">
<cfoutput>
<cfset contentNum=0> 
<cfset dbObject=createObject("component", "dataStore").init(this.datasource)>
<div class="container">
	<div class="row">
		<div class="col-md-12 text-center mt-5">
			<h1 class="display-1 font-weight-bold">TODOS</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 mx-auto">
			<div class="shadow p-3 mb-5 bg-white rounded">
				<div class="row border-bottom">
					<div class="col-md-1 h3">
						<a class="btn display3" id="selectall">
							<i class="fas fa-chevron-down"></i>
						</a>
					</div>
					<div class="col-md-10">
						<form action="" method="POST">
							<input type="text" name="activity" placeholder="What need to be done ?" class="h3 border-0" autofocus>
						</form>
					</div>
				</div>
				<cfif structKeyExists(form, "activity") AND len(trim(form.activity)) NEQ 0>
					<cfset inserResult= dbObject.insertTodos(form.activity)>
					<cfif structKeyExists(inserResult, "recordcount") AND inserResult.recordcount GT 0>
					</cfif>
				</cfif>
				<ul id="savedContents" class="list-unstyled">
					
				</ul>
				<div class="row footr ">
					<div class="col-md-3 btn" id="itemLeft">
						<small>0 Items Left</small>
					</div>
					<div class="col-md-6">
						<div id="footerWrap" class="all">
							<a id="allList" class=" p-2 pl-3 pr-3 btn active border"><small>All</small></a>
							<a class="p-2 pl-3 pr-3 btn btn-outline" id="activeList"><small>Active</small></a>
							<a class="p-2 pl-3 pr-3 btn btn-outline" id="completedList"><small>Completed</small></a>
						</div>
					</div>
					<div class="col-md-3">
						<a id="deleteAll" class="btn border"><small>Clear Completed</small></a>
					</div>
			</div>
		</div>
	</div>
</div>
</cfoutput>
 