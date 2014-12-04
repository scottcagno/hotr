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
						<li><a href="${(auth)?string('/secure/user', '/secure/video/all')}">${(auth)?string('Account', 'Login')}</a></li>
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
				<div class="col-lg-8">
					<div class="row text-center well well-sm">
						<p>
							Check out related videos to the one you just watched
						</p>
						<p>
							<#list topics as topic>
								<a href="/secure/video/all?topic=${topic}" class="btn btn-xs btn-primary">${topic}</a>
							</#list>
						</p>
					</div>
					<#list videos as video>
						<div class="col-sm-4 col-md-3 col-lg-3 text-center video-margin">
							<a href="${link}/video/id/${video.id}">
								<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" class="img-responsive img-thumbnail" alt="Video Thumbnail">
							</a>
							<p class="video-title"><strong>${video}</strong></p>
						</div>
					</#list>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading">Worksheet</div>
						<div class="panel-body">
							<#if worksheet??>
								${worksheet.htmlData}
							</#if>
						</div>
					</div>
				</div>
			</div>
		</div>

		<#include "../stubs/footer.ftl"/>

		<#include "../stubs/scripts.ftl"/>

	</body>
</html>
