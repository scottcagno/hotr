package com.cagnosolutions.starter.app

import org.springframework.dao.DataAccessException
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.social.security.SocialUser
import org.springframework.social.security.SocialUserDetails
import org.springframework.social.security.SocialUserDetailsService

class SimpleSocialUsersDetailService implements SocialUserDetailsService {

	UserDetailsService userDetailsService

	SimpleSocialUsersDetailService(UserDetailsService userDetailsService) {
		this.userDetailsService = userDetailsService
	}

	@Override
	SocialUserDetails loadUserByUserId(String userId) throws UsernameNotFoundException, DataAccessException {
		UserDetails userDetails = userDetailsService.loadUserByUsername userId
		new SocialUser(userDetails.username, userDetails.password, userDetails.authorities)
	}

}