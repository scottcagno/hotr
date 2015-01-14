package com.cagnosolutions.starter.app.user
import groovy.transform.CompileStatic
import org.springframework.security.core.GrantedAuthority
import org.springframework.social.security.SocialUser

@CompileStatic
class SocialMediaUser extends SocialUser {
	
	Long id
	String firstName, lastName, spouseName, spouseEmail, email, password, role = "ROLE_USER"
	Date creation, lastSeen
	Boolean challenge, monthly
	ArrayList<Long> progress
	short active = 1


	SocialMediaUser(String email, String password, Collection<? extends GrantedAuthority> authorities) {
		super(email, password, authorities)
	}
}