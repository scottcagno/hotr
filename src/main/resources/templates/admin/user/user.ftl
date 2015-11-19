<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Users</title>
		<#include "../../stubs/header.ftl"/>
	</head>
	<body id="body">
		<#include "../../stubs/admin_navbar.ftl"/>

		<br/>
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
		<div class="container-fluid">
			<#include "../../stubs/alert.ftl"/>
			<!-- add/edit -->
			<div class="col-sm-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						Add/Edit User <span class="pull-right"><a href="/admin/user">Clear</a></span>
					</div>
					<form id="accountForm" role="form" method="post" action="/admin/user/${(user?? && user.id??)?string('edit','add')}" novalidate>
						<#if user?? && user.id??>
							<div class="form-group">
								<label>Created On:</label><span> ${(user.creation?date)!}</span> <br/>
								<label>Last Seen:</label><span> ${(user.lastSeen?date)!}</span> <br/>
								<label>Account: </label>
								<a href="/admin/user/${(user.id)!}${(user.active==1)?string('?active=false','?active=true')}">
									${(user.active==1)?string('Enabled (click to disable)','Disabled (click to enable)')}
								</a> <br/>
							</div>
						</#if>
						<div class="checkbox">
							<label>
								<input name="monthly" type="checkbox" value="true" ${(user?? && user.monthly?? && user.monthly)?string('checked', '')}>
								Email monthly challenge reminders
							</label>
						</div>
						<div class="form-group">
							<label>First Name</label>
							<span class="text-error">${(errors.firstName)!}</span>
							<input type="text" id="firstName" name="firstName" class="form-control"
								   placeholder="First Name" required="true" value="${(user.firstName)!}"/>
						</div>
						<div class="form-group">
							<label>Spouse's Name (Optional)</label>
							<input type="text" id="spouseName" name="spouseName" class="form-control"
								   placeholder="Spouse's Name" value="${(user.spouseName)!}"/>
						</div>
						<div class="form-group">
							<label>Last Name</label>
							<span class="text-error">${(errors.lastName)!}</span>
							<input type="text" id="lastName" name="lastName" class="form-control"
								   placeholder="Last Name" required="true" value="${(user.lastName)!}"/>
						</div>
						<div class="form-group">
							<label>Email</label>
							<span class="text-error">${(errors.username)!}</span>
							<input type="text" id="username" name="username" class="form-control"
								   placeholder="Email" required="true" value="${(user.username)!}"/>
						</div>
						<div class="form-group">
							<label>Spouse's Email (Optional)</label>
							<input type="text" id="spouseEmail" name="spouseEmail" class="form-control"
								   placeholder="Spouse's Email" value="${(user.spouseEmail)!}"/>
						</div>
						<#if user??>
							<div class="text-center">
								<a data-toggle="collapse" data-parent="#accordion"
								   href="#changePassword" class="text-primary">
									Click to change password
								</a>
							</div>
							<br/>
							<div id="changePassword" class="panel-collapse collapse">
								<!-- toggle show password input -->
								<div class="form-group">
									<div class="input-group">
										<input type="password" id="toggle-pass" name="password" class="form-control"
											   placeholder="Password" />
										<span class="input-group-btn">
											<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
													title="Click to show/hide your password">
												<i class="fa fa-eye-slash"></i>
											</button>
										</span>
									</div>
								</div>
								<!-- toggle show password input -->
							</div>
						<#else/>
							<!-- toggle show password input -->
							<div class="form-group">
								<span class="text-error">${(errors.password)!}</span>
								<div class="input-group">
									<input type="password" id="toggle-pass" name="password" class="form-control"
										   placeholder="Password" required="true"/>
									<span class="input-group-btn">
										<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
												title="Click to show/hide your password">
											<i class="fa fa-eye-slash"></i>
										</button>
									</span>
								</div>
							</div>
							<!-- toggle show password input -->
						</#if>
						<input type="hidden" name="id" value="${(user.id)!}"/>
						<input type="hidden" name="active" value="${(user.active)!}"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
					</form>
				</div>
			</div>
			<!-- add/edit -->

			<!-- view all -->
			<div class="col-sm-8">
				<div class="panel panel-default">
					<div class="panel-heading">All Users</div>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email</th>
									<th class="hidden-xs hidden-sm">Enabled</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<#list users as user>
									<tr>
										<td>${(user.firstName)!}</td>
										<td>${(user.lastName)!}</td>
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
			<!-- view all -->
		</div>

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/password.js"></script>
		<script src="/static/js/delete-item.js"></script>

	</body>
</html>
