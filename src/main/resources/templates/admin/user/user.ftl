<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Users</title>
		<#include "../../stubs/header.ftl"/>
	</head>
	<body id="body">
		<#include "../../stubs/admin_navbar.ftl"/>

		<!-- delete item alert -->
		<div class="container">
			<div id="delete-item-confirm" class="hide alert alert-danger alert-dismissible wow fadeIn" role="alert">
				<form role="form" method="post" class="form-inline" action="">
					<div class="form-group">
						<button class="btn btn-sm btn-danger" type="submit">Yes, I'm sure</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="form-group">
						<button id="delete-item-confirm-cancel" type="button" class="btn btn-default">No, cancel</button>
					</div>
					<div class="form-group pull-right">
						<p class="lead text-danger">
							Are you sure you want to permanently remove this user?
						</p>
					</div>
				</form>
			</div>
		</div>
		<!-- delete item alert -->

		<!-- content -->
		<div id="content" class="container">
			<!-- add/edit -->
			<div class="col-sm-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						Add/Edit User <span class="pull-right"><a href="/admin/user">Clear</a></span>
					</div>
					<div class="panel-body">
						<form id="accountForm" role="form" method="post" action="/admin/user">
							<#if user??>
								<div class="form-group">
									<label>Created On:</label><span> ${(user.creation?date)!}</span> <br/>
									<label>Last Seen:</label><span> ${(user.lastSeen?date)!}</span> <br/>
									<label>Account: </label>
									<a href="/admin/user/${(user.id)!}${(user.active==1)?string('?active=false','?active=true')}">
										${(user.active==1)?string('Enabled (click to disable)','Disabled (click to enable)')}
									</a> <br/>
								</div>
							</#if>
							<div class="form-group">
								<input type="text" id="name" name="name" class="form-control"
									   placeholder="Name" required="true" value="${(user.name)!}"/>
							</div>
							<div class="form-group">
								<input type="text" id="username" name="username" class="form-control"
									   placeholder="Email" required="true" value="${(user.username)!}"/>
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
							<input type="hidden" name="id" value="${(user.id)!}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
						</form>
					</div>
				</div>
			</div>
			<!-- add/edit -->

			<!-- view all -->
			<div class="col-sm-8">
				<div class="panel panel-default">
					<div class="panel-heading">All Users</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Name</th>
										<th>Email</th>
										<th class="hidden-xs hidden-sm">Enabled</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<#list users as user>
										<tr>
											<td>${(user.name)!}</td>
											<td>${(user.username)!}</td>
											<td class="hidden-xs hidden-sm">${(user.active == 1)?c}</td>
											<td>
												<a href="/admin/user/${(user.id)!}" class="btn btn-primary">
													<i class="fa fa-pencil"></i>
												</a>
												<!-- delete item trigger -->
												<span id="delete-item" data-id="/admin/user/del/${user.id}"
													  class="btn btn-danger">
													<i class="fa fa-trash-o"></i>
												</span>
												<!-- delete item trigger -->
											</td>
										</tr>
									</#list>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- view all -->
		</div>

		<!-- content -->

		<#include "../../stubs/footer.ftl"/>

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/admin/global.js"></script>

		<script src="/static/js/delete-item.js"></script>

	</body>
</html>
