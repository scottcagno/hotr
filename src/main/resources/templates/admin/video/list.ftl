<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "../../stubs/header.ftl"/>
		<title>Videos</title>
	</head>
	<body id="body">

		<#include "../../stubs/admin_navbar.ftl"/>

		<script src="/static/js/facebook_conf.js"></script>

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
							Are you sure you want to permanently remove this video?
						</p>
					</div>
				</form>
			</div>
		</div>
		<!-- delete item alert -->

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
								<th>Series</th>
								<th class="hidden-xs hidden-sm">Thumbnail</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<#list videos as video>
								<tr>
									<td>${video.name}</td>
									<td>${video.description}</td>
									<td>${(video.series?? && video.series == '')? string('None', video.series!)}</td>
									<td class="hidden-xs hidden-sm">
										<#if video.thumb??>
											<a href="${(video.thumb)!}" target="_blank">View</a>
										<#else/>
											Not Ready
										</#if>
									</td>
									<td>
										<a href="" id="facebook"   data-name="${video.name}"
												data-desc="${video.description}" data-thumb="${video.thumb!}" data-id="${video.id}" data-vimeoId="${video.vimeoId}">
											<i class="fa fa-facebook-square fa-2x"></i>
										</a>
									</td>
									<td>
										<a href="/admin/video/${video.id}" class="btn btn-primary">
											<i class="fa fa-pencil"></i>
										</a>
										<!-- delete item trigger -->
										<span id="delete-item" data-id="/admin/video/del/${video.id}"
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
		<!-- content -->


		<#include "../../stubs/footer.ftl"/>

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/admin/all-video.js"></script>

		<script src="/static/js/delete-item.js"></script>

		<script>

			var link = '${glob.host}/video/id/'

			function vidShare(thumb, vimeoId, id, name, desc) {
				FB.ui({
					method: 'feed',
					picture: thumb,
					link: 'http://vimeo.com/' + vimeoId,
					source: 'http://vimeo.com/moogaloop.swf?clip_id=' + vimeoId + '&autoplay=1',
					name: name,
					description: desc,
					caption: 'We uploaded a new video!',
					actions: [
						{
							name: 'Click to watch on our site',
							link: link + id
						}
					]
				});
			};

			$('button[id="facebook"]').click(function() {
				vidShare(this.getAttribute('data-thumb'), this.getAttribute('data-vimeoId'), this.getAttribute('data-id'), this.getAttribute('data-name'), this.getAttribute('data-desc'))
			});

		</script>

	</body>
</html>
