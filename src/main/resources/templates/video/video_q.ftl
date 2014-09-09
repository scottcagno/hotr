<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>spring-boot-base|view</title>

		<#include "../stubs/header.ftl"/>

	</head>
	<body>

		<#include "../stubs/navbar.ftl"/>

		<div class="container navbar-margin">
			<div class="col-sm-12">
				<div class="row well well-sm">
					<div class="col-sm-7">
						<br>
						<div class="embed-responsive embed-responsive-16by9">
							<iframe src="//player.vimeo.com/video/${video.vimeoId}?portrait=0&title=0&byline=0&badge=0&color=eeeeee&&amp;autoplay=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
						</div>
						<p><strong>Tags:</strong></p>
						<p>
							<#list tags as tag>
								<a href="/video?tag=${tag}">${tag} </a>
							</#list>
						</p>
						<p><strong>Description</strong></p>
						<p>${video.description}</p>
					</div>
					<div class="col-sm-5">
						<br>
						<div class="panel panel-default">
							<div class="panel-heading">Worksheet</div>
							<div class="panel-body">
								<#assign i = 0 />
								<form id="worksheet">
									<#list questions as question>
										<#switch question.inputType>
											<#case "select one">
												<label id="question_${i}">${question.question}?</label>
												<#list question.options as option>
													<div class="radio">
														<label>
															<input id="question_${i}" type="radio" name="${question.question}" id="optionsRadios1" value="${option}">
															${option}
														</label>
													</div>
												</#list>
												<#break/>
											<#case "select many">
												<label id="question_${i}">${question.question} (Select all that apply)</label>
												<#list question.options as option>
													<div class="checkbox">
														<label>
															<input name="${question.question}" id="question_${i}" type="checkbox" value="${option}">
															${option}
														</label>
													</div>
												</#list>
												<#break/>
											<#case "text box">
												<label id="question_${i}">${question.question}</label>
												<div class="form-group">
													<textarea name="${question.question}" id="question_${i}" class="form-control" rows="5" style="resize:none;"></textarea>
												</div>
												<#break/>
											<#default>
												<label id="question_${i}">${question.question}?</label>
												<div class="form-group">
													<input name="${question.question}" id="question_${i}" type="${question.inputType}" class="form-control" required="true"/>
												</div>
										</#switch>
										<#assign i = i +1 />
									</#list>
									<br>
								</form>

								<form id="submitForm" action="/worksheet" role="form" method="post">
									<div class="checkbox">
										<label>
											<input type="checkbox" name="save" value="true"> Save completed workbook in my profile.
										</label>
									</div>
									<div class="checkbox">
										<label>
											<input type="checkbox" name="email" value="true"> Email completed workbook to me.
										</label>
									</div>
									<div class="checkbox">
										<label>
											<input type="checkbox" name="send" value="true"> Anonymously submit my completed workbook to Fan the Flame Dates.
										</label>
									</div>
									<input type="hidden" name="videoId" value="${video.id}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<input id="answers" type="hidden" name="answers">
								</form>
								<button id="submitWorksheet" class="btn btn-md btn-default btn-block">Submit</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<#include "../stubs/footer.ftl"/>

		<!-- scripts -->
		<div id="scripts">

			<#include "../stubs/scripts.ftl"/>

			<script>

				function formToObject(form) {
				    var object = {};
				    var formArray = form.serializeArray();
				    $.each(formArray, function() {
				        if (object[this.name] !== undefined) {
				            if (!object[this.name].push) {
				                object[this.name] = [object[this.name]];
				            }
				            object[this.name].push(this.value || '');
				        } else {
				            object[this.name] = this.value || '';
				        }
				    });
				    return object;
				};

				$('button[id="submitWorksheet"]').click(function() {
					obj = formToObject($('form[id="worksheet"]'));
					//j = JSON.stringify(obj);
					$('input[id="answers"]').val(obj);
					$('form[id="submitForm"]').submit();
				});

			</script>
		</div>
	</body>
</html>