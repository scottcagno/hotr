<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Template</title>
		<#include "../../stubs/header.ftl"/>
	</head>
	<body id="body">

		<#include "../../stubs/navbar.ftl"/>

		<!-- content -->
		<div class="container">
			<div class="col-sm-offset-4 col-sm-4">
				<div class="panel panel-default">
					<div class="panel-heading">Add Video</div>
					<div class="panel-body">
						<form id="" role="form" method="post" action="/secure/video/add">
							<div class="form-group">
								<input type="text" id="name" name="name" class="form-control"
									   placeholder="Name" required="true" />
							</div>
							<div class="form-group">
								<textarea id="description" name="description" class="form-control" rows="5"
										  style="resize:none;"></textarea>
							</div>
							<input type="hidden" name="thumb" value="${(vimeo.pictures.sizes?last.link)!}"/>
							<input type="hidden" name="uri" value="${vimeo.uri}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button class="btn btn-md btn-primary btn-block" type="submit">Add</button>
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
