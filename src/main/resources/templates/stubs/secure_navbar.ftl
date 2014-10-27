	<div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
                <a href="/secure/home/${hash}" class="navbar-brand">Home</a>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-right">
                    <li><a href="/secure/video/${hash}"> Videos</a></li>
                    <li><a href="/secure/user/${hash}"> Account</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="/secure/home/${hash}#about">About</a></li>
                            <li><a href="/secure/home/${hash}#events">Events</a></li>
                            <li><a href="/secure/home/${hash}#contact">Contact</a></li>
                            <li class="divider"></li>
                            <li><a href="/secure/site/${hash}">Site Map</a></li>
                            <li><a href="/secure/donate/${hash}">Donate</a></li>
                        </ul>
                    </li>
				</ul>
			</div>
		</div>
	</div>

<div class="navbar-margin">
	<!-- login error -->
	<#if RequestParameters.error??>
		<div id="alert" class="container">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				Invalid username or password. Please try again.
			</div>
		</div>
	</#if>
	<#if alert??>
		<div id="alert" class="container">
			<div class="alert alert-info alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alert}
			</div>
		</div>
	<#elseif alertError??/>
		<div id="alert" class="container">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alertError}
			</div>
		</div>
	<#elseif alertSuccess??/>
		<div id="alert" class="container">
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alertSuccess}
			</div>
		</div>
	<#elseif alertWarning??/>
		<div id="alert" class="container">
			<div class="alert alert-warning alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${alertWarning}
			</div>
		</div>
	</#if>
</div>