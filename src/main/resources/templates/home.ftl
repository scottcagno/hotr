<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Home</title>
		<#include "stubs/header.ftl"/>
	</head>
	<body id="top">

		<#assign link = (auth)?string('/secure/', '')/>

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
					<a href="#top" class="navbar-brand">Home</a>
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
		<!-- javascript -->

	</body>
</html>