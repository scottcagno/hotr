<!DOCTYPE html>
<html lang="en">
	<head>

		<#include "stubs/header.ftl"/>
		<title>Challenge</title>

	</head>
	<body class="boxedlayout" id="top">
		<div class="boxedcontent">

			<#include "stubs/navbar.ftl"/>

			<#include "stubs/alert.ftl"/>

			<!-- header -->
			<section class="colorarea">
				<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
			</section>
			<div class="container">
				<div class="row">
					<div class="col-md-12 negmtop">
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Take the Challenge</h1>
						<span class="pagedescrarea text-right animated fadeInRight pull-right">
							Fan the Flames
						</span>
					</div>
				</div>
			</div>
			<!-- header -->

			<div class="container">
				<div class="row">

					<!-- about  -->
					<div class="col-md-8">
						<div class="text-center text-white">
							<h3>Ready to Fan the Flame of your marriage?<br/> Take the ONE YEAR CHALLENGE!</h3>
							<div class="row">
								<div class="well well-sm row col-md-offset-3 col-md-6">
									<img src="/static/img/One_Year_Challenge.png" class="img-responsive" alt="">
								</div>
							</div>
							<br>
							<p class="lead">
								Here's how our free program works. After you create a login:
							</p>
							<ul class="text-left">
								<li>Watch a new Fan the Flame Date every month</li>
								<li>Answer the questions at the end of the video</li>
								<li>You'll see your progress bar grow after each one is completed</li>
								<li>Next month ... repeat the process!</li>
								<li>Don't forget to recommend this to your friends and family so they can Fan the Flame of their marriage too!</li>
							</ul>
							<p>
								Intimacy, passion and unity will begin to grow throughout the months as you work together.
								If you forget a month ... don't worry ...we'll send you an email reminder so you can catch up.
							</p>
							<p>
								Each month new videos will be added to the site ...and you'll receive recommendations based
								on your personal viewing taste.
							</p>
						</div>
					</div>
					<!-- about  -->

					<!-- register/start -->
					<div class="col-md-4">
						<div class="text-center">
							<#if !auth>

								<!-- facebook -->
								<form action="/auth/facebook" method="post">
									<button class="btn btn-block"><span class="text-primary">Sign in with Facebook</span>
										<i class="text-primary fa fa-facebook-square fa-lg"></i>
									</button>
									<input type="hidden" name="scope" value="email"/>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								</form>
								<br/>
								<!-- facebook -->

							</#if>
							<div class="panel panel-default light">
								<div class="panel-heading light">
									${(auth)?string('Begin Challenge', 'Register')}
								</div>
								<div class="panel-body light">
									<#if auth>

										<!-- start -->
										<form id="challengeForm" role="form" method="post" action="/secure/user/challenge">
											<input type="hidden" name="userId" value="${userSession.id}"/>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
												<div class="form-group">
													<div class="checkbox">
														<label>
															<input name="monthly" type="checkbox" value="true"> Email me monthly reminders
														</label>
													</div>
												</div>
											<button class="btn btn-md btn-success btn-block" type="submit">I'm ready to take the challenge</button>
										</form>
										<!-- start -->

									<#else>

										<!-- register -->
										<form role="form" method="post" action="/register">
											<div class="form-group">
												<span class="text-error">${(errors.firstName)!}</span>
												<input type="text" id="firstName" name="firstName" class="form-control"
													   placeholder="First Name" required="true" value="${(user.firstName)!}"/>
											</div>
											<div class="form-group">
												<span class="text-error">${(errors.lastName)!}</span>
												<input type="text" id="lastName" name="lastName" class="form-control"
													   placeholder="Last Name" required="true" value="${(user.lastName)!}"/>
											</div>
											<div class="form-group">
												<span class="text-error">${(errors.username)!}</span>
												<input type="email" id="username" name="username" class="form-control"
													   placeholder="Email" required="true" value="${(user.username)!}"/>
											</div>

											<!-- toggle show password input -->
											<div class="form-group">
												<div class="input-group">
													<span class="text-error">${(errors.password)!}</span>
													<input type="password" id="toggle-pass" name="password" class="form-control"
														   placeholder="Password" required="true" value="${(user.password)!}"/>
													<span class="input-group-btn">
														<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
																title="Click to show/hide your password">
															<i class="fa fa-eye-slash"></i>
														</button>
													</span>
												</div>
											</div>
											<!-- toggle show password input -->

											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<button class="btn btn-md btn-primary btn-block" type="submit">Create</button>
										</form>
										<!-- register -->

									</#if>
								</div>
							</div>
						</div>
					</div>
					<!-- register/start -->

				</div>
			</div>
		</div>

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>
		<script src="/static/js/password.js"></script>
		<!-- javascript -->

	</body>
</html>