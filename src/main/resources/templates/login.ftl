<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "stubs/header.ftl"/>
		<title>Login</title>
	</head>
	<body id="body">

		<!-- navbar -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="/home" class="navbar-brand">Home</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/home#about">About</a></li>
						<li><a href="/home#events">Events</a></li>
						<li><a href="/home#contact">Contact</a></li>
						<li><a href="/video/all">Videos</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- navbar -->

		<#include "stubs/alert.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-lg-offset-4 col-lg-4 col-sm-offset-3 col-sm-6">
					<form action="/auth/facebook" method="post">
						<button class="btn btn-primary btn-block">Sign in with Facebook
							<i class="fa fa-facebook-square fa-lg"></i>
						</button>
						<input type="hidden" name="scope" value="email"/>
						<input type="hidden" name="redirect" value="http://node2.cagnosolutions.com/auth/facebook"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
					<br/>
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading text-center">
								<a data-toggle="collapse" data-parent="#accordion" href="#login">
									Login to your account
								</a>
							</div>
							<div id="login" class="panel-collapse collapse ${(login??)?string('in','')}">
								<div class="panel-body">
									<form role="form" method="post" action="/login">
										<div class="form-group">
											<input type="text" name="username" class="form-control" placeholder="Email"
											${(username??)?string('', 'autofocus="true"')} required="true" value="${username!}"/>
										</div>
										<div class="form-group">
											<input type="password" name="password" class="form-control" placeholder="Password"
											${(username??)?string('autofocus="true"', '')} required="true"/>
										</div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<div class="form-group">
											<button class="btn btn-md btn-success btn-block" type="submit">Login</button>
										</div>
										<a href="/reset/password">Forgot my password</a>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading text-center text-primary">
							<a data-toggle="collapse" data-parent="#accordion" href="#register">
								Create a new account
							</a>
						</div>
						<div id="register" class="panel-collapse collapse ${(register??)?string('in', '')}">
							<div class="panel-body">
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
									<button class="btn btn-md btn-success btn-block" type="submit">Create</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<#include "stubs/footer.ftl"/>

		<#include "stubs/scripts.ftl"/>
		<script src="/static/js/password.js"></script>

	</body>
</html>
