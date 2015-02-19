<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Video Series</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../stubs/navbar.ftl"/>

		<#include "../stubs/alert.ftl"/>

		<!-- content -->
		<div id="content" class="container">
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-12">
					<div class="hidden-xs hidden-sm">
						<ul class="nav nav-tabs" role="tablist">
							<li><a href="/video/all">All Videos</a></li>
							<li><a href="/video/popular">Popular</a></li>
							<li><a href="/video/recent">Recently Added</a></li>
							<li class="active"><a href="">Series</a></li>
						</ul>
					</div>
					<div class="visible-xs visible-sm">
						<div class="list-group">
							<a href="/video/all" class="list-group-item">All Videos</a>
							<a href="/video/popular" class="list-group-item">Popular</a>
							<a href="/video/recent" class="list-group-item">Recently Added</a>
							<a href="/video/series" class="list-group-item active">Series</a>
						</div>
					</div>
					<br/>
					<#list allSeries as series>
						<div class="col-sm-6 col-md-4 col-lg-3 text-center video-margin">
							<a href="/video/${series}">
								<img src="/static/img/video2.jpg" class="img-responsive img-thumbnail" alt="Video Thumbnail">
							</a>
							<p class="video-title"><strong>${series}</strong></p>
						</div>
					</#list>
				</div>

				<div class="col-lg-3 col-md-3 col-sm-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							Hot Topics
						</div>
						<div class="panel-body">
							<#list topics as topic>
								<a href="/video/all?topic=${topic.topic}" class="btn btn-block red">
									${topic.topic?cap_first} <span class="badge pull-right">${topic.watched} Views</span>
								</a>
							</#list>
						</div>
					</div>
				</div>
			</div>
		</div>

		<#include "../stubs/footer.ftl"/>

		<#include "../stubs/scripts.ftl"/>

	</body>
</html>
