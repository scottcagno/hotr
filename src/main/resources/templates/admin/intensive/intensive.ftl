<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../../stubs/header.ftl"/>
		<title>Intensives</title>
		<!-- tinymce wysiwyg -->
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
		<!-- tinymce wysiwyg -->
		
	</head>
	<body id="body">

		<!-- navbar -->
		<#include "../../stubs/admin_navbar.ftl"/>
		<!-- navbar -->

		<br/>

		<div class="container-fluid">
			<#include "../../stubs/alert.ftl"/>
			<div class="row">
				<!-- add/edit -->
				<div class="col-sm-12">
					<div class="panel panel-default">
						<form role="form" method="post" class="ajaxUpload" action="/admin/intensive">
							<div class="form-group">
								<span style="color: red;">${(errors.body)!}</span>
								<textarea id="htmlData" name="htmlData" class="form-control" rows="20" style="resize:none;">${(intensive.htmlData)!}</textarea>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-primary">Save</button>
						</form>
					</div>
				</div>
				<!-- add/edit -->
			</div>
		</div>
		<!-- content -->

		<!-- javascript -->
		<#include "../../stubs/scripts.ftl"/>
		<script src="/static/js/delete-item.js"></script>
		<!-- javascript -->

	</body>
</html>


