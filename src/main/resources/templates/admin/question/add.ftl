<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../../stubs/header.ftl"/>
		<title>Add Question</title>

	</head>
	<body>

		<#include "../../stubs/admin_navbar.ftl"/>

		<br/>
		<div class="container">
			<#include "../../stubs/alert.ftl"/>
			<div class="col-sm-6 col-sm-offset-3" >
				<div class="panel panel-default">
					<div class="panel-heading">Add Question</div>
					<div class="panel-body">
						<form id="addQuestion" role="form" method="post" action="/admin/question">
							<div class="form-group">
								<label>Question</label>
								<span class="text-error">${(error)!}</span>
								<input type="text" id="ask" name="ask" class="form-control"
									   placeholder="Question" required="true"/>
							</div>
							<div id="selectType" class="form-group">
								<label>Please choose an answer type</label>
								<select id="inputType" name="inputType" class="form-control">
									<option value="text">Text</option>
									<option value="text box">Text Box</option>
									<option value="select one">Select One</option>
									<option value="select many">Select Many</option>
								</select>
							</div>
							<input type="hidden" name="video_fk" value="${videoId}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="hidden" name="options" value=""/>
						</form>
						<div id="allOptions">
							<div id="addOption" class="form-group">
							</div>
						</div>
						<div class="form-group">
							<button id="addQuestionButton" class="btn btn-md btn-primary btn-block" type="submit">Add</button>
							<a href="/admin/video/${videoId}" class="btn btn-default btn-block">Cancel</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="nextOptionInput" hidden="true">
			<div class="input-group">
				<input name="option" type="text" placeHolder="Add Option" class="form-control">
				<span class="input-group-btn">
        			<a class="btn btn-danger" name="removeOption"><i class="fa fa-times"></i></a>
      			</span>
			</div>
		</div>

		<div id="nextOptionDiv" hidden="true">
			<div id="addOption" class="form-group">
			</div>
		</div>

		<div id="nextOptionButton" hidden="true">
			<div class="form-group">
				<a class="btn btn-success" id="addOptionButton">Add Option</a>
			</div>
		</div>

		<!-- scripts -->
		<div id="scripts">

			<#include "../../stubs/scripts.ftl"/>

			<script>
				var i = 1;
				var multi = false;
			</script>
			<script src="/static/js/admin/question.js"></script>
		</div>
	</body>
</html>