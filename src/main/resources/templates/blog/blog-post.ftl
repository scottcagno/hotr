<!DOCTYPE html>
<html lang="en">
	<head>
    <#include "../stubs/header.ftl"/>
	<link rel="stylesheet" href="/static/css/blog.css"/>
    <title>Blog Post</title>
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
				<a href="#top" class="navbar-brand">
                   ${(glob.home)!''}
				</a>
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


	<!-- content -->
	<div class="container">

		<!-- blog header -->
		<div class="blog-header">
			<h1 class="blog-title">House On The Rock</h1>
			<p class="lead blog-description">
				Family Ministries Blog.
				<em>Building Men, Marriages, Families and Churches.</em>
			</p>
		</div>
		<!-- blog header -->

        <div class="row">

			<!-- blog main -->
			<div class="col-sm-8 blog-main">

				<!-- blog post -->
				<div class="blog-post">
					<h2 class="blog-post-title">
						${(blog.title)!}
					</h2>
					<p class="blog-post-meta">
						${(blog.date)?string["MMMM dd, yyyy hh:mm a (EEEE)"]}
					</p>
					<p>${(blog.body)!}</p>
				</div>
				<!-- blog post -->

			</div>
			<!-- blog main -->

			<!-- blog sidebar / archives -->
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module">
					<h4>Archives</h4>
					<ol class="list-unstyled">
						<#list blogs as blog>
							<li>
								<a href="/blog/${(blog.id)?c}"
								   data-trigger="hover" data-container="body" data-toggle="popover"
								   	data-placement="left" data-content="${(blog.title)!}...">
									${(blog.date)?string["MMMM dd, yyyy"]}
								</a>
							</li>
						</#list>
					</ol>
				</div>
			</div>
			<!-- blog sidebar / archives -->

        </div>
    </div>
	<!-- content -->

	<!-- javascript -->
    <#include "../stubs/scripts.ftl"/>
	<script>$(function(){$('[data-toggle="popover"]').popover();});</script>
	<!-- javascript -->

	</body>
</html>
