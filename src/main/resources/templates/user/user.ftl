<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Users</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">
		<#include "../stubs/navbar.ftl"/>
		<!-- content -->
		<div id="content" class="container navbar-margin">
			<!-- add/edit -->
			<div class="col-sm-4">

				<div class="panel panel-default">
					<div class="panel-heading">
						My Account
						<a href="/logout" class="btn btn-default btn-xs pull-right">Logout</a>
					</div>
					<div class="panel-body">
						<form id="accountForm" role="form" method="post" action="/user">
							<div class="form-group">
								<input type="text" id="name" name="name" class="form-control"
								       placeholder="Name" required="true" value="${user.name!}"/>
							</div>
							<div class="form-group">
								<input type="text" id="username" name="username" class="form-control"
								       placeholder="Email" required="true" value="${user.username}"/>
							</div>
							<div class="text-center">
								<a data-toggle="collapse" data-parent="#accordion"
								   href="#changePassword" class="text-primary">
									Click to change password
								</a>
							</div>
							<br/>
							<div id="changePassword" class="panel-collapse collapse">
								<div class="form-group">
									<input type="password" id="password" name="password" class="form-control"
									       placeholder="Password"/>
								</div>
								<div class="form-group">
									<input type="password" id="confirm" name="confirm" class="form-control"
									       placeholder="Confirm"/>
								</div>
							</div>
							<input type="hidden" name="id" value="${user.id}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
						</form>
					</div>
				</div>



				<!--
				<div class="panel panel-default">
					<div class="panel-heading">
						My Account
						<a href="/logout" class="btn btn-default btn-xs pull-right">Logout</a>
					</div>
					<div class="panel-body">
						<form role="form" method="post" action="/user">
							<div class="form-group">
								<input type="text" id="name" name="name" value="${(user.name)!}" class="form-control" placeholder="Name" required="true" autofocus="true"/>
							</div>
							<div class="form-group">
								<input type="email" id="email" name="email" value="${(user.email)!}" class="form-control" placeholder="Email" required="true"/>
							</div>
							<div class="form-group">
								<input type="text" id="username" name="username" value="${(user.username)!}" class="form-control" placeholder="Username" required="true"/>
							</div>
							<div class="form-group">
								<input type="password" id="password" name="password" value="${(user.password)!}" class="form-control" placeholder="Password" required="true"/>
							</div>
							<input type="hidden" name="id" value="${(user.id)!}"/>
							<input type="hidden" name="creation" value="${(user.creation?c)!}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
						</form>
					</div>
				</div>-->


			</div>
			<!-- add/edit -->
			<div class="col-sm-4">
				<div id="" class="panel panel-default">
					<div class="panel-heading">Recently Watched Videos</div>
					<div class="panel-body">
					</div>
				</div>
			</div>

			<div class="col-sm-4">
				<div id="" class="panel panel-default">
					<div class="panel-heading">Saved Worksheets</div>
					<div class="panel-body">
					</div>
				</div>
			</div>

		</div>

		<div class="modal fade" id="deleteCheck" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">Are you sure?</h4>
					</div>
					<div class="modal-body">
						Permantly remove user? This action cannot be undone.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-md pull-left" data-dismiss="modal">No, Cancel</button>
                        <span id="delete">
                            <form role="form" method="post" action="/user/${user.id}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button type="submit" class="btn btn-primary btn-md">Yes, Remove User</button>
							</form>
                        </span>

					</div>
				</div>
			</div>
		</div>

		<!-- content -->

		<#include "../stubs/footer.ftl"/>

		<#include "../stubs/scripts.ftl"/>
	</body>
</html>
