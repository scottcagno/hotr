<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Videos</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#assign link = (auth)?string('/secure', '')/>

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
						<li><a href="${(auth)?string('/secure/user', '/secure/video/${filter}')}">${(auth)?string('Account', 'Login')}</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${link}/home#about">About</a></li>
								<li><a href="${link}/home#events">Events</a></li>
								<li><a href="${link}/home#contact">Contact</a></li>
								<li class="divider"></li>
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
					<ul class="nav nav-tabs hidden-xs hidden-sm" role="tablist">
						<li class="${(filter == 'all' && !RequestParameters.tag??)?string('active', '')}">
							<a href="${link}/video/all">All Videos</a>
						</li>
						<li class="${(filter == 'popular')?string('active', '')}">
							<a href="${link}/video/popular">Popular</a>
						</li>
						<li class="${(filter == 'recent')?string('active', '')}">
							<a href="${link}/video/recent">Recently Added</a>
						</li>
						<li class="${(filter == 'category')?string('active', '')}">
							<a href="${link}/video/category">Categories</a>
						</li>
					</ul>
					<div class="visible-xs visible-sm">
						<div class="list-group">
							<a href="${link}/video/all" class="list-group-item ${(filter == 'all' && !RequestParameters.tag??)?string('active', '')}">All Videos</a>
							<a href="${link}/video/popular" class="list-group-item ${(filter == 'popular')?string('active', '')}">Popular</a>
							<a href="${link}/video/recent" class="list-group-item ${(filter == 'recent')?string('active', '')}">Recently Added</a>
							<a href="${link}/video/category" class="list-group-item ${(filter == 'category')?string('active', '')}">Categories</a>
						</div>
					</div>
					${(filter != 'all' && filter != 'popular' && filter!= 'recent' && filter != 'category')?string('<h4 class="text-center">${filter}</h4>', '')}
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
