<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Related Videos</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<script src="/static/js/facebook_conf.js"></script>

		<div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="/secure/home" class="navbar-brand">Home</a>
				</div>
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/secure/video/all"> Videos</a></li>
						<li><a href="/secure/user">Account</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/secure/home#about">About</a></li>
								<li><a href="/secure/home#events">Events</a></li>
								<li><a href="/secure/home#contact">Contact</a></li>
								<li class="divider"></li>
								<li><a href="/secure/donate">Donate</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<#include "../stubs/alert.ftl"/>

		<#assign message = 'I just completed the next step in my Fan The Flame Dates one year challenge!'/>
		<#assign shareLink = '${glob.host}/video/id/${id}'/>

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
									data-clientid="268327735010-6t55rdr44med018rtbbmd0cbbp88b0ga.apps.googleusercontent.com"
									data-cookiepolicy="single_host_origin"
									data-prefilltext="I just completed the next step in my Fan The Flame Dates one year challenge!"
									data-calltoactionlabel="VISIT"
									data-calltoactionurl="${shareLink}"
									data-calltoactiondeeplinkid="/pages/create">
								<i class="fa fa-google-plus-square fa-2x"></i>
							</span>
						</a>
						<a href="https://twitter.com/share?url=${shareLink}&text=${message}&count=none"
						   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"	>
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
		<div id="content" class="container">
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-12">
					<div class="text-center well well-sm">
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
						<div class="col-sm-6 col-md-4 col-lg-3 text-center video-margin">
							<a href="/secure/video/id/${video.id}">
								<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" class="img-responsive img-thumbnail" alt="Video Thumbnail">
							</a>
							<p class="video-title"><strong>${video}</strong></p>
						</div>
					</#list>
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

		<#include "../stubs/scripts.ftl"/>

		<script>
			var thumb = '${video.thumb!}';
			var message = '${message}';
			var shareLink = '${shareLink}';
		</script>

		<script src="https://apis.google.com/js/client:platform.js" async defer></script>

		<script src="/static/js/social.js"></script>

	</body>
</html>
