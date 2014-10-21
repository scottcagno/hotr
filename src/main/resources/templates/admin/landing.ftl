<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Donate</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">
		<#include "../stubs/navbar.ftl"/>

		<!-- content -->
		<div class="container navbar-margin">
			<div class="col-lg-4">
				<div id="" class="panel panel-default">
					<div class="panel-heading">Users</div>
					<div class="panel-body">
						<p>Registered Users: ${users}</p>
						<p>Users Taking Challenge: ${challenge}</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div id="" class="panel panel-default">
					<div class="panel-heading">Videos</div>
					<div class="panel-body">
						<p>Number Of Videos: ${videos}</p>
						<p>Videos Watched: </p>
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


