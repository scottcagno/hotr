<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "../../stubs/header.ftl"/>
		<title>Edit Video</title>
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
						<p class="lead text-danger">
							Are you sure you want to permanently remove this question?
						</p>
					</div>
					<input type="hidden" name="videoId" value="${video.id?c}"/>
				</form>
			</div>
		</div>
		<!-- delete item alert -->

		<!-- thumb request alert -->
		<div class="container">
			<#include "../../stubs/alert.ftl"/>
			<div id="thumb-request-confirm" class="hide alert alert-warning alert-dismissible wow fadeIn col-xs-12" role="alert">
				<form role="form" method="post" class="form-inline" action="/admin/video/thumb/${video.id}">
					<div class="col-xs-4">
						<div class="form-group">
							<button class="btn btn btn-warning" type="submit">Yes, make request</button>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="form-group">
							<button id="thumb-request-confirm-cancel" type="button" class="btn btn-default">No, cancel</button>
						</div>
					</div>
					<div class="col-xs-8 text-center">
						<div class="form-group">
							<p>
								Only request a thumbnail if it has been more than 30 minutes since the video was uploaded or a new thumbnail has been uploaded.
							</p>
							<p>
								After the request is made please allow 5-10 minutes to receive the thumbnail.
							</p>
						</div>
					</div>
					<input type="hidden" name="videoId" value="${video.id?c}"/>
				</form>
			</div>
		</div>
		<!-- thumb request alert -->

		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading col-xs-12">
							<div class="col-xs-4 text-center">
								Edit Video
							</div>
							<div class="col-xs-4 text-center">
								<a href="${(video.thumb)!}" target="_blank">View Thumbnail</a>
							</div>
							<div class="col-xs-4 text-center">
								<a id="thumb" href="#">Update Thumbnail</a>
							</div>
						</div>
						<div class="panel-body">
							<form id="videoForm" role="form" method="post" action="/admin/video">
								<label>Name</label>
								<div class="form-group">
									<span class="text-error">${(errors.name)!}</span>
									<input type="text" id="name" name="name" class="form-control"
										   placeholder="Name" required="true" value="${video.name}"/>
								</div>
								<label>Description</label>
								<div class="form-group">
									<span class="text-error">${(errors.description)!}</span>
									<textarea id="description" name="description" class="form-control" rows="5" placeholder="Description"
											  style="resize:none;">${video.description}</textarea>
								</div>
								<label>Topics separated by commas</label>
								<div class="form-group">
									<textarea id="topics" name="topics" class="form-control" rows="5" placeholder="Topics"
											  style="resize:none;">${topics?join(", ")}</textarea>
								</div>
								<!--<label>Series</label>
								<div class="form-group row">
									<div id="seriesSelectDiv" class="col-xs-12">
										<select id="seriesSelect" name="seriesSelect" class="form-control">
											<option ${(video.series?? && video.series == '')?string('selected', '')} value="">None</option>
											<option value="add">Add Series</option>
											<hr/>
											<#if allSeries?has_content>
												<#list allSeries as series>
													<option value="${series}" ${(video.series?? && video.series == series)?string('selected', '')}>${series}</option>
												</#list>
											</#if>
										</select>
									</div>
								</div>-->
								<div id="seriesInput" class="form-group" hidden="hidden">
									<input class="form-control" id="series" name="series" type="text"
										   placeholder="Add Series" value="${video.series}"/>
								</div>
								<input type="hidden" name="id" value="${video.id}"/>
								<input type="hidden" name="thumb" value="${video.thumb!}"/>
								<input type="hidden" name="vimeoId" value="${video.vimeoId}"/>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							</form>
							<button id="save" class="btn btn-md btn-primary btn-block" type="submit">Save</button>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="panel panel-default">
						<div class="panel-heading col-sm-12">
							Questions
							<a href="/admin/question/add?videoId=${video.id}" class="btn btn-default btn-xs pull-right">Add question</a>
						</div>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Question</th>
										<th>Type</th>
										<th>Options</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<#list questions as question>
										<tr>
											<td>${question.ask}</td>
											<td>${question.inputType?cap_first}</td>
											<td>${(question.options?size > 0)?string(question.options?join(', '), 'None')}</td>
											<td>
												<a href="/admin/question/${question.id}" class="btn btn-primary">
													<i class="fa fa-pencil"></i>
												</a>
												<!-- delete item trigger -->
												<span id="delete-item" data-id="/admin/question/del/${question.id}"
													  class="btn btn-danger">
													<i class="fa fa-trash-o"></i>
												</span>
												<!-- delete item trigger -->
											</td>
										</tr>
									</#list>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/admin/video.js"></script>
		<script src="/static/js/delete-item.js"></script>

	</body>
</html>
