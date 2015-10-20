<!DOCTYPE html>
<html lang="en">
    <head id="head">
        <#include "stubs/header.ftl"/>
        <title>Promotional</title>
    </head>
    <body>

        <#include "stubs/navbar.ftl"/>

        <#include "stubs/alert.ftl"/>

		<!-- begin header -->
		<section class="colorarea">
			<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
		</section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 negmtop">
					<h1 class="pgheadertitle animated fadeInLeft pull-left">Promotional Content</h1>
					<span class="pagedescrarea text-right animated fadeInRight pull-right">
						<i class=" fa fa-phone"></i> Phone: (717) 299-8969
					</span>
				</div>
			</div>
		</div>
		<!-- end header -->

        <!-- content -->
        <div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="well well-sm text-center">
						<label>Fan the Flame Bulletin insert (pdf format)</label>
						<a href="/static/bulletin.pdf" target="_blank">
							<img width="450" src="/static/img/promo.jpg" class="img-responsive img-thumbnail">
						</a>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="well well-sm text-center">
						<label>Research Says... (Funny Promo Video)</label>
						<div class="embed-responsive embed-responsive-16by9">
							<iframe src="https://www.youtube.com/embed/DAsNsMu0Dpc" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="well well-sm text-center">
						<label>Thing You Should Never Say To Your Wife (Promo video)</label>
						<div class="embed-responsive embed-responsive-16by9">
							<iframe src="http://www.youtube.com/embed/_jQ-z23_C3A" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="well well-sm text-center">
						<label>Promotional Video</label>
						<div class="embed-responsive embed-responsive-16by9">
							<iframe src="http://www.youtube.com/embed/ZJLesBwdYpw" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
						</div>
					</div>
				</div>
			</div>

        </div>
        <!-- content -->

        <!-- footer -->
        <#include "stubs/footer.ftl"/>
        <!-- footer -->

        <!-- javascript -->
        <#include "stubs/scripts.ftl"/>
        <!-- javascript -->

    </body>
</html>


