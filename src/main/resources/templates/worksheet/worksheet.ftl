<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../stubs/header.ftl"/>
		<title>Worksheet</title>

	</head>
	<body id="body">

		<!-- navbar -->
		<#include "../stubs/navbar.ftl"/>
		<!-- navbar -->

		<!-- header -->
		<section class="colorarea">
			<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
		</section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 negmtop">
					<h1 class="pgheadertitle animated fadeInLeft pull-left">Worksheet for ${worksheet.videoName}</h1>
					<span class="pagedescrarea text-right animated fadeInRight pull-right">
						<i>${(video.description)!}</i>
					</span>
				</div>
			</div>
		</div>
		<!-- header -->

		<!-- content -->
		<div class="container">
			<br/>
			<#include "../stubs/alert.ftl"/>
			<div class="row">
				<div class="col-lg-offset-3 col-lg-6" >
					<div class="panel panel-default">
						<div class="panel-heading">Worksheet</div>
						<div class="panel-body">
							${worksheet.htmlData}
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content -->

		<!-- footer -->
		<#include "../stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "../stubs/scripts.ftl"/>
		<!-- javascript -->

	</body>
</html>


