<cfinclude template="header.cfm">
<cfoutput>
<nav class="navbar bg-info navbar-light">
	<div class="container-fluid">
		<div class="navbar-header">
		</div>
		<div class="h3">
      <cfif NOT compare(listLast(cgi.SCRIPT_NAME,"/"), "home.cfm")>
  			<a href="addram.cfm" class="btn" id="addram">
  				<button class="btn btn-success"><i class="fas fa-plus-circle"></i>Add RAM</button>
  			</a>
  			<a href="addbrand.cfm" class="btn" id="addbrand">
  				<button class="btn btn-success"><i class="fas fa-plus-circle"></i>Add Brand</button>
  			</a>
      </cfif>
      <cfif compare(listLast(cgi.SCRIPT_NAME,"/"), "home.cfm")> 
  			<a href="home.cfm" class="btn">
  				<button class="btn btn-success navbar-btn" id="homebtn"><i class="fas fa-home"></i>Home</button>
  			</a>
      </cfif>
			<button class="btn btn-success navbar-btn" data-toggle="modal" data-target="##myModal"><i class="fas fa-power-off"></i>Logout</button>
		</div>
	</div>
</nav>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title">Alert........!</h3>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <p>Do you want to logout.....?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a href="logout.cfm">
          <button type="button" class="btn btn-primary">Logout</button>
        </a>
      </div>
    </div>
  </div>
</div>
</cfoutput>
