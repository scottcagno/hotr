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
				<div class="col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading">Edit Video</div>
						<div class="panel-body">
							<form id="videoForm" role="form" method="post" action="/admin/video">
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

								<div class="form-group row">
									<div id="categorySelectDiv" class="col-xs-6">
										<select id="categorySelect" name="categorySelect" class="form-control">
											<option value="">Select A Category</option>
											<option value="">--------------------</option>
											<hr/>
											<#list categories as category>
												<option value="${category}" ${(video.category == category)?string('selected', '')}>${category}</option>
											</#list>
										</select>
									</div>
									<div class="col-xs-6">
										<a id="addCategory" class="btn btn-primary btn-block">Add Category</a>
									</div>
								</div>
								<div id="categoryInput" class="form-group" hidden="hidden">
									<input class="form-control" id="category" name="category" type="text"
										   placeholder="Add Category" value="${video.category}"/>
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
				<div id="" class="col-sm-8" >
					<div id="" class="panel panel-default">
						<div class="panel-heading col-sm-12">
							Questions
							<a href="/admin/question/add?videoId=${video.id}" class="btn btn-default btn-xs pull-right">Add question</a>
						</div>
						<div class="panel-body">
							<div id="" class="table-responsive">
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
												<td>${question.question}</td>
												<td>${question.inputType?cap_first}</td>
												<td>${(question.options?size > 0)?string(question.options?join(', '), 'None')}</td>
												<td>
													<a href="/admin/question/${question.id}" class="btn btn-xs btn-primary">
														<i class="fa fa-pencil"></i>
													</a>
													<a href="" class="btn btn-danger btn-xs" data-id="${question.id}"
														data-toggle="modal" data-target="#questionDeleteCheck">
														<i class="fa fa-trash-o"></i>
													</a>
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
		</div>
		<!-- content -->

		<div class="modal fade" id="questionDeleteCheck" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Are you sure?</h4>
					</div>
					<div class="modal-body">
						Permanently remove question? This action cannot be undone.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-md pull-left" data-dismiss="modal">No, Cancel
						</button>
						<span id="delete">
							<form role="form" method="post" action="/admin/question/{id}">
								<input type="hidden" name="videoId" value="${video.id?c}"/>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button type="submit" class="btn btn-primary btn-md">Yes, Remove Question</button>
							</form>
						</span>
					</div>
				</div>
			</div>
		</div>

		<#include "../../stubs/footer.ftl"/>

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/admin/video.js"></script>
		<script src="/static/js/admin/global.js"></script>

	</body>
</html>
