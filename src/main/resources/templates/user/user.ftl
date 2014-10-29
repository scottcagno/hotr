<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Users</title>
		<#include "../stubs/header.ftl"/>
		<link href="/static/css/wizard.css" rel="stylesheet" type="text/css"/>
	</head>
	<body id="body">

		<div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="/secure/home/${hash}" class="navbar-brand">Home</a>
				</div>
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/secure/${hash}/video/all"> Videos</a></li>
						<li><a href="/secure/${hash}/user"> Account</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/secure/${hash}/home#about">About</a></li>
								<li><a href="/secure/${hash}/home#events">Events</a></li>
								<li><a href="/secure/${hash}/home#contact">Contact</a></li>
								<li class="divider"></li>
								<li><a href="/secure/${hash}/site">Site Map</a></li>
								<li><a href="/secure/${hash}/donate">Donate</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<#include "../stubs/alert.ftl"/>

		<!-- content -->
		<div id="content" class="container">
			<div class="row">
				<div class="col-lg-7 text-center">
					<#if !user.challenge>
						<form id="challengeForm" role="form" method="post" action="/secure/${hash}/user/challenge">
							<input type="hidden" name="userId" value="${user.id}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-md btn-default btn-block" type="submit">Begin Challenge</button>
						</form>
					<#else/>
						<#assign width = (user.progress?size / 12) * 100/>
						<p>
							<strong>Challenge Progress</strong>
						</p>
						<div class="progress">
							<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${width}%;">
								${user.progress?size}/12
							</div>
						</div>
					</#if>
					<br/>
				</div>
				<div class="col-lg-5 text-center">
					<strong>Member Since: ${user.creation?date}</strong>
				</div>
			</div>
			<div class="row">
				<!-- add/edit -->
				<div class="col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							My Account
							<a href="/logout" class="btn btn-default btn-xs pull-right">Logout</a>
						</div>
						<div class="panel-body">
							<form id="accountForm" role="form" method="post" action="/secure/${hash}/user">
								<div class="form-group">
									<input type="text" id="name" name="name" class="form-control"
									       placeholder="Name" required="true" value="${user.name!}"/>
								</div>
								<div class="form-group">
									<input type="text" id="username" name="username" class="form-control"
									       placeholder="Email" required="true" value="${user.username}"/>
								</div>
								<div class="text-center">
									<a data-toggle="collapse" data-parent="#accordion"
									   href="#changePassword" class="text-primary">
										Click to change password
									</a>
								</div>
								<br/>
								<div id="changePassword" class="panel-collapse collapse">
									<div class="form-group">
										<input type="password" id="password" name="password" class="form-control"
										       placeholder="Password"/>
									</div>
									<div class="form-group">
										<input type="password" id="confirm" name="confirm" class="form-control"
										       placeholder="Confirm"/>
									</div>
								</div>
								<input type="hidden" name="id" value="${user.id}"/>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
							</form>
						</div>
					</div>
				</div>
				<!-- add/edit -->
				<div class="col-sm-3">
					<div id="" class="panel panel-default">
						<div class="panel-heading">Recently Watched Videos</div>
						<div class="panel-body">
							<#list recent as video>
								<div class="text-center video-margin">
									<a href="/secure/${hash}/video/id/${video.id}">
										<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.png')}" class="img-responsive img-thumbnail" alt="Video Thumbnail">
									</a>
									<p class="video-title"><strong>${video}</strong></p>
								</div>
							</#list>
						</div>
					</div>
				</div>
				<div class="col-sm-5">
					<div id="" class="panel panel-default">
						<div class="panel-heading">Saved Worksheets</div>
						<table class="table">
							<tbody>
								<#list worksheets as worksheet>
									<tr>
										<td><strong>${worksheet.videoName}: </strong><a href="/secure/${hash}/worksheet/${worksheet.id}"> View</a></td>
									</tr>
								</#list>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- content -->

		<#include "../stubs/footer.ftl"/>

		<#include "../stubs/scripts.ftl"/>
	</body>
</html>
