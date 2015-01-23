<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Watch</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../stubs/navbar.ftl"/>

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
					<iframe id="player" src="//player.vimeo.com/video/${video.vimeoId}?api=1&player_id=player&portrait=0&title=0&byline=0&badge=0&color=eeeeee&&amp;" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
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

		<script src="//f.vimeocdn.com/js/froogaloop2.min.js"></script>
		<script src="/static/js/video.js"></script>

	</body>
</html>
