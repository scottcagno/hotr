<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Devotionals</title>
		<#include "../../stubs/header.ftl"/>
		<style>input.uploader{position:absolute;left:-9999px;}label.uploader{cursor:pointer;}</style>

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
				toolbar: "styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist | link image",
				image_list: "/admin/image"
			});
		</script>
		<!-- TINYMCE WYSIWYG -->

	</head>
	<body id="body">
		<#include "../../stubs/admin_navbar.ftl"/>
		<br/>
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
							Are you sure you want to permanently remove this devotional post?
						</p>
					</div>
				</form>
			</div>
		</div>
		<!-- delete item alert -->

		<!-- file error alert -->
		<div id="fileError" class="container hide">
			<div class="alert alert-danger">
				<p id="fileMessage"></p>
			</div>
		</div>
		<!-- file error alert -->

		<!-- content -->
		<div class="container">
			<#include "../../stubs/alert.ftl"/>
			<!-- add/edit -->
			<div class="col-sm-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						Add/Edit Devotional <span class="pull-right"><a href="/admin/devotional">Clear</a></span>
					</div>
					<div class="panel-body">
						<form role="form" method="post" class="ajaxUpload" action="/admin/devotional/save">
							<div class="form-group">
								<label>Title</label>
								<span class="text-error">${(errors.title)!}</span>
								<input type="text" id="title" name="title" class="form-control"
									   placeholder="Devotional title" required="true" value="${(devotional.title)!}"/>
							</div>
							<div class="form-group">
								<label>Body</label>
								<span class="text-error">${(errors.body)!}</span>
								<textarea id="body" name="body" class="form-control"
									   placeholder="Devotional body" rows="10" style="resize:none;">${(devotional.body)!}</textarea>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
							<#if devotional??>
								<br/>
								<input type="hidden" name="id" value="${(devotional.id)!}"/>
								<input type="hidden" name="date" value="${(devotional.date)!}"/>
								<!-- delete item trigger -->
								<span id="delete-item" data-id="/admin/devotional/del/${devotional.id}"
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
					<div class="panel-heading">Add Image</div>
					<div class="panel-body">
						<form id="uploader" class="text-center" role="form" method="post"
							  action="/admin/image/upload" enctype="multipart/form-data">
							<div class="form-group">
								<label class="btn btn-default btn-block uploader" for="file">
									Add Image
								</label>
								<input class="uploader" id="file" type="file" name="devotional" required="true">
							</div>
							<button class="btn btn-primary uploader btn-block" id="uploadAjax" type="submit"
									disabled="true">
								Upload
							</button>
							<input type="hidden" name="redirect" value="/admin/devotional/${(id)!}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</form>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">All Devotional Posts</div>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Date</th>
									<th>Title</th>
								</tr>
							</thead>
							<tbody>
								<#list devotionals as devotional>
									<tr>
										<td>
											<a href="/admin/devotional/${(devotional.id)!}" class="">
											${(devotional.date)?string["MMMM dd, yyyy"]}
											</a>
										</td>
										<td>
											<#if devotional.title?length gt 15>
												${devotional.title?substring(0,15)+"..."}
											<#else/>
												${(devotional.title)!}
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

		<!-- upload spinner -->
		<div id="uploadSpinner" class="text-center hide">
			<p class="lead">
				<strong>Uploading your file...</strong><br/>
			</p>
			<i class="fa fa-5x fa-circle-o-notch fa-spin"></i>
			<p class="lead">One moment please.</p>
		</div>
		<!-- upload spinner -->

		<!-- scripts -->
		<#include "../../stubs/scripts.ftl"/>
		<script src="/static/js/delete-item.js"></script>
		<script src="/static/js/admin/image-upload.js"></script>
		<!-- scripts -->

	</body>
</html>
