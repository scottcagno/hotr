<!DOCTYPE html>
<html lang="en-US">
	<head>
		<!-- HEADER IMPORT -->
		<#include "../stubs/header.ftl"/>
		<title>All Videos - Fan The Flame Dates</title>
	</head>

	<body class="boxedlayout">
		<div class="boxedcontent">

			<!-- BEGIN NAVBAR -->
			<#include "../stubs/navbar.ftl"/>
			<!-- END NAVBAR -->

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
					<div class="col-md-12">
						<div id="filter">
							<ul>
								<li><a href="" data-filter="*" class="selected"><i class="icon icon-reorder"></i>&nbsp; All Items</a></li>
								<li><a href="" data-filter=".cat1"><i class="icon icon-th-large"></i>&nbsp; Landscape</a></li>
								<li><a href="" data-filter=".cat2"><i class="icon icon-th-list"></i>&nbsp; Overview</a></li>
								<li><a href="" data-filter=".cat3"><i class="icon icon-th"></i>&nbsp; Green Nature</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div><!-- end portfolio categories -->

			<div class="container">
				<div id="content">
					<#list videos as video>
						<div class="boxportfolio3 item cat2 cat3">
							<div class="boxcontainer">
								<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.jpg')}" alt="">
								<div class="roll">
									<div class="wrapcaption">
										<a href="/video/id/${(video.id)!}"><i class="fa fa-play captionicons"></i></a>
									</div>
								</div>
								<h1>
									<a href="portfoliosingle"
									   data-toggle="popover"
									   data-trigger="hover"
									   title="${video.name}"
									   data-content="This is a longer description. I am writing it to test how it will display on the popover. Hopefully I will be able to see all of it and none will be cut off."
									   data-placement="top">
										${(video.name)!}
									</a>
								</h1>
								<p>
									Swiss city in Jura mountains
								</p>
							</div>
						</div>
					</#list>

					<!-- -->
					<!--&lt;!&ndash; box 1 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2 cat3">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/1.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/1.jpg" title="La Chaux De Fonds"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">La Chaux De Fonds</a></h1>-->
							<!--<p>-->
								<!--Swiss city in Jura mountains-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 2 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat1">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/2.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/2.jpg" title="Taj Mahal"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Taj Mahal</a></h1>-->
							<!--<p>-->
								<!--one of the eight wonders-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 3 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2 cat3">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/3.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/3.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Versailles, France</a></h1>-->
							<!--<p>-->
								<!--Cotelle Gallery-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 4 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat1">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/4.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/4.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">St Petersburg, Russia</a></h1>-->
							<!--<p>-->
								<!--water fountain-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 5 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/5.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/5.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Grunge Architecture</a></h1>-->
							<!--<p>-->
								<!--ancient style Europe-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 6 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/6.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/6.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">France Building</a></h1>-->
							<!--<p>-->
								<!--old towers architecture-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 7 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2 cat3">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/7.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/7.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Hall in Tirol</a></h1>-->
							<!--<p>-->
								<!--town in Tyrol, Austria-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 8 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat1">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/8.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/8.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Opéra-Théatre de Metz</a></h1>-->
							<!--<p>-->
								<!--opera house in France-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 9 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2 cat3">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/9.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/9.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">The Palace of Charles V</a></h1>-->
							<!--<p>-->
								<!--construction in Granada, Spain-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 10 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2 cat3">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/10.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/10.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Hamburg, Germany</a></h1>-->
							<!--<p>-->
								<!--City Hall-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 11 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2 cat3">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/11.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/11.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Washington Dc</a></h1>-->
							<!--<p>-->
								<!--water fountain-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 12 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2 cat3">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/12.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/12.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Bas-Rhin</a></h1>-->
							<!--<p>-->
								<!--department of France-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 13 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2 cat1">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/13.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/13.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Rome, Italy</a></h1>-->
							<!--<p>-->
								<!--Fontana di Trevi-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 14 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat1 cat2">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/14.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/14.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Sacramento, California</a></h1>-->
							<!--<p>-->
								<!--tower bridge-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; box 15 &ndash;&gt;-->
					<!--<div class="boxportfolio3 item cat2 cat3">-->
						<!--<div class="boxcontainer">-->
							<!--<img src="http://www.wowthemes.net/demo/serenity/img/temp/masonry/15.jpg" alt="">-->
							<!--<div class="roll">-->
								<!--<div class="wrapcaption">-->
									<!--<a href="portfoliosingle"><i class="fa fa-link captionicons"></i></a>-->
									<!--<a data-gal="prettyPhoto[gallery1]" href="http://www.wowthemes.net/demo/serenity/img/temp/masonry/15.jpg" title="Title Here"><i class="fa fa-search-plus captionicons"></i></a>-->
								<!--</div>-->
							<!--</div>-->
							<!--<h1><a href="portfoliosingle">Haikou, China</a></h1>-->
							<!--<p>-->
								<!--Haikou city statue-->
							<!--</p>-->
						<!--</div>-->
					<!--</div>-->
					<!--&lt;!&ndash; next box etc &ndash;&gt;-->
					<!--&lt;!&ndash; MASONRY ITEMS END &ndash;&gt;-->
					<!-- -->
				</div><!-- end content -->
			</div><!-- end container -->

			<!-- BEGIN FOOTER -->
			<#include "../stubs/footer.ftl"/>
			<!-- END FOOTER -->

			<!-- BEGIN SCRIPTS -->
			<#include "../stubs/scripts.ftl"/>
			<!-- END SCRIPTS -->

			<script>
				$(function () {
					$('[data-toggle="popover"]').popover()
				})
			</script>

		</div><!-- end boxedcontent -->
	</body>
</html>