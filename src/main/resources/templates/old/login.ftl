<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "stubs/header.ftl"/>
		<title>Login</title>
	</head>
	<body id="body">

		<#include "stubs/navbar.ftl"/>

		<#include "stubs/alert.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-lg-offset-4 col-lg-4 col-sm-offset-3 col-sm-6">
					<form action="/auth/facebook" method="post">
						<button class="btn btn-block"><span class="text-primary">Sign in with Facebook</span>
							<i class="text-primary fa fa-facebook-square fa-lg"></i>
						</button>
						<input type="hidden" name="scope" value="email"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
					<br/>
					<div class="panel-group" id="accordion">
						<div class="panel panel-default light">
							<div class="panel-heading text-center light">
								<a data-toggle="collapse" data-parent="#accordion" href="#login">
									Login to your account
								</a>
							</div>
							<div id="login" class="panel-collapse collapse ${(login??)?string('in','')}">
								<div class="panel-body light">
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
											<button class="btn btn-md btn-primary btn-block" type="submit">Login</button>
										</div>
                                        <div class="text-center">
                                            <a href="/reset/password" class="btn btn-md btn-success btn-block">
                                                Recover Your Password <i class="fa fa-lock" style="color:#fff;"></i>
                                            </a>
                                        </div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-group" id="accordion">
						<div class="panel panel-default light">
							<div class="panel-heading text-center text-primary light">
								<a  class="" data-toggle="collapse" data-parent="#accordion" href="#register">
									Create a new account
								</a>
							</div>
							<div id="register" class="panel-collapse collapse ${(register??)?string('in', '')}">
								<div class="panel-body light">
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
								</div>
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
