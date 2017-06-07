<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
	<head id="head">

		<#include "../../stubs/header.ftl"/>
		<link rel="stylesheet" href="/static/css/data-table-bootstrap.css">
		<title>Counselors</title>

	</head>
	<body id="body">

		<!-- navbar -->
		<#include "../../stubs/admin_navbar.ftl"/>
		<!-- navbar -->

		<div class="container-fluid">


			<!-- add/edit -->
			<div class="col-sm-offset-2 col-sm-8">
				<br>
				<#include "../../stubs/alert.ftl"/>
				<div class="panel panel-default">
					<div class="panel-heading">
						<#if counselor?? && counselor.id??>
							Edit Counselor <span class="pull-right"><a href="/admin/counselor/${counselor.id?c}">Clear</a></span>
						<#else>
							Add Counselor <span class="pull-right"><a href="/admin/counselor/add">Clear</a></span>
						</#if>

					</div>
					<form role="form" method="post" action="/admin/counselor/${(counselor?? && counselor.id??)?string('edit','add')}" novalidate>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Name</label>
								<span class="text-error">${(errors.name)!}</span>
								<input type="text" id="name" name="name" class="form-control"
									   placeholder="Name" required value="${(counselor.name)!}"/>
							</div>
							<div class="form-group">
								<label>Contact</label>
								<input type="text" id="contactName" name="contactName" class="form-control"
									   placeholder="Contact" value="${(counselor.contactName)!}"/>
							</div>
							<div class="form-group">
								<label>Phone</label>
								<span class="text-error">${(errors.phone)!}</span>
								<input type="text" id="phone" name="phone" class="form-control"
									   placeholder="Phone" value="${(counselor.phone)!}"/>
							</div>
							<div class="form-group">
								<label>Email</label>
								<span class="text-error">${(errors.email)!}</span>
								<input type="email" id="email" name="email" class="form-control"
									   placeholder="Email" value="${(counselor.email)!}"/>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Street</label>
								<span class="text-error">${(errors.street)!}</span>
								<input type="text" id="street" name="street" class="form-control"
									   placeholder="Street" value="${(counselor.street)!}"/>
							</div>
							<div class="form-group">
								<label>City</label>
								<span class="text-error">${(errors.city)!}</span>
								<input type="text" id="city" name="city" class="form-control"
									   placeholder="City" value="${(counselor.city)!}"/>
							</div>
							<div class="form-group">
								<label>State</label>
								<span class="text-error">${(errors.state)!}</span>
								<input type="text" id="state" name="state" class="form-control"
									   placeholder="State" value="${(counselor.state)!}"/>
							</div>
							<div class="form-group">
								<label>Zip</label>
								<span class="text-error">${(errors.zip)!}</span>
								<input type="text" id="zip" name="zip" class="form-control"
									   placeholder="Zip" required value="${(counselor.zip)!}"/>
							</div>
						</div>
						<input type="hidden" name="id" value="${(counselor.id?c)!}"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
					</form>
				</div>
			</div>
			<!-- add/edit -->

		</div>

		<!-- javascript -->

		<#include "../../stubs/scripts.ftl"/>

		<script src="/static/js/password.js"></script>
		<!-- javascript -->

	</body>
</html>
