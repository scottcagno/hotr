<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Blogs</title>
		<#include "../../stubs/header.ftl"/>

		<!-- TINYMCE WYSIWYG -->
		<script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>
		<script>
			tinymce.init({
				selector:'textarea',
				plugins: [
					"autolink lists link image print",
					"searchreplace visualblocks code",
					"insertdatetime media table contextmenu paste"
				],
				toolbar: "styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist | link image"
			});
		</script>
		<!-- TINYMCE WYSIWYG -->

	</head>
	<body id="body">
		<#include "../../stubs/admin_navbar.ftl"/>

		<!-- delete item alert -->
		<div class="container">
			<div id="delete-item-confirm" class="hide alert alert-danger alert-dismissible wow fadeIn" role="alert">
				<form role="form" method="post" class="form-inline" action="">
					<div class="form-group">
						<button class="btn btn-sm btn-danger" type="submit">Yes, I'm sure</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="form-group">
						<button id="delete-item-confirm-cancel" type="button" class="btn btn-default">No, cancel</button>
					</div>
					<div class="form-group pull-right">
						<p class="text-danger">
							Are you sure you want to permanently remove this blog post?
						</p>
					</div>
				</form>
			</div>
		</div>
		<!-- delete item alert -->

		<!-- content -->
		<div id="content" class="container">
			<!-- add/edit -->
			<div class="col-sm-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						Add/Edit Blog <span class="pull-right"><a href="/admin/blog">Clear</a></span>
					</div>
					<div class="panel-body">
						<form role="form" method="post" action="/admin/blog/save">
							<div class="form-group">
								<label>Title</label>
								<span class="text-error">${(errors.title)!}</span>
								<input type="text" id="title" name="title" class="form-control"
									   placeholder="Blog title" required="true" value="${(blog.title)!}"/>
							</div>
							<div class="form-group">
								<label>Body</label>
								<span class="text-error">${(errors.body)!}</span>
								<textarea id="body" name="body" class="form-control"
									   placeholder="Blog body" rows="10" style="resize:none;">${(blog.body)!}</textarea>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
							<#if blog??>
								<br/>
								<input type="hidden" name="id" value="${(blog.id)!}"/>
								<input type="hidden" name="date" value="${(blog.date)!}"/>
								<!-- delete item trigger -->
								<span id="delete-item" data-id="/admin/blog/del/${blog.id}"
									  class="btn btn-block btn-danger">
									Delete Entry
								</span>
								<!-- delete item trigger -->
							</#if>
						</form>
					</div>
				</div>
			</div>
			<!-- add/edit -->

			<!-- view all -->
			<div class="col-sm-4">
				<div class="panel panel-default">
					<div class="panel-heading">All Blog Posts</div>

						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Date</th>
										<th>Title</th>
									</tr>
								</thead>
								<tbody>
									<#list blogs as blog>
										<tr>
											<td>
												<a href="/admin/blog/${(blog.id)!}" class="">
												${(blog.date)?string["MMMM dd, yyyy"]}
												</a>
											</td>
											<td>
												<#if blog.title?length gt 15>
                                                        ${blog.title?substring(0,15)+"..."}
                                                    <#else>
													${(blog.title)!}
												</#if>
											</td>
										</tr>
									</#list>
								</tbody>
							</table>
						</div>
				</div>
			</div>
			<!-- view all -->
		</div>
		<!-- content -->

		<!-- footer -->
		<#include "../../stubs/footer.ftl"/>
		<!-- footer -->

		<!-- scripts -->
		<#include "../../stubs/scripts.ftl"/>
		<script src="/static/js/admin/global.js"></script>
		<script src="/static/js/delete-item.js"></script>
		<!-- scripts -->

	</body>
</html>
