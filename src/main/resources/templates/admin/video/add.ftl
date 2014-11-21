<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Template</title>
		<#include "../../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../../stubs/admin_navbar.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-sm-offset-4 col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading">Add Video</div>
						<div class="panel-body">
							<form id="videoForm" role="form" method="post" action="/admin/video">
								<label>Name</label>
								<div class="form-group">
									<input type="text" id="name" name="name" class="form-control"
										   placeholder="Name" required="true" />
								</div>
								<label>Description</label>
								<div class="form-group">
									<textarea id="description" name="description" class="form-control" rows="5" placeholder="Description"
											  style="resize:none;"></textarea>
								</div>
								<label>Tags separated by space</label>
								<div class="form-group">
									<textarea id="tags" name="tags" class="form-control" rows="5" placeholder="Tags"
											  style="resize:none;"></textarea>
								</div>
								<label>Category</label>
								<div class="form-group row">
									<div id="categorySelectDiv" class="col-sm-7">
										<select id="categorySelect" name="categorySelect" class="form-control">
											<option value="">Select A Category</option>
											<option value="">--------------------</option>
											<#list categories as category>
												<option value="${category}">${category}</option>
											</#list>
										</select>
									</div>
									<div class="col-sm-5">
										<a id="addCategory" class="btn btn-primary btn-block">Add Category</a>
									</div>
								</div>
								<div id="categoryInput" class="form-group" hidden="hidden">
									<input class="form-control" id="category" name="category" type="text" placeholder="Add Category" required="true"/>
								</div>
								<input type="hidden" name="vimeoId" value="${(RequestParameters.video_uri?split('/')[2])!}"/>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							</form>
							<button id="save" class="btn btn-md btn-primary btn-block" type="submit">Add</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content -->

		<#include "../../stubs/footer.ftl"/>

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/admin/video.js"></script>
	</body>
</html>
