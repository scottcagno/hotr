<!DOCTYPE html>
<html lang="en">
	<head>

		<title>Home</title>
		<#include "stubs/header.ftl"/>

	</head>
	<body>
		<#include "stubs/google-tag-manager-body.ftl"/>
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
					<h1 class="pgheadertitle animated fadeInLeft pull-left">Password Recovery</h1>
					<span class="pagedescrarea text-right animated fadeInRight pull-right">
					</span>
				</div>
			</div>
		</div>
		<!-- header -->

		<!-- content -->
		<section class="container">
			<br/>
			<#include "stubs/alert.ftl"/>
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4">
					<div class="panel panel-default translucent">
						<div class="panel-heading">
							<span class="lead">Password Recovery</span>
						</div>
						<div class="panel-body">
							<div id="spinner" class="text-center hide">
								<p class="lead">
									<strong>Processing...</strong><br/>
								</p>
								<i class="fa fa-5x fa-circle-o-notch fa-spin"></i>
								<p class="lead">One moment please.</p>
							</div>
							<form id="password-reset" role="form" method="post" action="/reset/password">
								<div class="form-group">
									<label class="black-text" for="username">Account Email</label>
									<input id="username" type="email" name="username" class="form-control" placeholder="Email" required="true"/>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button class="btn btn-md btn-block btn-primary" type="submit">Recover My Password</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- content -->

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>
		<script>
			(function(){
				$('form[id="password-reset"]').on('submit',function(){
					$(this).addClass('hide');
					$('div[id="spinner"]').removeClass('hide');
				});
			})();
		</script>
		<!-- javascript -->

	</body>
</html>