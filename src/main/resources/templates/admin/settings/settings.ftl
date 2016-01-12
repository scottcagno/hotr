<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../../stubs/header.ftl"/>
		<title>Settings</title>
		
	</head>
	<body id="body">

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
							Are you sure you want to permanently reset the colors site wide?
						</p>
					</div>
				</form>
			</div>
		</div>
		<!-- delete item alert -->

		<div class="container">
			<#include "../../stubs/alert.ftl"/>
			<div class="row">
				<form action="/admin/settings" method="post">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Site Settings</div>
							<div class="panel-body">
								<div class="form-group">
									<div class="row">
										<div class="col-lg-3">
											<label>Primary</label>
											<input name="prim" type="color" class="form-control" value="${(settings?? && settings.prim??)? string((settings.prim)!, '#428bca')}"/>
										</div>
										<div class="col-lg-3">
											<label>Success</label>
											<input name="succ" type="color" class="form-control" value="${(settings?? && settings.succ??)? string((settings.succ)!, '#5cb85c')}"/>
										</div>
										<div class="col-lg-3">
											<label>Info</label>
											<input name="info" type="color" class="form-control" value="${(settings?? && settings.info??)? string((settings.info)!, '#5bc0de')}"/>
										</div>
										<div class="col-lg-3">
											<label>Video Slide</label>
											<select class="form-control" name="videoId">
												<#list vids as vid>
													<option value="${vid.id?c}" ${(settings?? && settings.videoId?? && settings.videoId == vid.id)? string('selected', '')}>${vid.name}</option>
												</#list>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-lg-3">
											<label>Warning</label>
											<input name="warn" type="color" class="form-control" value="${(settings?? && settings.warn??)? string((settings.warn)!, '#f0ad4e')}"/>
										</div>
										<div class="col-lg-3">
											<Label>Danger</Label>
											<input name="dang" type="color" class="form-control" value="${(settings?? && settings.dang??)? string((settings.dang)!, '#d9534f')}"/>
										</div>
										<div class="col-lg-3">
											<label>Default</label>
											<input name="defa" type="color" class="form-control" value="${(settings?? && settings.defa??)? string((settings.defa)!, '#ffffff')}"/>
										</div>
										<div class="col-lg-3">
											<label>Options</label>
											<div class="btn-group btn-block">
												<button class="btn btn-primary" style="width: 50%;">Save</button>
												<!-- delete item trigger -->
												<span id="delete-item" data-id="/admin/settings/erase" class="btn btn-danger" style="width: 50%;">
													Reset
												</span>
												<!-- delete item trigger -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
		</div>
		<!-- content -->

		<!-- javascript -->
		<#include "../../stubs/scripts.ftl"/>
		<script src="/static/js/delete-item.js"></script>
		<!-- javascript -->

	</body>
</html>


