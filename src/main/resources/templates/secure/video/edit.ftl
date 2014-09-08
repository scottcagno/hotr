<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Template</title>
		<#include "../../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../../stubs/navbar.ftl"/>

		<!-- content -->
		<div class="container navbar-margin">
			<div class="col-sm-offset-4 col-sm-4">
				<div class="panel panel-default">
					<div class="panel-heading">Edit Video</div>
					<div class="panel-body">
						<form id="" role="form" method="post" action="/secure/video">
							<div class="form-group">
								<input type="text" id="name" name="name" class="form-control"
									   placeholder="Name" required="true" value="${video.name}"/>
							</div>
							<div class="form-group">
								<textarea id="description" name="description" class="form-control" rows="5" placeholder="Description"
										  style="resize:none;">${video.description}</textarea>
							</div>
							<div class="form-group">
								<textarea id="tags" name="tags" class="form-control" rows="5" placeholder="Tags"
										  style="resize:none;">${tags?join(", ")}</textarea>
							</div>
							<input type="hidden" name="id" value="${video.id}"/>
							<input type="hidden" name="thumb" value="${video.thumb}"/>
							<input type="hidden" name="vimeoId" value="${video.vimeoId}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- content -->

		<#include "../../stubs/footer.ftl"/>

		<#include "../../stubs/scripts.ftl"/>

	</body>
</html>
