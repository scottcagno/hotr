<!DOCTYPE html>
<html lang="en">
	<head>
		<#include "stubs/header.ftl"/>
		<title>Home</title>
	</head>
	<body id="top">

		<#assign link = (auth)?string('/secure', '')/>

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
					<a href="#top" class="navbar-brand">${(glob.home)!Home}</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
                        <li><a href="#about">About</a></li>
						<li><a href="#events">Events</a></li>
						<li><a href="#contact">Contact</a></li>
                        <li><a href="${link}/video/all">Videos</a></li>
                        <li><a href="${(auth)?string('/secure/user', '/secure/home')}">${(auth)?string('Account', 'Login')}</a></li>
                    </ul>
				</div>
			</div>
		</div>
		<!-- navbar -->

		<!-- carousel -->
		<#include "stubs/carousel.ftl"/>
		<!-- carousel -->

		<#if alert??>
			<br/>
			<div class="container">
				<div id="alert">
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						${alert}
					</div>
				</div>
			</div>
		</#if>
		<#if userSession?? && userSession.progress == 6>
			<br/>
			<div class="container">
				<div class="alert alert-info alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					You have hit the half way mark in your challenge.
					If you can think of anyone who could benefit from Fan the Flame Dates please take the time to
					<a href="/secure/recommend">recommend</a> us.
				</div>
			</div>
		</#if>

		<!-- about -->

		<#include "stubs/about.ftl"/>
		<!-- about -->

		<!-- events -->
		<#include "stubs/events.ftl"/>
		<!-- events -->

		<!-- contact -->
		<#include "stubs/contact.ftl"/>
		<!-- contact -->

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>
		<script src="/static/js/home.js"></script>
		<script>


        </script>
        <!-- javascript -->

	</body>
</html>