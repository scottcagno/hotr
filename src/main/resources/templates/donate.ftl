<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "stubs/header.ftl"/>
		<title>Donate</title>

	</head>
	<body class="boxedlayout">
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
						<h1 class="pgheadertitle animated fadeInLeft pull-left">Donate</h1>
					</div>
				</div>
			</div>
			<!-- header -->

			<!-- content -->
			<div class="container">
				<#include "stubs/alert.ftl"/>
				<div class="well well-lg text-center">
					<h3 class="black-text">“Fan the Flame Dates” is funded through generous donations from supporters like you!</h3>
					<br/>
					<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
						<input name="cmd" type="hidden" value="_s-xclick" />
						<input name="hosted_button_id" type="hidden" value="4AYV2BCD63B8U" />
						<input alt="PayPal - The safer, easier way to pay online!" name="submit" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" type="image" />
						<img src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" alt="" width="1" height="1" border="0" />
					</form>
				</div>
			</div>
			<!-- content -->

			<!-- footer -->
			<#include "stubs/footer.ftl"/>
			<!-- footer -->

			<!-- javascript -->
			<#include "stubs/scripts.ftl"/>
			<!-- javascript -->
		</div>
	</body>
</html>


