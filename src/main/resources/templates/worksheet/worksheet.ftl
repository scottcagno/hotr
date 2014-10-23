<div>
	<#list answerMap?keys as key>
		<strong>
			${key}<br/>
		</strong>
		<#if answerMap[key]?is_sequence>
			<p style=" text-indent: 2em;">
				${answerMap[key]?join(', ')}
			</p>
			<#else/>
			<p style=" text-indent: 2em;">
				${answerMap[key]}
			</p>
		</#if>
		<br/>
	</#list>
</div>