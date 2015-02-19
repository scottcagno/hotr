<div id="navbar" class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="/home">${(glob.home)!}</a>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/admin/video">Videos</a></li>
				<li><a href="/admin/user">Users</a></li>
				<li><a href="/admin/blog">Blog</a></li>
				<li><a href="/admin">Admin</a></li>
				<li><a href="/logout">Logout</a></li>
			</ul>
		</div>
	</div>
</div>

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