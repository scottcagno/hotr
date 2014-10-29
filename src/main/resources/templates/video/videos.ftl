<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Videos</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#assign link = (hash??)?string('/secure/${hash!}', '')/>

		<div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="${link}/home" class="navbar-brand">Home</a>
				</div>
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${link}/video/all"> Videos</a></li>
						<li><a href="${(hash??)?string('/secure/${hash!}/user', '/secure/video')}">${(hash??)?string('Account', 'Login')}</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${link}/home#about">About</a></li>
								<li><a href="${link}/home#events">Events</a></li>
								<li><a href="${link}/home#contact">Contact</a></li>
								<li class="divider"></li>
								<li><a href="${link}/site">Site Map</a></li>
								<li><a href="${link}/donate">Donate</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<#include "../stubs/alert.ftl"/>

		<!-- content -->
		<div id="content" class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="nav nav-tabs" role="tablist">
						<li class="${(filter == 'all')?string('active', '')}"><a href="${link}/video/all">All Videos</a></li>
						<li class="${(filter == 'popular')?string('active', '')}"><a href="${link}/video/popular">Popular</a></li>
						<li class="${(filter == 'recent')?string('active', '')}"><a href="${link}/video/recent">Recently Added</a></li>
						<li class="${(filter != 'all' && filter != 'popular' && filter!= 'recent')?string('active', '')}">
							<a href="${link}/video/category">Categories</a>
						</li>
					</ul>
					<br/>
				</div>
				<#list videos as video>
					<div class="col-sm-4 col-md-3 text-center video-margin">
						<a href="${link}/video/id/${video.id}">
							<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" class="img-responsive img-thumbnail" alt="Video Thumbnail">
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
