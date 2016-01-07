package com.cagnosolutions.starter.app.social

import com.cagnosolutions.starter.app.user.UserService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Configuration
import org.springframework.core.env.Environment
import org.springframework.security.crypto.encrypt.Encryptors
import org.springframework.social.UserIdSource
import org.springframework.social.config.annotation.ConnectionFactoryConfigurer
import org.springframework.social.config.annotation.EnableSocial
import org.springframework.social.config.annotation.SocialConfigurer
import org.springframework.social.connect.ConnectionFactoryLocator
import org.springframework.social.connect.UsersConnectionRepository
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository
import org.springframework.social.security.AuthenticationNameUserIdSource
import javax.sql.DataSource

@CompileStatic
@Configuration
@EnableSocial
class SocialConfig implements SocialConfigurer {

	@Autowired
	DataSource dataSource

	@Autowired
	UserService userService

	void addConnectionFactories(ConnectionFactoryConfigurer connectionFactoryConfigurer, Environment environment) {}

	UserIdSource getUserIdSource() {
		new AuthenticationNameUserIdSource()
	}

	UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator connectionFactoryLocator) {
		def repo = new JdbcUsersConnectionRepository(dataSource, connectionFactoryLocator, Encryptors.noOpText())
		repo.connectionSignUp = new UserSocialSignUp(userService: userService)
		repo
	}

}
