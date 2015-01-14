    $('button[id="fbLogin"]').click(function() {
        FB.login(function() {
            FB.api('/me', function(response) {
                socialCheck(response.email, response.first_name, response.last_name);
            });
            FB.logout();
        })
    });


    function socialCheck(username, firstName, lastName) {
        $.ajax({
            type: 'post',
            url: '/socialisregistered',
            data: {
                _csrf: csrfVal,
                username: username
            }
        }).done(function(e) {
            if (e) {
               // login
               $.ajax({
                   type: 'post',
                   url: 'login',
                   data: {
                       _csrf: csrfVal,
                       username: username,
                       password: "social"
                   }
               });
            } else {
                // register
                $.ajax({
                    type: 'post',
                    url: '/social/register',
                    data: {
                        _csrf: csrfVal,
                        username: username,
                        firstName: firstName,
                        lastName: lastName,
                    }
                }).done(function(e) {
                    if (e) {
                        alert('Successfully Registered');
                    } else {
                        alert('Error Registering');
                    }
                });
            }
        });
    }