<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "../../stubs/header.ftl"/>
		<title>Add Video</title>
	</head>
	<body id="body">

		<#include "../../stubs/admin_navbar.ftl"/>

		<br/>
		<!-- content -->
		<div class="container">
			<#include "../../stubs/alert.ftl"/>
			<div class="row">
				<div class="col-sm-offset-4 col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading">Add Video</div>
						<div class="panel-body">
							<form id="videoForm" role="form" method="post" action="/admin/video">
								<label>Name</label>
								<div class="form-group">
									<span class="text-error">${(errors.name)!}</span>
									<input type="text" id="name" name="name" class="form-control"
										   placeholder="Name" required="true" value="${(video.name)!}"/>
								</div>
								<label>Description</label>
								<div class="form-group">
									<span class="text-error">${(errors.description)!}</span>
									<textarea id="description" name="description" class="form-control" rows="5" placeholder="Description"
											  style="resize:none;">${(video.description)!}</textarea>
								</div>
								<label>Topics separated by space</label>
								<div class="form-group">
									<textarea id="topics" name="topics" class="form-control" rows="5" placeholder="Topics"
											  style="resize:none;">${(topics)!}</textarea>
								</div>
								<#--<label>Series</label>
								<div class="form-group row">
									<div id="seriesSelectDiv" class="col-sm-12">
										<select id="seriesSelect" name="seriesSelect" class="form-control">
											<option value="">None</option>
											<option value="add">Add Series</option>
											<#if allSeries?has_content>
												<#list allSeries as series>
													<option value="${series}">${series}</option>
												</#list>
											</#if>
										</select>
									</div>
								</div>-->
								<div id="seriesInput" class="form-group" hidden="hidden">
									<input class="form-control" id="series" name="series" type="text" placeholder="Add Series"/>
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

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/admin/video.js"></script>
	</body>
</html>
