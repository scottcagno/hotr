<!DOCTYPE html>
<html lang="en">
	<head>
		<#include "stubs/header.ftl"/>
		<title>Challenge</title>
	</head>
	<body id="top">

		<#assign link = (auth)?string('/secure/', '')/>

		<!-- navbar -->
		<#assign link = (auth)?string('/secure', '')/>

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
						<li><a href="${link}/video/all"> Videos</a></li>
						<li><a href="${(auth)?string('/secure/user', '/register')}">${(auth)?string('Account', 'Login')}</a></li>
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
		<!-- navbar -->

		<#include "stubs/alert.ftl"/>
		<div id="content" class="container">
			<div class="row">
				<div class="text-center">DEVELOPER note: We will spice this up at some point</div>
				<br/>
				<div class="col-lg-8 col-lg-offset-2 well well-lg">
					We like to protect things … we protect our house through home owners insurance … we protect our kids by sheltering them from harmful situations, yet very few of us are actively protecting our marriages from outside threats.
					<br/><br/>
					Research shows the odds of a couple getting a divorce or separation drop drastically if that couple “protects” their marriage by completing a monthly marriage program for the course of a year.
					<br/><br/>
					We’ve designed our “One Year Challenge” in our “Fan the Flame Dates” to help you grow and strengthen the intimacy in your relationship … and protect your marriage for years to come!
					By signing up for an account, you’ll be able to track your monthly progress … answer our “Knee to Knee, Nose to Nose” questions as a couple at the end of each video … and save your answers to reflect on in the future.
					<br/><br/>
					<#if auth>
						<form id="challengeForm" role="form" method="post" action="/secure/user/challenge">
							<input type="hidden" name="userId" value="${userSession.id}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="form-group row">
								<div class="col-sm-8">
									<button class="btn btn-md btn-success btn-block" type="submit">I'm ready to take the challenge</button>
								</div>
								<div class="col-sm-4">
									<div class="checkbox">
										<label>
											<input name="monthly" type="checkbox" value="true"> Email me monthly reminders
										</label>
									</div>
								</div>
							</div>
						</form>
					<#else/>
						Simply click the “log in” button at the top of your screen to create an account and get started!
					</#if>
				</div>
			</div>
		</div>

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>

		<!-- javascript -->

	</body>
</html>