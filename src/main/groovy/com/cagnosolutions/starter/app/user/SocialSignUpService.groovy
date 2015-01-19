package com.cagnosolutions.starter.app.user
import groovy.transform.CompileStatic
import org.springframework.social.connect.Connection
import org.springframework.social.connect.ConnectionSignUp
import org.springframework.social.connect.UserProfile

@CompileStatic
class SocialSignUpService implements ConnectionSignUp {

	UserService userService

	SocialSignUpService(UserService userService) {
		this.userService = userService
	}

	String execute(Connection<?> connection) {
		UserProfile profile = connection.fetchUserProfile()
		def user = userService.createUserFromSocial profile
		user.username
	}
}