<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome</title>
    <#include "stubs/header.ftl">
</head>
<body id="top">

<!-- navbar -->
<#--<#include "stubs/navbar.ftl">-->

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="navbar-brand">Welcome</span>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#about">About</a></li>
                <li><a href="#events">Events</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="#donate">Donate</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- navbar -->

<!-- carousel -->
<#include "stubs/carousel.ftl">
<!-- carousel -->

<!-- about -->
<#include "stubs/about.ftl">
<!-- about -->

<!-- events -->
<#include "stubs/events.ftl">
<!-- events -->

<!-- contact -->
<#include "stubs/contact.ftl">
<!-- contact -->

<!-- donate -->
<#include "stubs/donate.ftl">
<!-- donate -->

<!-- footer -->
<#include "stubs/footer.ftl">
<!-- footer -->

<!-- javascript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="/static/js/custom.js"></script>
<scrip>
    $('.nav li a').on('click', function(){
        $('.nav-collapse').collapse('hide');
    })
</scrip>
<!-- javascript -->

</body>
</html>