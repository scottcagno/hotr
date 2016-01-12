<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../stubs/header.ftl"/>
		<title>Admin</title>

	</head>
	<body id="body">

		<!-- navbar -->
		<#include "../stubs/admin_navbar.ftl"/>
		<!-- navbar -->

		<br/>

		<!-- content -->
		<div class="container">

			<#include "../stubs/alert.ftl"/>

			<div class="row">
				<div class="col-lg-offset-1 col-lg-4">
					<div id="" class="panel panel-default">
						<div class="panel-heading"><a href="/admin/user">Users</a></div>
						<div class="panel-body">
							<p>Registered Users: ${users}</p>
							<p>Users Taking Challenge: ${challenge}</p>
						</div>
					</div>
				</div>
				<div class="col-lg-offset-2 col-lg-4">
					<div id="" class="panel panel-default">
						<div class="panel-heading"><a href="/admin/video">Videos</a></div>
						<div class="panel-body">
							<p>Number Of Videos: ${videos}</p>
							<p>Number Of Videos Watched: ${(watched)!}</p>
							<p>Number Of Worksheets Saved: ${worksheets}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content -->

		<!-- javascript -->
		<#include "../stubs/scripts.ftl"/>
		<!-- javascript -->

	</body>
</html>


