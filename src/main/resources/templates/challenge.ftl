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

                <div class="col-md-12">
					<div class="text-center" style="border:1px solid black;height:75px;width:100%;padding:15px;margin:15px;">
                        <h1>the<strong><span class="text-danger">ONE YEAR</span>Challenge</strong></h1>
                    </div>
                </div>
				<div class="col-md-8">
					<div class="text-center">
                        <h3>Ready to Fan the Flame of your marriage?<br/> Take the ONE YEAR CHALLENGE!</h3>
                        <p>IMAGE GOES HERE</p>
                        <p class="lead">
                            Here's how our free program works. After you create a login:
                        </p>
						<ul class="text-left">
							<li>Watch a new Fan the Flame Date every month</li>
							<li>Answer the questions at the end of the video</li>
							<li>You'll see your progress bar grow after each one is completed</li>
							<li>Next month ... repeat the process!</li>
							<li>Don't forget to recommend this to your friends and family so they can Fan the Flame of their marriage too!</li>
						</ul>
						<p>
							Intimacy, passion and unity will begin to grow throughout the months as you work together.
							If you forget a month ... don't worry ...we'll send you an email reminder so you can catch up.
						</p>
						<p>
							Each month new videos will be added to the site ...and you'll receive recommendations based
							on your personal viewing taste.
						</p>
					</div>
                </div>
				<div class="col-md-4">
					<div class="text-center">
						<form action="/auth/facebook" method="post">
							<button class="btn btn-block"><span class="text-primary">Sign in with Facebook</span>
								<i class="text-primary fa fa-facebook-square fa-lg"></i>
							</button>
							<input type="hidden" name="scope" value="email"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</form>
						<br/>
                        <div class="panel panel-default">
							<div class="panel-heading">
								Register
							</div>
							<div class="panel-body">
								<form role="form" method="post" action="/register">
									<div class="form-group">
										<span class="text-error">${(errors.firstName)!}</span>
										<input type="text" id="firstName" name="firstName" class="form-control"
											   placeholder="First Name" required="true" value="${(user.firstName)!}"/>
									</div>
									<div class="form-group">
										<span class="text-error">${(errors.lastName)!}</span>
										<input type="text" id="lastName" name="lastName" class="form-control"
											   placeholder="Last Name" required="true" value="${(user.lastName)!}"/>
									</div>
									<div class="form-group">
										<span class="text-error">${(errors.username)!}</span>
										<input type="email" id="username" name="username" class="form-control"
											   placeholder="Email" required="true" value="${(user.username)!}"/>
									</div>
									<!-- toggle show password input -->
									<div class="form-group">
										<div class="input-group">
											<span class="text-error">${(errors.password)!}</span>
											<input type="password" id="toggle-pass" name="password" class="form-control"
												   placeholder="Password" required="true" value="${(user.password)!}"/>
                                            <span class="input-group-btn">
                                            	<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
														title="Click to show/hide your password">
													<i class="fa fa-eye-slash"></i>
												</button>
                                            </span>
										</div>
									</div>
									<!-- toggle show password input -->
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<button class="btn btn-md btn-success btn-block" type="submit">Create</button>
								</form>
							</div>
						</div>
					</div>
				</div>


				<#--<div class="col-lg-8 col-lg-offset-2 well well-lg">
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
				</div>-->
			</div>
		</div>

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>
		<script src="/static/js/password.js"></script>
		<!-- javascript -->

	</body>
</html>