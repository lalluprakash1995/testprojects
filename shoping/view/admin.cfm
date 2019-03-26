<link rel="stylesheet" type="text/css" href="../asset/css/login.css">
<cfinclude template="header.cfm">
<cfoutput>
	<div class="container">
		<div class="row " id="logincontainer">
			<div class="col-md-5 mx-auto border bg-info">
				<h2 class="text-center">LOGIN</h2>
				<form class="form-horizontal" method="POST" action="" id="loginForm">
					<div class="form-group mt-5">
						<div class="row">
							<label class="col-md-4 control-label">User Name</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="username" value="" id="username">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<label class="col-md-4 control-label">Password</label>
							<div class="col-md-8">
								<input type="password" class="form-control" name="password" value="" id="password">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12 text-center ">
								<input type="submit" class="btn btn-success ml-4 " name="login" value="SIGN IN" id="login">
								<input type="reset" class="btn btn-danger" name="reset" value="CLEAR">
							</div>
						</div>
					</div>
				</form>
				<cfif structKeyExists(form, "login")>
					<cfif NOT len(trim(form.username)) AND NOT len(trim(form.password))>
						<span class="text-danger">All fields Should be fill............!</span>
					<cfelseif compare(form.username, "admin") AND compare(form.password, "admin")>
						<span class="text-danger">Invalid user name or Password.....!</span>
					<cfelse>
						<cfset session.name="admin">
						<cflocation url="home.cfm">
					</cfif>
				</cfif>
			</div>
		</div>
	</div>
</cfoutput>
