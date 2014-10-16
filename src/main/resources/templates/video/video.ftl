<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Template</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../stubs/navbar.ftl"/>

		<!-- content -->
		<div class="container navbar-margin">
			<div class="col-sm-offset-1 col-sm-10">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe src="//player.vimeo.com/video/${video.vimeoId}?portrait=0&title=0&byline=0&badge=0&color=eeeeee&&amp;autoplay=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<h1>6 Ways to Spend Time Together as Couples</h1>
					</div>
					<div class="col-lg-6">
						<br/>
						<p class="">In this "Fan the Flame Date" we learn about the emotional "currency" or love language each person has in a relationship.
							Do you ever feel like you're trying to show love to your spouse ... and they don't receive it that way? Something is getting lost in translation ... you don't speak the same love language.</p>
					</div>
				</div>
				<div class="row text-center well well-sm">
					<p>
						Check out related videos
					</p>
					<p>
						<#list tags as tag>
							<a href="/video?tag=${tag}" class="btn btn-xs btn-primary">${tag}</a>
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
