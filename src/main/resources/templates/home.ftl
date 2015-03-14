<!DOCTYPE html>
<html lang="en">
	<head>
		<#include "stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/shadows.css"/>
        <title>Home</title>
	</head>
	<body id="top">


		<!-- navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					${(glob.home)!Home}
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
                        <li><a href="#about">About</a></li>
						<li><a href="#events">Events</a></li>
						<li><a href="#contact">Contact</a></li>
						<li><a href="/blog">Blog</a></li>
                        <li><a href="/video/all">Videos</a></li>
                        <li><a href="${(auth)?string('/secure/user', '/secure/home')}">${(auth)?string('Account', 'Login')}</a></li>
                    </ul>
				</div>
			</div>
		</div>
		<!-- navbar -->

		<!-- carousel -->
        <div class="navbar-margin-sm">
            <div class="container">
                <div class="col-lg-9">
                    <#include "stubs/carousel.ftl"/>
                </div>
                <div class="col-lg-3 navbar-margin-sm">

						<div class="panel panel-default">
							<div class="panel-heading">
								Hot Topics
							</div>
							<div class="panel-body style="max-height:725px; overflow-y:scroll;">

								<a href="#" class="btn btn-block red">
                                    Some Topic <span class="badge pull-right">99 Views</span>
								</a>
								<a href="#" class="btn btn-block red">
									Some Topic <span class="badge pull-right">99 Views</span>
								</a>
								<a href="#" class="btn btn-block red">
									Some Topic <span class="badge pull-right">99 Views</span>
								</a>
								<a href="#" class="btn btn-block red">
									Some Topic <span class="badge pull-right">99 Views</span>
								</a>
								<a href="#" class="btn btn-block red">
									Some Topic <span class="badge pull-right">99 Views</span>
								</a>
								<a href="#" class="btn btn-block red">
									Some Topic <span class="badge pull-right">99 Views</span>
								</a>
								<a href="#" class="btn btn-block red">
									Some Topic <span class="badge pull-right">99 Views</span>
								</a>
								<a href="#" class="btn btn-block red">
									Some Topic <span class="badge pull-right">99 Views</span>
								</a>
								<a href="#" class="btn btn-block red">
									Some Topic <span class="badge pull-right">99 Views</span>
								</a>
							    <a href="#" class="btn btn-block red">
							    	Some Topic <span class="badge pull-right">99 Views</span>
							    </a>
							    <a href="#" class="btn btn-block red">
							    	Some Topic <span class="badge pull-right">99 Views</span>
							    </a>
							    <a href="#" class="btn btn-block red">
							    	Some Topic <span class="badge pull-right">99 Views</span>
							    </a>
							    <a href="#" class="btn btn-block red">
							    	Some Topic <span class="badge pull-right">99 Views</span>
							    </a>
							    <a href="#" class="btn btn-block red">
							    	Some Topic <span class="badge pull-right">99 Views</span>
							    </a>
							    <a href="#" class="btn btn-block red">
							    	Some Topic <span class="badge pull-right">99 Views</span>
							    </a>
							    <a href="#" class="btn btn-block red">
							    	Some Topic <span class="badge pull-right">99 Views</span>
							    </a>
							    <a href="#" class="btn btn-block red">
							    	Some Topic <span class="badge pull-right">99 Views</span>
							    </a>
							    <a href="#" class="btn btn-block red">
							    	Some Topic <span class="badge pull-right">99 Views</span>
							    </a>

                            <#--<#list topics as topic>-->
								<#--<a href="/video/all?topic=${topic.topic}" class="btn btn-block red">-->
                                <#--${topic.topic?cap_first} <span class="badge pull-right">${topic.watched} Views</span>-->
								<#--</a>-->
                            <#--</#list>-->
							</div>
						</div>


                </div>
            </div>
        </div>

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
        <!-- javascript -->

	</body>
</html>