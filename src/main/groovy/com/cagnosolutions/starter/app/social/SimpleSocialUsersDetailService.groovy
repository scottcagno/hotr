package com.cagnosolutions.starter.app.social

import groovy.transform.CompileStatic
import org.springframework.dao.DataAccessException
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.social.security.SocialUser
import org.springframework.social.security.SocialUserDetails
import org.springframework.social.security.SocialUserDetailsService

@CompileStatic
class SimpleSocialUsersDetailService implements SocialUserDetailsService {

	UserDetailsService userDetailsService

	SimpleSocialUsersDetailService(UserDetailsService userDetailsService) {
		this.userDetailsService = userDetailsService
	}

	SocialUserDetails loadUserByUserId(String userId) throws UsernameNotFoundException, DataAccessException {
		def userDetails = userDetailsService.loadUserByUsername userId
		new SocialUser(userDetails.username, userDetails.password, userDetails.authorities)
	}

}
