<!DOCTYPE html>
<html lang="en-US">
	<head>
		<!-- HEADER IMPORT -->
		<#include "../stubs/header.ftl"/>
		<title>All Videos - Fan The Flame Dates</title>
	</head>

	<body class="boxedlayout">
		<div class="boxedcontent">

			<#include "../stubs/navbar.ftl"/>

			<#include "../stubs/alert.ftl"/>

			<section class="colorarea">
				<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
			</section>

			<div class="container">
				<div class="row">
					<div class="col-md-12 negmtop">
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Videos</h1>
						<span class="pagedescrarea text-right animated fadeInRight pull-right">
							<i>Check out our most recent <a href="big-map-contact">series here</a>!</i>
						</span>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-9 col-sm-12">
						<ul class="nav nav-tabs hidden-xs hidden-sm" role="tablist">
							<li class="${(filter == 'all' && !RequestParameters.topic??)?string('active', '')}">
								<a href="/video/all">All Videos</a>
							</li>
							<li class="${(filter == 'popular')?string('active', '')}">
								<a href="/video/popular">Popular</a>
							</li>
							<li class="${(filter == 'recent')?string('active', '')}">
								<a href="/video/recent">Recently Added</a>
							</li>
							<li class="${(filter == 'series')?string('active', '')}">
								<a href="/video/series">Series</a>
							</li>
						</ul>
						<div class="visible-xs visible-sm">
							<div class="list-group">
								<a href="/video/all" class="list-group-item ${(filter == 'all' && !RequestParameters.topic??)?string('active', '')}">All Videos</a>
								<a href="/video/popular" class="list-group-item ${(filter == 'popular')?string('active', '')}">Popular</a>
								<a href="/video/recent" class="list-group-item ${(filter == 'recent')?string('active', '')}">Recently Added</a>
								<a href="/video/series" class="list-group-item ${(filter == 'series')?string('active', '')}">Series</a>
							</div>
						</div>

						<br/>
						<#assign vidInRow = 0/>
						<div class="row">
							<#list videos as video>
								<#if vidInRow gt 3>
									</div><div class="row">
									<#assign vidInRow = 0/>
								</#if>
								<div class="col-lg-3">
									<div class="boxcontainer">
										<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" alt="">
										<div class="roll">
											<div class="wrapcaption">
												<a href="/video/id/${(video.id)!}"><i class="fa fa-play captionicons"></i></a>
											</div>
										</div>
										<h1>
											<a href="/video/id/${(video.id)!}">
											${(video.name)!}
											</a>
										</h1>
										<p>TEST</p>
									</div>
								</div>
								<#assign vidInRow = vidInRow + 1/>
							</#list>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 col-sm-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								HOT TOPICS
							</div>
							<div class="panel-body">
								<#list topics as topic>
									<a href="/video/all?topic=${topic.topic}" class="btn btn-block" style="text-align: left;">
										${topic.topic?cap_first} <span class="badge pull-right">${topic.watched} Views</span>
									</a>
								</#list>
							</div>
						</div>
					</div>
				</div>
			</div>

			<#include "../stubs/footer.ftl"/>

			<#include "../stubs/scripts.ftl"/>
			<script type='text/javascript' src='/static/asher/js/isotope.js'></script>

		</div>
	</body>
</html>