<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>spring-boot-base|view</title>

		<#include "../stubs/header.ftl"/>

	</head>
	<body>

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
								<p class="lead">
									Something about taking the challenge
								</p>
							</div>
							<div class="form-group">
								<a href="/secure/user" class="btn btn-info" type="submit">Start Now!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</#if>

		<#if alertWarning?? && (!(worksheet??))>
			<div class="container">
				<div id="alert">
					<div class="alert alert-warning alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						${alertWarning}
					</div>
				</div>
			</div>
		</#if>

		<#if worksheet??>
			<#assign message = 'I just completed the next step in my Fan The Flame Dates one year challenge!'/>
			<#assign shareLink = 'http://node2.cagnosolutions.com/video/id/${video.id}'/>
			<div class="container">
				<div id="alert">
					<div class="alert alert-info alert-dismissable text-right">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<div class="form-inline">
							<div class="form-group pull-left">
								<p class="lead">
									Congratulations on completing the next step in the one year challenge!
								</p>
							</div>
							Click to share
							<div class="form-group">
								<a href="#" onclick="fbShare()"><i class="fa fa-facebook-square fa-2x"></i></a>
							</div>
							<div class="form-group">
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
							</div>
							<div class="form-group">
								<a href="https://twitter.com/share?url=${shareLink}&text=${message}&count=none"
								   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"	>
									<i class="fa fa-twitter-square fa-2x"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</#if>
		<div class="container">
			<br/>
			<div class="col-sm-7">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe src="//player.vimeo.com/video/${video.vimeoId}?portrait=0&title=0&byline=0&badge=0&color=eeeeee&&amp;autoplay=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
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
						<#list tags as tag>
							<a href="/secure/video/all?tag=${tag}" class="btn btn-xs btn-primary">${tag}</a>
						</#list>
					</p>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="panel panel-default">
					<div class="panel-heading">Worksheet</div>
					<div class="panel-body">
						<#if worksheet??>
							${worksheet.htmlData}
						<#else/>
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
							<button id="submitWorksheet" class="btn btn-md btn-default btn-block">Submit</button>
						</#if>
					</div>
				</div>
			</div>
		</div>
		<div id="regEx" hidden>(<(?:"[^"]*"['"]*|'[^']*\'['"]*|[^'">])+>)|((function)|\(|\)|\;|([a-z]\.[a-z])|\{|\})</div>
		<#include "../stubs/footer.ftl"/>

		<!-- scripts -->
		<div id="scripts">

			<#include "../stubs/scripts.ftl"/>

			<script src="/static/js/video_q.js"></script>
			<script>
				var shareLink = '${shareLink}';
				var thumb = '${video.thumb!}';
				var message = '${message}'
			</script>
			<script src="/static/js/social.js"></script>
			<script src="https://apis.google.com/js/client:platform.js" async defer></script>
		</div>
	</body>
</html>