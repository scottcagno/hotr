<!DOCTYPE html>
<html lang="en">
	<head id="head">
        <#include "stubs/header.ftl"/>
		<title>Error Page</title>
	</head>
	<body id="body">

        <!-- navbar -->
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
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Videos <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/video/all">All</a></li>
								<li class="divider"></li>
								<li><a href="/video/popular">Popular</a></li>
								<li class="divider"></li>
								<li><a href="/video/recent">Recently Added</a></li>
								<li class="divider"></li>
								<li><a href="/video/series">Series</a></li>
							</ul>
						</li>
						<li><a href="/secure/user">Login</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/about">About</a></li>
								<li class="divider"></li>
								<li><a href="/events">Retreats</a></li>
								<li class="divider"></li>
								<li><a href="/events">Marriage<br/>Intensives</a></li>
								<li class="divider"></li>
								<li><a href="/devotional">Weekly Marriage<br/>Devotional</a></li>
								<li class="divider"></li>
								<li><a href="/contact">Contact</a></li>
								<li class="divider"></li>
								<li><a href="/donate">Donate</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
        <!-- navbar -->

		<#include "stubs/navbar.ftl"/>


        <!-- content -->
        <div class="container navbar-margin error-page">
            <div class="jumbotron">
                <h1>Woops! <p>Sorry, we couldn't find that for you.</p></h1>
            </div>
            <a href="/home" class="red btn btn-default">Lets get you back to solid ground.</a>
        </div>
        <!-- content -->

        <#include "stubs/footer.ftl"/>

	</body>
</html>
