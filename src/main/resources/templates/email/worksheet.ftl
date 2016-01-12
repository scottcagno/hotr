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
					<p>Hello ${name},</p><br/>
					<p>Here is a copy of the worksheet you completed for video ${worksheet.videoName}</p><br/>
					<div style="padding:5px;border:1px solid #5a5a5a;">
						<p>
							${worksheet.htmlData}
						</p>
					</div>
					<p>
						<em>
							**If you received this email in error, please delete it;
							we apologize for the inconvenience.
						</em>
					</p>
				</div>
			</div>
		</div>
	</body>
</html>