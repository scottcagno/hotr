<!DOCTYPE html>
<html lang="en-US">
	<head>

		<#include "../stubs/header.ftl"/>
		<script src="/static/js/facebook_conf.js"></script>
		<style>iframe[src^="https://apis.google.com/u/0/_/widget/oauthflow/toast"] {display: none;}</style>
		<title>Watch Video - Fan The Flame Dates</title>

	</head>
	<body class="boxedlayout">
		<div class="boxedcontent">

			<!-- navbar -->
			<#include "../stubs/navbar.ftl"/>
			<!-- navbar -->

			<#include "../stubs/alert.ftl"/>

			<#assign caption = video.name/>
			<#assign message = video.description/>
			<#assign shareLink = '${glob.host}/video/id/${id}'/>
			<#assign thumb = video.thumb/>

			<!-- header -->
			<section class="colorarea">
				<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
			</section>
			<div class="container">
				<div class="row">
					<div class="col-md-12 negmtop">
						<h1 class="pgheadertitle animated fadeInLeft pull-left">${(video.name)!}</h1>
						<span class="pagedescrarea text-right animated fadeInRight pull-right">
						</span>
					</div>
				</div>
			</div>
			<!-- header -->

			<div class="container">
				<div class="shortcode row">
					<div class="col-lg-offset-1 col-lg-10">

						<!-- video player -->
						<div class="row">
							<div id="videoDiv" class="embed-responsive embed-responsive-16by9">
								<iframe id="player" src="//player.vimeo.com/video/${video.vimeoId}?api=1&player_id=player&portrait=0&title=0&byline=0&badge=0&color=eeeeee&&amp;" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
							</div>
						</div>
						<!-- video player -->

						<!-- social media -->
						<div class="row">
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
						<!-- social media -->

						<!-- details -->
						<div class="row">
							<div class="col-lg-6">
								<h1 class="text-white">${video.name}</h1>
							</div>
							<div class="col-lg-6">
								<br/>
								<p class="text-white">${video.description}</p>
							</div>
						</div>
						<!-- details -->

						<!-- related topics -->
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
						<!-- related topics -->

					</div>
				</div>
			</div>

			<!-- watched form -->
			<form id="watched" hidden>
				<input type="text" name="topicIds" value="${topics?join(',')}"/>
				<input type="text" name="videoId" value="${video.id}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
			<!-- watched form -->

			<!-- footer -->
			<#include "../stubs/footer.ftl"/>
			<!-- footer -->

			<!-- javascript -->
			<script>
				var thumb = '${thumb}';
				var caption = '${caption}';
				var message = '${message}';
				var shareLink = '${shareLink}';
			</script>

			<script src="https://apis.google.com/js/client:platform.js" async defer></script>
			<script src="/static/js/social.js"></script>

			<#include "../stubs/scripts.ftl"/>
			<script src="//f.vimeocdn.com/js/froogaloop2.min.js"></script>
			<script src="/static/js/video.js"></script>
			<!-- javascript -->

		</div>
	</body>
</html>