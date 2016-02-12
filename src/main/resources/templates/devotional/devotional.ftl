<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html" itemscope itemtype="http://schema.org/Organization">
	<head>

    	<#include "../stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/devotional.css"/>
		<title>Devotional</title>

	</head>
	<body class="boxedlayout">
		<div class="boxedcontent">

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
						<#list devotionals as devotional>
							<!-- devotional post -->
							<div class="devotional-post">
								<p class="devotional-post-title"><a href="/devotional/${(devotional.id)?c}">${(devotional.title)!}</a></p>
								<p class="devotional-post-meta text-white">${(devotional.date)?string["MMMM dd, yyyy hh:mm a (EEEE)"]}</p>
								<div class="devotional-body">
									${(devotional.body)!}
								</div>
							</div>
							<hr/>
							<!-- devotional post -->
						</#list>
					</div>
					<!-- devotional main -->

					<!-- devotional sidebar / archives -->
					<div class="col-sm-3 col-sm-offset-1 devotional-sidebar">
						<div class="sidebar-module">
							<h4 class="text-white">Recent Posts</h4>
							<ol class="list-unstyled">
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
		</div>
	</body>
</html>
