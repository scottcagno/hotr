<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../stubs/header.ftl"/>
		<title>Video Series</title>

	</head>

	<body class="boxedlayout">
		<#include "../stubs/google-tag-manager-body.ftl"/>
		<div class="boxedcontent">

			<!-- navbar -->
			<#include "../stubs/navbar.ftl"/>
			<!-- navbar -->

			<#include "../stubs/alert.ftl"/>

			<!-- header -->
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
			<!-- header -->

			<div class="container-fluid">
				<div class="row">

					<!-- categories -->
					<div class="col-lg-9 col-md-9 col-sm-12">
						<div class="hidden-xs hidden-sm">
							<ul class="nav nav-tabs" role="tablist">
								<li><a href="/video/all">All Videos</a></li>
								<li><a href="/video/popular">Popular</a></li>
								<li><a href="/video/recent">Recently Added</a></li>
								<li class="active"><a href="">Series</a></li>
							</ul>
						</div>
						<div class="visible-xs visible-sm">
							<div class="list-group">
								<a href="/video/all" class="list-group-item">All Videos</a>
								<a href="/video/popular" class="list-group-item">Popular</a>
								<a href="/video/recent" class="list-group-item">Recently Added</a>
								<a href="/video/series" class="list-group-item active">Series</a>
							</div>
						</div>
						<br/>
						<!-- categories -->

						<!-- videos -->

						<!-- large view -->
						<div class="visible-lg-block">
							<#assign vidInRow = 0/>
							<div class="row">
								<#list allSeries as series>
									<#if vidInRow gt 3>
									</div><div class="row">
										<#assign vidInRow = 0/>
									</#if>
									<div class="col-lg-3">
										<div class="boxcontainer">
											<img src="${(series.thumb?has_content)?string('/image/${(series.thumb!)}', '/static/img/video2.jpg')}" alt="">
											<div class="roll">
												<div class="wrapcaption">
													<a href="/video/series/${series.slug}"><i class="fa fa-play captionicons"></i></a>
												</div>
											</div>
											<p><strong>
												${(series.name)!}
											</strong></p>
										</div>
									</div>
									<#assign vidInRow = vidInRow + 1/>
								</#list>
							</div>
						</div>
						<!-- large view -->

						<!-- medium view -->
						<div class="visible-md-block">
							<#assign vidInRow = 0/>
							<div class="row">
								<#list allSeries as series>
									<#if vidInRow gt 2>
										</div><div class="row">
										<#assign vidInRow = 0/>
									</#if>
									<div class="col-md-4">
										<div class="boxcontainer">
											<img src="${(series.thumb?has_content)?string('/image/${(series.thumb!)}', '/static/img/video2.jpg')}" alt="">
											<div class="roll">
												<div class="wrapcaption">
													<a href="/video/series/${series.slug}"><i class="fa fa-play captionicons"></i></a>
												</div>
											</div>
											<p><strong>
												${(series.name)!}
											</strong></p>
										</div>
									</div>
									<#assign vidInRow = vidInRow + 1/>
								</#list>
							</div>
						</div>
						<!-- medium view -->

						<!-- small view -->
						<div class="visible-sm-block">
							<#assign vidInRow = 0/>
							<div class="row">
								<#list allSeries as series>
									<#if vidInRow gt 1>
										</div><div class="row">
										<#assign vidInRow = 0/>
									</#if>
									<div class="col-sm-6">
										<div class="boxcontainer">
											<img src="${(series.thumb?has_content)?string('/image/${(series.thumb!)}', '/static/img/video2.jpg')}" alt="">
											<div class="roll">
												<div class="wrapcaption">
													<a href="/video/series/${series.slug}"><i class="fa fa-play captionicons"></i></a>
												</div>
											</div>
											<p><strong>
												${(series.name)!}
											</strong></p>
										</div>
									</div>
									<#assign vidInRow = vidInRow + 1/>
								</#list>
							</div>
						</div>
						<!-- small view -->

						<!-- extra small view -->
						<div class="visible-xs-block">
							<#assign vidInRow = 0/>
							<div class="row">
								<#list allSeries as series>
									<div class="col-xs-12">
										<div class="boxcontainer">
											<img src="${(series.thumb?has_content)?string('/image/${(series.thumb!)}', '/static/img/video2.jpg')}" alt="">
											<div class="roll">
												<div class="wrapcaption">
													<a href="/video/series/${series.slug}"><i class="fa fa-play captionicons"></i></a>
												</div>
											</div>
											<p><strong>
												${(series.name)!}
											</strong></p>
										</div>
									</div>
								</#list>
							</div>
						</div>
						<!-- extra small view -->

						<!-- videos -->

					</div>

					<!-- hot topics -->
					<div class="col-lg-3 col-md-3 col-sm-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								HOT TOPICS
							</div>
							<div class="panel-body topic">
								<#list topics as topic>
									<a href="/video/all?topic=${topic.topic}" class="btn btn-block red">
										${topic.topic?cap_first} <span class="badge pull-right visible-lg-block">${topic.watched} Views</span>
									</a>
								</#list>
							</div>
						</div>
					</div>
					<!-- hot topics -->
					
				</div>
			</div>

			<!-- footer -->
			<#include "../stubs/footer.ftl"/>
			<!-- footer -->

			<!-- javascript -->
			<#include "../stubs/scripts.ftl"/>
			<script type='text/javascript' src='/static/asher/js/isotope.js'></script>
			<!-- javascript -->

		</div>
	</body>
</html>
