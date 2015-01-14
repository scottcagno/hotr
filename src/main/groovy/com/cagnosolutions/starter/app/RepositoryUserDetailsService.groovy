package com.cagnosolutions.starter.app

import com.cagnosolutions.starter.app.user.SocialMediaUser
import com.cagnosolutions.starter.app.user.UserService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException

@CompileStatic
public class RepositoryUserDetailsService implements UserDetailsService {

	@Autowired
	UserService userService

	UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		def user = userService.findOne username
		if (user == null) {
			throw new UsernameNotFoundException("No username found : ${username}")
		}
		def authorities =  new ArrayList()
		authorities.add(new SimpleGrantedAuthority(user.role))
		new SocialMediaUser(user.username, user.password, authorities)
	}
}
