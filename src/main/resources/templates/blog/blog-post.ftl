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
                        Sample blog post
                    </h2>
					<p class="blog-post-meta">
                        January 1, 2014 by <a href="#">Jeff</a>
                    </p>
					<p>
                        This is a sample blog post. There is not really much here yet but eventually this will be hooked
                        up to a WYSIWYG on the admin side. I don't think this looks too bad.
                    </p>
					<hr>
				</div>
				<!-- blog post -->

			</div>
			<!-- blog main -->

			<!-- blog sidebar / archives -->
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module">
					<h4>Archives</h4>
					<ol class="list-unstyled">
						<li><a href="#">March 2014</a></li>
						<li><a href="#">February 2014</a></li>
						<li><a href="#">January 2014</a></li>
						<li><a href="#">December 2013</a></li>
						<li><a href="#">November 2013</a></li>
						<li><a href="#">October 2013</a></li>
						<li><a href="#">September 2013</a></li>
						<li><a href="#">August 2013</a></li>
						<li><a href="#">July 2013</a></li>
						<li><a href="#">June 2013</a></li>
						<li><a href="#">May 2013</a></li>
						<li><a href="#">April 2013</a></li>
					</ol>
				</div>
			</div>
			<!-- blog sidebar / archives -->

        </div>
    </div>
	<!-- content -->

	<!-- footer -->
    <#include "../stubs/footer.ftl"/>
	<!-- footer -->

	<!-- javascript -->
    <#include "../stubs/scripts.ftl"/>
	<!-- javascript -->

	</body>
</html>
