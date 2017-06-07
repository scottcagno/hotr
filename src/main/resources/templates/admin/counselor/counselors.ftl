<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../../stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/data-table-bootstrap.css">
		<title>Counselors</title>

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
							Are you sure you want to permanently remove this counselor?
						</p>
					</div>
				</form>
			</div>
		</div>
		<!-- delete item alert -->

		<div class="container-fluid">


			<!-- view all -->
			<div class="col-sm-12">
				<#include "../../stubs/alert.ftl"/>
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						All Counselors
						<a href="/admin/counselor/add" class="btn btn-primary pull-right">Add</a>
					</div>
					<div class="table-responsive">
						<table id="counselors" class="table table-striped">
							<thead>
								<tr>
									<th>Name</th>
									<th>Contact</th>
									<th>Phone</th>
									<th>Email</th>
									<th>Street</th>
									<th>City</th>
									<th>State</th>
									<th>Zip</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<#list counselors as counselor>
									<tr>
										<td>${(counselor.name)}</td>
										<td>${(counselor.contactName)}</td>
										<td>${(counselor.phone)}</td>
										<td>${(counselor.email)}</td>
										<td>${(counselor.street)}</td>
										<td>${(counselor.city)}</td>
										<td>${(counselor.state)}</td>
										<td>${(counselor.zip)}</td>
										<td>
											<a href="/admin/counselor/${(counselor.id?c)!}" class="btn btn-primary">
												<i class="fa fa-pencil"></i>
											</a>

											<!-- delete item trigger -->
											<span id="delete-item" data-id="/admin/counselor/del/${counselor.id?c}"
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
		<script src="/static/js/delete-item.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/datatables/1.10.7/js/jquery.dataTables.min.js"></script>
		<script src="/static/js/data-table-bootstrap.js"></script>
		<script>
			$(document).ready(function() {
				$('#counselors').DataTable({
					lengthMenu:[10,15,20],
					"columnDefs": [
						{ "orderable": false, "targets": [8] }
					]
				});
			});
		</script>
		<!-- javascript -->

	</body>
</html>
