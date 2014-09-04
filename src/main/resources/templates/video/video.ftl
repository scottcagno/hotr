<!DOCTYPE html>
<html lang="en">
<head id="head">
    <title>Videos</title>
    <#include "../stubs/header.ftl"/>
</head>
    <body id="body">

        <#include "../stubs/navbar.ftl"/>

        <!-- content -->
        <div id="content" class="container">
            <!-- add/edit -->
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class="panel-heading">Add or Update Video <span class="pull-right"><a href="/secure/video">Add New</a></span></div>
                    <div class="panel-body">
                        <form role="form" method="post" action="/secure/video">
                            <div class="form-group">
                                <input type="text" id="name" name="name" value="${(video.name)!}" class="form-control" placeholder="Name" required="true" autofocus="true"/>
                            </div>
                            <div class="form-group">
                                <input type="text" id="description" name="description" value="${(video.description)!}" class="form-control" placeholder="Description" required="true"/>
                            </div>
                            <textarea name="tags" id="metadata" cols="30" rows="10">
                                ${(video.tags)!}
                            </textarea>
                            <input type="hidden" name="id" value="${(video.id)!}"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- add/edit -->
            <!-- view all -->
            <div class="col-sm-8">
                <div class="panel panel-default">
                    <div class="panel-heading">Current Videos</div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Tags</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <#list videos as video>
                                        <tr>
                                            <td>${(video.id)!}</td>
                                            <td>${(video.name)!}</td>
                                            <td>${(video.description)!}</td>
                                            <td>${(video.tags)!}</td>
                                            <td>
                                                <a href="/secure/video/${(video.id)!}" class="btn btn-xs btn-primary">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                                <a href="#" class="btn btn-danger btn-xs" data-id="${(video.id)!}" data-toggle="modal" data-target="#deleteCheck">
                                                    <i class="fa fa-trash-o"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- view all -->
        </div>

        <div class="modal fade" id="deleteCheck" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Are you sure?</h4>
                    </div>
                    <div class="modal-body">
                        Permantly remove video? This action cannot be undone.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md pull-left" data-dismiss="modal">No, Cancel</button>
                        <span id="delete">
                            <form role="form" method="post" action="/secure/video/{id}">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-primary btn-md">Yes, Remove Video</button>
                            </form>
                        </span>

                    </div>
                </div>
            </div>
        </div>

        <!-- content -->

        <#include "../stubs/footer.ftl"/>

        <#include "../stubs/scripts.ftl"/>

        <script>
            $(document).ready(function() {

                // toggle safe delete modal popup
                $('a[data-toggle="modal"]').click(function(){
                    var id = $(this).data('id');
                    var form = $('.modal #delete');
                    form.html(form.html().replace('{id}',id));
                });
            });
        </script>

    </body>
</html>
