package com.cagnosolutions.starter.app.user

import groovy.transform.CompileStatic
import org.springframework.security.core.GrantedAuthority
import org.springframework.social.security.SocialUser

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Table

@CompileStatic
@Entity
@Table(name = "user")
class User extends SocialUser {

	@Id
	@GeneratedValue
	Long id
	String firstName, lastName, spouseName, spouseEmail, username, password, role = "ROLE_USER"
	Date creation, lastSeen
	Boolean challenge, monthly
	ArrayList<Long> progress
	short active = 1

	User(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities)
	}
}