<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Login</title>

		<#include "../../stubs/header.ftl"/>

		<style>input.uploader{position:absolute;left:-9999px;}label.uploader{cursor:pointer;}</style>
	</head>
	<body id="body">

		<#include "../../stubs/navbar.ftl"/>

		<!-- content -->
		<div class="container navbar-margin">
			<div class="col-sm-offset-4 col-sm-4">
				<div id="uploadVideoPanel" class="panel panel-default">
					<div class="panel-heading">Upload Video</div>
					<div class="panel-body">
						<form id="uploader" role="form" method="post" action="${upload.upload_link_secure}" enctype="multipart/form-data">
							<div class="form-group">
								<label class="btn btn-default btn-block uploader" for="file_data">Select Video</label>
								<input type="file" id="file_data" name="file_data" class="uploader" required="true"/>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button id="uploader" class="btn btn-md btn-primary btn-block" type="submit" disabled="true">Upload</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- scripts -->
		<div id="scripts">

			<#include "../../stubs/scripts.ftl"/>

			<script>
				function updateFileInfo() {
					var filepath = this.value;
					var m = filepath.match(/([^\/\\]+)$/);
					var filename = m[1];
					$('label[for^="'+this.id+'"]').text(filename);
					var inputs = $('form[id="uploader"] input');
					var file = true;
					for (var i = 0; i < 2; i++) {
						if (inputs[i].value === "") {
							file = false;
						}
					}
					if (file) {
						$('button[id="uploader"]').removeAttr('disabled')
					}
				}

				function addEventListenerBySelector(selector, event, fn) {
					var list = $(selector);
					list.bind(event, fn)
				}

				// add event listener on change of the file input
				addEventListenerBySelector('input.uploader', 'change', updateFileInfo);
			</script>
		</div>

	</body>

</html>