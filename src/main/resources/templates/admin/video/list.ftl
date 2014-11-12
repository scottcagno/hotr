<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Template</title>
		<#include "../../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../../stubs/admin_navbar.ftl"/>

		<!-- content -->
		<div class="container">
			<div id="videoTableDiv" class="panel panel-default">
				<div class="panel-heading col-sm-12">
					Videos
					<a href="/admin/video/upload" id="" class="btn btn-default btn-xs pull-right"><i class="fa fa-upload"></i> Upload Video</a>
				</div>
				<div id="videoTable" class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Name</th>
								<th>Description</th>
								<th>Category</th>
								<th class="hidden-xs hidden-sm">Thumbnail</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<#list videos as video>
								<tr>
									<td>${video.name}</td>
									<td>${video.description}</td>
									<td>${video.category!}</td>
									<td class="hidden-xs hidden-sm"><a href="${(video.thumb)!}" target="_blank">View</a></td>
									<td>
										<a href="/admin/video/${video.id}" class="btn btn-xs btn-primary">
											<i class="fa fa-pencil"></i>
										</a>
										<a href="" class="btn btn-danger btn-xs" data-id="${(video.id)!}" data-vimeo="${(video.vimeoId)!}"
										   data-toggle="modal" data-target="#videoDeleteCheck">
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
		<!-- content -->

		<div class="modal fade" id="videoDeleteCheck" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Are you sure?</h4>
					</div>
					<div class="modal-body">
						Permanently remove video? This action cannot be undone and will remove the video from vimeo.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-md pull-left" data-dismiss="modal">No, Cancel
						</button>
						<span id="delete">
							<form role="form" method="post" action="/admin/video/{id}">
								<input type="hidden" name="vimeoId" id="deleteVimeoId"/>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button type="submit" class="btn btn-primary btn-md">Yes, Remove Video</button>
							</form>
						</span>
					</div>
				</div>
			</div>
		</div>

		<#include "../../stubs/footer.ftl"/>

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/admin/all-video.js"></script>

	</body>
</html>
