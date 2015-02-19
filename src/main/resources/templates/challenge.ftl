<!DOCTYPE html>
<html lang="en">
	<head>
		<#include "stubs/header.ftl"/>
		<title>Challenge</title>
	</head>
	<body id="top">

		<#include "stubs/navbar.ftl"/>

		<#include "stubs/alert.ftl"/>
		<div id="content" class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 well well-lg">
					We like to protect things … we protect our house through home owners insurance … we protect our kids by sheltering them from harmful situations, yet very few of us are actively protecting our marriages from outside threats.
					<br/><br/>
					Research shows the odds of a couple getting a divorce or separation drop drastically if that couple “protects” their marriage by completing a monthly marriage program for the course of a year.
					<br/><br/>
					We’ve designed our “One Year Challenge” in our “Fan the Flame Dates” to help you grow and strengthen the intimacy in your relationship … and protect your marriage for years to come!
					By signing up for an account, you’ll be able to track your monthly progress … answer our “Knee to Knee, Nose to Nose” questions as a couple at the end of each video … and save your answers to reflect on in the future.
					<br/><br/>
					<#if auth>
						<form id="challengeForm" role="form" method="post" action="/secure/user/challenge">
							<input type="hidden" name="userId" value="${userSession.id}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="form-group row">
								<div class="col-sm-8">
									<button class="btn btn-md btn-success btn-block" type="submit">I'm ready to take the challenge</button>
								</div>
								<div class="col-sm-4">
									<div class="checkbox">
										<label>
											<input name="monthly" type="checkbox" value="true"> Email me monthly reminders
										</label>
									</div>
								</div>
							</div>
						</form>
					<#else/>
						Simply click the “log in” button at the top of your screen to create an account and get started!
					</#if>
				</div>
			</div>
		</div>

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>

		<!-- javascript -->

	</body>
</html>