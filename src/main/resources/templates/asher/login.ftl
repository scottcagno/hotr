<!DOCTYPE html>
<html lang="en-US">
	<head>
		<!-- HEADER IMPORT -->
		<#include "stubs/header.ftl"/>
		<title>Login - Fan The Flame Dates</title>
	</head>

	<body class="boxedlayout">
		<div class="boxedcontent">

			<!-- BEGIN NAVBAR -->
			<#include "stubs/navbar.ftl"/>
			<!-- END NAVBAR -->

			<section class="colorarea">
				<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/asher/img/headers/1.jpg);"></div>
			</section>

			<div class="container">
				<div class="row">
					<div class="col-md-12 negmtop">
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Please Login</h1>
					</div>
				</div>
			</div>
			<!-- end header -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<div class="shortcode row">
							<div class="col-md-6 col-md-offset-3">
								<div class="box1">
									<div class="striped">
									</div>
									<h6><i class=" fa fa-user ">
									</i> Please Login </h6>
									<div style="height: 5px"></div>
									<div class="done">
										<div class="alert alert-success">
											<button type="button" class="close" data-dismiss="alert">×</button>
											Your message has been sent. Thank you!
										</div>
									</div>
									<form method="post" action="/login">
										<div class="form">
											<input type="text" name="username" class="col-sm-12" placeholder="Username">
											<input type="password" name="password" class="col-sm-12" placeholder="Password">
											<input type="submit" id="submit" class="btn btn-primary btn-block" value="Login">
										</div>
									</form>

									<span class="boxlink wowhideme "><a href=" " class="defaultbutton mainthemebgcolor"><i class="fa fa-link"></i></a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end container -->

			<!-- BEGIN FOOTER -->
			<#include "stubs/footer.ftl"/>
			<!-- END FOOTER -->

			<!-- BEGIN SCRIPTS -->
			<#include "stubs/scripts.ftl"/>
			<!-- END SCRIPTS -->

		</div><!-- end boxedcontent -->
	</body>
</html>