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
						<li><a href="${(auth)?string('/secure/user', '/secure/video/series')}">${(auth)?string('Account', 'Login')}</a></li>
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
				<div class="col-lg-9 col-md-9 col-sm-12">
					<div class="hidden-xs hidden-sm">
						<ul class="nav nav-tabs" role="tablist">
							<li><a href="${link}/video/all">All Videos</a></li>
							<li><a href="${link}/video/popular">Popular</a></li>
							<li><a href="${link}/video/recent">Recently Added</a></li>
							<li class="active"><a href="">Series</a></li>
						</ul>
					</div>
					<div class="visible-xs visible-sm">
						<div class="list-group">
							<a href="${link}/video/all" class="list-group-item">All Videos</a>
							<a href="${link}/video/popular" class="list-group-item">Popular</a>
							<a href="${link}/video/recent" class="list-group-item">Recently Added</a>
							<a href="${link}/video/series" class="list-group-item active">Series</a>
						</div>
					</div>
					<br/>
					<#list allSeries as series>
						<div class="col-sm-6 col-md-4 col-lg-3 text-center video-margin">
							<a href="${link}/video/${series}">
								<img src="/static/img/video.jpg" class="img-responsive img-thumbnail" alt="Video Thumbnail">
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
								<a href="/video/all?topic=${topic.topic}" class="btn btn-block btn-primary">
									${topic.topic} <span class="badge pull-right">${topic.watched}</span>
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
