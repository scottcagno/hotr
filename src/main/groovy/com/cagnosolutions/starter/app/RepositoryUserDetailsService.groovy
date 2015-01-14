package com.cagnosolutions.starter.app

import com.cagnosolutions.starter.app.user.UserService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException

@CompileStatic
public class RepositoryUserDetailsService implements UserDetailsService {

	@Autowired
	UserService userService

	UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		userService.findOne username
	}
}
