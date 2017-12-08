<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../../stubs/header.ftl"/>
		<style>input.uploader{position:absolute;left:-9999px;}label.uploader{cursor:pointer;}</style>
		<title>Admin</title>

	</head>
	<body id="body">
		<#include "../../stubs/google-tag-manager-body.ftl"/>
		<!-- navbar -->
		<#include "../../stubs/admin_navbar.ftl"/>
		<!-- navbar -->

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
							Are you sure you want to permanently remove this series?
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

		<div class="container">

			<#include "../../stubs/alert.ftl"/>

			<div class="row">
				<div class="col-lg-3">
					<div class="form-group">
						<!-- all series -->
						<select class="form-control" id="seriesSelect">
							<option value="none">Choose Series</option>
							<option value="none">Add Series</option>
							<option value="none">-----------------</option>
							<#list allSeries as s>
								<option value="${s.id?c}" ${(id?? && id == s.id?c)? string('selected', '')}>${s.name}</option>
							</#list>
						</select>
						<!-- all series -->
					</div>
					<#if series??>

						<!-- delete item trigger -->
						<span id="delete-item" data-id="/admin/series/del/${series.id?c}"
							  class="btn btn-danger btn-block">Delete
						</span>
						<!-- delete item trigger -->

					</#if>
				</div>

				<!-- series name -->
				<div class="col-lg-3">
					<form action="/admin/series/save" method="post" id="seriesForm">
						<div class="form-group">
							<span id="nameError" class="text-error hide">*Name is required</span>
							<input id="seriesName" name="name" class="form-control" type="text" placeholder="Name" value="${(series.name)!}" required="true"/>
						</div>
						<input type="hidden" name="id" value="${(series.id?c)!}"/>
						<input type="hidden" name="videoIds"/>
						<input type="hidden" name="thumb"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
					<button id="save" class="btn btn-primary btn-block">${(series??)?string('Save', 'Add')}</button>
				</div>
				<!-- series name -->

				<!-- upload image -->
				<div class="col-lg-offset-3 col-lg-3">
					<form id="uploader" class="text-center" role="form" method="post"
						  action="/admin/image/upload" enctype="multipart/form-data">
						<div class="form-group">
							<label class="btn btn-default btn-block uploader" for="file">
								Add Image
							</label>
							<input class="uploader" id="file" type="file" name="series" required="true">
						</div>
						<button class="btn btn-primary uploader btn-block" id="uploader" type="submit"
								disabled="true">
							Upload
						</button>
						<input type="hidden" name="redirect" value="/admin/series/${(id?c)!}"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				</div>
				<!-- upload image -->

			</div>
			<br/>
			<div class="row">

				<!-- all  videos -->
				<div class="col-lg-4">
					<legend class="text-white">Videos In Series</legend>
					<#list videos as video>
						<div class="checkbox">
							<label class="text-white">
								<input type="checkbox" class="videoId" value="${video.id?c}" ${(series?? && series.videoIds?? && series.videoIds?seq_contains(video.id?c))? string('checked', '')}/> ${video.name}
							</label>
						</div>
					</#list>
				</div>
				<!-- all  videos -->

				<!-- thumbnails -->
				<div id="images" class="col-lg-8">
					<legend class="text-white">Series Thumbnail</legend>
					<#list images as image>
						<div class="col-lg-3">
							<div class="radio">
								<label>
									<input type="radio" class="image" name="image" value="${image}" ${(series?? && series.thumb?? && series.thumb == image)? string('checked', '')}>
									<img src="/image/${image}" class="img-responsive img-thumbnail"/>
								</label>
							</div>
						</div>
					</#list>
				</div>
				<!-- thumbnails -->

			</div>
		</div>

		<!-- javascript -->
		<#include "../../stubs/scripts.ftl"/>
		<script src="/static/js/admin/series.js"></script>
		<script src="/static/js/delete-item.js"></script>
		<script src="/static/js/admin/image-upload.js"></script>
		<!-- javascript -->

	</body>
</html>


