<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Template</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="/home" class="navbar-brand">Home</a>
				</div>
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/video/all"> Videos</a></li>
						<li><a href="/secure/video/id/${id}">Login</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/home#about">About</a></li>
								<li><a href="/home#events">Events</a></li>
								<li><a href="/home#contact">Contact</a></li>
								<li class="divider"></li>
								<li><a href="/donate">Donate</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<#include "../stubs/alert.ftl"/>

		<div class="container">
			<div id="alert">
				<div class="alert alert-info alert-dismissable text-right">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<div class="form-inline">
						<div class="form-group pull-left">
							<p class="lead">
								Something about taking the challenge
							</p>
						</div>
						<div class="form-group">
							<a href="/secure/user" class="btn btn-info" type="submit">Sign Up!</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- content -->
		<div class="container">
			<div class="col-lg-offset-1 col-lg-10">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe src="//player.vimeo.com/video/${video.vimeoId}?portrait=0&title=0&byline=0&badge=0&color=eeeeee&&amp;autoplay=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<h1>${video.name}</h1>
					</div>
					<div class="col-lg-6">
						<br/>
						<p class="">${video.description}</p>
					</div>
				</div>
				<div class="row text-center well well-sm">
					<p>
						Check out related videos
					</p>
					<p>
						<#list tags as tag>
							<a href="/video/all?tag=${tag}" class="btn btn-xs btn-primary">${tag}</a>
						</#list>
					</p>
				</div>
			</div>
		</div>
		<!-- content -->

		<#include "../stubs/footer.ftl"/>

		<#include "../stubs/scripts.ftl"/>

	</body>
</html>
