<!DOCTYPE html>
<html lang="en-US">
	<head>

		<#include "stubs/header.ftl"/>
		<title>Contact Us - Fan The Flame Dates</title>

	</head>

	<body class="boxedlayout">
		<div class="boxedcontent">

			<!-- navbar-->
			<#include "stubs/navbar.ftl"/>
			<!-- navbar -->

			<!-- header -->
			<section class="colorarea">
				<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
			</section>
			<div class="container">
				<div class="row">
					<div class="col-md-12 negmtop">
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Contact Us</h1>
						<span class="pagedescrarea text-right animated fadeInRight pull-right">
							<i><a href="/promo">Click here</a> to get started with some of our promotional content.</i>
						</span>
					</div>
				</div>
			</div>
			<!-- header -->

			<div class="container">

				<#include "stubs/alert.ftl"/>

				<div class="row">
					<div class="col-md-12">
						<div class="shortcode row">

							<!-- email -->
							<div class="col-md-6">
								<div class="box1">
									<div class="striped"></div>
									<h6><i class=" fa fa-envelope "></i> Get in Touch </h6>
									<div style="height: 5px"></div>
									<div class="done">
										<div class="alert alert-success">
											<button type="button" class="close" data-dismiss="alert">×</button>
											Your message has been sent. Thank you!
										</div>
									</div>
									<form id="contactform" action="/contact" method="post">
										<div class="form">
											<input class="col-md-6 col-xs-12" type="text" name="name" placeholder="Name">
											<input class="col-md-6 col-xs-12" type="text" name="email" placeholder="E-mail">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<textarea class="col-md-12 col-xs-12" name="comment" rows="7" placeholder="Message" style="resize: none;"></textarea>
											<button class="btn btn-block btn-primary">Submit</button>

										</div>
									</form>
								</div>
							</div>
							<!-- email -->

							<!-- map -->
							<div class="col-md-6">
								<div class="box1">
									<div class="striped">
									</div>
									<h6><i class="fa fa-map-marker"></i>&nbsp;222 S. Market St. Suite 102A, Elizabethtown, PA 17022</h6>
									<div class="embed-responsive embed-responsive-16by9">
									<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3054.1005488699966!2d-76.390074!3d40.05085700000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c626ea60d96b77%3A0xaf554629f2299bc1!2sHouse+on+the+Rock+Family+Ministries!5e0!3m2!1sen!2sus!4v1438117974083" frameborder="0" style="border:0" allowfullscreen></iframe>
									</div>
								</div>
							</div>
							<!-- map -->

						</div>
					</div>
				</div>
			</div>

			<!-- footer -->
			<#include "stubs/footer.ftl"/>
			<!-- footer -->

			<!-- javascript -->
			<#include "stubs/scripts.ftl"/>
			<!-- javascript -->

		</div>
	</body>
</html>