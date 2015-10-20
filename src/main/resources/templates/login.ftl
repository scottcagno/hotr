<!DOCTYPE html>
<html lang="en-US">
	<head>
		<!-- HEADER IMPORT -->
		<#include "stubs/header.ftl"/>
		<title>Login - Fan The Flame Dates</title>
	</head>

	<body class="boxedlayout">
		<div class="boxedcontent">

			<!-- BEGIN NAVBAR -->
			<#include "stubs/navbar.ftl"/>
			<!-- END NAVBAR -->

			<!-- begin header -->
			<section class="colorarea">
				<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
			</section>
			<div class="container">
				<div class="row">
					<div class="col-md-12 negmtop">
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Please Login</h1>
						<#--<span class="pagedescrarea text-right animated fadeInRight pull-right">-->
							<#--Fan the Flames-->
						<#--</span>-->
					</div>
				</div>
			</div>
			<!-- end header -->

			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<div class="shortcode row">
							<div class="col-md-4 col-md-offset-1">
								<div class="box1">
									<div class="striped">
									</div>
									<h6><i class=" fa fa-user ">
									</i> Please Login </h6>
									<div style="height: 5px"></div>
									<div class="done">
										<div class="alert alert-success">
											<button type="button" class="close" data-dismiss="alert">×</button>
											Your message has been sent. Thank you!
										</div>
									</div>
									<form method="post" action="/login">
										<div class="form">
											<input type="text" name="username" class="col-sm-12" placeholder="Username">
											<input type="password" name="password" class="col-sm-12" placeholder="Password">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<button type="submit" id="submit" class="btn btn-primary btn-block">Submit</button>
										</div>
									</form>

									<p class="text-center" style="margin-top:10px">
										<strong>OR</strong>
									</p>

									<form action="/auth/facebook" method="post">
										<button class="btn btn-block"><span class="text-primary">Sign in with Facebook</span>
											<i class="text-primary fa fa-facebook-square fa-lg"></i>
										</button>
										<input type="hidden" name="scope" value="email"/>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									</form>

									<span class="boxlink wowhideme "><a href=" " class="defaultbutton mainthemebgcolor"><i class="fa fa-link"></i></a></span>
								</div>
								<div>
									<span>Create a new account<a href=""> here</a></span>
									<span style="float: right">Forgot <a href="">Password</a></span>
								</div>
							</div>

							<#--new account registration-->
							<div class="col-md-4 col-md-offset-2">
								<div class="box1">
									<div class="striped">
									</div>
									<h6><i class=" fa fa-user ">
									</i> Create New Account </h6>
									<div style="height: 5px"></div>
									<div class="done">
										<div class="alert alert-success">
											<button type="button" class="close" data-dismiss="alert">×</button>
											Your message has been sent. Thank you!
										</div>
									</div>
									<form role="form" method="post" action="/register">
										<div class="form-group">
											<span class="text-error">${(errors.firstName)!}</span>
											<input type="text" id="firstName" name="firstName" class="col-sm-12"
												   placeholder="First Name" required="true" value="${(user.firstName)!}"/>
										</div>
										<div class="form-group">
											<span class="text-error">${(errors.lastName)!}</span>
											<input type="text" id="lastName" name="lastName" class="col-sm-12"
												   placeholder="Last Name" required="true" value="${(user.lastName)!}"/>
										</div>
										<div class="form-group">
											<span class="text-error">${(errors.username)!}</span>
											<input type="email" id="username" name="username" class="col-sm-12"
												   placeholder="Email" required="true" value="${(user.username)!}"/>
										</div>
										<!-- toggle show password input -->
										<div class="form-group">
											<div class="">
												<span class="text-error">${(errors.password)!}</span>
												<input type="password" id="toggle-pass" name="password" class="col-sm-10"
													   placeholder="Password" required="true" value="${(user.password)!}"/>
												<span class="col-sm-1">
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
									<span class="boxlink wowhideme "><a href=" " class="defaultbutton mainthemebgcolor"><i class="fa fa-link"></i></a></span>
								</div>
							</div>
							<#--registration end-->

						</div>
					</div>
				</div>
			</div>
			<!-- end container -->

			<!-- BEGIN FOOTER -->
			<#include "stubs/footer.ftl"/>
			<!-- END FOOTER -->

			<!-- BEGIN SCRIPTS -->
			<#include "stubs/scripts.ftl"/>
			<!-- END SCRIPTS -->

		</div><!-- end boxedcontent -->
	</body>
</html>