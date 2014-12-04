<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<meta property="og:url" content="node2.cagnosolutions.com/video/all" />
		<meta property="og:title" content="All Videos Page" />
		<meta property="og:description" content="These are all of the videos we have to offer" />
		<meta property="og:image" content="https://fbcdn-dragon-a.akamaihd.net/hphotos-ak-prn1/851565_496755187057665_544240989_n.jpg" />
		<title>Donate</title>
		<#include "stubs/header.ftl"/>
	</head>
	<body id="body">

		<script>
			window.fbAsyncInit = function() {
				FB.init({
					appId      : '1376717522621067',
					xfbml      : true,
					version    : 'v2.2'
				});
			};
			(function(d, s, id){
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) {return;}
				js = d.createElement(s); js.id = id;
				js.src = "//connect.facebook.net/en_US/sdk.js";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		</script>


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
						<li><a href="secure/user">Login</a></li>
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

		<#include "stubs/alert.ftl"/>

		<!-- content -->
		<div class="container">
			<div>

				<a href="https://twitter.com/share?url=node2.cagnosolutions.com/video/1&text=I%20just%20completed%20the%20next%20step%20in%20my%20Fan%20The%20Flame%20Dates%20one%20year%20challenge!&count=none"
				   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;">
					<i class="fa fa-twitter-square fa-2x"></i>
				</a>

				<span
					class="g-interactivepost"
					data-contenturl="http://node2.cagnosolutions.com/video/id/1"
					data-clientid="845141024587-90pjhir2j6oler2l82nckthksjm804d6.apps.googleusercontent.com"
					data-cookiepolicy="single_host_origin"
					data-prefilltext="I just completed the next step in my Fan The Flame Dates one year challenge!"
					data-calltoactionlabel="VISIT"
					data-calltoactionurl="http://node2.cagnosolutions.com/video/id/1"
					data-calltoactiondeeplinkid="/pages/create">
					<i class="fa fa-google-plus-square fa-2x"></i>
				</span>


				<script type="text/javascript">
					window.twttr=(function(d,s,id){var t,js,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return}js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);return window.twttr||(t={_e:[],ready:function(f){t._e.push(f)}})}(document,"script","twitter-wjs"));
				</script>


				<a href="#" onclick="vidShare()"><i class="fa fa-facebook-square fa-2x"></i></a>
				<script>
					function fbShare() {
					  FB.ui({
					    method: 'feed',
					    link: 'http://node2.cagnosolutions.com/video/id/1',
					    // picture: 'http://fbrell.com/f8.jpg',
					    name: 'Fan The Flame Dates',
					    caption: 'Challenge Accepted',
					    description: 'I just completed the next step in my Fan The Flame Dates one year challenge!'
					  });
					};

					function vidShare() {
						FB.ui({
							method: 'feed',
							picture: '${video.thumb}',
							link: 'http://vimeo.com/${video.vimeoId}',
							source: 'http://vimeo.com/moogaloop.swf?clip_id=${video.vimeoId}&autoplay=1',
							name: '${video.name}',
							caption: 'We uploaded a new video!',
							description: '${video.description}'
						});
					};
				</script>

				<script>
					window.___gcfg = {
						lang: 'en-US',
						parsetags: 'onload'
					};
				</script>
				<script src="https://apis.google.com/js/client:platform.js" async defer></script>

			</div>
		</div>
		<!-- content -->

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>



		<!-- javascript -->

	</body>
</html>


