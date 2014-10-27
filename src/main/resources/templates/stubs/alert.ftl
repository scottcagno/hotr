<div class="container navbar-margin">
	<!-- login error -->
	<#if RequestParameters.error??>
		<div id="alert" class="row">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				Invalid username or password. Please try again.
			</div>
		</div>
	</#if>
	<#if alert??>
		<div id="alert" class="row">
			<div class="alert alert-info alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alert}
			</div>
		</div>
	<#elseif alertError??/>
		<div id="alert" class="row">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alertError}
			</div>
		</div>
	<#elseif alertSuccess??/>
		<div id="alert" class="row">
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alertSuccess}
			</div>
		</div>
	<#elseif alertWarning??/>
		<div id="alert" class="row">
			<div class="alert alert-warning alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alertWarning}
			</div>
		</div>
	</#if>
</div>