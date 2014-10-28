<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>spring-boot-base|edit</title>

		<#include "../../stubs/header.ftl"/>

	</head>
	<body>

		<#include "../../stubs/admin_navbar.ftl"/>

		<div class="container">
			<div class="col-sm-6 col-sm-offset-3" >
				<div class="panel panel-default">
					<div class="panel-heading">Edit Question</div>
					<div class="panel-body">
						<form id="addQuestion" role="form" method="post" action="/admin/question">
							<div class="form-group">
								<input type="text" id="question" name="question" class="form-control"
									   placeholder="Question" required="true" value="${question.question}"/>
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
							<input type="hidden" name="id" value="${question.id}">
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

				// set delete action and add option button on load if exist
				window.onload = function() {
					if ($('a[name="removeOption"]')) {
						$('a[name="removeOption"]').click(function() {
							$('div[id="'+$(this).attr('id')+'"]').remove();
						});
					}
					if ($('a[id="addOptionButton"]')) {
						$('a[id="addOptionButton"]').click(function() {
							addOption();
						});
					}
				}

				// set variables
				var i = ${i};
				var type = 'select[id="inputType"]'
				var addOptionDiv = 'div[id="allOptions"] div[id="addOption"]'

				// add input with delete button add placeholder after input set delete action
				function addOption() {
					$(addOptionDiv).html($('div[id="nextOptionInput"]').html());
					$(addOptionDiv).attr('id', 'option'+i);
					$('div[id="option' + i + '"] input').attr('id', 'option'+i);
					$('div[id="option' + i + '"] a').attr('id', 'option'+i);
					$('div[id="option' + i + '"]').after($('div[id="nextOptionDiv"]').html());
					$('a[id="option' + i + '"]').click(function() {
						$('div[id="'+$(this).attr('id')+'"]').remove();
					});
					i++;
				}

				// run add option on type select add add option button after input || remove all options on type select
				$(type).change(function() {
					$('div[id="allOptions"]').html($('div[id="nextOptionDiv"]').html());
					if ($(type).val() == 'select one' || $(type).val() == 'select many') {
						$('div[id="allOptions"]').html($('div[id="nextOptionDiv"]').html());
						addOption();
						$(addOptionDiv).after($('div[id="nextOptionButton"]').html());
						$('a[id="addOptionButton"]').click(function() {
							addOption();
						});
					}
				});

				// create option list and submit form
				$('button[id="addQuestionButton"]').click(function() {
					if ($(type).val() == 'select one' || $(type).val() == 'select many') {
						var option = []
						inputs = $('div[id="allOptions"] input[name="option"]');
						for (i = 0; i < inputs.length; i++) {
							option.push(inputs[i].value.replace(',', ''));
						}
						$('form[id="addQuestion"] input[name="options"]').val(option);
					}
					$('form[id="addQuestion"]').submit();
				});
			</script>
		</div>
	</body>
</html>