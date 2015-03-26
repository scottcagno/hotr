<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
	<head>
    	<#include "../stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/blog.css"/>
		<title>Blog</title>
	</head>
	<body id="top">

	<#include "../stubs/navbar.ftl"/>

    <#include "../stubs/alert.ftl"/>

	<!-- content -->
	<div class="container">
	    <img style="margin:0 auto;" src="/static/img/blog-header.jpg" class="img-responsive" alt=""/>
		<hr style="border-bottom:2px solid #333;"/>
		<#--<blockquote>
            <h2>
                House On The Rock
                <em style="font-size: smaller;">Family Ministries Blog</em>
            </h2>
        </blockquote>-->

		<#--<!-- blog header &ndash;&gt;
		<div class="blog-header">
			<h1 class="blog-title">House On The Rock</h1>
			<p class="lead blog-description">
				Family Ministries Blog.
				<em><small>Building Men, Marriages, Families and Churches.</small></em>
			</p>
		</div>
		<!-- blog header &ndash;&gt;-->

        <div class="row">

			<!-- blog main -->
			<div class="col-sm-8 blog-main">

				<#list blogs as blog>
					<!-- blog post -->
					<div class="blog-post">
						<p class="blog-post-title"><a href="/blog/${(blog.id)?c}">${(blog.title)!}</a></p>
						<p class="blog-post-meta">${(blog.date)?string["MMMM dd, yyyy hh:mm a (EEEE)"]}</p>
						<div class="blog-body">
                            ${(blog.body)!}
                        </div>
					</div>
					<hr/>
					<!-- blog post -->
				</#list>

			</div>
			<!-- blog main -->

			<!-- blog sidebar / archives -->
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module">
					<h4>Recent Posts</h4>
					<ol class="list-unstyled">
					<#list blogs as blog>
						<li>
							<a href="/blog/${(blog.id)?c}" class="red"
							    data-trigger="hover" data-container="body" data-toggle="popover"
							    data-placement="left" data-content="${(blog.date)?string["MMMM dd, yyyy"]}...">
                                ${(blog.title)!}
							</a>
						</li>
					</#list>
					</ol>
				</div>
			</div>
			<!-- blog sidebar / archives -->

        </div>
    </div>
	<!-- content -->

	<!-- javascript -->
    <#include "../stubs/scripts.ftl"/>
	<script>$(function(){$('[data-toggle="popover"]').popover();});</script>
	<!-- javascript -->

    <#include "../stubs/footer.ftl"/>

	</body>
</html>
