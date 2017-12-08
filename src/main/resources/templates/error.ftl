<!DOCTYPE html>
<html lang="en">
	<head id="head">

        <#include "stubs/header.ftl"/>
		<title>Error Page</title>

	</head>
	<body id="body" class="boxedlayout">
		<#include "stubs/google-tag-manager-body.ftl"/>
		<div class="boxedcontent">

			<!-- navbar -->
			<#include "stubs/navbar.ftl"/>
			<!-- navbar -->

			<!-- header -->
			<section class="colorarea">
				<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
			</section>
			<div class="container">
				<div class="row">
					<div class="col-md-12 negmtop">
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Sorry For The Inconvenience</h1>
					</div>
				</div>
			</div>
			<!-- header -->

			<!-- content -->
			<div class="container navbar-margin error-page">
				<div class="jumbotron">
					<h1>Woops!</h1>
					<p>We couldn't find that for you.</p>
				</div>
				<a href="/home" class="red btn btn-default">Lets get you back to solid ground.</a>
			</div>
			<!-- content -->

			<!-- footer -->
			<#include "stubs/footer.ftl"/>
			<!-- footer -->

		</div>
	</body>
</html>
