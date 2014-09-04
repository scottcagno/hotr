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
				<div class="panel-heading col-sm-12">
					Videos
					<a href="/secure/video/upload" id="" class="btn btn-default btn-xs pull-right"><i class="fa fa-upload"></i> Upload Video</a>
				</div>
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
										<td>${video.vimeoId}</td>
										<td>
											<form role="form" method="post" action="/secure/video/delete/${video.id}">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
												<input type="hidden" name="vimeoId" value="${video.vimeoId}"/>
												<a href="/secure/video/edit/${video.id}" class="btn btn-xs btn-primary">
													<i class="fa fa-pencil"></i>
												</a>
												<button type="submit" class="btn btn-danger btn-xs">
													<i class="fa fa-trash-o"></i>
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
