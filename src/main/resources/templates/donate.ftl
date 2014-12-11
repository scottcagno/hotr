<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "stubs/header.ftl"/>
		<title>Donate</title>
	</head>
	<body id="body">

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

		<#include "stubs/alert.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="well well-lg text-center">
				<h3>“Fan the Flame Dates” is funded through generous donations from supporters like you!</h3>
				<br/>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
					<input name="cmd" type="hidden" value="_s-xclick" />
					<input name="hosted_button_id" type="hidden" value="4AYV2BCD63B8U" />
					<input alt="PayPal - The safer, easier way to pay online!" name="submit" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" type="image" />
					<img src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" alt="" width="1" height="1" border="0" />
				</form>
			</div>
		</div>
		<!-- content -->

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>
		<!-- javascript -->

	</body>
</html>


