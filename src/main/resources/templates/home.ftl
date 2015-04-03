<!DOCTYPE html>
<html lang="en" itemscope itemtype="http://schema.org/Organization">
	<head>
		<#include "stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/shadows.css"/>
		<link href="/static/css/carousel.css" rel="stylesheet" type="text/css"/>
        <title>Home</title>
	</head>
	<body>

		<#include "stubs/navbar.ftl"/>

		<#include "stubs/alert.ftl"/>

		<!-- carousel -->
        <div class="">
            <div class="container">
                <div class="col-lg-9">
                    <#include "stubs/carousel.ftl"/>
                </div>
                <div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading">
							Hot Topics
						</div>
						<div class="panel-body">
							<#list topics as topic>
								<a href="/video/all?topic=${topic.topic}" class="btn btn-block red">
									${topic.topic?cap_first} <span class="badge pull-right">${topic.watched} Views</span>
								</a>
							</#list>
						</div>
					</div>
                </div>
            </div>
        </div>

		<!-- carousel -->


		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>
        <!-- javascript -->

	</body>
</html>