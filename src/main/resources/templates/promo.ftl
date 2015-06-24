<!DOCTYPE html>
<html lang="en">
    <head id="head">
        <#include "stubs/header.ftl"/>
        <title>Promotional</title>
    </head>
    <body id="body">

        <#include "stubs/navbar.ftl"/>

        <#include "stubs/alert.ftl"/>

        <!-- content -->
        <div class="container">
            <legend class="text-white">Promotional Content</legend>
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


