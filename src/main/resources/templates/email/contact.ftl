<!doctype html>
<html lang="en-US" style="font-family: 'Noto Sans', sans-serif;font-size: 14px; color:#9c9c9c;">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<div style="margin: 25px;">
			<div style="width: 600px;margin: 0px auto;background-color: #f5f6f5;border:1px solid #dddddd;-moz-border-radius: 3px;-webkit-border-radius: 3px;">
				<div style="padding-left: 27px;padding-right: 27px; padding-bottom: 27px;">
					<br/>
					<p>
						${(name)! 'John Doe'} has contacted us.
						<p>Here is what ${(name)! 'John Doe'} had to say.</p>
						<pre style="white-space: pre-wrap; background-color: white; font-family: 'Noto Sans', sans-serif;font-size: 14px;">${(comment)! 'Hello, this is just filler text to demonstrate how the contact email will look.
The actual email to House on the Rock will contain the message sent by the person who filled out the form.
Obviously they will have more to say and it will be relevant to Fan the Flame Dates. '}</pre>
						Their reply email is ${(email)! 'example@whatever.com'}
					</p>
				</div>
			</div>
		</div>
	</body>
</html>