package com.cagnosolutions.starter.app.social

import com.cagnosolutions.starter.app.user.UserService
import groovy.transform.CompileStatic
import org.springframework.social.connect.Connection
import org.springframework.social.connect.ConnectionSignUp

@CompileStatic
class UserSocialSignUp implements ConnectionSignUp {

	UserService userService

	String execute(Connection<?> connection) {
		userService.createUserFromSocial connection.fetchUserProfile()
	}

}
