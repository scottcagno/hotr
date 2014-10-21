<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Donate</title>
		<#include "stubs/header.ftl"/>
	</head>
	<body id="body">
		<#include "stubs/navbar.ftl"/>

		<!-- content -->
		<div class="container navbar-margin">
			<div class="well well-lg text-center">
				<h3>“Fan the Flame Dates” is funded through generous donations from supporters like you!</h3>
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

	</body>
</html>


