<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Home</title>
		<#include "stubs/header.ftl"/>
		<style>textarea{resize: none;}</style>
	</head>
	<body>
		<!-- navbar -->
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="/home" class="navbar-brand">${(glob.home)!Home}</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/home#about">About</a></li>
						<li><a href="/home#events">Events</a></li>
						<li><a href="/home#contact">Contact</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- navbar -->
		<!-- *** beg content section *** -->
		<section id="content" class="container">
			<#include "stubs/alert.ftl"/>
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4">
					<div class="panel panel-default translucent">
						<div class="panel-heading">
							<span class="lead">Password Reset</span>
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
									<label for="username">Account Email</label>
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
		<!-- *** end content section *** -->
		<#include "stubs/scripts.ftl"/>
		<#include "stubs/footer.ftl"/>
		<script>
        (function(){
			$('form[id="password-reset"]').on('submit',function(){
				$(this).addClass('hide');
				$('div[id="spinner"]').removeClass('hide');
			});
        })();
    </script>
	</body>
</html>