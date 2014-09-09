<!DOCTYPE html>
<html lang="en">
<head id="head">
    <title>Account</title>
<#include "stubs/header.ftl">
</head>
<body id="body">
<#include "stubs/navbar.ftl">
<!-- content -->
<div class="container navbar-margin">
    <div class="container text-center">
        ${(error)!}
    </div>
    <div class="container">
    <span class="col-lg-5 col-md-5 col-sm-5">
        <legend>Register</legend>
        <form role="form" method="post" action="/register">
            <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="Full Name" autofocus="true"
                       required="true"/>
            </div>
            <div class="form-group">
                <input type="email" name="email" class="form-control" placeholder="Email" autofocus="true"
                       required="true"/>
            </div>
            <div class="form-group">
                <input type="text" name="username" class="form-control" placeholder="Username"
                       autofocus="true" required="true"/>
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="Password"
                       required="true"/>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button class="btn btn-md btn-block btn-primary" type="submit">Register Account</button>
        </form>
    </span>
    <span class="col-lg-2 col-md-2 col-sm-2 text-center">
        <vr/>
    </span>
    <span class="col-lg-5 col-md-5 col-sm-5">
        <legend>Login</legend>
        <form role="form" method="post" action="/login">
            <div class="form-group">
                <input type="text" name="username" class="form-control" placeholder="Username"
                       autofocus="true" required="true"/>
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="Password"
                       required="true"/>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button class="btn btn-md btn-block btn-primary" type="submit">Login</button>
        </form>
    </span>
    </div>
</div>
<!-- content -->

<#include "stubs/footer.ftl">

</body>
</html>
