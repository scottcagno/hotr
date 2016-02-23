<!DOCTYPE html>
<html lang="en">
	<head>

		<#include "../stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/shadows.css"/>
        <title>Intensives</title>

	</head>
	<body class="boxedlayout">
		<div class="boxedcontent">

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
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Marriage Intensives</h1>
					</div>
				</div>
			</div>
			<!-- header -->

			<div class="container">

				<#include "../stubs/alert.ftl"/>

				<div class="col-lg-offset-1 col-lg-10">
					${(intensive.htmlData)!}
				</div>
			</div>

			<!-- footer -->
			<#include "../stubs/footer.ftl"/>
			<!-- footer -->

			<!-- javascript -->
			<#include "../stubs/scripts.ftl"/>
			<!-- javascript -->
		</div>
	</body>
</html>