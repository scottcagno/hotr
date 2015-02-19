<!DOCTYPE html>
<html lang="en">
	<head id="head">
        <#include "stubs/header.ftl"/>
		<title>Error Page</title>
	</head>
	<body id="body">

        <!-- navbar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="/home">${(glob.home)!Home}</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/home#about">About</a></li>
                        <li><a href="/home#events">Events</a></li>
                        <li><a href="/home#contact">Contact</a></li>
						<li><a href="/blog">Blog</a></li>
                        <li><a href="/video/all">Videos</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- navbar -->

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
