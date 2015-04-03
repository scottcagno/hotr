<!DOCTYPE html>
<html lang="en" itemscope itemtype="http://schema.org/Organization">
	<head>
    <#include "../stubs/header.ftl"/>
	<link rel="stylesheet" href="/static/css/devotional.css"/>
    <title>Devotional Post</title>
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

		<img style="margin:0 auto;" src="/static/img/devotional-header.jpg" class="img-responsive" alt=""/>
		<hr style="border-bottom:2px solid #333;"/>

		<#--<!-- devotional header &ndash;&gt;
		<div class="devotional-header">
			<h1 class="devotional-title">House On The Rock</h1>
			<p class="lead devotional-description">
				Family Ministries Devotional.
				<em><small>Building Men, Marriages, Families and Churches.</small></em>
			</p>
		</div>
		<!-- devotional header &ndash;&gt;-->

        <div class="row">

			<!-- devotional main -->
			<div class="col-sm-8 devotional-main">

				<!-- devotional post -->
				<div class="devotional-post">
					<p class="devotional-post-title">${(devotional.title)!}</p>
					<p class="devotional-post-meta">${(devotional.date)?string["MMMM dd, yyyy hh:mm a (EEEE)"]}</p>
					<div class="devotional-body">${(devotional.body)!}</div>
				</div>
				<!-- devotional post -->

			</div>
			<!-- devotional main -->

			<!-- devotional sidebar / archives -->
			<div class="col-sm-3 col-sm-offset-1 devotional-sidebar">
				<div class="sidebar-module">
					<h4>Archives</h4>
					<ol class="list-unstyled">
                        <li><a href="/devotional" class="red">View All Posts</a></li>
						<#list devotionals as devotional>
							<li>
								<a href="/devotional/${(devotional.id)?c}" class="red"
								   data-trigger="hover" data-container="body" data-toggle="popover"
								   data-placement="left" data-content="${(devotional.date)?string["MMMM dd, yyyy"]}...">
                                ${(devotional.title)!}
								</a>
							</li>
						</#list>
					</ol>
				</div>
			</div>
			<!-- devotional sidebar / archives -->

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
