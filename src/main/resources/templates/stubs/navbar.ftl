<div class="navbar-wrapper">
	<div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-right">
					<#if authenticated??>
						<li><a href="#about"><i class="fa fa-home"></i> About</a></li>
						<li><a href="/video"><i class="fa fa-vimeo-square"></i> Videos</a></li>
						<li><a href="/account"><i class="fa fa-user"></i> Account</a></li>
						<li><a href="/logout"><i class="fa fa-unlock"></i> Logout (${authenticated})</a></li>

					<#else/>
						<li><a href="#about"><i class="fa fa-home"></i> About</a></li>
						<li><a href="/video"><i class="fa fa-vimeo-square"></i> Videos</a></li>
						<li><a href="/register"><i class="fa fa-user"></i> Register</a></li>
						<li><a href="/secure/login?forward=user"><i class="fa fa-lock"></i> Login</a></li>
					</#if>
				</ul>
			</div>
		</div>
	</div>
</div>

<span class="top-navigator">
    <a href="#top" class="btn btn-sm btn-default"><i class="fa fa-chevron-up"></i></a>
</span>

<#if alert??>
	<div id="alert" class="col-sm-10 col-sm-offset-1">
		<div class="alert alert-info alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			${alert}
		</div>
	</div>
<#elseif alertError??/>
	<div id="alert" class="col-sm-10 col-sm-offset-1">
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			${alertError}
		</div>
	</div>
<#elseif alertSuccess??/>
	<div id="alert" class="col-sm-10 col-sm-offset-1">
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			${alertSuccess}
		</div>
	</div>
</#if>
