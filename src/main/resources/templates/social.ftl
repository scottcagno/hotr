<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<script src="https://apis.google.com/js/client:platform.js" async defer></script>
		<title>Social Test Page</title>
		<#include "stubs/header.ftl"/>
	</head>
	<body id="body">
		<script src="/static/js/facebook_conf.js"></script>
		<button class="btn btn-default" id="fbLogin"><i class="fa fa-facebook-square fa-2x"></i> Login</button>

		<button id="gLogin">G Login</button>

		<button id="signOut">signout</button>

		<#include "stubs/scripts.ftl"/>
		<script>
			var csrfVal = '${_csrf.token}'

			$('button[id="gLogin"]').click(function() {
				gapi.auth.signIn(
				{
					'clientid' : '268327735010-6t55rdr44med018rtbbmd0cbbp88b0ga.apps.googleusercontent.com',
					'cookiepolicy' : 'single_host_origin',
					'callback' : 'signInCallback'
					}
				);
			});

			function signInCallback() {
			}




		</script>
		<script src="/static/js/facebook.js"></script>
	</body>
</html>


