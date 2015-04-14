<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "../stubs/header.ftl"/>
		<title>Admin</title>
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
							<p>Number Of Videos Watched: ${(watched)!}</p>
							<p>Number Of Worksheets Saved: ${worksheets}</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div id="" class="panel panel-default">
						<div class="panel-heading">Slide Setting</div>
						<div class="panel-body">
							<form action="/admin/settings" method="post">
								<div class="form-group">
									<select class="form-control" name="videoId">
										<#list vids as vid>
											<option value="${vid.id?c}" ${(settings?? && settings.videoId?? && settings.videoId == vid.id)? string('selected', '')}>${vid.name}</option>
										</#list>
									</select>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button class="btn btn-primary btn-block">Save</button>
							</form>
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


