<!DOCTYPE html>
<html lang="en-US">
	<head>

		<#include "../stubs/header.ftl"/>
		<script src="/static/js/facebook_conf.js"></script>
		<meta itemprop="name" content="Fan the Flame Dates">
		<meta itemprop="description" content="Fan the Flame Dates Description">
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
			<#assign shareLink = '${glob.host}/video/name/${video.slug}'/>
			<#assign thumb = (video.thumb)!/>

			<!-- header -->
			<section class="colorarea">
				<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
			</section>
			<div class="container">
				<div class="row">
					<div class="col-md-12 negmtop">
						<h1 class="pgheadertitle animated fadeInLeft pull-left">${(video.name)!}</h1>
						<span class="pagedescrarea text-right animated fadeInRight pull-right">
							<i></i>
						</span>
					</div>
				</div>
			</div>
			<!-- header -->

			<div class="container">
				<div class="shortcode row">

					<!-- worksheet -->
					<div class="col-md-6">
						<div class="panel1">
							<!-- video questions -->
							<#assign i = 0 />
							<#if questions??>
								<form id="worksheet">
									<#list questions as question>
										<#switch question.inputType>
											<#case "select one">
												<label id="question_${i}">${question.ask}</label>
												<#list question.options as option>
													<div class="radio">
														<label>
															<input id="question_${i}" type="radio" name="${question.ask}" value="${option}">
														${option}
														</label>
													</div>
												</#list>
												<#break/>
											<#case "select many">
												<label id="question_${i}">${question.ask}</label>
												<#list question.options as option>
													<div class="checkbox">
														<label>
															<input name="${question.ask}" id="question_${i}" type="checkbox" value="${option}">
														${option}
														</label>
													</div>
												</#list>
												<#break/>
											<#case "text box">
												<label id="question_${i}">${question.ask}</label>
												<div class="form-group">
													<textarea name="${question.ask}" id="question_${i}" class="form-control" rows="5" style="resize:none;"></textarea>
												</div>
												<#break/>
											<#default>
												<label id="question_${i}">${question.ask}</label>
												<div class="form-group">
													<input name="${question.ask}" id="question_${i}" type="${question.inputType}" class="form-control" required="true"/>
												</div>
										</#switch>
										<#assign i = i +1 />
									</#list>
									<br>
								</form>
							</#if>
							<!-- video questions -->
							<#if auth>
								<!-- save/email -->
								<form id="submitForm" action="/secure/worksheet" role="form" method="post">
									<div class="checkbox">
										<label>
											<input type="checkbox" name="save" value="true"> Save completed worksheet in my profile.
										</label>
									</div>
									<div class="checkbox">
										<label>
											<input type="checkbox" name="email" value="true"> Email completed worksheet to me.
										</label>
									</div>
									<div class="checkbox">
										<label>
											<input type="checkbox" name="send" value="true"> Anonymously submit my completed worksheet to Fan the Flame Dates.
										</label>
									</div>
									<input type="hidden" name="videoId" value="${video.id?c}">
									<input type="hidden" name="userId" value="${user.id?c}">
									<input type="hidden" name="videoName" value="${video.name}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<input type="hidden" name="answers" id="answers">
								</form>
								<!-- save/email -->

								<button id="submitWorksheet" class="btn btn-md btn-primary btn-block">Submit</button>
							</div>

							<#else>
								</div>
								<div class="panel1">
									<b>Create a free account to email a copy of this worksheet to yourself and to continue to "Fan the Flame" of your marriage -</b><br>
									Here's how our free program works. After you create a login:
									<ul>
										<li>We encourage you to watch a new Fan the Flame Date every month</li>
										<li>Answer the questions at the end of the video</li>
										<li>You'll see your progress bar grow after each one is completed</li>
										<li>Next month ... repeat the process!</li>
									</ul>
									Don't forget to recommend this to your friends and family so they can Fan the Flame of their marriage too!
									Intimacy, passion and unity will begin to grow throughout the months as you work together. If you forget a month ... don't worry ...we'll send you an email reminder so you can catch up.
									Each month new videos will be added to the site ...and you'll receive recommendations based on your personal viewing taste.
								</div>

							</#if>
					</div>
					<!-- worksheet -->

					<div class="col-md-6">

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
						<!-- details -->

					</div>
				</div>
			</div>

			<!-- html/javascript regex -->
			<div id="regEx" hidden>(<(?:"[^"]*"['"]*|'[^']*\'['"]*|[^'">])+>)|((function)|\(|\)|\;|([a-z]\.[a-z])|\{|\})</div>
			<!-- html/javascript regex -->

			<!-- watched form -->
			<form id="watched" hidden>
				<input type="text" name="topicIds" value="${topics?join(',')}"/>
				<input type="text" name="videoId" value="${video.id?c}"/>
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
			<script src="/static/js/video_q.js"></script>
			<script src="/static/js/video.js"></script>
			<!-- javascript -->

		</div>
	</body>
</html>