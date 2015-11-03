<!DOCTYPE html>
<html lang="en-US">
	<head>
		<!-- HEADER IMPORT -->
		<#include "stubs/header.ftl"/>
		<title>Home - Fan The Flame Dates</title>
	</head>

	<body class="boxedlayout">
		<div class="boxedcontent">

			<!-- BEGIN NAVBAR -->
			<#include "stubs/navbar.ftl"/>
			<!-- END NAVBAR -->

			<section class="homeslider fullwidth flexslider" id="home-slider" style="height:500px;">
				<ul class="slides">
					<li class="text-center">
						<a href="#"><img src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/asherslider2.jpg" alt=""/></a>
						<div class="flex-caption transparent light-font center" style="top:17%;">
							<div>
								<h1 class="animated fadeInDown"><span class="uppercase">Banner Image Sizes</span></h1>
								<p class="lead ib animated fadeInUp" style="margin-bottom:30px;">
									1920px by 1200px or 1600px by 1000px (Ratio 1.6:1)
								</p>
								<p class="animated fadeInLeftBig">
									<i>The text is separate from the images</i>
								</p>
								<#--<h1 class="animated fadeInDown"><span class="uppercase">Powerful & Beautiful <br/> Bootstrap Theme</span></h1>
								<br/><a href="#" class="buttonsimple animated fadeInLeftBig"><i class="fa fa-download"></i> Download Now</a>
								<a href="#" class="buttonsimple animated fadeInRightBig"><i class="fa fa-link"></i> Start Tour</a>-->
							</div>
						</div>
					</li>
					<li class="text-center">
						<a href="#"><img src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/sunny-morning-49393.jpg" alt=""/></a>
						<div class="flex-caption transparent light-font center" style="top:17%;">
							<div>
								<h1 class="animated fadeInDown"><span class="uppercase">Banner Image Sizes</span></h1>
								<p class="lead ib animated fadeInUp" style="margin-bottom:30px;">
									1920px by 1200px or 1600px by 1000px (Ratio 1.6:1)
								</p>
								<p class="animated fadeInLeftBig">
									<i>The text is separate from the images</i>
								</p>
							</div>
						</div>
					</li>
					<li class="text-center">
						<a href="#"><img src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/ashers1.jpg" alt=""/></a>
						<div class="flex-caption transparent light-font center" style="top:17%;">
							<div>
								<h1 class="animated fadeInDown"><span class="uppercase">Banner Image Sizes</span></h1>
								<p class="lead ib animated fadeInUp" style="margin-bottom:30px;">
									1920px by 1200px or 1600px by 1000px (Ratio 1.6:1)
								</p>
								<p class="animated fadeInLeftBig">
									<i>The text is separate from the images</i>
								</p>
								<#--<h1 class="animated fadeInDown"><span class="uppercase">Need Help building your website?</span></h1>
								<p class="animated fadeInLeftBig">
									Bootstrap users may install and switch between themes.
								</p>
								<p class="animated fadeInRightBig">
									They allow users to change the look of a Bootstrap website.
								</p>
								<br/><a href="#" class="buttonsimple animated fadeInUpBig"><i class="fa fa-download"></i> Purchase Asher</a>-->
							</div>
						</div>
					</li>
				</ul>
			</section>
			<!-- end homeslider -->

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
			<!-- end introblock -->

			<section class="service-box whites">
				<div class="container">
					<div class="row">
						<div class="col-md-3 text-center">
							<div class="icon-box-top">
								<a href="/video/all">
									<i class="fontawesome-icon medium circle-white center fa fa-microphone"></i>
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
									<i class="fontawesome-icon medium circle-white center fa fa-rocket"></i>
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
									<i class="fontawesome-icon medium circle-white center fa fa-code"></i>
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
									<i class="fontawesome-icon medium circle-white center fa fa-users"></i>
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
			<!-- end servicesbox -->

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
									<div class="clearfix">
									</div>
									<ul id="recent-portfolio">
										<#list recentVideos as video>
										<li>
											<div class="">
												<a href="/video/id/${(video.id)!}">
													<img class="" style="" src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" alt="">
												</a>
												<div class="text-center">
													<strong>${(video.name)!}</strong>
													<p>${(video.watched)!} Views</p>
												</div>
											</div>
										</li>
										</#list>
									<#--<li>
											<div class="boxcontainer">
												<a class="imgOpa imgproject" href="portfoliosingle"><img width="600" height="350" src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/tumblr_mvyxfkaRb41st5lhmo1_1280-600x350.jpg" class="attachment-recentprojects-thumb wp-post-image" alt="tumblr_mvyxfkaRb41st5lhmo1_1280"/></a>
												<div class="roll">
													<div class="wrapcaption">
														<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a><a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/tumblr_mvyxfkaRb41st5lhmo1_1280.jpg" title="Asher Theme"><i class="fa fa-search-plus captionicons"></i></a>
													</div>
												</div>
												<h1><a href="portfoliosingle">Asher Theme</a></h1>
												<p>
													multipurpose theme
												</p>
											</div>
										</li>
										<li>
											<div class="boxcontainer">
												<a class="imgOpa imgproject" href="portfoliosingle"><img width="600" height="350" src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/tumblr_mvyxgqpNHE1st5lhmo1_1280-600x350.jpg" class="attachment-recentprojects-thumb wp-post-image" alt="tumblr_mvyxgqpNHE1st5lhmo1_1280"/></a>
												<div class="roll">
													<div class="wrapcaption">
														<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a><a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/tumblr_mvyxgqpNHE1st5lhmo1_1280.jpg" title="WowThemes"><i class="fa fa-search-plus captionicons"></i></a>
													</div>
												</div>
												<h1><a href="portfoliosingle">WowThemes</a></h1>
												<p>
													biscaya author
												</p>
											</div>
										</li>
										<li>
											<div class="boxcontainer">
												<a class="imgOpa imgproject" href="portfoliosingle"><img width="600" height="350" src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/post1-600x350.jpg" class="attachment-recentprojects-thumb wp-post-image" alt="post1"/></a>
												<div class="roll">
													<div class="wrapcaption">
														<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a><a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/post1.jpg" title="Salique"><i class="fa fa-search-plus captionicons"></i></a>
													</div>
												</div>
												<h1><a href="portfoliosingle">Salique</a></h1>
												<p>
													multipurpose template
												</p>
											</div>
										</li>
										<li>
											<div class="boxcontainer">
												<a class="imgOpa imgproject" href="portfoliosingle"><img width="600" height="350" src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2013/08/tumblr_mzzr7n7idZ1st5lhmo1_1280-600x350.jpg" class="attachment-recentprojects-thumb wp-post-image" alt="tumblr_mzzr7n7idZ1st5lhmo1_1280"/></a>
												<div class="roll">
													<div class="wrapcaption">
														<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a><a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2013/08/tumblr_mzzr7n7idZ1st5lhmo1_1280.jpg" title="Serenity"><i class="fa fa-search-plus captionicons"></i></a>
													</div>
												</div>
												<h1><a href="portfoliosingle">Serenity</a></h1>
												<p>
													wordpress portfolio
												</p>
											</div>
										</li>
										<li>
											<div class="boxcontainer">
												<a class="imgOpa imgproject" href="portfoliosingle"><img width="600" height="350" src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2013/08/tumblr_mzzqwktTbR1st5lhmo1_1280-600x350.jpg" class="attachment-recentprojects-thumb wp-post-image" alt="tumblr_mzzqwktTbR1st5lhmo1_1280"/></a>
												<div class="roll">
													<div class="wrapcaption">
														<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a><a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2013/08/tumblr_mzzqwktTbR1st5lhmo1_1280.jpg" title="BizLeaders"><i class="fa fa-search-plus captionicons"></i></a>
													</div>
												</div>
												<h1><a href="portfoliosingle">BizLeaders</a></h1>
												<p>
													business html
												</p>
											</div>
										</li>
										<li>
											<div class="boxcontainer">
												<a class="imgOpa imgproject" href="portfoliosingle"><img width="600" height="350" src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2013/08/tumblr_myp9dgyhJ71st5lhmo1_1280-600x350.jpg" class="attachment-recentprojects-thumb wp-post-image" alt="tumblr_myp9dgyhJ71st5lhmo1_1280"/></a>
												<div class="roll">
													<div class="wrapcaption">
														<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a><a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2013/08/tumblr_myp9dgyhJ71st5lhmo1_1280.jpg" title="Studio"><i class="fa fa-search-plus captionicons"></i></a>
													</div>
												</div>
												<h1><a href="portfoliosingle">Vesta</a></h1>
												<p>
													wordpress theme
												</p>
											</div>
										</li>-->
									</ul>
								</div>
							</div>
							<div class="clearfix">
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- end homerecentportfolio -->

			<#--<section class="infoarea whites">-->
				<#--<div class="container">-->
					<#--<div class="row text-center">-->
						<#--<h1 class="maintitle">Need Support with Asher?</h1>-->
					<#--</div>-->
					<#--<div class="row">-->
						<#--<div class="col-md-4">-->
							<#--<i class="fa fa-microphone infoareaicon"></i>-->
							<#--<div class="infoareawrap">-->
								<#--<h1 class="text-center subtitle">General Questions</h1>-->
								<#--<p>-->
									<#--Want to buy a theme but not sure if it's got all the features you need? Trouble completing the payment? Or just want to say hi? Send us your message and we will answer as soon as possible!-->
								<#--</p>-->
								<#--<p class='text-center'>-->
									<#--<a href='#'>- Get in Touch -</a>-->
								<#--</p>-->
							<#--</div>-->
						<#--</div>-->
						<#--<div class="col-md-4">-->
							<#--<i class="fa fa-comments infoareaicon"></i>-->
							<#--<div class="infoareawrap">-->
								<#--<h1 class="text-center subtitle">Theme Support</h1>-->
								<#--<p>-->
									<#--Theme support issues prevent the theme from working as advertised in the demo. This is a free and guaranteed service offered through our support forum which is found in each theme.-->
								<#--</p>-->
								<#--<p class='text-center'>-->
									<#--<a href='#'>- Select Theme -</a>-->
								<#--</p>-->
							<#--</div>-->
						<#--</div>-->
						<#--<div class="col-md-4">-->
							<#--<i class="fa fa-bullhorn infoareaicon"></i>-->
							<#--<div class="infoareawrap">-->
								<#--<h1 class="text-center subtitle">Hire Us</h1>-->
								<#--<p>-->
									<#--If you wish to change an element to look or function differently than shown in the demo, we will be glad to assist you. This is a paid service due to theme support requests solved with priority.-->
								<#--</p>-->
								<#--<p class='text-center'>-->
									<#--<a href='#'>- Get in Touch -</a>-->
								<#--</p>-->
							<#--</div>-->
						<#--</div>-->
					<#--</div>-->
				<#--</div>-->
			<#--</section>-->
			<!-- end infoarea -->

			<#--<section class="videoarea bgsizecover" style="background-image: url(http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/tumblr_mzzqxabKjH1st5lhmo1_1280.jpg); background-attachment: fixed; background-position: relative;">-->
				<#--<div class="transp">-->
					<#--<div class="container">-->
						<#--<div class="row">-->
							<#--<div class="col-md-6">-->
								<#--<iframe src='http://player.vimeo.com/video/40569948' style="width:100%; height:312px; border:0px;">-->
								<#--</iframe>-->
							<#--</div>-->
							<#--<div class="col-md-6 text-center">-->
								<#--<h1 class="maintitle">Awesome Videos</h1>-->
								<#--<p>-->
									<#--Use your imagination, add shortcodes, create something unique!-->
								<#--</p>-->
								<#--<ul class='unstyle doublearrowlist'>-->
									<#--<li>Responsive Design</li>-->
									<#--<li>Multiple Layouts Width</li>-->
									<#--<li>Unlimited Skin Colors</li>-->
									<#--<li>Easy to Customize</li>-->
									<#--<li>Over 40 Shortcodes</li>-->
								<#--</ul>-->
								<#--<p>-->
									<#--<a href='#' class='sbutton round noshadow medium blue'><i class='fa fa-shopping-cart'></i> Download Asher</a>-->
								<#--</p>-->
							<#--</div>-->
						<#--</div>-->
					<#--</div>-->
				<#--</div>-->
			<#--</section>-->
			<!-- end videoarea -->

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
								<#--<li>-->
									<#--<div class="slide-text">-->
										<#--<div>-->
											<#--<h2 class="animated fadeInDown"><span class="uppercase">Great Themes</span></h2>-->
											<#--<img src="http://wowthemes.net/demo/salique/salique-boxed/images/temp/avatar4.png" alt="">-->
											<#--<p>-->
												<#--Great themes with equally amazing customer service to go with it. Very prompt responses and very knowledgable staff that truly cares about their customer. I stand 100% behind this website and will make sure to recommend it to my friends.-->
											<#--</p>-->
										<#--</div>-->
									<#--</div>-->
								<#--</li>-->
								<#--<li>-->
									<#--<div class="slide-text">-->
										<#--<div>-->
											<#--<h2 class="animated fadeInDown"><span class="uppercase">Content Slider</span></h2>-->
											<#--<img src="http://wowthemes.net/demo/salique/salique-boxed/images/temp/avatar5.png" alt="">-->
											<#--<p>-->
												<#--This is a great theme for Bootstrap. Great features, catchy look. Also, I have on a few occasions needed to contact the support team, and they have been extremely helpful. I'm new to navigating these things so this has been invaluable!-->
											<#--</p>-->
										<#--</div>-->
									<#--</div>-->
								<#--</li>-->
							</ul>
						</div>
					</div>
				</div>
			</section>
			<!-- end testimonial -->

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
										<h2><a href="/devotional/${(devotional.id)!}"><span class="colortext">${(devotional.title)!}</span></a></h2>
										<div class="meta">
											<i class="fa fa-clock-o"></i>${(devotional.date)!}
										</div>
									</div>
								</li>
							</#list>
							<#--<li class="col-md-3 unstyle"><article><a class="imgOpa" href="#"><img width="600" height="350" src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2013/08/tumblr_mzzqwktTbR1st5lhmo1_1280-600x350.jpg" class="attachment-recentprojects-thumb wp-post-image" alt="tumblr_mzzqwktTbR1st5lhmo1_1280"/></a>
								<div class="insidetext">
									<h2><a href="blogsingle">WordPress Tuts</a></h2>
									<div class="meta">
										<i class="fa fa-clock-o"></i><span class="day">02</span> / <span class="month">02</span> / <span class="year">2014</span>
									</div>
									<p>
										WordPress is web software you can use to create a beautiful website or blog. We like to say that WordPress is both free <a href="#"><span class="mute">[...]</span></a>
									</p>
								</div>
							</article></li>
							<li class="col-md-3 unstyle"><article><a class="imgOpa" href="#/"><img width="600" height="350" src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/post1-600x350.jpg" class="attachment-recentprojects-thumb wp-post-image" alt="post1"/></a>
								<div class="insidetext">
									<h2><a href="blogsingle">Language Files</a></h2>
									<div class="meta">
										<i class="fa fa-clock-o"></i><span class="day">02</span> / <span class="month">02</span> / <span class="year">2014</span>
									</div>
									<p>
										A WordPress Theme is a collection of files that work together to produce a graphical interface with an underlying unifying <a href="#"><span class="mute">[...]</span></a>
									</p>
								</div>
							</article></li>
							<li class="col-md-3 unstyle"><article><a class="imgOpa" href="#"><img width="600" height="350" src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/tumblr_mzzqxabKjH1st5lhmo1_1280-600x350.jpg" class="attachment-recentprojects-thumb wp-post-image" alt="tumblr_mzzqxabKjH1st5lhmo1_1280"/></a>
								<div class="insidetext">
									<h2><a href="blogsingle">Operating Systems</a></h2>
									<div class="meta">
										<i class="fa fa-clock-o"></i><span class="day">01</span> / <span class="month">02</span> / <span class="year">2014</span>
									</div>
									<p>
										Themes are often used to change the look and feel of a wide range of things at once, which makes them much <a href="#"><span class="mute">[...]</span></a>
									</p>
								</div>
							</article></li>
							<li class="col-md-3 unstyle"><article><a class="imgOpa" href="#"><img width="600" height="350" src="http://www.wowthemes.net/demo-asher/wp-content/uploads/sites/9/2014/02/tumblr_muuig0890N1st5lhmo1_1280-600x350.jpg" class="attachment-recentprojects-thumb wp-post-image" alt="tumblr_muuig0890N1st5lhmo1_1280"/></a>
								<div class="insidetext">
									<h2><a href="blogsingle">Web Concerns</a></h2>
									<div class="meta">
										<i class="fa fa-clock-o"></i><span class="day">01</span> / <span class="month">02</span> / <span class="year">2014</span>
									</div>
									<p>
										A common goal among experienced web developers is to develop and deploy applications today, tomorrow and always <a href="#"><span class="mute">[...]</span></a>
									</p>
								</div>
							</article></li>-->
						</ul>
					</div>
					<div class="clearfix">
					</div>
				</div>
			</section>
			<!-- end homerecentposts -->

			<#--<section class="whites calltoactionarea">-->
				<#--<div class="container">-->
					<#--<div class="row">-->
						<#--<div class="col-md-12">-->
							<#--<div class="text-center">-->
								<#--<h1>-->
									<#--Praesent <span class='fontpacifico colortext'>WowThemes</span> sapien, a vulputate enim auctor vitae </h1>-->
								<#--<p>-->
									<#--Duis non lorem porta, adipiscing eros sit amet, tempor sem. Donec nunc arcu, semper a tempus et, consequat-->
								<#--</p>-->
								<#--<a href='#' class='buttonblack'><i class='fa fa-shopping-cart'></i> get asher</a>-->
								<#--<a href='#' class='buttoncolor'><i class='fa fa-link'></i> learn more</a>-->
							<#--</div>-->
						<#--</div>-->
					<#--</div>-->
				<#--</div>-->
			<#--</section>-->
			<!-- end calltoactionarea -->

			<!-- BEGIN FOOTER -->
			<#include "stubs/footer.ftl"/>
			<!-- END FOOTER -->

			<!-- BEGIN SCRIPTS -->
			<#include "stubs/scripts.ftl"/>
			<!-- END SCRIPTS -->

		</div><!-- end boxedcontent -->
	</body>
</html>