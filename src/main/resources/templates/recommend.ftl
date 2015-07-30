<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "stubs/header.ftl"/>
		<title>Recommendation</title>
	</head>
	<body id="body">

		<#include "stubs/navbar.ftl"/>

		<!-- begin header -->
		<section class="colorarea">
			<div class="bgsizecover headeropacity" style="background-image:url(/static/asher/img/headers/1.jpg);"></div>
		</section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 negmtop">
					<h1 class="pgheadertitle animated fadeInLeft pull-left">Recommend Us</h1>
				</div>
			</div>
		</div>
		<!-- end header -->

		<!-- content -->
		<div class="container">
			<#include "stubs/alert.ftl"/>
			<div class="row">
				<div class="col-lg-offset-3 col-lg-6">
					<div class="panel panel-default panel1">
						<div class="panel-body text-center">
							<h4 class="black-text">Please provide up to 6 email addresses of friends or family you would like to share Fan the Flame Dates with</h4>
							<br/>
							<div id="recommendDiv">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<input class="form-control" type="email" name="email1" placeholder="Email"/>
										</div>
										<div class="form-group">
											<input class="form-control" type="email" name="email2" placeholder="Email"/>
										</div>
										<div class="form-group">
											<input class="form-control" type="email" name="email3" placeholder="Email"/>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<input class="form-control" type="email" name="email4" placeholder="Email"/>
										</div>
										<div class="form-group">
											<input class="form-control" type="email" name="email5" placeholder="Email"/>
										</div>
										<div class="form-group">
											<input class="form-control" type="email" name="email5" placeholder="Email"/>
										</div>
									</div>
								</div>
								<button id="recommend" class="btn btn-block btn-primary">Recommend</button>
							</div>

						</div>
					</div>
				</div>
				<form id="recommendForm" action="/secure/recommend" method="post" hidden="hidden">
					<input id="emails" name="emails"/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
		</div>
		<!-- content -->

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>
		<script>
			$('button[id="recommend"]').click(function() {
				var emails = []
				var inputs = $('div[id="recommendDiv"] input');
				for (var i = 0; i < inputs.length; i++) {
					if (inputs[i].value != '') {
						emails.push(inputs[i].value);
					}
				}
				$('form[id="recommendForm"] input[id="emails"]').val(emails)
				//alert($('form[id="recommendForm"] input[id="emails"]').val());
				$('form[id="recommendForm"]').submit();
			});
		</script>
		<!-- javascript -->

	</body>
</html>


