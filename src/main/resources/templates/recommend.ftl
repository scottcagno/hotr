<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "stubs/header.ftl"/>
		<title>Recommendation</title>
	</head>
	<body id="body">

		<#assign link = (auth)?string('/secure/', '')/>

		<div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="${link}/home" class="navbar-brand">${(glob.home)!Home}</a>
				</div>
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${link}/video/all">Videos</a></li>
						<li><a href="${(auth)?string('/secure/user', '/secure/terms')}">${(auth)?string('Account', 'Login')}</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${link}/home#about">About</a></li>
								<li><a href="${link}/home#events">Events</a></li>
								<li><a href="${link}/home#contact">Contact</a></li>
								<li class="divider"></li>
								<li><a href="${link}/donate">Donate</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<#include "stubs/alert.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-lg-offset-4 col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							Recommend
						</div>
						<div class="panel-body text-center">
							<h4>Please provide up to 5 email addresses of friends or family you would like to share Fan the Flame Dates with</h4>
							<br/>
							<div id="recommendDiv">
								<div class="form-group">
									<input class="form-control" type="email" name="email1" placeholder="Email"/>
								</div>
								<div class="form-group">
									<input class="form-control" type="email" name="email2" placeholder="Email"/>
								</div>
								<div class="form-group">
									<input class="form-control" type="email" name="email3" placeholder="Email"/>
								</div>
								<div class="form-group">
									<input class="form-control" type="email" name="email4" placeholder="Email"/>
								</div>

								<div class="form-group">
									<input class="form-control" type="email" name="email5" placeholder="Email"/>
								</div>
								<button id="recommend" class="btn btn-block btn-primary">Recommend</button>
							</div>

						</div>
					</div>
				</div>
				<form id="recommendForm" action="/secure/recommend" method="post" hidden="hidden">
					<input id="emails" name="emails"/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
		</div>
		<!-- content -->

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>
		<script>
			$('button[id="recommend"]').click(function() {
				var emails = []
				var inputs = $('div[id="recommendDiv"] input');
				for (var i = 0; i < inputs.length; i++) {
					if (inputs[i].value != '') {
						emails.push(inputs[i].value);
					}
				}
				$('form[id="recommendForm"] input[id="emails"]').val(emails)
				//alert($('form[id="recommendForm"] input[id="emails"]').val());
				$('form[id="recommendForm"]').submit();
			});
		</script>
		<!-- javascript -->

	</body>
</html>


