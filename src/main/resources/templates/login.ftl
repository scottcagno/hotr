<!DOCTYPE html>
<html lang="en-US">
	<head>

		<#include "stubs/header.ftl"/>
		<title>Login - Fan The Flame Dates</title>

	</head>

	<body class="boxedlayout">
		<#include "stubs/google-tag-manager-body.ftl"/>
		<div class="boxedcontent">

			<!-- navbar -->
			<#include "stubs/navbar.ftl"/>
			<!-- navbar -->

			<!-- header -->
			<section class="colorarea">
				<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
			</section>
			<div class="container">
				<div class="row">
					<div class="col-md-12 negmtop">
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Please Login</h1>
					</div>
				</div>
			</div>
			<!-- header -->

			<div class="container">

				<#include "stubs/alert.ftl"/>

				<div class="row">
					<div class="col-md-12">
						<div class="shortcode row">

							<!-- login -->
							<div class="col-md-5">
								<div class="box1">
									<div class="striped"></div>
									<h6>
										<i class=" fa fa-user"></i>
										Please Login
									</h6>
									<form method="post" action="/login">
										<div class="form">
											<div class="form-group">
												<input type="text" name="username" class="form-control" placeholder="Username">
											</div>
											<div class="input-group form-group">
												<input type="password" id="toggle-pass" name="password" class="form-control" placeholder="Password" />
                                	        	<span class="input-group-btn">
                                	           		<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
															title="Click to show/hide your password">
														<i class="fa fa-eye-slash"></i>
													</button>
                                	        	</span>
											</div>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<button type="submit" id="submit" class="btn btn-primary btn-block">Submit</button>
										</div>
									</form>
									<p class="text-center" style="margin-top:10px">
										<strong>OR</strong>
									</p>

									<!-- facebook -->
									<form action="/auth/facebook" method="post">
										<button class="btn btn-block"><span class="text-primary">Sign in with Facebook</span>
											<i class="text-primary fa fa-facebook-square fa-lg"></i>
										</button>
										<input type="hidden" name="scope" value="email"/>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									</form>
									<!-- facebook -->

									<span class="boxlink wowhideme "><a href=" " class="defaultbutton mainthemebgcolor"><i class="fa fa-link"></i></a></span>
								</div>
								<div>
									<span class="pull-right">Forgot <a href="/reset/password">Password</a></span>
								</div>
							</div>
							<!-- login -->

							<!-- register -->
							<div class="col-md-5 col-md-offset-2">
								<div class="box1">
									<div class="striped"></div>
									<h6>
										<i class=" fa fa-user"></i> Create New Account
									</h6>
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
										<div class="input-group form-group">
											<input type="password" id="toggle-pass" name="password" class="form-control" placeholder="Password" />
                                	    	<span class="input-group-btn">
                                	          		<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
														title="Click to show/hide your password">
													<i class="fa fa-eye-slash"></i>
												</button>
                                	    	</span>
										</div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<button class="btn btn-md btn-primary btn-block" type="submit">Create</button>
									</form>
									<span class="boxlink wowhideme "><a href=" " class="defaultbutton mainthemebgcolor"><i class="fa fa-link"></i></a></span>
								</div>
							</div>
							<!-- register -->

						</div>
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

		</div>
	</body>
</html>