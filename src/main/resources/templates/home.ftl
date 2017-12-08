<!DOCTYPE html>
<html lang="en-US">
	<head>

		<#include "stubs/header.ftl"/>
		<title>Home - Fan The Flame Dates</title>

	</head>

	<body class="boxedlayout">
		<#include "stubs/google-tag-manager-body.ftl"/>
		<div class="boxedcontent">

			<!-- navbar -->
			<#include "stubs/navbar.ftl"/>
			<!-- navbar -->

			<!-- carousel -->
			<section class="homeslider fullwidth flexslider" id="home-slider">
				<ul class="slides">
					<li class="text-center">
						<a href="/challenge"><img src="/static/img/banner/1-updated.jpg" alt=""></a>
						<a href="/challenge">
							<div class="flex-caption transparent light-font center" style="top:17%;">
								<div>
									<h1 class="animated fadeInDown"><span class="uppercase">Welcome To Fan the Flame Dates</span></h1>
									<p class="lead ib animated fadeInUp" style="margin-bottom:30px; color:white;">
										Rekindle <i>Romance</i>
									</p>
								</div>
							</div>
						</a>
					</li>
					<li class="text-center">
						<a href="#"><img src="/static/img/banner/2-updated.jpg" alt=""></a>
						<a href="#">
							<div class="flex-caption transparent light-font center" style="top:17%;">
								<div>
									<h1 class="animated fadeInDown"><span class="uppercase">Connect With Your Spouse</span></h1>
									<p class="lead ib animated fadeInUp" style="margin-bottom:30px; color:white;">
										Through Meaningful Conversations
									</p>
								</div>
							</div>
						</a>
					</li>
					<li class="text-center">
						<a href="/challenge"><img src="/static/img/banner/3-updated.jpg" alt="Fan The Flame & Take The One Year Challenge"></a>
						<a href="/challenge">
							<div class="flex-caption transparent light-font center" style="top:17%;">
								<div>
									<h1 class="animated fadeInDown"><span class="uppercase">Fan The Flame</span></h1>
									<p class="lead ib animated fadeInUp" style="margin-bottom:30px; color: white;">
										Take the <strong>ONE YEAR</strong> <i>Challenge</i>
									</p>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</section>
			<!-- carousel -->

			<!-- ready -->
			<section class="introblock whites">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center">
							<h1>
								<span class="animated fadeInDown">
									Are you READY to <span class='colortext'>FAN the FLAME</span> of your MARRIAGE?
								</span>
							</h1>
						</div>
					</div>
				</div>
			</section>
			<!-- ready -->

			<!-- spinners -->
			<section class="service-box whites">
				<div class="container">
					<div class="row">
						<div class="col-md-3 text-center">
							<div class="icon-box-top">
								<a href="/video/all">
									<i class="fontawesome-icon medium circle-white center fa fa-film"></i>
								</a>
								<h1>Watch Now</h1>
								<p>
									Fan the Flame of your marriage by watching our free online videos with your spouse!
								</p>
							</div>
						</div>
						<div class="col-md-3 text-center">
							<div class="icon-box-top">
								<a href="/events">
									<i class="fontawesome-icon medium circle-white center fa fa-suitcase"></i>
								</a>
								<h1>Marriage Retreats</h1>
								<p>
									Join us for a live marriage retreat. Click for more details.
								</p>
							</div>
						</div>
						<div class="col-md-3 text-center">
							<div class="icon-box-top">
								<a href="/intensives">
									<i class="fontawesome-icon medium circle-white center fa fa-heart"></i>
								</a>
								<h1>Marriage Intensives</h1>
								<p>
									May we encourage you ...  before you choose to extinguish the flame of your marriage forever, to make at least one more try?
								</p>
							</div>
						</div>
						<div class="col-md-3 text-center">
							<div class="icon-box-top">
								<a href="/challenge">
									<i class="fontawesome-icon medium circle-white center fa fa-calendar"></i>
								</a>
								<h1>One Year Challenge</h1>
								<p>
									Are you ready to take your marriage to the next level? Learn about our free One-Year Challenge program!
								</p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- spinners -->

			<!-- recent videos -->
			<section class="homerecentportfolio grays">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<h1 class="heading">
								Check out our <a href="/video/recent">latest videos</a>
							</h1>
							<div class="recent-portfolio">
								<div class="list_carousel">
									<div class="carousel_nav">
										<a class="prev" id="car_prev" href="#"><span>prev</span></a><a class="next" id="car_next" href="#"><span>next</span></a>
									</div>
									<ul id="recent-portfolio">
										<#list recentVideos as video>
											<li>
												<div>
													<a href="/video/name/${(video.slug)!}">
														<img class="img-responsive" style="" src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" alt="">
													</a>
													<div class="text-center">
														<strong>${(video.name)!}</strong>
													</div>
												</div>
											</li>
										</#list>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- recent videos -->

			<!-- devotional -->
			<section class="whites testimonial fullwidth flexslider" id="testimonials-slider">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<ul class="slides">
								<li>
									<div class="slide-text">
										<div>
											<h2 class="animated fadeInDown">
												<span class="uppercase">
													Check out our <a href="/devotional">Weekly Marriage Devotional</a>
												</span>
											</h2>
											<img src="http://wowthemes.net/demo/salique/salique-boxed/images/temp/avatar2.png" alt="">
											<p>
												Each week Dr. Bruce McCracken shares a short 2-minute marriage devotional thought for couples to Fan the Flame of their marriage.
											</p>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</section>
			<!-- devotional -->

			<!-- recent devotional -->
			<section class="grays homerecentposts">
				<div class="container">
					<div class="row text-center">
						<div class="col-md-12">
							<h1 class="maintitle">Recent Devotionals<br/>
								<a href="/devotional" class="colorblack"><i class="fa fa-angle-down"></i></a>
							</h1>
						</div>
					</div>
					<div class="row homerecentposts recent-posts text-center">
						<div class="clearfix">
						</div>
						<ul class="unstyle">
							<#list recentDevotionals as devotional>
								<li class="col-md-3 unstyle">
									<div class="insidetext">
										<img src="${(devotional.thumb)!}" class="img-responsive">
										<h2><a href="/devotional/${(devotional.slug)!}"><span class="colortext">${(devotional.title)!}</span></a></h2>
										<div class="meta">
											<i class="fa fa-clock-o"></i>${(devotional.date)!}
										</div>
									</div>
								</li>
							</#list>
						</ul>
					</div>
				</div>
			</section>
			<!-- recent devotional -->

			<!-- footer -->
			<#include "stubs/footer.ftl"/>
			<!-- footer -->

			<!-- javascript -->
			<#include "stubs/scripts.ftl"/>

			<script type='text/javascript' src='/static/asher/js/carouselrecentportfolio.js'></script>
			<script type='text/javascript' src='/static/asher/js/carousel.js'></script>
			<script>
				if (window.innerWidth > 1920) {
					$('.homeslider.fullwidth.flexslider').css('height', Math.round(window.innerHeight-457));
				} else if (window.innerWidth > 750) {
					$('.homeslider.fullwidth.flexslider').css('height', Math.round(window.innerHeight-188));
				} else {
					$('.homeslider.fullwidth.flexslider').css('height', '100%');
				}

			</script>
			<!-- javascript -->

		</div>
	</body>
</html>