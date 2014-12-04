<#import "global.ftl" as glob/>

<div class="container navbar-margin">
	<!-- login error -->
	<#if RequestParameters.error??>
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			Invalid username or password. Please try again.
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

	<#if RequestParameters.formError??>
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			${RequestParameters.formError}
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