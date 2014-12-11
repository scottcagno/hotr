<!DOCTYPE html>
<html lang="en">
    <head id="head">
        <#include "stubs/header.ftl"/>
        <title>Promotional</title>
    </head>
    <body id="body">

        <#assign link = (auth)?string('/secure', '')/>

        <div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="${link}/home" class="navbar-brand">Home</a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${link}/video/all"> Videos</a></li>
                        <li><a href="${(auth)?string('/secure/user', '/secure/promo')}">${(auth)?string('Account', 'Login')}</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${link}/home#about">About</a></li>
                                <li><a href="${link}/home#events">Events</a></li>
                                <li><a href="${link}/home#contact">Contact</a></li>
                                <li class="divider"></li>
                                <li><a href="${link}/donate">Donate</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <#include "stubs/alert.ftl"/>

        <!-- content -->
        <div class="container">
            <legend>Promotional Content</legend>
            <div class="col-sm-6">
                <div class="well well-sm text-center">
                    <label>Fan the Flame Bulletin insert (pdf format)</label>
                    <a href="/static/bulletin.pdf" target="_blank">
                        <img width="450" src="/static/img/promo.jpg" class="img-responsive img-thumbnail">
                    </a>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="well well-sm text-center">
                    <label>Research Says... (Funny Promo Video)</label>
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe src="https://www.youtube.com/embed/DAsNsMu0Dpc" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="well well-sm text-center">
                    <label>Thing You Should Never Say To Your Wife (Promo video)</label>
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe src="http://www.youtube.com/embed/_jQ-z23_C3A" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="well well-sm text-center">
                    <label>Promotional Video</label>
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe src="http://www.youtube.com/embed/ZJLesBwdYpw" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                    </div>
                </div>
            </div>

        </div>
        <!-- content -->

        <!-- footer -->
        <#include "stubs/footer.ftl"/>
        <!-- footer -->

        <!-- javascript -->
        <#include "stubs/scripts.ftl"/>
        <!-- javascript -->

    </body>
</html>


