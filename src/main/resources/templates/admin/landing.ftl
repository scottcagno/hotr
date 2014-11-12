<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Donate</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">
		<#include "../stubs/admin_navbar.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div id="" class="panel panel-default">
						<div class="panel-heading"><a href="/admin/user">Users</a></div>
						<div class="panel-body">
							<p>Registered Users: ${users}</p>
							<p>Users Taking Challenge: ${challenge}</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div id="" class="panel panel-default">
						<div class="panel-heading"><a href="/admin/video">Videos</a></div>
						<div class="panel-body">
							<p>Number Of Videos: ${videos}</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div id="" class="panel panel-default">
						<div class="panel-heading">Worksheets</div>
						<div class="panel-body">
							<p>Number Of Worksheets Saved: ${worksheets}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content -->

		<!-- footer -->
		<#include "../stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "../stubs/scripts.ftl"/>
		<!-- javascript -->

	</body>
</html>


