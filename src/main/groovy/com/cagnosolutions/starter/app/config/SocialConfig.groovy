package com.cagnosolutions.starter.app.config
import com.cagnosolutions.starter.app.user.SocialSignUpService
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
/**
 * Created by magnus on 18/08/14.
 */

@CompileStatic
@Configuration
@EnableSocial
class SocialConfig implements SocialConfigurer {

	@Autowired
	DataSource dataSource

	@Autowired
	UserService userService

	@Override
	void addConnectionFactories(ConnectionFactoryConfigurer connectionFactoryConfigurer, Environment environment) {
		connectionFactoryConfigurer
	}

	@Override
	UserIdSource getUserIdSource() {
		return new AuthenticationNameUserIdSource()
	}

	@Override
	UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator connectionFactoryLocator) {
		JdbcUsersConnectionRepository repository = new JdbcUsersConnectionRepository(dataSource,connectionFactoryLocator, Encryptors.noOpText())
		repository.setConnectionSignUp(new SocialSignUpService(userService))
		return repository
	}
}
