<#import "global.ftl" as glob/>

<div class="container navbar-margin">
	<!-- login error -->
	<#if RequestParameters.error??>
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			Invalid username or password. Please try again. If you logged in with
			Facebook you must continue to log in with Facebook.
		</div>
	</#if>

	<!-- login expired -->
	<#if RequestParameters.expired??>
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			Your session has expired due to inactivity. Please login.
		</div>
	</#if>

	<#if RequestParameters.invalid??>
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			Your session is invalid, maybe you're logged in from another location?
		</div>
	</#if>

	<#if userSession?? && userSession.progress == 6>
		<div class="alert alert-info alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			You have hit the half way mark in your challenge.
			If you can think of anyone who could benefit from Fan the Flame Dates please take the time to
			<a href="/secure/recommend">recommend</a> us.
		</div>
	</#if>

	<#if alert??>
		<div id="alert">
			<div class="alert alert-info alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alert}
			</div>
		</div>
	<#elseif alertError??/>
		<div id="alert">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alertError}
			</div>
		</div>
	<#elseif alertSuccess??/>
		<div id="alert">
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alertSuccess}
			</div>
		</div>
	</#if>
</div>