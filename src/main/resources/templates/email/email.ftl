<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Home</title>
    <#include "../stubs/header.ftl"/>
		<style>textarea{resize: none;}</style>
	</head>
	<body>

		<div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="${link}/home" class="navbar-brand">Home</a>
				</div>
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${link}/video/all"> Videos</a></li>
						<li><a href="${(auth)?string('/secure/user', '/secure/donate')}">${(auth)?string('Account', 'Login')}</a></li>
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


		<!-- *** beg content section *** -->
		<section id="content" class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4">
					<div class="">
						<div class="panel panel-default translucent">
							<div class="panel-heading">
								<span class="lead">Email Form</span>
							</div>
							<div class="panel-body">
								<form role="form" method="post" action="/email">
									<div class="form-group">
										<#--<label for="from">From</label>-->
										<input id="from" type="text" name="from" class="form-control" placeholder="From" required="true"/>
									</div>
									<div class="form-group">
										<#--<label for="to">To</label>-->
										<input id="to" type="text" name="to" class="form-control" placeholder="To" required="true"/>
									</div>
									<div class="form-group">
										<#--<label for="subject">Subject</label>-->
										<input id="subject" type="text" name="subject" class="form-control" placeholder="Subject" required="true"/>
									</div>
									<div class="form-group">
										<#--<label for="text">Body</label>-->
										<textarea id="text" name="text" class="form-control" cols="30" rows="5" placeholder="Body" required="true"></textarea>
									</div>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<button class="btn btn-md btn-block btn-primary" type="submit">Send Email</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- *** end content section *** -->
    <#include "../stubs/scripts.ftl"/>
    <#include "../stubs/footer.ftl"/>
	</body>
</html>
