<!DOCTYPE html>
<html lang="en">
	<head id="head" itemscope itemtype="http://schema.org/Organization">
		<title>Watch</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../stubs/navbar.ftl"/>

		<#include "../stubs/alert.ftl"/>

		<#assign caption = video.name/>
		<#assign message = video.description/>
		<#assign shareLink = '${glob.host}/video/id/${id}'/>
		<#assign thumb = video.thumb/>

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
					<div class="col-lg-12">
						<a href="#" onclick="fbShare()"><i class="fa fa-facebook-square fa-2x"></i></a>

						<a href="#">
							<span
									class="g-interactivepost"
									data-contenturl="${shareLink}"
									data-clientid="472352253568-brmvt0cpld8fua3qlbj4ssdj6s3ak70c.apps.googleusercontent.com"
									data-cookiepolicy="single_host_origin"
									data-prefilltext="${message}"
									data-calltoactionlabel="VISIT"
									data-calltoactionurl="${shareLink}"
									data-calltoactiondeeplinkid="/pages/create">
								<i class="fa fa-google-plus-square fa-2x"></i>
							</span>
						</a>

						<a href="https://twitter.com/share?url=${shareLink}&text=${message}&count=none"
						   onclick="window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"	>
							<i class="fa fa-twitter-square fa-2x"></i>
						</a>
					</div>
					<div class="col-lg-6">
						<h1 class="text-white">${video.name}</h1>
					</div>
					<div class="col-lg-6">
						<br/>
						<p class="text-white">${video.description}</p>
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

		<script>
			var thumb = '${thumb}';
			var caption = '${caption}';
			var message = '${message}';
			var shareLink = '${shareLink}';
		</script>


		<script src="https://apis.google.com/js/client:platform.js" async defer></script>
		<script src="/static/js/social.js"></script>
		<#include "../stubs/scripts.ftl"/>

	</body>
</html>
