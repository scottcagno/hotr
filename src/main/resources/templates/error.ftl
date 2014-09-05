<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Error Page</title>
        <#include "stubs/header.ftl">
	</head>
	<body id="body">

        <!--<#include "stubs/navbar.ftl">-->

        <!-- content -->
        <div id="content" class="container">
            <legend>${(error)!} <span class="text-hot">${(message)!}</span></legend>
            <pre>${(exception)!'An unknown error has occoured. That really sucks.'}</pre>
        </div>
        <!-- content -->

        <#include "stubs/footer.ftl">

	</body>
</html>
