<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>spring-boot-base|view</title>

		<#include "../stubs/header.ftl"/>

	</head>
	<body>

		<div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="/secure/home/${hash}" class="navbar-brand">Home</a>
				</div>
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/secure/${hash}/video"> Videos</a></li>
						<li><a href="/secure/${hash}/user"> Account</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/secure/${hash}/home#about">About</a></li>
								<li><a href="/secure/${hash}/home#events">Events</a></li>
								<li><a href="/secure/${hash}/home#contact">Contact</a></li>
								<li class="divider"></li>
								<li><a href="/secure/${hash}/site">Site Map</a></li>
								<li><a href="/secure/${hash}/donate">Donate</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<#include "../stubs/alert.ftl"/>

		<div class="container">
			<div class="row">
				<br/>
				<div class="col-sm-7">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe src="//player.vimeo.com/video/${video.vimeoId}?portrait=0&title=0&byline=0&badge=0&color=eeeeee&&amp;autoplay=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<h1>${video.name}</h1>
						</div>
						<div class="col-lg-6">
							<br/>
							<p class="">${video.description}</p>
						</div>
					</div>
					<div class="row text-center well well-sm">
						<p>
							Check out related videos
						</p>
						<p>
							<#list tags as tag>
								<a href="/secure/${hash}/video?tag=${tag}" class="btn btn-xs btn-primary">${tag}</a>
							</#list>
						</p>
					</div>
				</div>
				<div class="col-sm-5">
					<div class="panel panel-default">
						<div class="panel-heading">Worksheet</div>
						<div class="panel-body">
							<#if worksheet??>
								${worksheet.htmlData}
							<#else/>
								<#assign i = 0 />
								<form id="worksheet">
									<#list questions as question>
										<#switch question.inputType>
											<#case "select one">
												<label id="question_${i}">${question.question}</label>
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
												<label id="question_${i}">${question.question}</label>
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
												<label id="question_${i}">${question.question}</label>
												<div class="form-group">
													<input name="${question.question}" id="question_${i}" type="${question.inputType}" class="form-control" required="true"/>
												</div>
										</#switch>
										<#assign i = i +1 />
									</#list>
									<br>
								</form>
								<form id="submitForm" action="/secure/${hash}/worksheet" role="form" method="post">
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
									<input type="hidden" name="userId" value="${user.id}">
									<input type="hidden" name="videoName" value="${video.name}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<input type="hidden" name="answers" id="answers">
								</form>
								<button id="submitWorksheet" class="btn btn-md btn-default btn-block">Submit</button>
							</#if>
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
					j = JSON.stringify(obj);
					$('input[id="answers"]').val(j);
					$('form[id="submitForm"]').submit();
				});

			</script>
		</div>
	</body>
</html>