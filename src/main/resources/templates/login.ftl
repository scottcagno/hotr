<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Account</title>
		<#include "stubs/header.ftl"/>
	</head>
	<body id="body">
		<#include "stubs/navbar.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-lg-offset-4 col-lg-4 col-sm-offset-3 col-sm-6">
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading text-center">
								<a data-toggle="collapse" data-parent="#accordion" href="#login">
									Login to your account
								</a>
							</div>
							<div id="login" class="panel-collapse collapse ${(login??)?string("in", "")}">
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
										<button class="btn btn-md btn-success btn-block" type="submit">Login</button>
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
						<div id="register" class="panel-collapse collapse ${(register??)?string("in", "")}">
							<div class="panel-body">
								<form role="form" method="post" action="/register">
									<div class="form-group">
										<input type="text" id="name" name="name" class="form-control"
										       placeholder="Name" required="true" />
									</div>
									<div class="form-group">
										<input type="email" id="username" name="username" class="form-control"
										       placeholder="Email" required="true" />
									</div>
									<div class="form-group">
										<input type="password" id="password" name="password" class="form-control"
										       placeholder="Password" required="true" />
									</div>
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

	</body>
</html>
