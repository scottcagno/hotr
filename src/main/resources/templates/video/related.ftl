<!DOCTYPE html>
<html lang="en" itemscope itemtype="http://schema.org/Organization">
	<head id="head">
		<title>Related Videos</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body class="boxedlayout">
		<div class="boxedcontent">

			<#include "../stubs/navbar.ftl"/>

			<section class="colorarea">
				<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
			</section>

			<div class="container">
				<div class="row">
					<div class="col-md-12 negmtop">
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Related Videos</h1>
						<span class="pagedescrarea text-right animated fadeInRight pull-right">
							<i>Check out other videos on the same topic!</i>
						</span>
					</div>
				</div>
			</div>

			<#assign caption = 'Challenge accepted'/>
			<#assign message = 'I just completed the next step in my Fan The Flame Dates one year challenge!'/>
			<#assign shareLink = '${glob.host}/video/id/${id}'/>
			<#assign thumb = video.thumb/>

			<#if isChallenged??>
				<div class="container">
					<div id="alert">
						<div class="alert alert-info alert-dismissable">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>

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

							<label>
								Congratulations on completing the next step in the one year challenge!
							</label>
						</div>
					</div>
				</div>
			</#if>
			<!-- content -->
			<div class="container">
				<#include "../stubs/alert.ftl"/>
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-12">
						<div class="text-center well well-sm">
							<p>
								Check out related videos to the one you just watched
							</p>
							<p>
								<#list topics as topic>
									<a href="/video/all?topic=${topic}" class="btn btn-xs btn-primary">${topic}</a>
								</#list>
							</p>
						</div>
						<#assign vidInRow = 0/>
						<div class="row">
							<#list videos as video>
								<#if vidInRow gt 3>
									</div><div class="row">
									<#assign vidInRow = 0/>
								</#if>
								<div class="col-sm-6 col-md-4 col-lg-3 text-center video-margin">
									<a href="/video/id/${video.id}">
										<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" class="img-responsive img-thumbnail" alt="Video Thumbnail">
									</a>
									<p class="video-title"><strong>${video.name}</strong></p>
								</div>
								<#assign vidInRow = vidInRow + 1/>
							</#list>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12">
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

			<script>
				var thumb = '${thumb}';
				var caption = '${caption}';
				var message = '${message}';
				var shareLink = '${shareLink}';
			</script>

			<#include "../stubs/scripts.ftl"/>

			<script src="https://apis.google.com/js/client:platform.js" async defer></script>
			<script src="/static/js/social.js"></script>
		</div>
	</body>
</html>
