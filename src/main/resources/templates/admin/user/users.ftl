<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../../stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/data-table-bootstrap.css">
		<title>Users</title>

	</head>
	<body id="body">
		<#include "../../stubs/google-tag-manager-body.ftl"/>
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

			<!-- view all -->
			<div class="col-sm-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						All Users
						<a href="/admin/user/add" class="btn btn-primary pull-right">Add</a>
					</div>
					<div class="table-responsive">
						<table id="users" class="table table-striped">
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
											<a href="/admin/user/${(user.id?c)!}" class="btn btn-primary">
												<i class="fa fa-pencil"></i>
											</a>

											<!-- delete item trigger -->
											<span id="delete-item" data-id="/admin/user/del/${user.id?c}"
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

		<!-- javascript -->

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/password.js"></script>
		<script src="/static/js/delete-item.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/datatables/1.10.7/js/jquery.dataTables.min.js"></script>
		<script src="/static/js/data-table-bootstrap.js"></script>
		<script>
			$(document).ready(function() {
				$('#users').DataTable({
					lengthMenu:[10,15,20],
					"columnDefs": [
						{ "orderable": false, "targets": [3,4] }
					]
				});
			});
		</script>
		<!-- javascript -->

	</body>
</html>
