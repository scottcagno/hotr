<!DOCTYPE html>
<html lang="en">
	<head id="head">

		<#include "../../stubs/header.ftl"/>
		<title>Edit Question</title>

	</head>
	<body>

		<!-- navbar -->
		<#include "../../stubs/admin_navbar.ftl"/>
		<!-- navbar -->

		<br/>
		<div class="container">

			<#include "../../stubs/alert.ftl"/>
			<!-- edit -->
			<div class="col-sm-6 col-sm-offset-3" >
				<div class="panel panel-default">
					<div class="panel-heading">Edit Question</div>
					<div class="panel-body">
						<form id="addQuestion" role="form" method="post" action="/admin/question">
							<div class="form-group">
								<label>Question</label>
								<span class="text-error">${(error)!}</span>
								<input type="text" id="ask" name="ask" class="form-control"
									   placeholder="Question" required="true" value="${question.ask}"/>
							</div>
							<div id="selectType" class="form-group">
								<label>Please choose an answer type</label>
								<select id="inputType" name="inputType" class="form-control">
									<option value="text" <#if question.inputType == "text">selected="true"</#if>>Text</option>
									<option value="text box" <#if question.inputType == "text box">selected="true"</#if>>Text Box</option>
									<option value="select one" <#if question.inputType == "select one">selected="true"</#if>>Select One</option>
									<option value="select many" <#if question.inputType == "select many">selected="true"</#if>>Select Many</option>
								</select>
							</div>
							<input type="hidden" name="id" value="${(question.id?c)!}">
							<input type="hidden" name="video_fk" value="${question.video_fk}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="hidden" name="options" value=""/>
						</form>
						<div id="allOptions">
							<#assign i = 1 />
							<#list question.options as option>
								<div id="option${i}" class="form-group">
									<div class="input-group" id="">
										<input type="text" name="option" class="form-control" placeholder="Option #${i}" value="${option}"/>
										<span class="input-group-btn">
        									<a id="option${i}" class="btn btn-danger" name="removeOption"><i class="fa fa-times"></i></a>
      									</span>
									</div>
								</div>
								<#assign i = i+1 />
							</#list>
							<div id="addOption" class="form-group">
							</div>
							<#if question.options[0]??>
								<div class="form-group">
									<a class="btn btn-success" id="addOptionButton">Add Option</a>
								</div>
							</#if>
						</div>
						<div class="form-group">
							<button id="addQuestionButton" class="btn btn-md btn-primary btn-block" type="submit">Save</button>
						</div>
						<div class="form-group">
							<a href="/admin/video/${question.video_fk}" class="btn btn-default btn-block">Cancel</a>
						</div>
					</div>
				</div>
			</div>
			<!-- edit -->
		</div>

		<!-- duplicates -->
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
		<!-- duplicates -->

		<!-- javascript -->
		<#include "../../stubs/scripts.ftl"/>
		<script>
			// set js variable from freemarker
			var i = ${i};
			var multi = ${(question.inputType == "select many" || question.inputType == "select one") ? string('true', 'false')}
		</script>
		<script src="/static/js/admin/question.js"></script>
		<script src="/static/js/admin/edit-question.js"></script>
		<!-- javascript -->

	</body>
</html>