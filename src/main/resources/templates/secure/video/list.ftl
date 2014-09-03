<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Template</title>
		<#include "../../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../../stubs/navbar.ftl"/>

		<!-- content -->
		<div class="container">
			<div id="videoTableDiv" class="panel panel-default">
				<div class="panel-heading">Videos</div>
				<div class="panel-body">
					<div id="videoTable" class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Description</th>
									<th>Thumbnail Uri</th>
									<th>Video Uri</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<#list videos as video>
									<tr>
										<td>${video.id}</td>
										<td>${video.name}</td>
										<td>${video.description}</td>
										<td>${video.thumb}</td>
										<td>${video.uri}</td>
										<td>
											<form role="form" method="post" action="/secure/video/delete/${video.id}">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
												<input type="hidden" name="uri" value="${video.uri}"/>
												<button type="submit">
													<i class="fa fa-trash"></i>
												</button>
											</form>
										</td>
									</tr>
								</#list>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- content -->

		<#include "../../stubs/footer.ftl"/>

		<#include "../../stubs/scripts.ftl"/>

	</body>
</html>
