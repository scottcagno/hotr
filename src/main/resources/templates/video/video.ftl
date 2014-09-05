<!DOCTYPE html>
<html lang="en">
<head id="head">
    <title>Videos</title>
    <#include "../stubs/header.ftl"/>
</head>
    <body id="body">

        <#include "../stubs/navbar.ftl"/>

        <!-- content -->
        <div id="content" class="container navbar-margin">
			<#list videos as video>
				<div class="col-xs-6 col-sm-3 col-md-2 text-center">
					<a href="/video/${video.id}" class="thumbnail">
						<img src="${(video.thumb??)?string((video.thumb)!, '/static/img/video.png')}" class="img-responsive img-thumbnail" alt="Video Thumbnail">
					</a>
					<p><strong>${video.name}</strong></p>
				</div>
			</#list>
        </div>

        <#include "../stubs/footer.ftl"/>

        <#include "../stubs/scripts.ftl"/>

    </body>
</html>
