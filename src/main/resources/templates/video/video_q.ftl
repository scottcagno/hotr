<!DOCTYPE html>
<html lang="en" itemscope itemtype="http://schema.org/Organization">
	<head id="head">

		<#include "../stubs/header.ftl"/>

		<title>Watch</title>
	</head>
	<body>

		<#include "../stubs/navbar.ftl"/>

		<#include "../stubs/alert.ftl"/>

		<#assign caption = video.name/>
		<#assign message = video.description/>
		<#assign shareLink = '${glob.host}/video/id/${id}'/>
		<#assign thumb = video.thumb/>

		<#if notChallenge??>
			<div class="container">
				<div id="alert">
					<div class="alert alert-info alert-dismissable text-right">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<div class="form-inline">
							<div class="form-group pull-left">
								<p>
									Begin the one-year marriage challenge to grow intimacy and protect your marriage!
								</p>
							</div>
							<div class="form-group">
								<a href="/challenge" class="btn btn-info btn-xs" type="submit">Learn More!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</#if>

		<#if alertWarning??>
			<div class="container">
				<div id="alert">
					<div class="alert alert-warning alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						${alertWarning}
					</div>
				</div>
			</div>
		</#if>

		<div class="container">
			<br/>
			<div class="col-sm-7">
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
			<div class="col-sm-5">
				<div class="panel panel-default">
					<div class="panel-heading">Worksheet</div>
					<div class="panel-body">
						<#assign i = 0 />
						<form id="worksheet">
							<#list questions as question>
								<#switch question.inputType>
									<#case "select one">
										<label id="question_${i}">${question.ask}</label>
										<#list question.options as option>
											<div class="radio">
												<label>
													<input id="question_${i}" type="radio" name="${question.ask}" id="optionsRadios1" value="${option}">
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
							<input type="hidden" name="videoId" value="${video.id}">
							<input type="hidden" name="userId" value="${user.id}">
							<input type="hidden" name="videoName" value="${video.name}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="hidden" name="answers" id="answers">
						</form>
						<button id="submitWorksheet" class="btn btn-md btn-primary btn-block">Submit</button>
					</div>
				</div>
			</div>
		</div>

		<div id="regEx" hidden>(<(?:"[^"]*"['"]*|'[^']*\'['"]*|[^'">])+>)|((function)|\(|\)|\;|([a-z]\.[a-z])|\{|\})</div>

		<form id="watched" hidden>
			<input type="text" name="topicIds" value="${topics?join(',')}"/>
			<input type="text" name="videoId" value="${video.id}"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		
		<#include "../stubs/footer.ftl"/>

		<!-- scripts -->
		<div id="scripts">
			<script>
				var thumb = '${thumb}';
				var caption = '${caption}';
				var message = '${message}';
				var shareLink = '${shareLink}';
			</script>

			<#include "../stubs/scripts.ftl"/>
			<script src="//f.vimeocdn.com/js/froogaloop2.min.js"></script>
			<script src="/static/js/video_q.js"></script>
			<script src="/static/js/video.js"></script>

			<script src="https://apis.google.com/js/client:platform.js" async defer></script>
			<script src="/static/js/social.js"></script>
		</div>
	</body>
</html>