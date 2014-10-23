<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Videos</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../stubs/navbar.ftl"/>

		<!-- content -->
		<div id="content" class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="nav nav-tabs" role="tablist">
						<li class="active"><a href="#">All Videos</a></li>
						<li><a href="#">Popular</a></li>
						<li><a href="#">Recently Added</a></li>
						<li><a href="#">Categories</a></li>
					</ul>
					<br/>
				</div>
				<#list videos as video>
					<div class="col-sm-4 col-md-3 text-center video-margin">
						<a href="/video/${video.id}">
							<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.png')}" class="img-responsive img-thumbnail" alt="Video Thumbnail">
						</a>
						<p class="video-title"><strong>${video}</strong></p>
					</div>
				</#list>
			</div>
		</div>

		<#include "../stubs/footer.ftl"/>

		<#include "../stubs/scripts.ftl"/>

	</body>
</html>
