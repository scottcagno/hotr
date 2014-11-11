<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Users</title>
		<#include "../../stubs/header.ftl"/>
	</head>
	<body id="body">
		<#include "../../stubs/admin_navbar.ftl"/>
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
										<th>Username</th>
										<th>Enabled</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<#list users as user>
										<tr>
											<td>${(user.name)!}</td>
											<td>${(user.email)!}</td>
											<td>${(user.username)!}</td>
											<td>${(user.active == 1)?c}</td>
											<td>
												<a href="/admin/user/${(user.id)!}" class="btn btn-xs btn-primary">
													<i class="fa fa-pencil"></i>
												</a>
												<a class="btn btn-danger btn-xs" data-id="${(user.id)!}" data-toggle="modal" data-target="#deleteCheck">
													<i class="fa fa-trash-o"></i>
												</a>
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

		<div class="modal fade" id="deleteCheck" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">Are you sure?</h4>
					</div>
					<div class="modal-body">
						Permanently remove user? This action cannot be undone.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-md pull-left" data-dismiss="modal">No, Cancel</button>
                        <span id="delete">
                            <form role="form" method="post" action="/admin/user/{id}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button type="submit" class="btn btn-primary btn-md">Yes, Remove User</button>
							</form>
                        </span>

					</div>
				</div>
			</div>
		</div>

		<!-- content -->

		<#include "../../stubs/footer.ftl"/>

		<#include "../../stubs/scripts.ftl"/>

		<script>
            $(document).ready(function() {

                // toggle safe delete modal popup
                $('a[data-toggle="modal"]').click(function(){
                    var id = $(this).data('id');
                    var form = $('.modal #delete');
                    form.html(form.html().replace('{id}',id));
                });
            });
        </script>

	</body>
</html>
