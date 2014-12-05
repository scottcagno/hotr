<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<meta property="og:url" content="node2.cagnosolutions.com/video/id/${video.id}" />
		<meta property="og:title" content="Challenge Completed" />
		<meta property="og:description" content="I just completed the next step in the Fan the Flame Dates one year challenge!" />
		<meta property="og:image" content="${video.thumb!}" />
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
							<p>
								Sign up for the one-year marriage challenge to grow intimacy and protect your marriage!
							</p>
						</div>
						<div class="form-group">
							<a href="/challenge" class="btn btn-info btn-xs" type="submit">Learn More</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- content -->
		<div class="container">
			<div class="col-lg-offset-1 col-lg-10">
				<div id="videoDiv" class="embed-responsive embed-responsive-16by9">
					<img id="video" src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" class="img-responsive " alt="Video Thumbnail">
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
						<#list topics as topic>
							<a href="/video/all?topic=${topic}" class="btn btn-xs btn-primary">${topic}</a>
						</#list>
					</p>
				</div>
			</div>
		</div>
		<!-- content -->
		<form id="watched" hidden>
			<input type="text" name="topicIds" value="${topics?join(',')}"/>
			<input type="text" name="videoId" value="${video.id}"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>

		<#include "../stubs/footer.ftl"/>

		<#include "../stubs/scripts.ftl"/>

		<script>
			var iframe = '<iframe id="iFrame" src="//player.vimeo.com/video/${video.vimeoId}?portrait=0&title=0&byline=0&badge=0&color=eeeeee&&amp;autoplay=1" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
		</script>
		<script src="/static/js/video.js"></script>

	</body>
</html>
