package com.cagnosolutions.starter.app.config

import groovy.transform.CompileStatic
import org.springframework.context.annotation.Configuration
import org.springframework.core.env.Environment
import org.springframework.social.UserIdSource
import org.springframework.social.config.annotation.ConnectionFactoryConfigurer
import org.springframework.social.config.annotation.SocialConfigurer
import org.springframework.social.connect.ConnectionFactoryLocator
import org.springframework.social.connect.UsersConnectionRepository

@CompileStatic
@Configuration
class SocialConfig implements SocialConfigurer {

	@Override
	void addConnectionFactories(ConnectionFactoryConfigurer connectionFactoryConfigurer, Environment environment) {

	}

	@Override
	UserIdSource getUserIdSource() {
		return null
	}

	@Override
	UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator connectionFactoryLocator) {
		return null
	}
}
