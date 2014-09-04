<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Template</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../stubs/navbar.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="col-sm-offset-1 col-sm-10">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe src="//player.vimeo.com/video/${video.vimeoId}?portrait=0&title=0&byline=0&badge=0&color=eeeeee&&amp;autoplay=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
				</div>
			</div>
		</div>
		<!-- content -->

		<#include "../stubs/footer.ftl"/>

		<#include "../stubs/scripts.ftl"/>

	</body>
</html>
