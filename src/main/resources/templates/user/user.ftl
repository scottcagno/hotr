<!DOCTYPE html>
<html lang="en" itemscope itemtype="http://schema.org/Organization">
	<head id="head">

		<#include "../stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/user.css"/>
		<title>Account</title>

	</head>
	<body id="body">

		<!-- navbar -->
		<#include "../stubs/navbar.ftl"/>
		<!-- navbar -->

		<!-- header -->
		<section class="colorarea">
			<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
		</section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 negmtop">

					<!-- progress/challenge -->
					<span class="row col-lg-7 pgheadertitle animated fadeInLeft pull-left">
						<div class="text-center">
							<#if !user.challenge>
								<div>
									<a href="/challenge" class="btn btn-md btn-success btn-block black-border"><span class="bold-panel">CLICK</span><span>to</span><span class="bold-panel red-panel">BEGIN</span><span class="gray-panel">CHALLENGE</span></a>
								</div>
							<#else>
								<#assign width = (user.progress?size / 12) * 100/>
								<p>
									<strong>Challenge Progress</strong>
								</p>
								<div class="progress">
									<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${width}%;">
										<span>${user.progress?size}/12</span>
									</div>
								</div>
							</#if>
							<br/>
						</div>
					</span>
					<!-- progress/challenge -->

					<!-- recommend -->
					<span class="pagedescrarea text-right animated fadeInRight pull-right">
						<p>
							<strong>Member Since: ${user.creation?date}</strong>
						</p>
						<p>
							<a href="/secure/recommend">Recommend us to your family and friends</a>
						</p>
					</span>
					<!-- recommend -->

				</div>
			</div>
		</div>
		<!-- header -->

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

		<div class="container">

			<#include "../stubs/alert.ftl"/>

			<div class="row">

				<!-- edit -->
				<div class="col-sm-4">
					<div class="panel panel-default panel1">
						<div class="panel-heading clearfix">
							My Account
							<a href="/logout" class="btn btn-default btn-sm pull-right">Logout</a>
						</div>
						<form class="red-panel" id="accountForm" role="form" method="post" action="/secure/user">
							<div class="checkbox">
								<label class="text-black">
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
								<p class="text-black">
									${user.username}
								</p>
							</div>
							<div class="form-group">
								<label>Spouse's Email (Optional)</label>
								<input type="text" id="spouseEmail" name="spouseEmail" class="form-control"
									   placeholder="Spouse's Email" value="${user.spouseEmail!}"/>
							</div>
							<#if !user.social>
								<div class="text-center">
									<a data-toggle="collapse" data-parent="#accordion"
									   href="#changePassword" class="" style="a:hover: #666;a:focus: #666;">
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
							</#if>
							<input type="hidden" name="id" value="${user.id}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
						</form>
					</div>
				</div>
				<!-- add -->

				<!-- recently watched -->
				<div class="col-sm-3">
					<div class="panel panel-default panel1">
						<div class="panel-heading">Recently Watched Videos</div>
						<#if recent?has_content>
							<#list recent as video>
								<div class="text-center video-margin">
									<a href="/video/id/${video.id}">
										<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.png')}" class="img-responsive img-thumbnail" alt="Video Thumbnail">
									</a>
									<p class="video-title"><strong>${video.name}</strong></p>
								</div>
							</#list>
						<#else>
							<div class="text-center black-text">You have no recently watched videos.</div>
						</#if>
					</div>
				</div>
				<!-- recently watched -->

				<!-- saved worksheets -->
				<div class="col-sm-5">
					<div id="" class="panel panel-default panel1">
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
							<#else>
								<div class="text-center black-text">You have no saved worksheets.</div>
							</#if>
						</table>
					</div>
				</div>
				<!-- saved worksheets -->

			</div>
		</div>

		<!-- footer -->
		<#include "../stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "../stubs/scripts.ftl"/>
		<script src="/static/js/password.js"></script>
		<script src="/static/js/delete-item.js"></script>
		<!-- javascript -->

	</body>
</html>
