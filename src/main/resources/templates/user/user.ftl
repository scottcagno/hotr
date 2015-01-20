<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Account</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
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

		<!-- delete item alert -->
		<div class="container">
			<div id="delete-item-confirm" class="hide alert alert-danger alert-dismissible wow fadeIn" role="alert">
				<form role="form" method="post" class="form-inline" action="">
					<div class="form-group">
						<button class="btn btn-sm btn-danger" type="submit">Yes, I'm sure</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="form-group">
						<button id="delete-item-confirm-cancel" type="button" class="btn btn-default">No, cancel</button>
					</div>
					<div class="form-group pull-right">
						<p class="lead text-danger">
							Are you sure you want to permanently remove this worksheet?
						</p>
					</div>
				</form>
			</div>
		</div>
		<!-- delete item alert -->

		<!-- content -->
		<div id="content" class="container">
			<div class="row">
				<div class="col-lg-7 text-center">
					<#if !user.challenge>
						<div>
							<a href="/secure/challenge" class="btn btn-md btn-success btn-block">Begin Challenge</a>
						</div>
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
					<p>
						<strong>Member Since: ${user.creation?date}</strong>
					</p>
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
							<form id="accountForm" role="form" method="post" action="/secure/user">
								<div class="checkbox">
									<label>
										<input name="monthly" type="checkbox" value="true" ${(user.monthly)?string('checked', '')}> Email me monthly challenge reminders
									</label>
								</div>
								<div class="form-group">
									<label>First Name</label>
									<span class="text-error">${(errors.firstName)!}</span>
									<input type="text" id="firstName" name="firstName" class="form-control"
									       placeholder="First Name" required="true" value="${user.firstName!}"/>
								</div>
								<div class="form-group">
									<label>Spouse's Name (Optional)</label>
									<input type="text" id="spouseName" name="spouseName" class="form-control"
										   placeholder="Spouse's Name" value="${user.spouseName!}"/>
								</div>
								<div class="form-group">
									<label>Last Name</label>
									<span class="text-error">${(errors.lastName)!}</span>
									<input type="text" id="lastName" name="lastName" class="form-control"
										   placeholder="Last Name" required="true" value="${user.lastName!}"/>
								</div>
								<div class="form-group">
									<label>Email</label>
									<span class="text-error">${(errors.username)!}</span>
									<input type="text" id="username" name="username" class="form-control"
									       placeholder="Email" required="true" value="${user.username}"/>
								</div>
								<div class="form-group">
									<label>Spouse's Email (Optional)</label>
									<input type="text" id="spouseEmail" name="spouseEmail" class="form-control"
										   placeholder="Spouse's Email" value="${user.spouseEmail!}"/>
								</div>
								<div class="text-center">
									<a data-toggle="collapse" data-parent="#accordion"
									   href="#changePassword" class="text-primary">
										Click to change password
									</a>
								</div>
								<br/>
								<div id="changePassword" class="panel-collapse collapse">
									<!-- toggle show password input -->
									<div class="form-group">
										<div class="input-group">
											<input type="password" id="toggle-pass" name="password" class="form-control"
												   placeholder="Password" />
                                            <span class="input-group-btn">
                                            	<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
														title="Click to show/hide your password">
													<i class="fa fa-eye-slash"></i>
												</button>
                                            </span>
										</div>
									</div>
									<!-- toggle show password input -->
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
					<div class="panel panel-default">
						<div class="panel-heading">Recently Watched Videos</div>
						<div class="panel-body">
							<#if recent?has_content>
								<#list recent as video>
									<div class="text-center video-margin">
										<a href="/secure/video/id/${video.id}">
											<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.png')}" class="img-responsive img-thumbnail" alt="Video Thumbnail">
										</a>
										<p class="video-title"><strong>${video}</strong></p>
									</div>
								</#list>
							<#else/>
								<div class="text-center">You have no recently watched videos.</div>
							</#if>
						</div>
					</div>
				</div>
				<div class="col-sm-5">
					<div id="" class="panel panel-default">
						<div class="panel-heading">Saved Worksheets</div>
						<table class="table">
							<#if worksheets?has_content>
								<thead>
									<tr>
										<th>Video</th>
										<th>Completed</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<#list worksheets as worksheet>
										<tr>
											<td><strong>${worksheet.videoName}: </strong><a href="/secure/worksheet/${worksheet.id}"> View</a></td>
											<td>${(worksheet.completed?date)!}</td>
											<td>
												<!-- delete item trigger -->
												<span id="delete-item" data-id="/secure/worksheet/del/${worksheet.id}"
													  class="label label-danger" style="cursor:pointer;">
													<i class="fa fa-trash-o"></i> Delete
												</span>
												<!-- delete item trigger -->
											</td>
										</tr>
									</#list>
								</tbody>
							<#else/>
								<div class="text-center">You have no saved worksheets.</div>
							</#if>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- content -->

		<#include "../stubs/footer.ftl"/>

		<#include "../stubs/scripts.ftl"/>

		<script src="/static/js/password.js"></script>

		<script src="/static/js/delete-item.js"></script>
	</body>
</html>
