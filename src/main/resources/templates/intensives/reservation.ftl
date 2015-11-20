<!DOCTYPE html>
<html lang="en">
	<head>
		<#include "../stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/shadows.css"/>
        <title>Intensives</title>
	</head>
	<body id="top">

		<#include "../stubs/navbar.ftl"/>

		<!-- begin header -->
		<section class="colorarea">
			<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
		</section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 negmtop">
					<h1 class="pgheadertitle animated fadeInLeft pull-left">Make Your Reservation!</h1>
				</div>
			</div>
		</div>
		<!-- end header -->

		<div class="container">
			<#include "../stubs/alert.ftl"/>
			<div class="row">
				<div class="col-lg-offset-2 col-lg-8">
					<strong><h4>We’re glad you’re here!</h4></strong>
					<p class="text-white">
						We schedule intensives based on your and our availability ... we can do them on
					</p>
					<p>
						weekdays or weekends ... whatever works best for you ... contact us today!
					</p>
					<br>
					<h3>
						Phone: 717-299-8969
					</h3>
					<h3>
						Email: <a href="mailto:jeff@hotrfm.com">info@hotrfm.org</a>
					</h3>
					<p>
						You can also visit our contact page <a href="/contact">here</a>.
					</p>
					<br>
					<a href="/intensives">
						what is an intensive?
					</a>
					<br>
					<a href="/intensives/divorce">
						are you considering divorce... read this...
					</a>
					<br/>
					<a href="/intensives/schedule">
						see what our schedule looks like...
					</a>
					<br/>
					<a href="/intensives/testimonies">
						read some testimonies...
					</a>
					<br/>
					<a href="/intensives/reservation">
						make your reservation...
					</a>
				</div>
			</div>
		</div>

		<!-- footer -->
		<#include "../stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "../stubs/scripts.ftl"/>
        <!-- javascript -->

	</body>
</html>