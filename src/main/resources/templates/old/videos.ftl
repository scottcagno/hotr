<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Videos</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../stubs/navbar.ftl"/>

		<#include "../stubs/alert.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-12">
					<ul class="nav nav-tabs hidden-xs hidden-sm" role="tablist">
						<li class="${(filter == 'all' && !RequestParameters.topic??)?string('active', '')}">
							<a href="/video/all">All Videos</a>
						</li>
						<li class="${(filter == 'popular')?string('active', '')}">
							<a href="/video/popular">Popular</a>
						</li>
						<li class="${(filter == 'recent')?string('active', '')}">
							<a href="/video/recent">Recently Added</a>
						</li>
						<li class="${(filter == 'series')?string('active', '')}">
							<a href="/video/series">Series</a>
						</li>
					</ul>
					<div class="visible-xs visible-sm">
						<div class="list-group">
							<a href="/video/all" class="list-group-item ${(filter == 'all' && !RequestParameters.topic??)?string('active', '')}">All Videos</a>
							<a href="/video/popular" class="list-group-item ${(filter == 'popular')?string('active', '')}">Popular</a>
							<a href="/video/recent" class="list-group-item ${(filter == 'recent')?string('active', '')}">Recently Added</a>
							<a href="/video/series" class="list-group-item ${(filter == 'series')?string('active', '')}">Series</a>
						</div>
					</div>
					${(filter != 'all' && filter != 'popular' && filter!= 'recent' && filter != 'series')?string('<h4 class="text-center text-white">Series: ${(seriesName)!}</h4>', '')}
					${(RequestParameters.topic??)?string('<h4 class="text-center text-white">Topic: ${RequestParameters.topic!}</h4>', '')}
					<br/>
					<#assign vidInRow = 0/>
					<div class="row">
						<#list videos as video>
							<#if vidInRow gt 3>
								</div><div class="row">
								<#assign vidInRow = 0/>
							</#if>
							<div class="col-sm-6 col-md-4 col-lg-3 text-center video-margin">
								<a href="/video/id/${video.id}" data-toggle="popover"
									data-trigger="hover"
									title="${video.name}"
									data-content="${video.description}"
									data-placement="bottom">
									<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" class="img-responsive img-thumbnail" alt="Video Thumbnail">
								</a>
								<p class="video-title"><strong>${video.name}</strong></p>
								<#assign vidInRow = vidInRow + 1/>
							</div>
						</#list>
					</div>
				</div>

				<div class="col-md-3 col-lg-3 col-sm-12">
					<div class="panel panel-default dark">
						<div class="panel-heading dark">
							<span class="gray-panel"><span class="bold-panel red-panel">HOT</span>TOPICS</span>
						</div>
						<div class="panel-body dark">
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

		<script>
			$(document).ready(function() {
				$(function () {
				  $('[data-toggle="popover"]').popover()
				})
			});
		</script>

	</body>
</html>