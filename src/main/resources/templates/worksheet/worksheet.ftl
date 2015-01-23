<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Donate</title>
		<#include "../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../stubs/navbar.ftl"/>

		<#include "../stubs/alert.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-lg-offset-3 col-lg-6" >
					<div class="panel panel-default">
						<div class="panel-heading">Worksheet for ${worksheet.videoName}</div>
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


