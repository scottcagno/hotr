<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
	<head id="head">

		<#include "../../stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/data-table-bootstrap.css">
		<title>Users</title>

	</head>
	<body id="body">

		<!-- navbar -->
		<#include "../../stubs/admin_navbar.ftl"/>
		<!-- navbar -->

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

		<div class="container-fluid">

			<#include "../../stubs/alert.ftl"/>

			<!-- add/edit -->
			<div class="col-sm-offset-2 col-sm-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<#if user?? && user.id??>
							Edit User <span class="pull-right"><a href="/admin/user/${user.id?c}">Clear</a></span>
						<#else>
							Add User <span class="pull-right"><a href="/admin/user/add">Clear</a></span>
						</#if>

					</div>
					<form id="accountForm" role="form" method="post" action="/admin/user/${(user?? && user.id??)?string('edit','add')}" novalidate>
						<#if user?? && user.id??>
							<div class="form-group">
								<label>Created On:</label><span> ${(user.creation?date)!}</span> <br/>
								<label>Last Seen:</label><span> ${(user.lastSeen?date)!}</span> <br/>
								<label>Account: </label>
								<a href="/admin/user/${(user.id?c)!}${(user.active==1)?string('?active=false','?active=true')}">
									${(user.active==1)?string('Enabled (click to disable)','Disabled (click to enable)')}
								</a> <br/>
							</div>
						</#if>
						<#--<div class="checkbox">
							<label>
								<input name="monthly" type="checkbox" value="true" ${(user?? && user.monthly?? && user.monthly)?string('checked', '')}>
								Email monthly challenge reminders
							</label>
						</div>-->
						<div class="col-sm-6">
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
						</div>
						<div class="col-sm-6">
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
									<label><a data-toggle="collapse" data-parent="#accordion"
									   href="#changePassword" class="text-primary">
										Click to change password
									</a></label>
								</div>
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
							<#else>

								<!-- toggle show password input -->
								<div class="form-group">
									<label>Password</label>
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
						</div>
						<input type="hidden" name="id" value="${(user.id?c)!}"/>
						<input type="hidden" name="active" value="${(user.active)!}"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
					</form>
				</div>
			</div>
			<!-- add/edit -->

			<!-- view all -->

		</div>

		<!-- javascript -->

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/password.js"></script>
		<script src="/static/js/delete-item.js"></script>
		<!-- javascript -->

	</body>
</html>
