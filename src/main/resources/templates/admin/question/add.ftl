<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>spring-boot-base|add</title>

		<#include "../../stubs/header.ftl"/>

	</head>
	<body>

		<#include "../../stubs/admin_navbar.ftl"/>

		<div class="container">
			<div class="col-sm-6 col-sm-offset-3" >
				<div class="panel panel-default">
					<div class="panel-heading">Add Question</div>
					<div class="panel-body">
						<form id="addQuestion" role="form" method="post" action="/admin/question">
							<div class="form-group">
								<input type="text" id="question" name="question" class="form-control"
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
				// set variables
				var i = 1;
				var type = 'select[id="inputType"]';
				var addOptionDiv = 'div[id="allOptions"] div[id="addOption"]';
				var multi = false;

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
					if ($(type).val() == 'select one' || $(type).val() == 'select many') {
						if (!multi) {
							multi = true;
							addOption();
							$(addOptionDiv).after($('div[id="nextOptionButton"]').html());
							$('a[id="addOptionButton"]').click(function() {
								addOption();
							});
						}
					} else {
						$('div[id="allOptions"]').html($('div[id="nextOptionDiv"]').html());
						multi = false;
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