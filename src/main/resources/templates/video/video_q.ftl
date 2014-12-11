<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../stubs/header.ftl"/>

		<title>Watch</title>
	</head>
	<body>

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
						<li><a href="/secure/user"> Account</a></li>
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
								<a href="/secure/challenge" class="btn btn-info btn-xs" type="submit">Learn More!</a>
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
				<div id="videoDiv" class="embed-responsive embed-responsive-16by9 play">
					<img id="video" src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" class="img-responsive " alt="Video Thumbnail">
					<a id="video" href="#">
						<span class="fa fa-play-circle fa-5x"></span>
					</a>
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
							<a href="/secure/video/all?topic=${topic}" class="btn btn-xs btn-primary">${topic}</a>
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
										<label id="question_${i}">${question.question}</label>
										<#list question.options as option>
											<div class="radio">
												<label>
													<input id="question_${i}" type="radio" name="${question.question}" id="optionsRadios1" value="${option}">
													${option}
												</label>
											</div>
										</#list>
										<#break/>
									<#case "select many">
										<label id="question_${i}">${question.question}</label>
										<#list question.options as option>
											<div class="checkbox">
												<label>
													<input name="${question.question}" id="question_${i}" type="checkbox" value="${option}">
													${option}
												</label>
											</div>
										</#list>
										<#break/>
									<#case "text box">
										<label id="question_${i}">${question.question}</label>
										<div class="form-group">
											<textarea name="${question.question}" id="question_${i}" class="form-control" rows="5" style="resize:none;"></textarea>
										</div>
										<#break/>
									<#default>
										<label id="question_${i}">${question.question}</label>
										<div class="form-group">
											<input name="${question.question}" id="question_${i}" type="${question.inputType}" class="form-control" required="true"/>
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
						<button id="submitWorksheet" class="btn btn-md btn-success btn-block">Submit</button>
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

			<#include "../stubs/scripts.ftl"/>
			<script>
				var iframe = '<iframe id="iFrame" src="//player.vimeo.com/video/${video.vimeoId}?portrait=0&title=0&byline=0&badge=0&color=eeeeee&&amp;autoplay=1" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>';
			</script>
			<script src="/static/js/video_q.js"></script>
			<script src="/static/js/video.js"></script>

			<script src="https://apis.google.com/js/client:platform.js" async defer></script>
		</div>
	</body>
</html>