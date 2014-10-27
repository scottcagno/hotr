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
						<li><a href="/secure/${hash}/video"> Videos</a></li>
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
				<div class="col-lg-8">
					<#if !user.challenge>
						<form id="challengeForm" role="form" method="post" action="/user/challenge">
							<input type="hidden" name="userId" value="${user.id}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-md btn-default btn-block" type="submit">Begin Challenge</button>
						</form>
					<#else/>
						<div class="wizard">
							<a class="${(user.progress?size >= 1)?string('current', 'disabled')}"> 1</a>
							<a class="${(user.progress?size >= 2)?string('current', 'disabled')}"> 2</a>
							<a class="${(user.progress?size >= 3)?string('current', 'disabled')}"> 3</a>
							<a class="${(user.progress?size >= 4)?string('current', 'disabled')}"> 4</a>
							<a class="${(user.progress?size >= 5)?string('current', 'disabled')}"> 5</a>
							<a class="${(user.progress?size >= 6)?string('current', 'disabled')}"> 6</a>
							<a class="${(user.progress?size >= 7)?string('current', 'disabled')}"> 7</a>
							<a class="${(user.progress?size >= 8)?string('current', 'disabled')}"> 8</a>
							<a class="${(user.progress?size >= 9)?string('current', 'disabled')}"> 9</a>
							<a class="${(user.progress?size >= 10)?string('current', 'disabled')}"> 10</a>
							<a class="${(user.progress?size >= 11)?string('current', 'disabled')}"> 11</a>
							<a class="${(user.progress?size >= 12)?string('current', 'disabled')}"> 12</a>
						</div>
					</#if>
					<br/>
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
							<form id="accountForm" role="form" method="post" action="/user">
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
									<a href="/video/${video.id}">
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
						<div class="panel-body">
							<#list worksheets as worksheet>
								Worksheet for: <strong>${worksheet.videoName}</strong><a href="/secure/${hash}/worksheet/${worksheet.id}"> View</a><br/>
							</#list>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="deleteCheck" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">Are you sure?</h4>
					</div>
					<div class="modal-body">
						Permanently remove user? This action cannot be undone.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-md pull-left" data-dismiss="modal">No, Cancel</button>
                        <span id="delete">
                            <form role="form" method="post" action="/user/${user.id}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button type="submit" class="btn btn-primary btn-md">Yes, Remove User</button>
							</form>
                        </span>

					</div>
				</div>
			</div>
		</div>

		<!-- content -->

		<#include "../stubs/footer.ftl"/>

		<#include "../stubs/scripts.ftl"/>
	</body>
</html>
