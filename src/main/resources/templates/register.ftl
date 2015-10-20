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
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Register</h1>
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
							<div class="col-md-6 col-md-offset-3">
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
										</div>
									</form>

									<span class="boxlink wowhideme "><a href=" " class="defaultbutton mainthemebgcolor"><i class="fa fa-link"></i></a></span>
								</div>
								<div>
									<span>Create a new account<a href=""> here</a></span>
									<span style="float: right">Forgot <a href="">Password</a></span>
								</div>
							</div>

						<#--new account registration-->
							<#--<div class="col-md-3">-->
								<#--<div class="panel-group" id="accordion">-->
									<#--<div class="panel panel-default light">-->
										<#--<div class="panel-heading text-center text-primary light">-->
											<#--<a  class="" data-toggle="collapse" data-parent="#accordion" href="#register">-->
												<#--Create a new account-->
											<#--</a>-->
										<#--</div>-->
										<#--<div id="register" class="panel-collapse collapse ${(register??)?string('in', '')}">-->
											<#--<div class="panel-body light">-->
												<#--<form role="form" method="post" action="/register">-->
													<#--<div class="form-group">-->
														<#--<span class="text-error">${(errors.firstName)!}</span>-->
														<#--<input type="text" id="firstName" name="firstName" class="form-control"-->
															   <#--placeholder="First Name" required="true" value="${(user.firstName)!}"/>-->
													<#--</div>-->
													<#--<div class="form-group">-->
														<#--<span class="text-error">${(errors.lastName)!}</span>-->
														<#--<input type="text" id="lastName" name="lastName" class="form-control"-->
															   <#--placeholder="Last Name" required="true" value="${(user.lastName)!}"/>-->
													<#--</div>-->
													<#--<div class="form-group">-->
														<#--<span class="text-error">${(errors.username)!}</span>-->
														<#--<input type="email" id="username" name="username" class="form-control"-->
															   <#--placeholder="Email" required="true" value="${(user.username)!}"/>-->
													<#--</div>-->
													<#--<!-- toggle show password input &ndash;&gt;-->
													<#--<div class="form-group">-->
														<#--<div class="input-group">-->
															<#--<span class="text-error">${(errors.password)!}</span>-->
															<#--<input type="password" id="toggle-pass" name="password" class="form-control"-->
																   <#--placeholder="Password" required="true" value="${(user.password)!}"/>-->
															<#--<span class="input-group-btn">-->
																<#--<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"-->
																		<#--title="Click to show/hide your password">-->
																	<#--<i class="fa fa-eye-slash"></i>-->
																<#--</button>-->
															<#--</span>-->
														<#--</div>-->
													<#--</div>-->
													<#--<!-- toggle show password input &ndash;&gt;-->
													<#--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
													<#--<button class="btn btn-md btn-primary btn-block" type="submit">Create</button>-->
												<#--</form>-->
											<#--</div>-->
										<#--</div>-->
									<#--</div>-->
								<#--</div>-->
							<#--</div>-->
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