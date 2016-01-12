<!DOCTYPE html>
<html lang="en" itemscope itemtype="http://schema.org/Organization">
	<head>

		<#include "../stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/devotional.css"/>
    	<title>Devotional Post</title>
	</head>
	<body id="top">

		<#assign link = (auth)?string('/secure', '')/>


		<#include "../stubs/navbar.ftl"/>

		<#include "../stubs/alert.ftl"/>

		<!-- header -->
		<section class="colorarea">
			<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
		</section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 negmtop">
					<h1 class="pgheadertitle animated fadeInLeft pull-left">Weekly Marriage Devotional</h1>
					<span class="pagedescrarea text-right animated fadeInRight pull-right">
					</span>
				</div>
			</div>
		</div>
		<!-- header -->

		<!-- content -->
		<div class="container">
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
