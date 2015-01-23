<!DOCTYPE html>
<html lang="en">
	<head id="head">
        <#include "stubs/header.ftl"/>
		<title>Error Page</title>
	</head>
	<body id="body">

        <!-- navbar -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="/home" class="navbar-brand">${(glob.home)!Home}</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/home#about">About</a></li>
                        <li><a href="/home#events">Events</a></li>
                        <li><a href="/home#contact">Contact</a></li>
                        <li><a href="/video/all">Videos</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- navbar -->

        <!-- content -->
        <div id="content" class="container navbar-margin">
            <legend>${(error)!} <span class="text-hot">${(message)!}</span></legend>
            <pre>${(exception)!'An unknown error has occoured. That really sucks.'}</pre>
        </div>
        <!-- content -->

        <#include "stubs/footer.ftl"/>

	</body>
</html>
