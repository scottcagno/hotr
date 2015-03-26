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
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="#top">${(glob.home)!''}</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/home#about">About</a></li>
					<li><a href="/home#events">Events</a></li>
					<li><a href="/home#contact">Contact</a></li>
					<li><a href="${link}/video/all">Videos</a></li>
					<li><a href="${(auth)?string('/secure/user', '/secure/home')}">${(auth)?string('Account', 'Login')}</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- navbar -->

    <#include "../stubs/alert.ftl"/>


	<!-- content -->
	<div class="container">

		<img style="margin:0 auto;" src="/static/img/blog-header.jpg" class="img-responsive" alt=""/>
		<hr style="border-bottom:2px solid #333;"/>

		<#--<!-- blog header &ndash;&gt;
		<div class="blog-header">
			<h1 class="blog-title">House On The Rock</h1>
			<p class="lead blog-description">
				Family Ministries Blog.
				<em><small>Building Men, Marriages, Families and Churches.</small></em>
			</p>
		</div>
		<!-- blog header &ndash;&gt;-->

        <div class="row">

			<!-- blog main -->
			<div class="col-sm-8 blog-main">

				<!-- blog post -->
				<div class="blog-post">
					<p class="blog-post-title">${(blog.title)!}</p>
					<p class="blog-post-meta">${(blog.date)?string["MMMM dd, yyyy hh:mm a (EEEE)"]}</p>
					<div class="blog-body">${(blog.body)!}</div>
				</div>
				<!-- blog post -->

			</div>
			<!-- blog main -->

			<!-- blog sidebar / archives -->
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module">
					<h4>Archives</h4>
					<ol class="list-unstyled">
                        <li><a href="/blog" class="red">View All Posts</a></li>
						<#list blogs as blog>
							<li>
								<a href="/blog/${(blog.id)?c}" class="red"
								   data-trigger="hover" data-container="body" data-toggle="popover"
								   data-placement="left" data-content="${(blog.date)?string["MMMM dd, yyyy"]}...">
                                ${(blog.title)!}
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

    <#include "../stubs/footer.ftl"/>

	</body>
</html>
