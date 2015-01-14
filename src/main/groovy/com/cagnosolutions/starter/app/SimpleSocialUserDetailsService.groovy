package com.cagnosolutions.starter.app

import groovy.transform.CompileStatic
import org.springframework.dao.DataAccessException
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.social.security.SocialUserDetails
import org.springframework.social.security.SocialUserDetailsService

@CompileStatic
public class SimpleSocialUserDetailsService implements SocialUserDetailsService {

	UserDetailsService userDetailsService

	SimpleSocialUserDetailsService(UserDetailsService userDetailsService) {
		this.userDetailsService = userDetailsService
	}

	SocialUserDetails loadUserByUserId(String userId) throws UsernameNotFoundException, DataAccessException {
		def userDetails = userDetailsService.loadUserByUsername(userId);
		userDetails as SocialUserDetails
	}
}