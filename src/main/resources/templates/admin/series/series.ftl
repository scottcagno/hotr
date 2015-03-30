<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "../../stubs/header.ftl"/>
		<title>Admin</title>
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
						<p class="lead text-danger">
							Are you sure you want to permanently remove this series?
						</p>
					</div>
				</form>
			</div>
		</div>
		<!-- delete item alert -->

		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="form-group">
						<select class="form-control" id="seriesSelect">
							<option value="none">Choose Series</option>
							<#list allSeries as s>
								<option value="${s.id}" ${(id?? && id == s.id)? string('selected', '')}>${s.name}</option>
							</#list>
						</select>
					</div>
					<#if series??>
						<!-- delete item trigger -->
						<span id="delete-item" data-id="/admin/series/del/${series.id}"
							  class="btn btn-danger btn-block">Delete
						</span>
						<!-- delete item trigger -->
					</#if>
				</div>
				<div class="col-lg-3">
					<form action="/admin/series/save" method="post" id="seriesForm">
						<div class="form-group">
							<input name="name" class="form-control" type="text" placeholder="Name" value="${(series.name)!}"/>
						</div>
						<input type="hidden" name="id" value="${(series.id)!}"/>
						<input type="hidden" name="videoIds"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
					<button id="save" class="btn btn-primary btn-block">${(series??)?string('Save', 'Add')}</button>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<#list videos as video>
						<div class="checkbox">
							<label>
								<input type="checkbox" value="${video.id}" ${(series?? && series.videoIds?? && series.videoIds?seq_contains(video.id))? string('checked', '')}/> ${video.name}
							</label>
						</div>
					</#list>
				</div>
			</div>
		</div>
		<!-- content -->

		<!-- footer -->
		<#include "../../stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "../../stubs/scripts.ftl"/>
		<script src="/static/js/admin/series.js"></script>
		<script src="/static/js/delete-item.js"></script>
		<!-- javascript -->

	</body>
</html>


