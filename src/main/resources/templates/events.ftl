<!DOCTYPE html>
<html lang="en">
	<head>
		<#include "stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/shadows.css"/>
        <title>Events</title>
	</head>
	<body id="top">

		<#include "stubs/navbar.ftl"/>

		<!-- begin header -->
		<section class="colorarea">
			<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
		</section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 negmtop">
					<h1 class="pgheadertitle animated fadeInLeft pull-left">Marriage Retreats</h1>
				</div>
			</div>
		</div>
		<!-- end header -->

		<div id="events" class="container">
			<#include "stubs/alert.ftl"/>
			<div class="row">
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-4 hidden-xs hidden-sm">
							<img src="/static/img/home/brucekaren.jpg" class="img-responsive">
						</div>
						<div class="col-lg-7">
							<h2 class="text-white">Dr. Bruce McCracken <span class="gray-panel"><br/>and his wife Karen</span></h2>
							<div class="col-xs-6 visible-xs-block visible-sm-block">
								<img src="/static/img/home/brucekaren.jpg" class="img-responsive">
							</div>
							<p class="lead text-white">
								We explore varying topics throughout the year and invite you to join them on a
								destination weekend to laugh together, learn together and <em>FAN THE FLAME</em>
								of your marriage.
							</p>
							<em class="red-panel">
								“A long lasting marriage is built by two people who believe in, live by and work
								on the solemn promise they made.” – Darlene Schacht
							</em>
						</div>
					</div>
					<div class="row">
						<h1 class="text-white">Marriage Retreats</h1>
						<ul class="list-group">
							<#setting datetime_format="iso"/>
							<#list events as event>
								<li class="list-group-item col-lg-12">
									<div class="col-lg-3">
										<h4>
											<img src="${event.logo.url}" class="img-responsive"/>
										</h4>
									</div>
									<div class="col-lg-6">
										<h4 class="black-text">
											<p><strong>${event.name.text}</strong></p>
											<p>
												${(event.venue.address.city)!}, ${(event.venue.address.region)!}<br/>
												${((event.start.local?datetime)?date)!} - ${((event.end.local?datetime)?date)!}
											</p>
										</h4>
										<p><a href="${event.url}" target="_blank">More Info</a></p>
									</div>
								</li>
							</#list>
						</ul>
					</div>
				</div>
				<div class="col-lg-3">
					<#if events?has_content>
						<br/>
						<div class="pull-right">
							<iframe src="http://www.eventbrite.com/calendar-widget?eid=${events[0].id}" frameborder="0" height="600" width="195" marginheight="0" marginwidth="0" scrolling="no" allowtransparency="true"></iframe>
						</div>
						<br/><br/><br/><br/>
					</#if>
				</div>
			</div>
		</div>

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>
        <!-- javascript -->

	</body>
</html>